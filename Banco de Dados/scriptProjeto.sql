create database sixtracker;
use sixtracker;

create table servidor (
idServidor int primary key auto_increment,
nome varchar(45)
);

insert into servidor values
	(null, 'servidorSP');

create table unidade (
idUnidade int primary key auto_increment,
nome varchar(40),
estado varchar(40),
cidade varchar(40),
bairro varchar(40),
cep char(11),
numero varchar(40),
cnpj char(14),
fkServidor int,
foreign key (fkServidor) references servidor (idServidor)
);

insert into unidade values
	(null, "Serasa Financeiro", "São Paulo", "Santo André", "Maria Rosa", 12345678911, "266", 12312309800, 1);
insert into unidade values
	(null, 'Banco Central', 'Brasília', 'Brasília', 'Centro', '700000000', '123', '98765432100001', 1),
    (null, 'Banco do Brasil', 'São Paulo', 'São Paulo', 'Paulista', '123450000', '789', '12398745600022', 1),
    (null, 'Caixa Econômica', 'Rio de Janeiro', 'Rio de Janeiro', 'Copacabana', '222222222', '456', '98765432111100', 1);

create table dados (
idDados int primary key auto_increment,
processador decimal(10,2),
memoriaRAM decimal(10,2),
disco decimal(10,2),
dataHora datetime,
deteccaoUSB VARCHAR(5) CHECK (deteccaoUSB IN ('true', 'false')),
fkUnidade int,
foreign key (fkUnidade) references unidade (idUnidade),
fkServidor int,
foreign key (fkServidor) references servidor (idServidor)
);

create table cargo (
idCargo int primary key auto_increment,
NomeCargo varchar(45) CHECK (NomeCargo IN ('Gerente de Segurança de TI', 'Analista de Segurança da Informação', 'Engenheiro de Segurança Cibernética', 'Especialista em Forense Digital', 'Consultor de Segurança Cibernética'))
);

insert into cargo values
	(null, 'Gerente de Segurança de TI'),
    (null, 'Analista de Segurança da Informação'),
    (null, 'Engenheiro de Segurança Cibernética'),
    (null, 'Especialista em Forense Digital'),
	(null, 'Consultor de Segurança Cibernética');

create table funcionario (
fkCargo int,
foreign key (fkCargo) references cargo (idCargo),
fkUnidade int,
foreign key (fkUnidade) references unidade (idUnidade),
idFuncionario int primary key auto_increment,
nome varchar(45),
cpf char(11),
telefone char(11),
email varchar(45),
senha varchar(45),
fkGerente int,
constraint fkGerente foreign key (fkGerente) references cargo (idCargo)
);

insert into funcionario values
	(1, 1, null, 'José Roberto', 48511388855, 12312312312, 'jose@gmail.com', 'jose1234567!', null),
    (2, 1, null, 'Elias Fernando', 44322385835, 12234512312, 'elias@gmail.com', 'elias1234567!', 1);
    
insert into funcionario values
	(3, 1, null, 'Reginaldo Faria', 33322385835, 33334512312, 'reginaldo@gmail.com', 'reginaldo1234567!', 1);
    
insert into funcionario values 
	(1, 2, null, 'Ana Silva', '12345678901', '987654321', 'ana@bancocentral.com', 'senha123', null),
	(1, 3, null, 'Carlos Santos', '23456789012', '876543210', 'carlos@bancodobrasil.com', 'senha456', null),
    (1, 4, null, 'Maria Oliveira', '34567890123', '765432109', 'maria@caixa.com', 'senha789', null),
    (2, 2, null, 'João Pereira', '45678901234', '654321098', 'joao@bancocentral.com', 'senhaanalista', 2),
    (2, 2, null, 'Marta Souza', '56789012345', '543210987', 'marta@bancocentral.com', 'senhamarta', 2),
    (3, 3, null, 'Pedro Almeida', '67890123456', '432109876', 'pedro@bancodobrasil.com', 'senhaengenheiro', 3),
    (4, 4, null, 'Ricardo Nunes', '89012345678', '210987654', 'ricardo@caixa.com', 'senharicardo', 3),
    (4, 4, null, 'Lúcia Fernandes', '90123456789', '109876543', 'lucia@caixa.com', 'senhaLucia', 4);
    
    

select * from unidade;
select * from funcionario;
select * from servidor;
select * from dados;
select * from cargo;

truncate table dados;

#SELECT PARA VER O GERENTE E SUAS RESPECTIVAS UNIDADES
SELECT
    uni.nome AS unidade,
    car.NomeCargo AS cargo,
    fun.nome AS funcionario
FROM unidade uni
JOIN funcionario fun ON uni.idUnidade = fun.fkUnidade
JOIN cargo car ON fun.fkCargo = car.idCargo
WHERE car.NomeCargo = 'Gerente de Segurança de TI';

# SELECT PARA VER O NOME DA UNIDADE, DO GERENTE DESSA UNIDADE E SEUS FUNCIONARIOS
SELECT
    unidade.nome AS nome_empresa,
    gerente.nome AS nome_gerente,
    funcionario.nome AS nome_funcionario
FROM
    unidade
LEFT JOIN
    funcionario AS gerente ON unidade.idUnidade = gerente.fkUnidade
LEFT JOIN
    funcionario ON unidade.idUnidade = funcionario.fkUnidade
WHERE
    gerente.fkCargo = (SELECT idCargo FROM cargo WHERE NomeCargo = 'Gerente de Segurança de TI')
    AND funcionario.idFuncionario <> gerente.idFuncionario
ORDER BY
    nome_empresa, nome_gerente, nome_funcionario;
    
# SELECT PARA VER OS FUNCIONÁRIOS DE UM RESPECTIVO GERENTE
SELECT
    fun.nome AS funcionario
FROM
    funcionario fun
WHERE
    fun.fkGerente = 3;
    
# SELECT PARA VER O NOME DOS CARGOS DE TODOS OS FUNCIONARIOS DE UMA RESPECTIVA UNIDADE
SELECT
    fun.nome AS funcionario,
    car.NomeCargo AS cargo,
    uni.nome AS unidade
FROM
    funcionario fun
JOIN
    cargo car ON fun.fkCargo = car.idCargo
JOIN
    unidade uni ON fun.fkUnidade = uni.idUnidade
WHERE
    uni.idUnidade = 1;
    
# SELECT PARA VER OS DADOS DE UM DETERMINADO SERVIDOR
SELECT
    processador,
    memoriaRAM,
    disco,
    dataHora,
    deteccaoUSB
FROM
    dados
WHERE
    fkServidor = 1;





