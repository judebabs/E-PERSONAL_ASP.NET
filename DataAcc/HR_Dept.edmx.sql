
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/30/2012 18:53:43
-- Generated from EDMX file: G:\EAGLE-EYE\STUDENT PACKAGE\ASSIGNEMENT\DS2\TO_BE_PRESENTED\THE_PROJECT_E-PERSONAL\THE_PROJECT_E-PERSONAL\DataAcc\HR_Dept.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [HR_Dept];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Employee__dept_c__060DEAE8]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK__Employee__dept_c__060DEAE8];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Department]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Department];
GO
IF OBJECT_ID(N'[dbo].[Employee]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employee];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Departments'
CREATE TABLE [dbo].[Departments] (
    [dept_code] int  NOT NULL,
    [dept_name] varchar(100)  NULL,
    [dept_location] varchar(100)  NULL
);
GO

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [emp_code] int  NOT NULL,
    [emp_name] varchar(100)  NULL,
    [emp_designation] varchar(100)  NULL,
    [emp_date_appointed] int  NULL,
    [dept_code] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [dept_code] in table 'Departments'
ALTER TABLE [dbo].[Departments]
ADD CONSTRAINT [PK_Departments]
    PRIMARY KEY CLUSTERED ([dept_code] ASC);
GO

-- Creating primary key on [emp_code] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([emp_code] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [dept_code] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [FK__Employee__dept_c__060DEAE8]
    FOREIGN KEY ([dept_code])
    REFERENCES [dbo].[Departments]
        ([dept_code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK__Employee__dept_c__060DEAE8'
CREATE INDEX [IX_FK__Employee__dept_c__060DEAE8]
ON [dbo].[Employees]
    ([dept_code]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------