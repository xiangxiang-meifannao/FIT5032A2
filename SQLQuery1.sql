
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/31/2023 17:24:30
-- Generated from EDMX file: E:\Course\monash\S2\FIT5032 Internet applications development\MyCode\FIT5032A2FXY\Models\EntityModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Database];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Customer'
CREATE TABLE [dbo].[Customer] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Doctor'
CREATE TABLE [dbo].[Doctor] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Appointment'
CREATE TABLE [dbo].[Appointment] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CustomerId] int  NOT NULL,
    [DoctorId] int  NOT NULL,
    [Date] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Customer'
ALTER TABLE [dbo].[Customer]
ADD CONSTRAINT [PK_Customer]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Doctor'
ALTER TABLE [dbo].[Doctor]
ADD CONSTRAINT [PK_Doctor]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Appointment'
ALTER TABLE [dbo].[Appointment]
ADD CONSTRAINT [PK_Appointment]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerId] in table 'Appointment'
ALTER TABLE [dbo].[Appointment]
ADD CONSTRAINT [FK_CustomerAppointment]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customer]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerAppointment'
CREATE INDEX [IX_FK_CustomerAppointment]
ON [dbo].[Appointment]
    ([CustomerId]);
GO

-- Creating foreign key on [DoctorId] in table 'Appointment'
ALTER TABLE [dbo].[Appointment]
ADD CONSTRAINT [FK_DoctorAppointment]
    FOREIGN KEY ([DoctorId])
    REFERENCES [dbo].[Doctor]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorAppointment'
CREATE INDEX [IX_FK_DoctorAppointment]
ON [dbo].[Appointment]
    ([DoctorId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------