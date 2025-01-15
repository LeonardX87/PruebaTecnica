-- 1. Crear la base de datos
CREATE DATABASE InventoryDb;
GO

-- 2. Uso de la base de datos creada
USE InventoryDb;
GO

-- 3. Crear la tabla de Usuarios
CREATE TABLE Users (
                       Id INT IDENTITY(1,1) PRIMARY KEY,
                       Username NVARCHAR(50) NOT NULL UNIQUE,
                       PasswordHash NVARCHAR(255) NOT NULL,
                       Role NVARCHAR(50) NOT NULL DEFAULT 'User',
                       CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- 4. Crear la tabla de Productos
CREATE TABLE Products (
                          Id INT IDENTITY(1,1) PRIMARY KEY,
                          Name NVARCHAR(100) NOT NULL,
                          Price DECIMAL(10,2) NOT NULL,
                          Description NVARCHAR(500) NULL,
                          Stock INT NOT NULL,
                          Status NVARCHAR(50) NOT NULL,
                          ImageUrl NVARCHAR(255) NULL,
                          IsActive BIT NOT NULL DEFAULT 1,
                          CreatedAt DATETIME DEFAULT GETDATE(),
                          UpdatedAt DATETIME NULL
);
GO

-- 5. Insertar un usuario administrador por defecto
-- Contraseña: 'admin123' (encriptada con BCrypt)
INSERT INTO Users (Username, PasswordHash, Role)
VALUES ('admin', '$2a$11$QCfutXwYGXHZaZk.JvHZWu8c1BEyXl85SmatcQIOgI7idEFRFCA3u', 'Admin');
GO

-- 6. Insertar productos de ejemplo
INSERT INTO Products (Name, Price, Description, Stock, Status,IsActive)
VALUES 
('Monitor Gamer 27"', 250.00, 'Monitor Gamer de 27" con resolución 100Hz', 8, 'Activo', 1),
('Laptop Dell XP', 1200.00, 'Laptop ultrabook Dell', 10, 'Activo', 1),
GO