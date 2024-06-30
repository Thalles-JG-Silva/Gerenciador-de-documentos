-- Cria o banco de dados 'CertificadosDB'
CREATE DATABASE CertificadosDB
GO

-- Seleciona o banco de dados 'CertificadosDB' para uso
USE CertificadosDB
GO

-- Cria a tabela 'Certificados'
CREATE TABLE dbo.Certificados(
    CertificadoID int IDENTITY(1,1) NOT NULL, -- Coluna 'CertificadoID' com incremento automático
    Titulo nvarchar(255) NOT NULL,            -- Coluna 'Titulo' do tipo texto variável até 255 caracteres
    Tipo nvarchar(50) NOT NULL,               -- Coluna 'Tipo' do tipo texto variável até 50 caracteres
    Horas int NOT NULL,                       -- Coluna 'Horas' do tipo inteiro
    Data date NOT NULL,                       -- Coluna 'Data' do tipo data
    Participante nvarchar(255) NOT NULL,      -- Coluna 'Participante' do tipo texto variável até 255 caracteres
    Participacao nvarchar(50) NOT NULL,       -- Coluna 'Participacao' do tipo texto variável até 50 caracteres
    Excluido bit NOT NULL,                    -- Coluna 'Excluido' do tipo bit (booleano)
    PRIMARY KEY (CertificadoID)               -- Define 'CertificadoID' como chave primária
)
GO

-- Cria a tabela 'Usuarios'
CREATE TABLE dbo.Usuarios(
    UsuarioID int IDENTITY(1,1) NOT NULL,     -- Coluna 'UsuarioID' com incremento automático
    Nome nvarchar(255) NOT NULL,              -- Coluna 'Nome' do tipo texto variável até 255 caracteres
    NomeUsuario nvarchar(255) NOT NULL,       -- Coluna 'NomeUsuario' do tipo texto variável até 255 caracteres
    Email nvarchar(255) NOT NULL,             -- Coluna 'Email' do tipo texto variável até 255 caracteres
    Senha nvarchar(255) NOT NULL,             -- Coluna 'Senha' do tipo texto variável até 255 caracteres
    DataCadastro datetime NOT NULL DEFAULT (getdate()), -- Coluna 'DataCadastro' do tipo datetime com valor padrão como data atual
    PRIMARY KEY (UsuarioID),                  -- Define 'UsuarioID' como chave primária
    UNIQUE (NomeUsuario),                     -- Define 'NomeUsuario' como único
    UNIQUE (Email)                            -- Define 'Email' como único
)
GO

-- Adiciona um valor padrão de 0 para a coluna 'Excluido' na tabela 'Certificados'
ALTER TABLE dbo.Certificados ADD DEFAULT ((0)) FOR Excluido
GO

-- Cria a stored procedure 'AutenticarUsuario' para autenticar um usuário
CREATE PROCEDURE dbo.AutenticarUsuario
    @NomeUsuario NVARCHAR(255),
    @Senha NVARCHAR(255)
AS
BEGIN
    SELECT UsuarioID, Nome, NomeUsuario, Email, DataCadastro
    FROM Usuarios
    WHERE NomeUsuario = @NomeUsuario AND Senha = @Senha;
END;
GO

-- Cria a stored procedure 'CriarCertificado' para criar um novo certificado
CREATE PROCEDURE dbo.CriarCertificado
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

-- Cria a stored procedure 'CriarUsuario' para criar um novo usuário
CREATE PROCEDURE dbo.CriarUsuario
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

-- Cria a stored procedure 'EditarCertificado' para editar um certificado existente
CREATE PROCEDURE dbo.EditarCertificado
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

-- Cria a stored procedure 'ExcluirCertificado' para mover um certificado para a lixeira
CREATE PROCEDURE dbo.ExcluirCertificado
    @CertificadoID INT
AS
BEGIN
    UPDATE Certificados
    SET Excluido = 1
    WHERE CertificadoID = @CertificadoID;
END;
GO

-- Cria a stored procedure 'ExcluirPermanentementeCertificado' para excluir permanentemente um certificado
CREATE PROCEDURE dbo.ExcluirPermanentementeCertificado
    @CertificadoID INT
AS
BEGIN
    DELETE FROM Certificados
    WHERE CertificadoID = @CertificadoID;
END;
GO

-- Cria a stored procedure 'RestaurarCertificado' para restaurar um certificado da lixeira
CREATE PROCEDURE dbo.RestaurarCertificado
    @CertificadoID INT
AS
BEGIN
    UPDATE Certificados
    SET Excluido = 0
    WHERE CertificadoID = @CertificadoID;
END;
GO

-- Cria a stored procedure 'VisualizarCertificados' para visualizar todos os certificados
CREATE PROCEDURE dbo.VisualizarCertificados
AS
BEGIN
    SELECT * FROM Certificados;
END;
GO

-- Cria a stored procedure 'VisualizarCertificadosAtivos' para visualizar certificados não excluídos
CREATE PROCEDURE dbo.VisualizarCertificadosAtivos
AS
BEGIN
    SELECT * FROM Certificados
    WHERE Excluido = 0;
END;
GO

-- Cria a stored procedure 'VisualizarCertificadosExcluidos' para visualizar certificados excluídos (na lixeira)
CREATE PROCEDURE dbo.VisualizarCertificadosExcluidos
AS
BEGIN
    SELECT * FROM Certificados
    WHERE Excluido = 1;
END;
GO
