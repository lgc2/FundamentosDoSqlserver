USE Cursos;
INSERT INTO Categoria (Nome) Values ('Backend');
INSERT INTO Categoria (Nome) Values ('Frontend');
INSERT INTO Categoria (Nome) Values ('Mobile');

INSERT INTO Curso (Nome, CategoriaId) Values ('Fundamentos do C#', (select c.Id from Categoria c where nome = 'Backend'));

INSERT INTO Curso (Nome, CategoriaId)
Values
('Fundamentos OPP', (select c.Id from Categoria c where nome = 'Backend')),
('Angular', (select c.Id from Categoria c where nome = 'Frontend')),
('Fluter', (select c.Id from Categoria c where nome = 'Mobile'))
;

INSERT INTO Curso (Nome, CategoriaId) Values ('Fluter e SQLite', (select c.Id from Categoria c where nome = 'Mobile'));

------------------------------------------------------------

SELECT TOP 100
	*
from
	Curso c
--where
--	c.CategoriaId = 1
--	c.Id != 1
--	and c.CategoriaId = 1
order by c.Nome asc, c.id desc
;
--SELECT * from Curso c order by Id asc limit 2; --> NÂO temos o LIMIT no SQLServer

SELECT TOP 100
	min(Id) as min,
	max(Id) as max,
	count(Id) as count,
	avg(Id) as avg,
	sum(Id) as sum
from
	Curso
;

SELECT TOP 100
	*
from
	Curso
where
	nome LIKE '%fundamentos%'
;

SELECT TOP 100
	*
from
	Curso
where
--	Id IN (3,5)
	Id BETWEEN 3 and 5
;

SELECT TOP 100
	*
from
	Curso c
	inner join Categoria ct
		on c.CategoriaId = ct.Id
;

SELECT TOP 100
	*
from
	Curso c
--	left join Categoria ct
--	right join Categoria ct
	full outer join Categoria ct -- traz tudo da direita e da esquerda
		on c.CategoriaId = ct.Id
;

SELECT TOP 100
	c.Id, c.Nome
from Curso c

UNION -- UNION ALL funciona como um DISTINCT

SELECT TOP 100
	ct.Id, ct.Nome
from Categoria ct
;

CREATE OR ALTER VIEW vwContagemCursosPorCategoria AS
	SELECT TOP 100
		c2.Id as IdCategoria,	
		c2.Nome as NomeCategoria,
		count(c.CategoriaId) as TotalCursosNaCategoria
	from Curso c
	inner join Categoria c2 on c.CategoriaId = c2.Id
	group by
		c2.Id,
		c2.Nome,
		c.CategoriaId
	HAVING --aqui não aceitaria o WHERE
		count(c.CategoriaId) > 1
	ORDER by c2.id asc;

SELECT * from vwContagemCursosPorCategoria
WHERE NomeCategoria = 'Backend';

------------------------------------------------------------

begin transaction
	UPDATE
		Categoria
	set
		nome = 'Backend'
	where
		id = 1
commit

DELETE FROM
	Categoria
WHERE
	nome = 'Azure';

------------------------------------------------------------

CREATE OR ALTER PROCEDURE [spListCourses]
	@NomeCategoria NVARCHAR(80)
AS
	DECLARE @CategoriaId INT
	SET @CategoriaId = (SELECT TOP 1 c.Id FROM Categoria c where c.Nome = @NomeCategoria)

	SELECT * FROM [Curso] where CategoriaId = @CategoriaId;
	
EXEC [spListCourses] 'Mobile';
--EXEC [spListCourses] 'Mobile', 'param2';

DROP PROCEDURE [spListCourse];
DROP PROCEDURE [spListCourses];