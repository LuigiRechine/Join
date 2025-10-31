create database empresa_joins;
use empresa_joins;

-- Tabela DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
    DEPCODIGO integer PRIMARY KEY auto_increment,
    DEPNOME VARCHAR(50)
);

-- Tabela FUNCIONARIO
CREATE TABLE FUNCIONARIO (
    FUNCODIGO integer PRIMARY KEY auto_increment,
    DEPCODIGO integer not null,
    FUNNOME VARCHAR(100) not null,
    FUNNASCIMENTO DATE not null,
    FUNSALARIO decimal(10, 2) not null,
    FOREIGN KEY (DEPCODIGO) REFERENCES DEPARTAMENTO(DEPCODIGO)
);

-- Tabela DEPENDENTE
CREATE TABLE DEPENDENTE (
    DEPENCODIGO INT PRIMARY KEY auto_increment,
    FUNCODIGO INT not null,
    DEPENNOME VARCHAR(100) not null,
    FOREIGN KEY (FUNCODIGO) REFERENCES FUNCIONARIO(FUNCODIGO)
);

-- 1. Inserindo 10 linhas na tabela DEPARTAMENTO
INSERT INTO DEPARTAMENTO (DEPNOME)
VALUES
('Recursos Humanos'),
('Tecnologia da Informação'),
('Financeiro'),
('Marketing'),
('Vendas'),
('Operações'),
('Jurídico'),
('Logística'),
('Produção'),
('Qualidade');

-- 2. Inserindo 10 linhas na tabela FUNCIONARIO
INSERT INTO FUNCIONARIO (DEPCODIGO, FUNNOME, FUNNASCIMENTO, FUNSALARIO)
VALUES
(1, 'Ana Silva', '1990-05-15', 5500.00),        -- DEP 1 (RH)
(2, 'Bruno Costa', '1988-11-01', 7200.00),     -- DEP 2 (TI)
(3, 'Carla Dias', '1995-02-20', 4800.00),      -- DEP 3 (Financeiro)
(4, 'Daniel Moreira', '1992-09-30', 6100.00),  -- DEP 4 (Marketing)
(5, 'Elisa Fernandes', '1985-07-12', 8000.00), -- DEP 5 (Vendas)
(1, 'Fábio Guedes', '1998-01-05', 3900.00),      -- DEP 1 (RH)
(2, 'Gabriela Lima', '1983-03-18', 9500.00),   -- DEP 2 (TI)
(8, 'Heitor Bastos', '1993-12-25', 4300.00),    -- DEP 8 (Logística)
(9, 'Isabela Rocha', '1996-06-08', 4100.00),    -- DEP 9 (Produção)
(5, 'Jonas Martins', '1991-04-14', 7600.00);    -- DEP 5 (Vendas)

-- 3. Inserindo 10 linhas na tabela DEPENDENTE
INSERT INTO DEPENDENTE (FUNCODIGO, DEPENNOME)
VALUES
(1, 'Lucas Silva'),   -- Dependente da Ana (Func. 1)
(1, 'Maria Silva'),   -- Dependente da Ana (Func. 1)
(2, 'Sofia Costa'),   -- Dependente do Bruno (Func. 2)
(3, 'Laura Dias'),    -- Dependente da Carla (Func. 3)
(3, 'Marcos Dias'),   -- Dependente da Carla (Func. 3)
(5, 'Arthur Fernandes'), -- Dependente da Elisa (Func. 5)
(5, 'Júlia Fernandes'), -- Dependente da Elisa (Func. 5)
(7, 'Pedro Lima'),    -- Dependente da Gabriela (Func. 7)
(8, 'Beatriz Bastos'), -- Dependente do Heitor (Func. 8)
(10, 'Rafael Martins'); -- Dependente do Jonas (Func. 10)

select * from funcionario;
select * from dependente;
select * from departamento;

#Inner Join
select func.funnome as nome_funcionario, dep.depennome nome_dependentes
from funcionario func
inner join dependente dep
on func.funcodigo = dep.funcodigo;

#Left Join
select func.funnome as nome_funcionario, dep.depennome as nome_dependente
from funcionario func
left join dependente dep
on func.funcodigo = dep.funcodigo;

#left excluding join
select func.funnome as funcionario_nome, dep.depennome as nome_dependente
from funcionario func
left join dependente dep
on func.funcodigo = dep.funcodigo
where dep.funcodigo is null;

#right join
select func.funnome as nome_funcionario, dep.depennome as nome_dependente
from funcionario func
right join dependente dep
on func.funcodigo = dep.funcodigo;

#right excluding join
select func.funnome as nome_funcionario, dep.depennome as nome_dependente
from funcionario func
right join dependente dep
on func.funcodigo = dep.funcodigo
where func.funcodigo is null;

#full join
#parte 1
select f.funnome as nome_funcionario, d.depennome as nome_dependente
from funcionario f
left join dependente d
on f.funcodigo = d.funcodigo

UNION ALL

#parte 2
select f.funnome as nome_funcionario, d.depennome as nome_dependente
from funcionario f
right join dependente d
on f.funcodigo = d.funcodigo
where f.funcodigo is null;