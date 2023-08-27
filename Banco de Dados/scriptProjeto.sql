create database sixtracker;
use sixtracker;

create table unidade (
idUnidade int primary key auto_increment,
nome varchar(40),
estado varchar(40),
cidade varchar(40),
bairro varchar(40),
cep char(11),
numero varchar(40),
cnpj char(14)
);

create table dados (
idDados int primary key auto_increment,
processador decimal(10,2),
memoriaRAM decimal(10,2),
disco decimal(10,2),
dataHora datetime,
deteccaoUSB VARCHAR(5) CHECK (deteccaoUSB IN ('true', 'false')),
fkUnidade int,
foreign key (fkUnidade) references unidade (idUnidade)
);

create table gerente (
idGerente int primary key auto_increment,
nome varchar(45),
cpf char(11),
telefone char(11),
email varchar(45),
senha varchar(45),
confirmacaoSenha varchar(45),
fkUnidade int,
foreign key (fkUnidade) references unidade (idUnidade)
);

create table funcionario (
idFuncionario int primary key auto_increment,
nome varchar(45),
cpf char(11),
telefone char(11),
email varchar(45),
senha varchar(45),
confirmacaoSenha varchar(45),
cargo varchar(45),
fkGerente int,
foreign key (fkGerente) references gerente (idGerente),
fkUnidade int,
foreign key (fkUnidade) references unidade (idUnidade)
);

insert into unidade values
	(null, "Serasa Financeiro", "São Paulo", "Paulista", "Maria Rosa", 12345678911, "266", 12312309800);
    
insert into gerente values
	(null, "Jorge", 48511311866, "14982193729", "jorge@gmail.com", "jorge123!", "jorge123!", 1);
    
insert into funcionario values
	(null, "Junior", "48511311899", "12312312312", "junior@gmail.com", "junior123!", "junior123!", "Cyber Segurança", 1, 1);

select * from unidade;
select * from dados;
select * from funcionario;
select * from gerente;




