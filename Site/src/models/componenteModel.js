var database = require("../database/config");

function buscarServidores(){
    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
       instrucaoSql = `select 
       Servidor.nome 
           from Componente 
               join Servidor 
                   on Servidor.idServidor = Componente.fkServidor;`;
   } else {
       console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
       return
   }

   console.log("Executando a instrução SQL: \n" + instrucaoSql);
   return database.executar(instrucaoSql);
}

function buscarMedidas(){
    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
       instrucaoSql = `select 
       UnidadeMedida.unidadeMedida 
           from Componente 
               join UnidadeMedida 
                   on UnidadeMedida.idUnidadeMedida = Componente.fkServidor;`;
   } else {
       console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
       return
   }

   console.log("Executando a instrução SQL: \n" + instrucaoSql);
   return database.executar(instrucaoSql);
}

function buscarComponentes(){
    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
       instrucaoSql = `select 
       TipoComponente.tipoComponente 
           from Componente 
               join TipoComponente 
                   on TipoComponente.idTipoComponente = Componente.fkServidor;`;
   } else {
       console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
       return
   }

   console.log("Executando a instrução SQL: \n" + instrucaoSql);
   return database.executar(instrucaoSql);
}

module.exports = {
    buscarServidores,
    buscarMedidas,
    buscarComponentes
};