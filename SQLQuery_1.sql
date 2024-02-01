--create database [Curso];
--drop database [Curso];

USE [Curso]
CREATE table [Aluno](
	[Id] INT NOT NULL,
	[Nome] NVARCHAR(80) NOT NULL,
	[Email] NVARCHAR(180) NOT NULL UNIQUE,
	[Nascimento] DATETIME NULL,
	[Ativo] BIT NOT NULL DEFAULT(0)
	
	CONSTRAINT [PK_Aluno_Id] PRIMARY KEY([Id])
--	O mesmo poderia ser feito pro Email que é UNIQUE
)
GO;

CREATE INDEX [IX_Aluno_Email] ON [Aluno]([Email]);
DROP INDEX [IX_Aluno_Email] ON [Aluno];

USE [Curso]
CREATE table [Curso](
	[Id] INT NOT NULL IDENTITY(1, 1),
	[Nome] NVARCHAR(80) NOT NULL,
	[CategoriaId] INT NOT NULL
		
	CONSTRAINT [PK_Curso_Id] PRIMARY KEY([Id]),
	CONSTRAINT [FK_Curso_CategoriaId] FOREIGN KEY([CategoriaId])
		REFERENCES [Categoria]([Id])
)
GO;

USE [Curso]
CREATE table [ProgressoCurso](
	[AlunoId] INT NOT NULL,
	[CursoId] INT NOT NULL,
	[Progresso] INT NOT NULL,
	[UltimaAtualizacao] DATETIME NOT NULL DEFAULT(GETDATE()),
	
	CONSTRAINT PK_ProgressoCurso PRIMARY KEY([AlunoId], [CursoId])
)
GO;

USE [Curso]
CREATE table [Categoria](
	[Id] INT NOT NULL,
	[Nome] NVARCHAR(80) NOT NULL,
		
	CONSTRAINT [PK_Categoria_Id] PRIMARY KEY([Id])
)
GO;

USE [Curso]
DROP TABLE [Curso];

ALTER TABLE [Aluno]
	ADD [Documento] NVARCHAR(11);
	
ALTER TABLE [Aluno]
	DROP COLUMN [Documento];
	
ALTER TABLE [Aluno]
	ALTER COLUMN [Documento] CHAR(11);
	
ALTER TABLE [Aluno]
	ALTER COLUMN [Ativo] BIT NOT NULL;
	
ALTER TABLE [Aluno]
	ADD PRIMARY KEY([Id]);
	



-------------------------------------------------------------------------------------
USE [master];

DECLARE @kill varchar(8000) = '';  
SELECT @kill = @kill + 'kill ' + CONVERT(varchar(5), session_id) + ';'  
FROM sys.dm_exec_sessions
WHERE database_id  = db_id('Cursos')

EXEC(@kill);

DROP DATABASE [Cursos]
-------------------------------------------------------------------------------------