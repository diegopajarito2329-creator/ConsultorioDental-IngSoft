-- 1. Configuramos la base de datos (Usando el nombre de tu repositorio)
CREATE DATABASE IF NOT EXISTS consultorio_dental;[cite: 1]
USE consultorio_dental;[cite: 1]

-- 2. Creamos la tabla de Médicos (Indispensable para identificar a la Dra. Ana)
CREATE TABLE IF NOT EXISTS medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    especialidad VARCHAR(100)
);

-- 3. Tabla de Pacientes (Tal cual la tienes en tu captura de pantalla)
CREATE TABLE IF NOT EXISTS pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,[cite: 1]
    nombre_completo VARCHAR(150) NOT NULL,[cite: 1]
    telefono VARCHAR(20) NOT NULL,[cite: 1]
    email VARCHAR(100),[cite: 1]
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP[cite: 1]
);

-- 4. Tabla de Citas (Híbrida: Tu código + Soporte automático para la Dra.)
CREATE TABLE IF NOT EXISTS citas (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,[cite: 1]
    id_paciente INT NOT NULL,[cite: 1]
    -- El DEFAULT 1 hace que el servidor.js siga funcionando sin cambios
    id_medico INT NOT NULL DEFAULT 1, 
    fecha DATE NOT NULL,[cite: 1]
    hora TIME NOT NULL,[cite: 1]
    motivo VARCHAR(255) NOT NULL,[cite: 1]
    estado VARCHAR(50) DEFAULT 'Programada',[cite: 1]
    
    -- Mantenemos tu lógica de borrado en cascada
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,[cite: 1]
    FOREIGN KEY (id_medico) REFERENCES medicos(id_medico) ON DELETE CASCADE
);

-- 5. Registro de la Dra. Ana Pajarito (Para que el ID 1 exista siempre)
INSERT INTO medicos (nombre_completo, especialidad) 
VALUES ('Dra. Ana Pajarito', 'Odontología General');

-- 6. Opcional: Un paciente de prueba para que veas datos en tu web
INSERT INTO pacientes (nombre_completo, telefono, email) 
VALUES ('Carlos Ramirez', '3312345678', 'carlos@gmail.com');[cite: 1]
