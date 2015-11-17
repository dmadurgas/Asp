
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/17/2015 16:39:03
-- Generated from EDMX file: C:\Users\david_madurga\documents\visual studio 2015\Projects\Incidencias\Incidencias\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [db465e6d7d614444a79e72a552012aefd2];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ClientesProductos_Clientes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ClientesProductos] DROP CONSTRAINT [FK_ClientesProductos_Clientes];
GO
IF OBJECT_ID(N'[dbo].[FK_ClientesProductos_Productos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ClientesProductos] DROP CONSTRAINT [FK_ClientesProductos_Productos];
GO
IF OBJECT_ID(N'[dbo].[FK_ClientesCabeceraTickets]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CabeceraTicketsSet] DROP CONSTRAINT [FK_ClientesCabeceraTickets];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductosCabeceraTickets]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CabeceraTicketsSet] DROP CONSTRAINT [FK_ProductosCabeceraTickets];
GO
IF OBJECT_ID(N'[dbo].[FK_TecnicosLineasTicket_Tecnicos]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TecnicosLineasTicket] DROP CONSTRAINT [FK_TecnicosLineasTicket_Tecnicos];
GO
IF OBJECT_ID(N'[dbo].[FK_TecnicosLineasTicket_LineasTicket]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TecnicosLineasTicket] DROP CONSTRAINT [FK_TecnicosLineasTicket_LineasTicket];
GO
IF OBJECT_ID(N'[dbo].[FK_LineasTicketCabeceraTickets]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LineasTicketSet] DROP CONSTRAINT [FK_LineasTicketCabeceraTickets];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ClientesSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ClientesSet];
GO
IF OBJECT_ID(N'[dbo].[ProductosSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductosSet];
GO
IF OBJECT_ID(N'[dbo].[CabeceraTicketsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CabeceraTicketsSet];
GO
IF OBJECT_ID(N'[dbo].[LineasTicketSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LineasTicketSet];
GO
IF OBJECT_ID(N'[dbo].[TecnicosSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TecnicosSet];
GO
IF OBJECT_ID(N'[dbo].[ClientesProductos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ClientesProductos];
GO
IF OBJECT_ID(N'[dbo].[TecnicosLineasTicket]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TecnicosLineasTicket];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ClientesSet'
CREATE TABLE [dbo].[ClientesSet] (
    [Cif] nvarchar(9)  NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Direccion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProductosSet'
CREATE TABLE [dbo].[ProductosSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CabeceraTicketsSet'
CREATE TABLE [dbo].[CabeceraTicketsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FechaApertura] nvarchar(max)  NOT NULL,
    [FechaCierre] nvarchar(max)  NOT NULL,
    [TiempoTotal] int  NOT NULL,
    [Facturable] bit  NOT NULL,
    [ClientesCif] nvarchar(9)  NOT NULL,
    [ProductosId] int  NOT NULL,
    [Tipo] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LineasTicketSet'
CREATE TABLE [dbo].[LineasTicketSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Tiempo] nvarchar(max)  NOT NULL,
    [CabeceraTickets_Id] int  NOT NULL
);
GO

-- Creating table 'TecnicosSet'
CREATE TABLE [dbo].[TecnicosSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Correo] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ClientesProductos'
CREATE TABLE [dbo].[ClientesProductos] (
    [Clientes_Cif] nvarchar(9)  NOT NULL,
    [Productos_Id] int  NOT NULL
);
GO

-- Creating table 'TecnicosLineasTicket'
CREATE TABLE [dbo].[TecnicosLineasTicket] (
    [Tecnicos_Id] int  NOT NULL,
    [LineasTicket_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Cif] in table 'ClientesSet'
ALTER TABLE [dbo].[ClientesSet]
ADD CONSTRAINT [PK_ClientesSet]
    PRIMARY KEY CLUSTERED ([Cif] ASC);
GO

-- Creating primary key on [Id] in table 'ProductosSet'
ALTER TABLE [dbo].[ProductosSet]
ADD CONSTRAINT [PK_ProductosSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CabeceraTicketsSet'
ALTER TABLE [dbo].[CabeceraTicketsSet]
ADD CONSTRAINT [PK_CabeceraTicketsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LineasTicketSet'
ALTER TABLE [dbo].[LineasTicketSet]
ADD CONSTRAINT [PK_LineasTicketSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TecnicosSet'
ALTER TABLE [dbo].[TecnicosSet]
ADD CONSTRAINT [PK_TecnicosSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Clientes_Cif], [Productos_Id] in table 'ClientesProductos'
ALTER TABLE [dbo].[ClientesProductos]
ADD CONSTRAINT [PK_ClientesProductos]
    PRIMARY KEY CLUSTERED ([Clientes_Cif], [Productos_Id] ASC);
GO

-- Creating primary key on [Tecnicos_Id], [LineasTicket_Id] in table 'TecnicosLineasTicket'
ALTER TABLE [dbo].[TecnicosLineasTicket]
ADD CONSTRAINT [PK_TecnicosLineasTicket]
    PRIMARY KEY CLUSTERED ([Tecnicos_Id], [LineasTicket_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Clientes_Cif] in table 'ClientesProductos'
ALTER TABLE [dbo].[ClientesProductos]
ADD CONSTRAINT [FK_ClientesProductos_Clientes]
    FOREIGN KEY ([Clientes_Cif])
    REFERENCES [dbo].[ClientesSet]
        ([Cif])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Productos_Id] in table 'ClientesProductos'
ALTER TABLE [dbo].[ClientesProductos]
ADD CONSTRAINT [FK_ClientesProductos_Productos]
    FOREIGN KEY ([Productos_Id])
    REFERENCES [dbo].[ProductosSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientesProductos_Productos'
CREATE INDEX [IX_FK_ClientesProductos_Productos]
ON [dbo].[ClientesProductos]
    ([Productos_Id]);
GO

-- Creating foreign key on [ClientesCif] in table 'CabeceraTicketsSet'
ALTER TABLE [dbo].[CabeceraTicketsSet]
ADD CONSTRAINT [FK_ClientesCabeceraTickets]
    FOREIGN KEY ([ClientesCif])
    REFERENCES [dbo].[ClientesSet]
        ([Cif])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientesCabeceraTickets'
CREATE INDEX [IX_FK_ClientesCabeceraTickets]
ON [dbo].[CabeceraTicketsSet]
    ([ClientesCif]);
GO

-- Creating foreign key on [ProductosId] in table 'CabeceraTicketsSet'
ALTER TABLE [dbo].[CabeceraTicketsSet]
ADD CONSTRAINT [FK_ProductosCabeceraTickets]
    FOREIGN KEY ([ProductosId])
    REFERENCES [dbo].[ProductosSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductosCabeceraTickets'
CREATE INDEX [IX_FK_ProductosCabeceraTickets]
ON [dbo].[CabeceraTicketsSet]
    ([ProductosId]);
GO

-- Creating foreign key on [Tecnicos_Id] in table 'TecnicosLineasTicket'
ALTER TABLE [dbo].[TecnicosLineasTicket]
ADD CONSTRAINT [FK_TecnicosLineasTicket_Tecnicos]
    FOREIGN KEY ([Tecnicos_Id])
    REFERENCES [dbo].[TecnicosSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [LineasTicket_Id] in table 'TecnicosLineasTicket'
ALTER TABLE [dbo].[TecnicosLineasTicket]
ADD CONSTRAINT [FK_TecnicosLineasTicket_LineasTicket]
    FOREIGN KEY ([LineasTicket_Id])
    REFERENCES [dbo].[LineasTicketSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TecnicosLineasTicket_LineasTicket'
CREATE INDEX [IX_FK_TecnicosLineasTicket_LineasTicket]
ON [dbo].[TecnicosLineasTicket]
    ([LineasTicket_Id]);
GO

-- Creating foreign key on [CabeceraTickets_Id] in table 'LineasTicketSet'
ALTER TABLE [dbo].[LineasTicketSet]
ADD CONSTRAINT [FK_LineasTicketCabeceraTickets]
    FOREIGN KEY ([CabeceraTickets_Id])
    REFERENCES [dbo].[CabeceraTicketsSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LineasTicketCabeceraTickets'
CREATE INDEX [IX_FK_LineasTicketCabeceraTickets]
ON [dbo].[LineasTicketSet]
    ([CabeceraTickets_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------