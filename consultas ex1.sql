select c.num_cadastro, c.nome, f.titulo, d.data_fabricacao, l.valor
FROM Cliente as c, Filme as f
INNER JOIN DVD as d
on d.filmeId = f.id
INNER JOIN Locacao as l
on l.dvdNum = d.num
WHERE d.data_fabricacao = (SELECT MAX(data_fabricacao) from DVD)
GO

SELECT c.num_cadastro, c.nome, s.data_locacao, s.qnt
from Cliente as c
INNER JOIN (select l.clienteNum_Cadastro, convert(char, l.data_locacao, 103) as data_locacao, count(*) as qnt 
FROM Locacao as l
group by l.data_locacao, L.clienteNum_Cadastro) as s
on s.clienteNum_Cadastro = c.num_cadastro
GO

SELECT c.num_cadastro, c.nome, s.data_locacao, s.qnt as valor_total
from Cliente as c
INNER JOIN (select l.valor * count(*) as qnt,l.clienteNum_Cadastro, convert(char, l.data_locacao, 103) as data_locacao
FROM Locacao as l
group by l.data_locacao, L.clienteNum_Cadastro, l.valor) as s
on s.clienteNum_Cadastro = c.num_cadastro
GO


SELECT c.num_cadastro, c.nome, s.data_locacao
from Cliente as c
INNER JOIN (select l.clienteNum_Cadastro, convert(char, l.data_locacao, 103) as data_locacao, count(*) as qnt 
FROM Locacao as l
group by l.data_locacao, L.clienteNum_Cadastro) as s
on s.clienteNum_Cadastro = c.num_cadastro
GO

SELECT c.num_cadastro, c.nome, s.data_locacao
from Cliente as c
INNER JOIN (select l.clienteNum_Cadastro, convert(char, l.data_locacao, 103) as data_locacao, count(*) as qnt 
FROM Locacao as l
group by l.data_locacao, L.clienteNum_Cadastro) as s
on s.clienteNum_Cadastro = c.num_cadastro
WHERE s.qnt >= 2
GO

