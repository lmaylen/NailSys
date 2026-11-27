/*Integrantes: Sofia Sarmiento, Aylen Suarez, Yojan Sanchez, Michelle Ibañez, Danielis Gonzalez*/
DROP DATABASE IF EXISTS nailsys;

CREATE DATABASE IF NOT EXISTS nailsys
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE nailsys;

-- =========================================
-- 1. TABLAS Y DATOS INICIALES (DDL + DML)
-- =========================================

CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(200)
);

INSERT INTO roles (nombre, descripcion) VALUES
('Administrador', 'Control total del sistema'),
('Empleado', 'Gestiona agenda y servicios'),
('Cliente', 'Solicita servicios y citas'),
('Recepcionista', 'Gestiona reservas y atención'),
('Supervisor', 'Supervisa las actividades'),
('Contador', 'Gestiona información financiera'),
('Coordinador', 'Coordina el personal'),
('Soporte', 'Administra soporte técnico'),
('Auditor', 'Revisa las operaciones'),
('Gerente', 'Administra el negocio');

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_rol INT NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    tipo_documento VARCHAR(30),
    numero_documento VARCHAR(30) UNIQUE,
    correo VARCHAR(120) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    contrasena VARCHAR(255) NOT NULL,
    estado ENUM('Activo','Inactivo','Bloqueado') DEFAULT 'Activo',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

INSERT INTO usuarios
(id_rol, nombres, apellidos, tipo_documento,
numero_documento, correo, telefono, contrasena)
VALUES
(3,'Laura','Gomez','CC','100100001','laura@gmail.com','3001000001','hash_demo_01'),
(3,'Camila','Rodriguez','CC','100100002','camila@gmail.com','3001000002','hash_demo_02'),
(3,'Valentina','Martinez','CC','100100003','valentina@gmail.com','3001000003','hash_demo_03'),
(3,'Sofia','Hernandez','CC','100100004','sofia@gmail.com','3001000004','hash_demo_04'),
(3,'Daniela','Lopez','CC','100100005','daniela@gmail.com','3001000005','hash_demo_05'),
(3,'Mariana','Torres','CC','100100006','mariana@gmail.com','3001000006','hash_demo_06'),
(3,'Isabella','Ramirez','CC','100100007','isabella@gmail.com','3001000007','hash_demo_07'),
(3,'Gabriela','Castro','CC','100100008','gabriela@gmail.com','3001000008','hash_demo_08'),
(3,'Natalia','Moreno','CC','100100009','natalia@gmail.com','3001000009','hash_demo_09'),
(3,'Andrea','Vargas','CC','100100010','andrea@gmail.com','3001000010','hash_demo_10'),
(2,'Paula','Rojas','CC','100200001','paula@gmail.com','3012000001','hash_demo_11'),
(2,'Diana','Perez','CC','100200002','diana@gmail.com','3012000002','hash_demo_12'),
(2,'Carolina','Diaz','CC','100200003','carolina@gmail.com','3012000003','hash_demo_13'),
(2,'Luisa','Mendoza','CC','100200004','luisa@gmail.com','3012000004','hash_demo_14'),
(2,'Alejandra','Silva','CC','100200005','alejandra@gmail.com','3012000005','hash_demo_15'),
(2,'Juliana','Ortega','CC','100200006','juliana@gmail.com','3012000006','hash_demo_16'),
(2,'Tatiana','Ruiz','CC','100200007','tatiana@gmail.com','3012000007','hash_demo_17'),
(2,'Monica','Navarro','CC','100200008','monica@gmail.com','3012000008','hash_demo_18'),
(2,'Katherine','Molina','CC','100200009','katherine@gmail.com','3012000009','hash_demo_19'),
(2,'Marcela','Suarez','CC','100200010','marcela@gmail.com','3012000010','hash_demo_20');

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL UNIQUE,
    fecha_nacimiento DATE,
    direccion VARCHAR(200),
    genero VARCHAR(30),
    observaciones TEXT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO clientes
(id_usuario, fecha_nacimiento, direccion, genero, observaciones)
VALUES
(1,'2000-05-12','Calle 10 #15-20','Femenino','Prefiere manicure tradicional'),
(2,'1998-08-20','Carrera 20 #30-15','Femenino','Prefiere tonos claros'),
(3,'2001-02-14','Calle 45 #12-30','Femenino','Tiene uñas sensibles'),
(4,'1999-11-03','Carrera 15 #40-10','Femenino','Prefiere citas en la mañana'),
(5,'2002-06-25','Calle 80 #20-40','Femenino','Solicita diseños personalizados'),
(6,'1997-04-18','Carrera 50 #10-25','Femenino','Prefiere uñas cortas'),
(7,'2000-09-09','Calle 22 #18-50','Femenino','Prefiere colores oscuros'),
(8,'1996-12-30','Carrera 30 #25-60','Femenino','Cliente frecuente'),
(9,'2003-03-16','Calle 60 #14-20','Femenino','Prefiere diseños sencillos'),
(10,'1995-07-07','Carrera 12 #50-30','Femenino','Solicita manicure y pedicure');

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL UNIQUE,
    especialidad VARCHAR(100),
    descripcion TEXT,
    fecha_contratacion DATE,
    salario DECIMAL(10,2),
    estado ENUM('Disponible','Ocupado','Inactivo') DEFAULT 'Disponible',
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO empleados
(id_usuario, especialidad, descripcion, fecha_contratacion, salario, estado)
VALUES
(11,'Manicure','Especialista en manicure tradicional y semipermanente','2025-01-10',1800000,'Disponible'),
(12,'Pedicure','Especialista en cuidado, limpieza y esmaltado de uñas de los pies','2025-02-15',1850000,'Disponible'),
(13,'Uñas acrílicas','Experta en aplicación, esculpido y mantenimiento de uñas acrílicas','2025-03-20',1900000,'Disponible'),
(14,'Nail art','Especialista en decoraciones y diseños artísticos para uñas','2025-04-05',1900000,'Disponible'),
(15,'Uñas en polygel','Especialista en extensión y recubrimiento de uñas con polygel','2025-05-12',2000000,'Disponible'),
(16,'Tratamientos de uñas','Especialista en fortalecimiento, baño de calcio y reconstrucción de uñas','2025-06-18',2100000,'Disponible'),
(17,'Retiro y cuidado de uñas','Especialista en retiro seguro de acrílico o gel y cuidado de uña natural','2025-07-22',1850000,'Disponible'),
(18,'Manicure ruso','Especialista en limpieza profunda de cutícula y esmaltado en uñas','2025-08-14',1800000,'Disponible'),
(19,'Spa de uñas','Especialista en rituales de hidratación y bienestar para uñas y manos','2025-09-01',1950000,'Disponible'),
(20,'Manicure','Especialista en cuidado y mantenimiento general de uñas','2025-10-10',1850000,'Disponible');

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    estado ENUM('Activa','Inactiva') DEFAULT 'Activa'
);

INSERT INTO categorias (nombre, descripcion) VALUES
('Manicure', 'Cuidado, limado, cutícula y esmaltado de uñas de las manos'),
('Pedicure', 'Cuidado, limado, exfoliación y esmaltado de uñas de los pies'),
('Tratamientos de uñas', 'Tratamientos fortalecedores, reconstructores y de nutrición para uñas'),
('Spa de uñas', 'Rituales relajantes de hidratación y bienestar enfocados en manos, pies y uñas'),
('Uñas acrílicas', 'Aplicación, esculpido, diseño y mantenimiento de uñas acrílicas');

CREATE TABLE servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    duracion INT NOT NULL,
    estado ENUM('Activo','Inactivo') DEFAULT 'Activo',
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

INSERT INTO servicios
(id_categoria, nombre, descripcion, precio, duracion)
VALUES
(1,'Manicure tradicional','Limpieza, limado de uñas, arreglo de cutícula y esmaltado tradicional',25000,40),
(1,'Manicure semipermanente','Preparación de uña natural y esmaltado semipermanente de larga duración',45000,60),
(2,'Pedicure tradicional','Limpieza de uñas de los pies, retiro de cutícula y esmaltado tradicional',30000,50),
(2,'Pedicure spa','Cuidado de uñas de los pies con exfoliación, mascarilla y esmaltado',50000,70),
(3,'Baño de calcio para uñas','Tratamiento fortalecedor para uñas débiles o quebradizas',35000,45),
(3,'Reconstrucción de uña','Reparación y nivelación de uña natural fisurada o maltratada',80000,90),
(3,'Polygel en uñas','Extensión y recubrimiento de uñas con sistema de polygel',90000,120),
(3,'Retiro profesional de uñas','Retiro seguro de acrílico, gel o semipermanente cuidando la uña natural',20000,30),
(4,'Hidratación profunda de uñas y cutículas','Tratamiento nutritivo con aceites y mascarilla para uñas y cutículas',55000,60),
(5,'Uñas acrílicas','Aplicación, moldeado y acabado de uñas acrílicas',100000,120);

CREATE TABLE empleado_servicio (
    id_empleado_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    id_servicio INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio),
    UNIQUE (id_empleado, id_servicio)
);

INSERT INTO empleado_servicio (id_empleado, id_servicio) VALUES
(1,1),(2,3),(3,10),(4,2),(5,6),
(6,5),(7,7),(8,8),(9,9),(10,4);

CREATE TABLE horarios (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    dia_semana ENUM(
        'Lunes','Martes','Miercoles','Jueves',
        'Viernes','Sabado','Domingo'
    ) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    estado ENUM('Activo','Inactivo') DEFAULT 'Activo',
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

INSERT INTO horarios
(id_empleado, dia_semana, hora_inicio, hora_fin)
VALUES
(1,'Lunes','08:00:00','17:00:00'),
(2,'Martes','08:00:00','17:00:00'),
(3,'Miercoles','09:00:00','18:00:00'),
(4,'Jueves','08:00:00','17:00:00'),
(5,'Viernes','09:00:00','18:00:00'),
(6,'Sabado','08:00:00','16:00:00'),
(7,'Lunes','09:00:00','18:00:00'),
(8,'Martes','08:00:00','17:00:00'),
(9,'Miercoles','09:00:00','18:00:00'),
(10,'Jueves','08:00:00','17:00:00');

CREATE TABLE excepciones_horario (
    id_excepcion INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio TIME,
    hora_fin TIME,
    tipo ENUM('Permiso','Descanso','Vacaciones','Bloqueo') NOT NULL,
    descripcion VARCHAR(200),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

INSERT INTO excepciones_horario
(id_empleado, fecha, hora_inicio, hora_fin, tipo, descripcion)
VALUES
(1,'2026-12-15','08:00:00','12:00:00','Permiso','Cita personal'),
(2,'2026-12-16',NULL,NULL,'Descanso','Dia de descanso'),
(3,'2026-12-17',NULL,NULL,'Vacaciones','Vacaciones programadas'),
(4,'2026-12-18','14:00:00','18:00:00','Bloqueo','Capacitacion'),
(5,'2026-12-19','08:00:00','12:00:00','Permiso','Diligencia personal'),
(6,'2026-12-20',NULL,NULL,'Descanso','Dia libre'),
(7,'2026-12-21',NULL,NULL,'Vacaciones','Vacaciones programadas'),
(8,'2026-12-22','09:00:00','13:00:00','Bloqueo','Mantenimiento'),
(9,'2026-12-23','08:00:00','12:00:00','Permiso','Asunto personal'),
(10,'2026-12-24',NULL,NULL,'Descanso','Descanso navideño');

CREATE TABLE citas (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    estado ENUM(
        'Pendiente',
        'Confirmada',
        'En proceso',
        'Completada',
        'Cancelada',
        'No asistio'
    ) DEFAULT 'Pendiente',
    observaciones TEXT,
    motivo_cancelacion VARCHAR(250),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

INSERT INTO citas
(id_cliente, id_empleado, fecha, hora_inicio, hora_fin, estado, observaciones)
VALUES
(1,1,'2026-12-01','08:00:00','08:40:00','Completada','Manicure tradicional realizado correctamente'),
(2,2,'2026-12-02','09:00:00','09:50:00','Completada','Pedicure realizado, cliente satisfecha'),
(3,3,'2026-12-03','10:00:00','12:00:00','Completada','Aplicacion de uñas acrilicas'),
(4,4,'2026-12-04','11:00:00','12:00:00','Confirmada','Diseño nail art personalizado en uñas'),
(5,5,'2026-12-05','09:00:00','10:30:00','Confirmada','Aplicación de uñas en polygel'),
(6,6,'2026-12-06','10:00:00','10:45:00','Pendiente','Tratamiento fortalecedor y reconstrucción de uña'),
(7,7,'2026-12-07','08:00:00','10:00:00','Confirmada','Retiro seguro de sistema anterior y cuidado de uña'),
(8,8,'2026-12-08','09:00:00','09:30:00','Completada','Manicure ruso y esmaltado'),
(9,9,'2026-12-09','10:00:00','11:00:00','Completada','Spa de uñas e hidratación profunda'),
(10,10,'2026-12-10','11:00:00','12:00:00','Pendiente','Manicure y cuidado general de uñas');

CREATE TABLE detalle_citas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_cita INT NOT NULL,
    id_servicio INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    precio_unitario DECIMAL(10,2) NOT NULL,
    duracion_minutos INT NOT NULL,
    FOREIGN KEY (id_cita) REFERENCES citas(id_cita),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);

INSERT INTO detalle_citas
(id_cita, id_servicio, cantidad, precio_unitario, duracion_minutos)
VALUES
(1,1,1,25000,40),
(2,3,1,30000,50),
(3,10,1,100000,120),
(4,2,1,45000,60),
(5,6,1,80000,90),
(6,5,1,35000,45),
(7,7,1,90000,120),
(8,8,1,20000,30),
(9,9,1,55000,60),
(10,4,1,50000,70);

CREATE TABLE historial_citas (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_cita INT NOT NULL,
    id_usuario INT NOT NULL,
    estado_anterior VARCHAR(30),
    estado_nuevo VARCHAR(30) NOT NULL,
    observacion TEXT,
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cita) REFERENCES citas(id_cita),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO historial_citas
(id_cita, id_usuario, estado_anterior, estado_nuevo, observacion)
VALUES
(1,11,'Pendiente','Completada','Servicio finalizado'),
(2,12,'Pendiente','Completada','Cita finalizada'),
(3,13,'Pendiente','Completada','Aplicacion finalizada'),
(4,14,'Pendiente','Confirmada','Cita confirmada'),
(5,15,'Pendiente','Confirmada','Reserva confirmada'),
(6,16,'Pendiente','Pendiente','Reserva registrada'),
(7,17,'Pendiente','Confirmada','Cita confirmada'),
(8,18,'Pendiente','Completada','Servicio finalizado'),
(9,19,'Pendiente','Completada','Tratamiento realizado'),
(10,20,'Pendiente','Pendiente','Reserva registrada');

CREATE TABLE metodos_pago (
    id_metodo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    estado ENUM('Activo','Inactivo') DEFAULT 'Activo'
);

INSERT INTO metodos_pago (nombre) VALUES
('Efectivo'),
('Tarjeta debito'),
('Tarjeta credito'),
('Transferencia bancaria'),
('Pago en linea');

CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_cita INT NOT NULL,
    id_metodo INT,
    modalidad ENUM('En linea','En establecimiento') NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    estado ENUM(
        'Pendiente',
        'Aprobado',
        'Rechazado',
        'Reembolsado'
    ) DEFAULT 'Pendiente',
    referencia_transaccion VARCHAR(150) UNIQUE,
    fecha_pago DATETIME,
    observaciones TEXT,
    FOREIGN KEY (id_cita) REFERENCES citas(id_cita),
    FOREIGN KEY (id_metodo) REFERENCES metodos_pago(id_metodo)
);

INSERT INTO pagos
(id_cita, id_metodo, modalidad, monto, estado, referencia_transaccion, fecha_pago, observaciones)
VALUES
(1,1,'En establecimiento',25000,'Aprobado','PAGO001','2026-12-01 08:45:00','Pago en efectivo'),
(2,2,'En establecimiento',30000,'Aprobado','PAGO002','2026-12-02 09:55:00','Pago realizado'),
(3,3,'En linea',100000,'Aprobado','PAGO003','2026-12-03 12:05:00','Transferencia aprobada'),
(4,4,'En linea',45000,'Pendiente','PAGO004',NULL,'Pendiente de confirmacion'),
(5,5,'En establecimiento',80000,'Aprobado','PAGO005','2026-12-05 10:35:00','Pago con tarjeta'),
(6,1,'En linea',35000,'Pendiente','PAGO006',NULL,'Esperando pago'),
(7,4,'En linea',90000,'Aprobado','PAGO007','2026-12-07 10:05:00','Transferencia aprobada'),
(8,1,'En establecimiento',20000,'Aprobado','PAGO008','2026-12-08 09:35:00','Pago en efectivo'),
(9,5,'En linea',55000,'Aprobado','PAGO009','2026-12-09 11:05:00','Pago confirmado'),
(10,2,'En establecimiento',50000,'Pendiente','PAGO010',NULL,'Pago pendiente');

CREATE TABLE servicios_realizados (
    id_realizado INT AUTO_INCREMENT PRIMARY KEY,
    id_detalle INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha_realizacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    observaciones TEXT,
    FOREIGN KEY (id_detalle) REFERENCES detalle_citas(id_detalle),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

INSERT INTO servicios_realizados
(id_detalle, id_empleado, observaciones)
VALUES
(1,1,'Manicure tradicional realizado'),
(2,2,'Pedicure realizado'),
(3,3,'Uñas acrílicas aplicadas'),
(4,4,'Diseño nail art y esmaltado realizados'),
(5,5,'Aplicación de uñas en polygel realizada'),
(6,6,'Tratamiento fortalecedor y reconstrucción de uña realizados'),
(7,7,'Retiro de sistema anterior y cuidado de uña realizados'),
(8,8,'Manicure ruso y esmaltado realizados'),
(9,9,'Spa de uñas e hidratación profunda aplicados'),
(10,10,'Manicure y cuidado general de uñas realizados');

CREATE TABLE calificaciones (
    id_calificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_cita INT NOT NULL UNIQUE,
    id_cliente INT NOT NULL,
    puntuacion INT NOT NULL,
    comentario TEXT,
    fecha_calificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cita) REFERENCES citas(id_cita),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CHECK (puntuacion BETWEEN 1 AND 5)
);

INSERT INTO calificaciones
(id_cita, id_cliente, puntuacion, comentario)
VALUES
(1,1,5,'Excelente servicio'),
(2,2,4,'Muy buena atencion'),
(3,3,5,'Me encanto el resultado'),
(4,4,5,'Muy profesional'),
(5,5,4,'Buen servicio'),
(6,6,3,'Servicio aceptable'),
(7,7,5,'Excelente trabajo'),
(8,8,4,'Muy satisfecha'),
(9,9,5,'Recomendado'),
(10,10,4,'Buena experiencia');

CREATE TABLE promociones (
    id_promocion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    descuento DECIMAL(5,2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado ENUM('Activa','Inactiva') DEFAULT 'Activa',
    CHECK (descuento > 0 AND descuento <= 100),
    CHECK (fecha_fin >= fecha_inicio)
);

INSERT INTO promociones
(nombre, descripcion, descuento, fecha_inicio, fecha_fin)
VALUES
('Bienvenida','Descuento en servicios de uñas para nuevos clientes',10,'2026-11-01','2026-12-31'),
('Navidad','Promocion especial navideña en servicios de uñas',15,'2026-12-01','2026-12-31'),
('Manos perfectas','Descuento en manicure tradicional y semipermanente',20,'2026-11-15','2026-12-15'),
('Dia de spa','Descuento en spa de uñas e hidratacion de manos y pies',12,'2026-11-20','2026-12-20'),
('Uñas radiantes','Descuento en servicios seleccionados de uñas',25,'2026-12-01','2026-12-20'),
('Cliente frecuente','Beneficio en servicios de uñas para clientes frecuentes',10,'2026-11-01','2027-01-31'),
('Semana de uñas','Descuento en uñas acrilicas y polygel',18,'2026-12-05','2026-12-12'),
('Cuidado de uñas','Descuento en tratamientos fortalecedores y reconstruccion de uñas',15,'2026-12-01','2026-12-15'),
('Pedicure especial','Descuento en pedicure tradicional y spa para uñas de los pies',20,'2026-11-25','2026-12-25'),
('Fin de año','Promocion de fin de año en servicios de uñas',30,'2026-12-20','2026-12-31');

CREATE TABLE promociones_servicios (
    id_promocion_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_promocion INT NOT NULL,
    id_servicio INT NOT NULL,
    FOREIGN KEY (id_promocion) REFERENCES promociones(id_promocion),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio),
    UNIQUE (id_promocion, id_servicio)
);

INSERT INTO promociones_servicios (id_promocion, id_servicio) VALUES
(1, 1), (1, 2),
(2, 2), (2, 10),
(3, 1), (3, 2),
(4, 4), (4, 9),
(5, 2), (5, 7),
(6, 1), (6, 3),
(7, 7), (7, 10),
(8, 5), (8, 6),
(9, 3), (9, 4),
(10, 1), (10, 4), (10, 10);

CREATE TABLE notificaciones (
    id_notificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    titulo VARCHAR(120) NOT NULL,
    mensaje TEXT NOT NULL,
    tipo ENUM('Cita','Pago','Sistema','Promocion') DEFAULT 'Sistema',
    leida BOOLEAN DEFAULT FALSE,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO notificaciones
(id_usuario, titulo, mensaje, tipo, leida)
VALUES
(1,'Cita registrada','Tu cita ha sido registrada.','Cita',FALSE),
(2,'Cita confirmada','Tu reserva ha sido confirmada.','Cita',FALSE),
(3,'Pago aprobado','Tu pago fue aprobado.','Pago',TRUE),
(4,'Recordatorio','Recuerda tu proxima cita.','Cita',FALSE),
(5,'Nueva promocion','Tenemos descuentos disponibles.','Promocion',FALSE),
(6,'Pago pendiente','Tienes un pago pendiente.','Pago',FALSE),
(7,'Cita actualizada','La informacion de tu cita fue actualizada.','Cita',TRUE),
(8,'Bienvenida','Gracias por registrarte en NailSys.','Sistema',TRUE),
(9,'Promocion especial','Aprovecha nuestros descuentos.','Promocion',FALSE),
(10,'Recordatorio de cita','No olvides asistir a tu cita.','Cita',FALSE);

CREATE TABLE configuracion (
    id_configuracion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    valor TEXT,
    descripcion VARCHAR(200)
);

INSERT INTO configuracion (nombre, valor, descripcion) VALUES
('correo_negocio','contacto@nailsys.com','Correo de contacto'),
('telefono_negocio','3001234567','Telefono del establecimiento'),
('direccion_negocio','Bogota Colombia','Direccion del negocio'),
('horario_apertura','08:00','Hora de apertura'),
('horario_cierre','18:00','Hora de cierre'),
('politica_cancelacion','24 horas','Tiempo minimo para cancelar'),
('nombre_negocio', 'Salon de Belleza', 'Nombre comercial'),
('moneda', 'COP', 'Moneda del negocio'),
('duracion_reserva', '30', 'Intervalo de reserva en minutos'),
('anticipacion_citas', '1', 'Dias minimos de anticipacion');

CREATE TABLE auditoria (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    accion VARCHAR(100) NOT NULL,
    tabla_afectada VARCHAR(100),
    descripcion TEXT,
    fecha_accion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

INSERT INTO auditoria
(id_usuario, accion, tabla_afectada, descripcion)
VALUES
(1,'INSERT','usuarios','Registro de usuario'),
(2,'UPDATE','clientes','Actualizacion de informacion del cliente'),
(3,'INSERT','citas','Registro de una nueva cita'),
(4,'UPDATE','citas','Actualizacion del estado de una cita'),
(5,'INSERT','pagos','Registro de un pago'),
(6,'UPDATE','servicios','Actualizacion de servicio'),
(7,'INSERT','calificaciones','Registro de calificacion'),
(8,'INSERT','promociones','Creacion de promocion'),
(9,'UPDATE','horarios','Actualizacion de horario'),
(10,'INSERT','notificaciones','Creacion de notificacion');

-- =========================================
-- 2. ÍNDICES
-- =========================================

CREATE INDEX idx_citas_empleado_fecha_estado
    ON citas (id_empleado, fecha, estado);

CREATE INDEX idx_citas_cliente_fecha
    ON citas (id_cliente, fecha);

CREATE INDEX idx_pagos_estado_fecha
    ON pagos (estado, fecha_pago);

CREATE INDEX idx_notificaciones_usuario_leida
    ON notificaciones (id_usuario, leida, fecha_envio);

CREATE INDEX idx_auditoria_tabla_fecha
    ON auditoria (tabla_afectada, fecha_accion);

-- =========================================
-- 3. VISTAS
-- =========================================

CREATE VIEW vista_agenda AS
SELECT
    c.id_cita,
    c.fecha,
    c.hora_inicio,
    c.hora_fin,
    c.estado,
    CONCAT(uc.nombres, ' ', uc.apellidos) AS cliente,
    CONCAT(ue.nombres, ' ', ue.apellidos) AS empleado,
    GROUP_CONCAT(s.nombre SEPARATOR ', ') AS servicios
FROM citas c
INNER JOIN clientes cl ON c.id_cliente = cl.id_cliente
INNER JOIN usuarios uc ON cl.id_usuario = uc.id_usuario
INNER JOIN empleados e ON c.id_empleado = e.id_empleado
INNER JOIN usuarios ue ON e.id_usuario = ue.id_usuario
LEFT JOIN detalle_citas dc ON c.id_cita = dc.id_cita
LEFT JOIN servicios s ON dc.id_servicio = s.id_servicio
GROUP BY c.id_cita, c.fecha, c.hora_inicio, c.hora_fin,
c.estado, uc.nombres, uc.apellidos, ue.nombres, ue.apellidos;

CREATE VIEW vista_ingresos AS
SELECT
    YEAR(fecha_pago) AS anio,
    MONTH(fecha_pago) AS mes,
    SUM(monto) AS total_ingresos
FROM pagos
WHERE estado = 'Aprobado'
GROUP BY YEAR(fecha_pago), MONTH(fecha_pago);

CREATE VIEW vista_servicios_populares AS
SELECT
    s.id_servicio,
    s.nombre,
    COUNT(dc.id_detalle) AS cantidad_solicitudes
FROM servicios s
LEFT JOIN detalle_citas dc ON s.id_servicio = dc.id_servicio
LEFT JOIN citas c ON dc.id_cita = c.id_cita
AND c.estado <> 'Cancelada'
GROUP BY s.id_servicio, s.nombre;

CREATE VIEW vista_calificaciones AS
SELECT
    e.id_empleado,
    CONCAT(u.nombres, ' ', u.apellidos) AS empleado,
    ROUND(AVG(ca.puntuacion), 2) AS promedio,
    COUNT(ca.id_calificacion) AS total_calificaciones
FROM empleados e
INNER JOIN usuarios u ON e.id_usuario = u.id_usuario
LEFT JOIN citas c ON e.id_empleado = c.id_empleado
LEFT JOIN calificaciones ca ON c.id_cita = ca.id_cita
GROUP BY e.id_empleado, u.nombres, u.apellidos;

-- =========================================
-- 4. TRIGGERS, PROCEDIMIENTO Y EVENTO
-- =========================================

DELIMITER $$

CREATE TRIGGER validar_cita_insert
BEFORE INSERT ON citas
FOR EACH ROW
BEGIN
    IF NEW.hora_fin <= NEW.hora_inicio THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La hora final debe ser posterior a la hora inicial';
    END IF;

    IF EXISTS (
        SELECT 1 FROM citas
        WHERE id_empleado = NEW.id_empleado
        AND fecha = NEW.fecha
        AND estado NOT IN ('Cancelada','No asistio')
        AND NEW.hora_inicio < hora_fin
        AND NEW.hora_fin > hora_inicio
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El empleado ya tiene una cita en ese horario';
    END IF;
END$$

CREATE TRIGGER validar_cita_update
BEFORE UPDATE ON citas
FOR EACH ROW
BEGIN
    IF NEW.hora_fin <= NEW.hora_inicio THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La hora final debe ser posterior a la hora inicial';
    END IF;

    IF EXISTS (
        SELECT 1 FROM citas
        WHERE id_empleado = NEW.id_empleado
        AND fecha = NEW.fecha
        AND id_cita <> NEW.id_cita
        AND estado NOT IN ('Cancelada','No asistio')
        AND NEW.hora_inicio < hora_fin
        AND NEW.hora_fin > hora_inicio
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El empleado ya tiene una cita en ese horario';
    END IF;
END$$

CREATE TRIGGER trg_citas_after_update_estado
AFTER UPDATE ON citas
FOR EACH ROW
BEGIN
    IF OLD.estado <> NEW.estado THEN
        INSERT INTO historial_citas (
            id_cita,
            id_usuario,
            estado_anterior,
            estado_nuevo,
            observacion
        )
        SELECT
            NEW.id_cita,
            e.id_usuario,
            OLD.estado,
            NEW.estado,
            COALESCE(NEW.motivo_cancelacion, NEW.observaciones, 'Cambio de estado automático')
        FROM empleados e
        WHERE e.id_empleado = NEW.id_empleado
        LIMIT 1;
    END IF;
END$$

CREATE TRIGGER trg_pagos_before_insert
BEFORE INSERT ON pagos
FOR EACH ROW
BEGIN
    IF NEW.monto <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El monto del pago debe ser mayor que cero';
    END IF;
END$$

CREATE PROCEDURE sp_crear_cita_simple (
    IN p_id_cliente INT,
    IN p_id_empleado INT,
    IN p_id_servicio INT,
    IN p_fecha DATE,
    IN p_hora_inicio TIME,
    IN p_observaciones TEXT,
    OUT p_id_cita_creada INT
)
BEGIN
    DECLARE v_duracion INT;
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_hora_fin TIME;

    SELECT duracion, precio
    INTO v_duracion, v_precio
    FROM servicios
    WHERE id_servicio = p_id_servicio AND estado = 'Activo';

    IF v_duracion IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El servicio no existe o está inactivo';
    END IF;

    SET v_hora_fin = ADDTIME(p_hora_inicio, SEC_TO_TIME(v_duracion * 60));

    INSERT INTO citas (
        id_cliente,
        id_empleado,
        fecha,
        hora_inicio,
        hora_fin,
        estado,
        observaciones
    ) VALUES (
        p_id_cliente,
        p_id_empleado,
        p_fecha,
        p_hora_inicio,
        v_hora_fin,
        'Pendiente',
        p_observaciones
    );

    SET p_id_cita_creada = LAST_INSERT_ID();

    INSERT INTO detalle_citas (
        id_cita,
        id_servicio,
        cantidad,
        precio_unitario,
        duracion_minutos
    ) VALUES (
        p_id_cita_creada,
        p_id_servicio,
        1,
        v_precio,
        v_duracion
    );
END$$

CREATE EVENT IF NOT EXISTS evt_desactivar_promociones_vencidas
ON SCHEDULE EVERY 1 DAY
STARTS (TIMESTAMP(CURRENT_DATE) + INTERVAL 1 DAY)
DO
    UPDATE promociones
    SET estado = 'Inactiva'
    WHERE estado = 'Activa'
      AND fecha_fin < CURRENT_DATE;

DELIMITER ;

-- =========================================
-- 5. DCL: CONTROL DE PERMISOS
-- =========================================

CREATE USER IF NOT EXISTS 'nailsys_app'@'localhost'
IDENTIFIED BY 'NailSys2026*';

GRANT SELECT, INSERT, UPDATE, DELETE
ON nailsys.*
TO 'nailsys_app'@'localhost';

SHOW GRANTS FOR 'nailsys_app'@'localhost';

REVOKE DELETE
ON nailsys.*
FROM 'nailsys_app'@'localhost';

SHOW GRANTS FOR 'nailsys_app'@'localhost';

-- =========================================
-- 6. TCL: CONTROL DE TRANSACCIONES
-- =========================================

START TRANSACTION;

UPDATE notificaciones
SET leida = TRUE
WHERE id_notificacion = 1;

SAVEPOINT punto_seguro;

UPDATE notificaciones
SET leida = TRUE
WHERE id_notificacion = 2;

ROLLBACK TO SAVEPOINT punto_seguro;

INSERT INTO auditoria
(id_usuario, accion, tabla_afectada, descripcion)
VALUES
(1, 'UPDATE', 'notificaciones', 'Se marco una notificacion como leida');

COMMIT;

START TRANSACTION;

UPDATE notificaciones
SET leida = FALSE
WHERE id_notificacion = 1;

ROLLBACK;