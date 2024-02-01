create database [Cursos];

USE [Cursos]
CREATE table [Curso](
	[Id] INT NOT NULL IDENTITY(1, 1),
	[Nome] NVARCHAR(80) NOT NULL,
	[CategoriaId] INT NOT NULL,
		
	CONSTRAINT [PK_Curso_Id] PRIMARY KEY([Id]),
	CONSTRAINT [FK_Curso_CategoriaId] FOREIGN KEY([CategoriaId])
		REFERENCES [Categoria]([Id])
)
GO;

USE [Cursos]
CREATE table [Categoria](
	[Id] INT NOT NULL IDENTITY(1, 1),
	[Nome] NVARCHAR(80) NOT NULL,
		
	CONSTRAINT [PK_Categoria_Id] PRIMARY KEY([Id])
)
GO;