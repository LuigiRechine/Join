create database EMPRESA_join2;
use EMPRESA_join2;

create table departamento (
    id bigint primary key auto_increment,
    nome varchar(255)
);

create table funcionario (
    id integer primary key auto_increment,
	salario decimal(10, 2) not null,
    nome varchar(100) not null,
    id_departamento bigint not null,
    foreign key (id_departamento) references departamento(id)
);

create table dependente (
    id integer primary key auto_increment,
    nome varchar(100) not null,
    id_funcionario integer not null,
    foreign key (id_funcionario) references funcionario(id)
);

#Inserir os dados
insert into departamento (nome)
values ('RH'),
	   ('Jurídico'),
	   ('Financeiro'),
	   ('Marketing'),
	   ('Vendas');
       
insert into funcionario (salario, nome, id_departamento)
values (4000.50, 'Júlio Serafim', 3),
	   (2050.80, 'Marcos Leite', 1),
       (9025.55, 'Pamela Rossi', 4),
       (12600.00, 'Rafael Farias', 2),
       (3500.90, 'Letícia Moura', 5);
       
insert into dependente (nome, id_funcionario)
values ('Matheus Leite', 2),
	   ('Augusto Leite', 2),
       ('Thomaz Farias', 4),
       ('Rafaela Farias', 4),
       ('Leonardo Moura', 5);
       
select * from departamento;
select * from funcionario;
select * from dependente;

#Atividades - 01
select f.nome as nome_funcionario, count(d.id) as qtd_dependentes
from funcionario f
join dependente d 
on f.id = d.id_funcionario
group by f.nome
having count(d.id) >= 2;

#Atividades - 02
select d.nome as departamento, f.nome as funcionario
from departamento d
join funcionario f 
on d.id = f.id_departamento
order by f.nome asc;

#Atividades - 03
select f.nome as funcionario, d.nome as dependente
from funcionario f
left join dependente d 
on f.id = d.id_funcionario;

#Atividades - 04
select d.nome as departamento, avg(f.salario) as media_salarial
from departamento d
join funcionario f 
on d.id = f.id_departamento
group by d.nome;

#Atividades - 05
select d.nome as departamento, f.nome as funcionario
from departamento d
left join funcionario f 
on d.id = f.id_departamento;
    
#Atividades - 06
select sum(salario) as total_mensal
from funcionario;

#Atividades - 07
select d.nome as departamento, sum(f.salario) as custo_mensal
from departamento d
left join funcionario f 
on d.id = f.id_departamento
group by d.nome;