-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: preparatorios
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actas_preparatorios`
--

DROP TABLE IF EXISTS `actas_preparatorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actas_preparatorios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nro_acta` int DEFAULT NULL,
  `id_secretaria` int DEFAULT NULL,
  `id_docente` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_estudiante` int DEFAULT NULL,
  `id_asignacion_academica` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acta_docente` (`id_docente`),
  KEY `fk_acta_estudiante` (`id_estudiante`),
  CONSTRAINT `fk_acta_docente` FOREIGN KEY (`id_docente`) REFERENCES `docentes` (`id`),
  CONSTRAINT `fk_acta_estudiante` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actas_preparatorios`
--

LOCK TABLES `actas_preparatorios` WRITE;
/*!40000 ALTER TABLE `actas_preparatorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `actas_preparatorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignaturas` (
  `id` int NOT NULL,
  `nombre_asignatura` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` VALUES (1,'AREA LABORAL'),(2,'AREA PENAL'),(3,'AREA PUBLICO'),(4,'AREA PRIVADO');
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion_preparatorios`
--

DROP TABLE IF EXISTS `configuracion_preparatorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracion_preparatorios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_preparatorio` int NOT NULL,
  `fecha_inicio_inscripciones` date DEFAULT NULL,
  `fecha_fin_inscripciones` date DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `id_asignacion_academica` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_configuracion_preparatorio` (`id_preparatorio`),
  CONSTRAINT `fk_configuracion_preparatorio` FOREIGN KEY (`id_preparatorio`) REFERENCES `preparatorios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion_preparatorios`
--

LOCK TABLES `configuracion_preparatorios` WRITE;
/*!40000 ALTER TABLE `configuracion_preparatorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracion_preparatorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docentes`
--

DROP TABLE IF EXISTS `docentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docentes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `id_vinculacion` int DEFAULT NULL,
  `id_programa` int DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `dias_prueba` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nuevo` tinyint(1) DEFAULT '0',
  `id_escalafon` int DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_docente_persona` (`id_persona`),
  CONSTRAINT `fk_docente_persona` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docentes`
--

LOCK TABLES `docentes` WRITE;
/*!40000 ALTER TABLE `docentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `docentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_estudiantes`
--

DROP TABLE IF EXISTS `estados_estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_estudiantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_estudiantes`
--

LOCK TABLES `estados_estudiantes` WRITE;
/*!40000 ALTER TABLE `estados_estudiantes` DISABLE KEYS */;
INSERT INTO `estados_estudiantes` VALUES (1,'Estudiante'),(2,'Estudiante no titulado'),(3,'Titulado');
/*!40000 ALTER TABLE `estados_estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `codigo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_programa` int DEFAULT NULL,
  `id_semestre` int DEFAULT NULL,
  `id_estado_estudiante` int DEFAULT NULL,
  `semestre_asignado` tinyint(1) DEFAULT '0',
  `activo` tinyint(1) DEFAULT '1',
  `id_inscripcion` int DEFAULT NULL,
  `id_zeus_inscripcion` int DEFAULT NULL,
  `activar_pazysalvo` tinyint(1) DEFAULT '0',
  `aspirante_grado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_estudiante_estado` (`id_estado_estudiante`),
  KEY `fk_estudiante_persona` (`id_persona`),
  CONSTRAINT `fk_estudiante_estado` FOREIGN KEY (`id_estado_estudiante`) REFERENCES `estados_estudiantes` (`id`),
  CONSTRAINT `fk_estudiante_persona` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,1,'2023140001',14,3,1,5,1,1001,50231,0,0),(2,2,'2022140002',14,7,1,7,1,1002,50232,0,0),(3,3,'2024140003',14,2,1,3,1,1003,50233,0,0),(4,4,'2026140004',14,1,1,1,1,1004,50234,0,0),(5,5,'2022140005',14,8,1,8,1,1005,50235,0,0),(6,8,'2024140006',14,4,1,4,0,1006,50236,0,0),(7,10,'2025140007',14,2,1,2,1,1007,50237,0,0),(8,11,'2021140008',14,9,1,9,1,1008,50238,0,0),(9,13,'2026140009',14,1,1,1,1,1009,50239,0,0),(10,14,'2023140010',14,6,1,6,1,1010,50240,0,0),(11,16,'2025140011',14,3,1,3,1,1011,50241,0,0),(12,17,'2024140012',14,5,1,5,0,1012,50242,0,0),(13,18,'2021140013',14,10,1,10,1,1013,50243,1,1),(14,20,'2025140014',14,2,1,2,1,1014,50244,0,0),(15,7,'2019140015',14,10,2,10,1,1015,50245,1,1),(16,9,'2018140016',14,10,2,10,1,1016,50246,0,1),(17,12,'2019140017',14,10,2,10,1,1017,50247,1,1),(18,19,'2018140018',14,10,2,10,0,1018,50248,0,0),(19,6,'2015140019',14,10,3,10,0,1019,50249,1,0),(20,15,'2016140020',14,10,3,10,0,1020,50250,1,0);
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones_preparatorios`
--

DROP TABLE IF EXISTS `inscripciones_preparatorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripciones_preparatorios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_preparatorio` int NOT NULL,
  `id_estudiante` int NOT NULL,
  `fecha_inscripcion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `consecutivo_recibo` int DEFAULT NULL,
  `factura_pagado` tinyint(1) DEFAULT '0',
  `valor_pagado` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inscripcion_estudiante` (`id_estudiante`),
  KEY `fk_inscripcion_preparatorio` (`id_preparatorio`),
  CONSTRAINT `fk_inscripcion_estudiante` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`),
  CONSTRAINT `fk_inscripcion_preparatorio` FOREIGN KEY (`id_preparatorio`) REFERENCES `preparatorios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones_preparatorios`
--

LOCK TABLES `inscripciones_preparatorios` WRITE;
/*!40000 ALTER TABLE `inscripciones_preparatorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscripciones_preparatorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriculas`
--

DROP TABLE IF EXISTS `matriculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matriculas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int NOT NULL,
  `fecha_matricula` date DEFAULT NULL,
  `id_periodo_academico` int DEFAULT NULL,
  `confirmacion` tinyint(1) DEFAULT '0',
  `fecha_actualizacion` date DEFAULT NULL,
  `fecha_cancelacion` date DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `observaciones` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_matricula_estudiante` (`id_estudiante`),
  KEY `fk_matricula_periodo` (`id_periodo_academico`),
  CONSTRAINT `fk_matricula_estudiante` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`),
  CONSTRAINT `fk_matricula_periodo` FOREIGN KEY (`id_periodo_academico`) REFERENCES `periodos_academicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculas`
--

LOCK TABLES `matriculas` WRITE;
/*!40000 ALTER TABLE `matriculas` DISABLE KEYS */;
/*!40000 ALTER TABLE `matriculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_generales`
--

DROP TABLE IF EXISTS `notas_generales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_generales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int NOT NULL,
  `semestre` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor_nota` decimal(5,2) DEFAULT NULL,
  `periodo_academico` int DEFAULT NULL,
  `asignacion_academica` int DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_nota_general_estudiante` (`id_estudiante`),
  KEY `fk_nota_general_periodo` (`periodo_academico`),
  CONSTRAINT `fk_nota_general_estudiante` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id`),
  CONSTRAINT `fk_nota_general_periodo` FOREIGN KEY (`periodo_academico`) REFERENCES `periodos_academicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_generales`
--

LOCK TABLES `notas_generales` WRITE;
/*!40000 ALTER TABLE `notas_generales` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas_generales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_preparatorios`
--

DROP TABLE IF EXISTS `notas_preparatorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_preparatorios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nota_general_id` int DEFAULT NULL,
  `id_inscripcion_preparatorio` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nota_inscripcion` (`id_inscripcion_preparatorio`),
  CONSTRAINT `fk_nota_inscripcion` FOREIGN KEY (`id_inscripcion_preparatorio`) REFERENCES `inscripciones_preparatorios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_preparatorios`
--

LOCK TABLES `notas_preparatorios` WRITE;
/*!40000 ALTER TABLE `notas_preparatorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas_preparatorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `novedades_preparatorios`
--

DROP TABLE IF EXISTS `novedades_preparatorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `novedades_preparatorios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_plan_estudios` int DEFAULT NULL,
  `id_docente` int DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `periodo_academico` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_novedad_docente` (`id_docente`),
  KEY `fk_novedad_periodo` (`periodo_academico`),
  CONSTRAINT `fk_novedad_docente` FOREIGN KEY (`id_docente`) REFERENCES `docentes` (`id`),
  CONSTRAINT `fk_novedad_periodo` FOREIGN KEY (`periodo_academico`) REFERENCES `periodos_academicos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `novedades_preparatorios`
--

LOCK TABLES `novedades_preparatorios` WRITE;
/*!40000 ALTER TABLE `novedades_preparatorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `novedades_preparatorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodos_academicos`
--

DROP TABLE IF EXISTS `periodos_academicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodos_academicos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `anio` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periodo` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `actual` tinyint(1) DEFAULT '0',
  `id_tipo_periodo` int DEFAULT NULL,
  `estado` int DEFAULT NULL,
  `fecha_egreso` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodos_academicos`
--

LOCK TABLES `periodos_academicos` WRITE;
/*!40000 ALTER TABLE `periodos_academicos` DISABLE KEYS */;
INSERT INTO `periodos_academicos` VALUES (1,'2026','1','2026-01-15','2026-07-15',0,1,1,'2026-07-20'),(2,'2026','2','2026-07-16','2026-12-20',1,1,2,'2026-12-25');
/*!40000 ALTER TABLE `periodos_academicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_identificacion` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_identificacion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `primer_nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `segundo_nombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primer_apellido` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `segundo_apellido` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `datos_adicionales` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'CC','1085245671','Juan','Carlos','Pérez','Gómez','1990-03-15','{\"correo\": \"juan.perez@gmail.com\", \"celular\": \"3104567890\", \"direccion\": \"Calle 18 # 25-40, Pasto\"}'),(2,'CC','1085312498','María','Fernanda','López','Rodríguez','1988-07-22','{\"correo\": \"maria.lopez@hotmail.com\", \"celular\": \"3157894561\", \"direccion\": \"Carrera 27 # 15-32, Pasto\"}'),(3,'CC','52874123','Andrés',NULL,'Martínez','Ruiz','1985-11-02','{\"correo\": \"andres.martinez@yahoo.com\", \"celular\": \"3009871234\", \"direccion\": \"Avenida Panamericana # 12-50, Pasto\"}'),(4,'TI','1004123456','Valentina','Sofía','Castro','Muñoz','2009-05-10','{\"correo\": \"valentina.castro@gmail.com\", \"celular\": \"3201234567\", \"direccion\": \"Calle 20 # 30-15, Ipiales\"}'),(5,'CC','1085678912','Diego','Alejandro','Hernández','Bravo','1995-01-28','{\"correo\": \"diego.hernandez@outlook.com\", \"celular\": \"3112345678\", \"direccion\": \"Carrera 22 # 9-45, Pasto\"}'),(6,'CC','27456789','Luz','Marina','Guerrero','Erazo','1972-09-14','{\"correo\": \"luz.guerrero@gmail.com\", \"celular\": \"3168765432\", \"direccion\": \"Calle 12 # 40-08, Pasto\"}'),(7,'CE','654321','Carlos','Eduardo','Ramírez','Silva','1980-12-03','{\"correo\": \"carlos.ramirez@gmail.com\", \"celular\": \"3015558899\", \"direccion\": \"Carrera 7 # 72-10, Bogotá\"}'),(8,'CC','1085901234','Camila',NULL,'Ortiz','Benavides','1998-04-19','{\"correo\": \"camila.ortiz@gmail.com\", \"celular\": \"3187654321\", \"direccion\": \"Barrio Las Cuadras, Calle 19 # 33-21, Pasto\"}'),(9,'CC','98765432','Jorge','Luis','Delgado','Cabrera','1978-06-25','{\"correo\": \"jorge.delgado@hotmail.com\", \"celular\": \"3126549870\", \"direccion\": \"Carrera 25 # 17-60, Pasto\"}'),(10,'CC','1086123987','Daniela','Alejandra','Rosero','Paz','2000-08-08','{\"correo\": \"daniela.rosero@gmail.com\", \"celular\": \"3134567812\", \"direccion\": \"Calle 15 # 21-34, Pasto\"}'),(11,'CC','1085456789','Sebastián',NULL,'Torres','Jurado','1993-02-11','{\"correo\": \"sebastian.torres@outlook.com\", \"celular\": \"3145678923\", \"direccion\": \"Avenida Boyacá # 5-20, Pasto\"}'),(12,'CC','30745123','Ana','Lucía','Burbano','Zambrano','1983-10-30','{\"correo\": \"ana.burbano@yahoo.com\", \"celular\": \"3173456789\", \"direccion\": \"Carrera 30 # 11-55, Pasto\"}'),(13,'TI','1004567890','Mateo','José','Villota','Chamorro','2010-01-17','{\"correo\": \"mateo.villota@gmail.com\", \"celular\": \"3209876543\", \"direccion\": \"Calle 10 # 24-18, Túquerres\"}'),(14,'CC','1085234567','Paula','Andrea','Mora','Insuasty','1996-12-24','{\"correo\": \"paula.mora@gmail.com\", \"celular\": \"3058901234\", \"direccion\": \"Carrera 19 # 20-12, Pasto\"}'),(15,'CC','12987654','Héctor','Fabio','Narváez','Coral','1969-03-05','{\"correo\": \"hector.narvaez@hotmail.com\", \"celular\": \"3116789012\", \"direccion\": \"Calle 22 # 8-70, Pasto\"}'),(16,'CC','1086345678','Natalia',NULL,'Enríquez','Ibarra','2001-07-13','{\"correo\": \"natalia.enriquez@gmail.com\", \"celular\": \"3162345678\", \"direccion\": \"Barrio Palermo, Carrera 36 # 14-05, Pasto\"}'),(17,'CE','789456','Miguel','Ángel','Sánchez','Vega','1987-05-21','{\"correo\": \"miguel.sanchez@gmail.com\", \"celular\": \"3024561237\", \"direccion\": \"Calle 50 # 45-30, Medellín\"}'),(18,'CC','1085789123','Laura','Isabel','Cuéllar','Montenegro','1994-09-09','{\"correo\": \"laura.cuellar@outlook.com\", \"celular\": \"3198765123\", \"direccion\": \"Carrera 24 # 16-48, Pasto\"}'),(19,'CC','87123456','Fernando','José','Revelo','Arteaga','1976-11-27','{\"correo\": \"fernando.revelo@yahoo.com\", \"celular\": \"3137890456\", \"direccion\": \"Calle 17 # 28-90, Pasto\"}'),(20,'CC','1086456789','Sara','Milena','Obando','Figueroa','1999-02-02','{\"correo\": \"sara.obando@gmail.com\", \"celular\": \"3184561230\", \"direccion\": \"Barrio Torobajo, Calle 2 # 31-15, Pasto\"}');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preparatorios`
--

DROP TABLE IF EXISTS `preparatorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preparatorios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor_pago` int DEFAULT NULL,
  `fecha_evaluacion` datetime DEFAULT NULL,
  `lugar_evaluacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `valor_pagado` decimal(12,2) DEFAULT NULL,
  `id_tipo_evaluacion` int DEFAULT NULL,
  `limite_inscritos` int DEFAULT NULL,
  `fecha_limite_pago` date DEFAULT NULL,
  `mostrar_recibo` tinyint(1) DEFAULT '0',
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acuerdo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preparatorios`
--

LOCK TABLES `preparatorios` WRITE;
/*!40000 ALTER TABLE `preparatorios` DISABLE KEYS */;
INSERT INTO `preparatorios` VALUES (1,156000,'2026-11-01 08:00:00','AULA 3',1,NULL,NULL,30,'2026-10-15',0,'PREPARATORIO AREA PENAL','0011416Ç'),(2,320000,'2026-12-05 18:00:00','AULA 2',1,NULL,NULL,40,'2026-10-20',0,'PREPARATORIO AREA LABORAL','00151417'),(3,1233000,'2026-10-23 18:00:00','SALA BEYINA',1,NULL,NULL,5,'2026-10-15',0,'PREPARATORIO AREA PRIVADO','00141817'),(6,132000,'2026-10-22 17:05:00','SEDE C1A',1,132000.00,NULL,15,'2026-10-14',0,'PREPARATORIO ORAL AREA PENAL','00114162'),(7,150000,'2026-11-20 08:00:00','Auditorio principal',1,150000.00,1,40,'2026-11-15',1,'Preparatorio Derecho Civil','Acuerdo 015 de 2026'),(9,150000,'2026-11-20 08:00:00','Auditorio principal',1,150000.00,1,40,'2026-11-15',1,NULL,'Acuerdo 017 de 2026'),(10,150000,'2026-12-20 08:00:00','Auditorio principal',1,0.00,1,40,'2026-12-15',1,'Derecho Civil','Acuerdo 015 de 2026');
/*!40000 ALTER TABLE `preparatorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesiones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_hora_ingreso` datetime DEFAULT NULL,
  `direccion_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aplicacion` int DEFAULT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sesion_usuario` (`id_usuario`),
  CONSTRAINT `fk_sesion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `nombre_usuario` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clave_acceso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` tinyint(1) DEFAULT '1',
  `fecha_creacion` date DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `fk_usuario_persona` (`id_persona`),
  CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-06 17:49:19
