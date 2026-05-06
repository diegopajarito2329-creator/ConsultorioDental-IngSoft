-- 1. Configuramos la base de datos
CREATE DATABASE IF NOT EXISTS consultorio_dental;
USE consultorio_dental;

-- 2. Creamos la tabla de Médicos
CREATE TABLE IF NOT EXISTS medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    especialidad VARCHAR(100)
);

-- 3. Tabla de Pacientes
CREATE TABLE IF NOT EXISTS pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Tabla de Citas
CREATE TABLE IF NOT EXISTS citas (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL DEFAULT 1, 
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    estado VARCHAR(50) DEFAULT 'Programada',
    
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico) ON DELETE CASCADE
);

-- 5. Registro de la Dra. Ana Pajarito
INSERT INTO medicos (nombre_completo, especialidad) 
VALUES ('Dra. Ana Pajarito', 'Odontología General');

-- 6. Paciente de prueba
INSERT INTO pacientes (nombre_completo, telefono, email) 
VALUES ('Carlos Ramirez', '3312345678', 'carlos@gmail.com');
