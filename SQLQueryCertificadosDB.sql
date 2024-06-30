USE [master]
GO
/****** Object:  Database [CertificadosDB]    Script Date: 30/06/2024 11:24:46 ******/
CREATE DATABASE [CertificadosDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CertificadosDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CertificadosDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CertificadosDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CertificadosDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CertificadosDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CertificadosDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CertificadosDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CertificadosDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CertificadosDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CertificadosDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CertificadosDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CertificadosDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CertificadosDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CertificadosDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CertificadosDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CertificadosDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CertificadosDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CertificadosDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CertificadosDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CertificadosDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CertificadosDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CertificadosDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CertificadosDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CertificadosDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CertificadosDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CertificadosDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CertificadosDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CertificadosDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CertificadosDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CertificadosDB] SET  MULTI_USER 
GO
ALTER DATABASE [CertificadosDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CertificadosDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CertificadosDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CertificadosDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CertificadosDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CertificadosDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CertificadosDB] SET QUERY_STORE = OFF
GO
USE [CertificadosDB]
GO
/****** Object:  Table [dbo].[Certificados]    Script Date: 30/06/2024 11:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificados](
	[CertificadoID] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](255) NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
	[Horas] [int] NOT NULL,
	[Data] [date] NOT NULL,
	[Participante] [nvarchar](255) NOT NULL,
	[Participacao] [nvarchar](50) NOT NULL,
	[Excluido] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CertificadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 30/06/2024 11:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](255) NOT NULL,
	[NomeUsuario] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Senha] [nvarchar](255) NOT NULL,
	[DataCadastro] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[NomeUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Certificados] ADD  DEFAULT ((0)) FOR [Excluido]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [DataCadastro]
GO
/****** Object:  StoredProcedure [dbo].[AutenticarUsuario]    Script Date: 30/06/2024 11:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedure para autenticar um usuário
CREATE PROCEDURE [dbo].[AutenticarUsuario]
    @NomeUsuario NVARCHAR(255),
    @Senha NVARCHAR(255)
AS
BEGIN
    SELECT UsuarioID, Nome, NomeUsuario, Email, DataCadastro
    FROM Usuarios
    WHERE NomeUsuario = @NomeUsuario AND Senha = @Senha;
END;
GO
/****** Object:  StoredProcedure [dbo].[CriarCertificado]    Script Date: 30/06/2024 11:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedure para criar um novo certificado
CREATE PROCEDURE [dbo].[CriarCertificado]
    @Titulo NVARCHAR(255),
    @Tipo NVARCHAR(50),
    @Horas INT,
    @Data DATE,
    @Participante NVARCHAR(255),
    @Participacao NVARCHAR(50)
AS
BEGIN
    INSERT INTO Certificados (Titulo, Tipo, Horas, Data, Participante, Participacao, Excluido)
    VALUES (@Titulo, @Tipo, @Horas, @Data, @Participante, @Participacao, 0);
END;
GO
/****** Object:  StoredProcedure [dbo].[CriarUsuario]    Script Date: 30/06/2024 11:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedure para criar um novo usuário
CREATE PROCEDURE [dbo].[CriarUsuario]
    @Nome NVARCHAR(255),
    @NomeUsuario NVARCHAR(255),
    @Email NVARCHAR(255),
    @Senha NVARCHAR(255)
AS
BEGIN
    INSERT INTO Usuarios (Nome, NomeUsuario, Email, Senha)
    VALUES (@Nome, @NomeUsuario, @Email, @Senha);
END;
GO
/****** Object:  StoredProcedure [dbo].[EditarCertificado]    Script Date: 30/06/2024 11:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedure para editar um certificado existente
CREATE PROCEDURE [dbo].[EditarCertificado]
    @CertificadoID INT,
    @Titulo NVARCHAR(255),
    @Tipo NVARCHAR(50),
    @Horas INT,
    @Data DATE,
    @Participante NVARCHAR(255),
    @Participacao NVARCHAR(50)
AS
BEGIN
    UPDATE Certificados
    SET Titulo = @Titulo,
        Tipo = @Tipo,
        Horas = @Horas,
        Data = @Data,
        Participante = @Participante,
        Participacao = @Participacao
    WHERE CertificadoID = @CertificadoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[ExcluirCertificado]    Script Date: 30/06/2024 11:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedure para excluir (mover para a lixeira) um certificado
CREATE PROCEDURE [dbo].[ExcluirCertificado]
    @CertificadoID INT
AS
BEGIN
    UPDATE Certificados
    SET Excluido = 1
    WHERE CertificadoID = @CertificadoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[ExcluirPermanentementeCertificado]    Script Date: 30/06/2024 11:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedure para excluir permanentemente um certificado
CREATE PROCEDURE [dbo].[ExcluirPermanentementeCertificado]
    @CertificadoID INT
AS
BEGIN
    DELETE FROM Certificados
    WHERE CertificadoID = @CertificadoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[RestaurarCertificado]    Script Date: 30/06/2024 11:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedure para restaurar um certificado da lixeira
CREATE PROCEDURE [dbo].[RestaurarCertificado]
    @CertificadoID INT
AS
BEGIN
    UPDATE Certificados
    SET Excluido = 0
    WHERE CertificadoID = @CertificadoID;
END;
GO
/****** Object:  StoredProcedure [dbo].[VisualizarCertificados]    Script Date: 30/06/2024 11:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Visualizar certificados (incluindo lixeira)
CREATE PROCEDURE [dbo].[VisualizarCertificados]
AS
BEGIN
    SELECT * FROM Certificados;
END;
GO
/****** Object:  StoredProcedure [dbo].[VisualizarCertificadosAtivos]    Script Date: 30/06/2024 11:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Visualizar certificados não excluídos
CREATE PROCEDURE [dbo].[VisualizarCertificadosAtivos]
AS
BEGIN
    SELECT * FROM Certificados
    WHERE Excluido = 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[VisualizarCertificadosExcluidos]    Script Date: 30/06/2024 11:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Visualizar certificados na lixeira
CREATE PROCEDURE [dbo].[VisualizarCertificadosExcluidos]
AS
BEGIN
    SELECT * FROM Certificados
    WHERE Excluido = 1;
END;
GO
USE [master]
GO
ALTER DATABASE [CertificadosDB] SET  READ_WRITE 
GO
