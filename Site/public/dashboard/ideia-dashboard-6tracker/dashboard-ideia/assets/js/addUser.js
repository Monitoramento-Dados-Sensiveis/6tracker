function cadastrarUser() {
    aguardar();

    //Recupere o valor da nova input pelo nome do id
    // Agora vá para o método fetch logo abaixo
    var nomeVar = nome_input.value;
    var cpfVar = cpf_input.value;
    var telefoneVar = telefone_input.value;
    var emailVar = email_input.value;  
    var nivelPermissaoVar = nivelPermissao_input.value;    
    var senhaVar = senha_input.value;
    var confirmSenhaVar = confirm_senha_input.value;
    var fkempresa = sessionStorage.NOME_EMPRESA;
     

    if (nomeVar == "" || cpfVar == "" || emailVar == "" || telefoneVar == "" || senhaVar == "" || confirmSenhaVar == "" || nivelPermissaoVar == "") {
        cardErro.style.display = "block"
        mensagem_erro.innerHTML = "Todos os campos são obrigatórios";
        setTimeout(function () {
            cardErro.style.display = "none";
                }, 3000);
        finalizarAguardar();
        return false;
    }

    if (senhaVar != confirmSenhaVar) {
        cardErro.style.display = "block"
        mensagem_erro.innerHTML = "Senhas diferentes!";

        setTimeout(function () {
            cardErro.style.display = "none";
                }, 3000);

        finalizarAguardar();
        return false;
    }

    if (emailVar.indexOf("@") == -1 || emailVar.indexOf(".com") == -1 || emailVar.indexOf("@") > emailVar.indexOf(".com")) {
        cardErro.style.display = "block"
        mensagem_erro.innerHTML = "Email Inválido!";

        setTimeout(function () {
            cardErro.style.display = "none";
                }, 3000);

        finalizarAguardar();
        return false;
    }

    if (!/[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]/.test(senhaVar) || senhaVar.length < 8) {
        cardErro.style.display = "block"
        mensagem_erro.innerHTML = "Senha Inválida!";

        setTimeout(function () {
            cardErro.style.display = "none";
                }, 3000);

        finalizarAguardar();
        return false;
    }

    if (telefoneVar.length != 11) {
        cardErro.style.display = "block"
        mensagem_erro.innerHTML = "Número de telefone inválido!";

        setTimeout(function () {
            cardErro.style.display = "none";
                }, 3000);

        finalizarAguardar();
        return false;
    }

    if (cpfVar.length != 11) {
        cardErro.style.display = "block"
        mensagem_erro.innerHTML = "CPF inválido!";

        setTimeout(function () {
            cardErro.style.display = "none";
                }, 3000);

        finalizarAguardar();
        return false;
    }

    else {
        setInterval(sumirMensagem, 5000)
    }

    // Enviando o valor da nova input
    fetch("/usuarios/addUser", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            // crie um atributo que recebe o valor recuperado aqui
            // Agora vá para o arquivo routes/usuario.js
            nomeServer: nomeVar,
            cpfServer: cpfVar,
            emailServer: emailVar,
            nivelPermissaoServer: nivelPermissaoVar,
            telefoneServer: telefoneVar,
            senhaServer: senhaVar,
            fkempresaServer: fkempresa,
        })
    }).then(function (resposta) {

        console.log("resposta: ", resposta);

        if (resposta.ok) {
            cardErro.style.display = "block";

            mensagem_erro.innerHTML = "Cadastro realizado com sucesso! Redirecionando para tela de Login...";

            setTimeout(() => {
                window.location = "login.html";
            }, "2000")

            limparFormulario();
            finalizarAguardar();
        } else {
            throw ("Houve um erro ao tentar realizar o cadastro!");
        }
    }).catch(function (resposta) {
        console.log(`#ERRO: ${resposta}`);
        finalizarAguardar();
    });

    return false;
}

function sumirMensagem() {
    cardErro.style.display = "none"
}
