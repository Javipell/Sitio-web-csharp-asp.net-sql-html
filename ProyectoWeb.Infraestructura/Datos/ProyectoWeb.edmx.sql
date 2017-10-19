
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/18/2017 09:31:09
-- Generated from EDMX file: C:\Users\pepe\source\repos\ProyectoWeb\ProyectoWeb.Infraestructura\Datos\ProyectoWeb.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BdEntrevistas];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[EntrevistasSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EntrevistasSet];
GO
IF OBJECT_ID(N'[dbo].[UsuariosSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsuariosSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'EntrevistasSet'
CREATE TABLE [dbo].[EntrevistasSet] (
    [IdEntrevista] int IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [Apellidos] nvarchar(100)  NOT NULL,
    [Dni] nvarchar(9)  NOT NULL,
    [Asiste] smallint  NOT NULL,
    [Valoracion] smallint  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UsuariosSet'
CREATE TABLE [dbo].[UsuariosSet] (
    [IdUsuario] int IDENTITY(1,1) NOT NULL,
    [NombreUsuario] nvarchar(50)  NOT NULL,
    [NickUsuario] nvarchar(50)  NOT NULL,
    [ClaveUsuario] nvarchar(50)  NOT NULL,
    [Administrador] tinyint  NOT NULL,
    [Foto] nvarchar(500)  NOT NULL
);
GO

-- Creating table 'MenusSet'
CREATE TABLE [dbo].[MenusSet] (
    [IdMenu] int IDENTITY(1,1) NOT NULL,
    [GrupoMenu] nvarchar(50)  NOT NULL,
    [Posicion] tinyint  NOT NULL,
    [NombreMenu] nvarchar(20)  NOT NULL,
    [Logo] nvarchar(50)  NOT NULL,
    [TipoUsuario] nvarchar(20)  NOT NULL
);
GO

-- Creating table 'SubMenuSet'
CREATE TABLE [dbo].[SubMenuSet] (
    [IdSubMenu] int IDENTITY(1,1) NOT NULL,
    [GrupoMenu] nvarchar(50)  NOT NULL,
    [Posicion] tinyint  NOT NULL,
    [NombreSubMenu] nvarchar(50)  NOT NULL,
    [Logo] nvarchar(50)  NOT NULL,
    [TipoUsuario] nvarchar(20)  NOT NULL,
    [IdMenu] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdEntrevista] in table 'EntrevistasSet'
ALTER TABLE [dbo].[EntrevistasSet]
ADD CONSTRAINT [PK_EntrevistasSet]
    PRIMARY KEY CLUSTERED ([IdEntrevista] ASC);
GO

-- Creating primary key on [IdUsuario] in table 'UsuariosSet'
ALTER TABLE [dbo].[UsuariosSet]
ADD CONSTRAINT [PK_UsuariosSet]
    PRIMARY KEY CLUSTERED ([IdUsuario] ASC);
GO

-- Creating primary key on [IdMenu] in table 'MenusSet'
ALTER TABLE [dbo].[MenusSet]
ADD CONSTRAINT [PK_MenusSet]
    PRIMARY KEY CLUSTERED ([IdMenu] ASC);
GO

-- Creating primary key on [IdSubMenu] in table 'SubMenuSet'
ALTER TABLE [dbo].[SubMenuSet]
ADD CONSTRAINT [PK_SubMenuSet]
    PRIMARY KEY CLUSTERED ([IdSubMenu] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Añadir usuario administrador
-- --------------------------------------------------

INSERT INTO [dbo].[UsuariosSet]
           ([NombreUsuario]
           ,[NickUsuario]
           ,[ClaveUsuario]
           ,[Administrador]
           ,[Foto])
     VALUES
           ('administrador', 'admin', 'admin', 1, '')
GO

-- --------------------------------------------------
-- Añadir menu principal y acceso
-- --------------------------------------------------

	INSERT INTO [dbo].[MenusSet]
    ([GrupoMenu],[Posicion],[NombreMenu],[Logo],[TipoUsuario]) VALUES
        ('principal',1,'tienda','','todos'),
        ('principal',2,'folletos','','todos'),
        ('principal',3,'conocenos','','todos'),
        ('principal',4,'servicios','','todos'),
        ('principal',5,'login','','todos'),
		('principal',6,'gestion','','admin')

-- --------------------------------------------------
-- Añadir Submenus
-- --------------------------------------------------

	INSERT INTO SubMenuSet ([GrupoMenu],[Posicion],[NombreSubMenu],[Logo],[TipoUsuario],[IdMenu])
	VALUES
	('principal',1,'acerca de','','todos',1),
	('principal',2,'servicios','','todos',1),
	('principal',3,'testimonios','','todos',1),
	('principal',4,'F.A.Q.s','','todos',1),
	('principal',5,'galeria','','todos',1),
	('principal',1,'Linea de tiempo','','todos',1),
	('principal',1,'404 Pagina','','todos',1),
	('principal',1,'GestionMenus','','admin',6),
	('principal',2,'GestionSubMenus','','admin',6),
	('principal',3,'GestionUsuarios','','admin',6),
	('principal',4,'Salir','','admin',6)

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------