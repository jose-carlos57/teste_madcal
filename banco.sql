CREATE DATABASE  IF NOT EXISTS `madcal_sistema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `madcal_sistema`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: madcal_sistema
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `contas`
--

DROP TABLE IF EXISTS `contas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contas` (
  `id_conta` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `apelido` varchar(40) DEFAULT NULL,
  `telefone` varchar(40) NOT NULL,
  `tipo_conta` int NOT NULL,
  `tipo_pessoa` int DEFAULT NULL,
  `cd_status` int NOT NULL,
  PRIMARY KEY (`id_conta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contas`
--

LOCK TABLES `contas` WRITE;
/*!40000 ALTER TABLE `contas` DISABLE KEYS */;
/*!40000 ALTER TABLE `contas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens`
--

DROP TABLE IF EXISTS `itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens` (
  `id_itens` int DEFAULT NULL,
  `id_Produtos` int NOT NULL,
  `id_orcamento` int NOT NULL,
  PRIMARY KEY (`id_Produtos`,`id_orcamento`),
  KEY `id_orcamento` (`id_orcamento`),
  CONSTRAINT `itens_ibfk_1` FOREIGN KEY (`id_Produtos`) REFERENCES `produtos` (`id_produtos`),
  CONSTRAINT `itens_ibfk_2` FOREIGN KEY (`id_orcamento`) REFERENCES `orcamento` (`id_orcamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens`
--

LOCK TABLES `itens` WRITE;
/*!40000 ALTER TABLE `itens` DISABLE KEYS */;
/*!40000 ALTER TABLE `itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamento`
--

DROP TABLE IF EXISTS `orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orcamento` (
  `id_orcamento` int NOT NULL AUTO_INCREMENT,
  `nome_cliente` varchar(40) NOT NULL,
  `telefone_cliente` varchar(20) NOT NULL,
  `nome_vendedor` varchar(40) NOT NULL,
  `telefone_vendedor` varchar(40) NOT NULL,
  `forma_pagamento` varchar(40) NOT NULL,
  `tabela_de_preco` varchar(40) NOT NULL,
  PRIMARY KEY (`id_orcamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamento`
--

LOCK TABLES `orcamento` WRITE;
/*!40000 ALTER TABLE `orcamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `politica_de_precos`
--

DROP TABLE IF EXISTS `politica_de_precos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `politica_de_precos` (
  `id_Politica_precos` int NOT NULL,
  `idTabela_de_precos` int DEFAULT NULL,
  `id_Produtos` int NOT NULL,
  `Preco` int NOT NULL,
  PRIMARY KEY (`id_Politica_precos`,`id_Produtos`),
  KEY `idTabela_de_precos` (`idTabela_de_precos`),
  KEY `id_Produtos` (`id_Produtos`),
  CONSTRAINT `politica_de_precos_ibfk_1` FOREIGN KEY (`idTabela_de_precos`) REFERENCES `tabela_de_precos` (`idTabela_de_precos`),
  CONSTRAINT `politica_de_precos_ibfk_2` FOREIGN KEY (`id_Produtos`) REFERENCES `produtos` (`id_produtos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `politica_de_precos`
--

LOCK TABLES `politica_de_precos` WRITE;
/*!40000 ALTER TABLE `politica_de_precos` DISABLE KEYS */;
/*!40000 ALTER TABLE `politica_de_precos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produtos` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `unidade_medida` float NOT NULL,
  `cd_status` int NOT NULL,
  PRIMARY KEY (`id_produtos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabela_de_precos`
--

DROP TABLE IF EXISTS `tabela_de_precos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabela_de_precos` (
  `idTabela_de_precos` int NOT NULL AUTO_INCREMENT,
  `descricao_tabela_precos` varchar(45) NOT NULL,
  `cd_status` int NOT NULL,
  PRIMARY KEY (`idTabela_de_precos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_de_precos`
--

LOCK TABLES `tabela_de_precos` WRITE;
/*!40000 ALTER TABLE `tabela_de_precos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabela_de_precos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-30 19:30:41
