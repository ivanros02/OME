-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2024 a las 00:41:53
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ome`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

CREATE TABLE `diagnostico` (
  `cod_diag` varchar(255) NOT NULL,
  `descript` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `diagnostico`
--

INSERT INTO `diagnostico` (`cod_diag`, `descript`) VALUES
('F00', 'DEMENCIA EN LA ENFERMEDAD DE ALZHEIMER (G30.-+)'),
('F00.0', 'DEMENCIA EN LA ENFERMEDAD DE ALZHEIMER DE COMIENZO TEMPRANO (G30.0+)'),
('F00.1', 'DEMENCIA EN LA ENFERMEDAD DE ALZHEIMER DE COMIENZO TARDIO (G30.1+)'),
('F00.2', 'DEMENCIA EN LA ENFERMEDAD DE ALZHEIMER ATIPICA O DE TIPO MIXTO (G30.8+)'),
('F00.9', 'DEMENCIA EN LA ENFERMEDAD DE ALZHEIMER NO ESPECIFICADA (G30.9+)'),
('F01', 'DEMENCIA VASCULAR'),
('F01.0', 'DEMENCIA VASCULAR DE COMIENZO AGUDO'),
('F01.1', 'DEMENCIA VASCULAR POR INFARTOS MULTIPLES'),
('F01.2', 'DEMENCIA VASCULAR SUBCORTICAL'),
('F01.3', 'DEMENCIA VASCULAR MIXTA CORTICAL Y SUBCORTICAL'),
('F01.8', 'OTRAS DEMENCIAS VASCULARES'),
('F01.9', 'DEMENCIA VASCULAR NO ESPECIFICADA'),
('F02', 'DEMENCIA EN OTRAS ENFERMEDADES CLASIFICADAS EN OTRA PARTE'),
('F02.0', 'DEMENCIA EN LA ENFERMEDAD DE PICK (G3L.0+)'),
('F02.1', 'DEMENCIA EN LA ENFERMEDAD DE CREUTZFELDT JAKOB (A81.0+)'),
('F02.2', 'DEMENCIA EN LA ENFERMEDAD DE HUNTINGTON (GL0+)'),
('F02.3', 'DEMENCIA EN LA ENFERMEDAD DE PARKINSON (G20+)'),
('F02.4', 'DEMENCIA EN LA ENFERMEDAD POR VIRUS DE LA INMUNODEFICIENCIA HUMANA [VIH]'),
('F02.8', 'DEMENCIA EN OTRAS ENFERMEDADES ESPECIFICADAS CLASIFICADAS EN OTRA PARTE'),
('F03', 'DEMENCIA NO ESPECIFICADA'),
('F04', 'SINDROME AMNESICO ORGANICO NO INDUCIDO POR ALCOHOL O POR OTRAS SUSTANCIAS'),
('F05', 'DELIRIO NO INDUCIDO POR ALCOHOL O POR OTRAS SUSTANCIAS PSICOACTIVAS'),
('F05.0', 'DELIRIO NO SUPERPUESTO A UN CUADRO DE DEMENCIA ASI DESCRITO'),
('F05.1', 'DELIRIO SUPERPUESTO A UN CUADRO DE DEMENCIA'),
('F05.8', 'OTROS DELIRIOS'),
('F05.9', 'DELIRIO NO ESPECIFICADO'),
('F06', 'OTROS TRASTORNOS MENTALES DEBIDOS A LESION Y DISFUNCION CEREBRAL Y A ENFER'),
('F06.0', 'ALUCINOSIS ORGANICA'),
('F06.1', 'TRASTORNO CATATONICO ORGANICO'),
('F06.2', 'TRASTORNO DELIRANTE [ESQUIZOFRENIFORME] ORGANICO'),
('F06.3', 'TRASTORNOS DEL HUMOR [AFECTIVOS] ORGANICOS'),
('F06.4', 'TRASTORNO DE ANSIEDAD ORGANICO'),
('F06.5', 'TRASTORNO DISOCIATIVO ORGANICO'),
('F06.6', 'TRASTORNO DE LABILIDAD EMOCIONAL [ASTENICO] ORGANICO'),
('F06.7', 'TRASTORNO COGNOSCITIVO LEVE'),
('F06.8', 'OTROS TRASTORNOS MENTALES ESPECIFICADOS DEBIDOS A LESION Y DISFUNCION CEREB'),
('F06.9', 'TRASTORNO MENTAL NO ESPECIFICADO DEBIDO A LESION Y DISFUNCION CEREBRAL Y A'),
('F07', 'TRASTORNOS DE LA PERSONALIDAD Y DEL COMPORTAMIENTO DEBIDOS A ENFERMEDAD LE'),
('F07.0', 'TRASTORNO DE LA PERSONALIDAD ORGANICO'),
('F07.1', 'SINDROME POSTENCEFALITICO'),
('F07.2', 'SINDROME POSTCONCUSIONAL'),
('F07.8', 'OTROS TRASTORNOS ORGANICOS DE LA PERSONALIDAD Y DEL COMPORTAMIENTO DEBIDOS'),
('F07.9', 'TRASTORNO ORGANICO DE LA PERSONALIDAD Y DEL COMPORTAMIENTO NO ESPECIFICADO'),
('F09', '\"TRASTORNO MENTAL ORGANICO O SINTOMATICO NO ESPECIFICADO\"'),
('F10.-', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALCOHOL'),
('F10.0', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALCOHOL INTOXIC'),
('F10.1', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALCOHOL USO NOC'),
('F10.2', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALCOHOL SINDROM'),
('F10.3', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALCOHOL ESTADO'),
('F10.4', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALCOHOL ESTADO'),
('F10.5', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALCOHOL TRASTOR'),
('F10.6', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALCOHOL SINDROM'),
('F10.7', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALCOHOL TRASTOR'),
('F10.8', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALCOHOL OTROS T'),
('F10.9', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALCOHOL TRASTOR'),
('F11.-', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OPIACEOS'),
('F11.0', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OPIACEOS INTOXI'),
('F11.1', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OPIACEOS USO NO'),
('F11.2', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OPIACEOS SINDRO'),
('F11.3', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OPIACEOS ESTADO'),
('F11.4', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OPIACEOS ESTADO'),
('F11.5', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OPIACEOS TRASTO'),
('F11.6', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OPIACEOS SINDRO'),
('F11.7', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OPIACEOS TRASTO'),
('F11.8', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OPIACEOS OTROS'),
('F11.9', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OPIACEOS TRASTO'),
('F12.-', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE CANNABINOIDES'),
('F12.0', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE CANNABINOIDES I'),
('F12.1', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE CANNABINOIDES U'),
('F12.2', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE CANNABINOIDES S'),
('F12.3', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE CANNABINOIDES E'),
('F12.4', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE CANNABINOIDES E'),
('F12.5', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE CANNABINOIDES T'),
('F12.6', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE CANNABINOIDES S'),
('F12.7', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE CANNABINOIDES T'),
('F12.8', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE CANNABINOIDES O'),
('F12.9', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE CANNABINOIDES T'),
('F13.-', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE SEDANTES O HIPNO'),
('F13.0', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE SEDANTES HIPNOTI'),
('F13.1', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE SEDANTES HIPNOTI'),
('F13.2', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE SEDANTES HIPNOTI'),
('F13.3', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE SEDANTES HIPNOTI'),
('F13.4', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE SEDANTES HIPNOTI'),
('F13.5', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE SEDANTES HIPNOTI'),
('F13.6', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE SEDANTES HIPNOTI'),
('F13.7', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE SEDANTES HIPNOTI'),
('F13.8', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE SEDANTES HIPNOTI'),
('F13.9', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE SEDANTES HIPNOTI'),
('F14.-', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE COCAINA'),
('F14.0', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE COCAINA INTOXIC'),
('F14.1', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE COCAINA USO NOC'),
('F14.2', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE COCAINA SINDROM'),
('F14.3', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE COCAINA ESTADO'),
('F14.4', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE COCAINA ESTADO'),
('F14.5', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE COCAINA TRASTOR'),
('F14.6', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE COCAINAS INDROM'),
('F14.7', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE COCAINA TRASTOR'),
('F14.8', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE COCAINA OTROS T'),
('F14.9', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE COCAINA TRASTOR'),
('F15.-', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OTROS ESTIMULANT'),
('F15.0', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OTROS ESTIMULANT'),
('F15.1', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OTROS ESTIMULANT'),
('F15.2', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OTROS ESTIMULANT'),
('F15.3', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OTROS ESTIMULANT'),
('F15.4', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OTROS ESTIMULANT'),
('F15.5', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OTROS ESTIMULANT'),
('F15.6', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OTROS ESTIMULANT'),
('F15.7', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OTROS ESTIMULANT'),
('F15.8', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OTROS ESTIMULANT'),
('F15.9', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE OTROS ESTIMULANT'),
('F16.-', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALUCINOGENOS'),
('F16.0', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALUCINOGENOS IN'),
('F16.1', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALUCINOGENOS US'),
('F16.2', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALUCINOGENOS SI'),
('F16.3', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALUCINOGENOS ES'),
('F16.4', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALUCINOGENOS ES'),
('F16.5', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALUCINOGENOS TR'),
('F16.6', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALUCINOGENOS SI'),
('F16.7', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALUCINOGENOS TR'),
('F16.8', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALUCINOGENOS OT'),
('F16.9', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE ALUCINOGENOS TR'),
('F17.-', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE TABACO'),
('F17.0', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE TABACO INTOXICA'),
('F17.1', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE TABACO USO NOCI'),
('F17.2', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE TABACO SINDROME'),
('F17.3', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE TABACO ESTADO D'),
('F17.4', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE TABACO ESTADO D'),
('F17.5', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE TABACO TRASTORN'),
('F17.6', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE TABACO SINDROME'),
('F17.7', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE TABACO TRASTORN'),
('F17.8', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE TABACO OTROS TR'),
('F17.9', '\"TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE TABACO TRASTORN'),
('F18.-', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE DISOLVENTES VOLA'),
('F18.0', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE DISOLVENTES VOLA'),
('F18.1', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE DISOLVENTES VOLA'),
('F18.2', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE DISOLVENTES VOLA'),
('F18.3', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE DISOLVENTES VOLA'),
('F18.4', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE DISOLVENTES VOLA'),
('F18.5', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE DISOLVENTES VOLA'),
('F18.6', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE DISOLVENTES VOLA'),
('F18.7', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE DISOLVENTES VOLA'),
('F18.8', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE DISOLVENTES VOLA'),
('F18.9', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE DISOLVENTES VOLA'),
('F19.-', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE MULTIPLES DROGAS'),
('F19.0', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE MULTIPLES DROGAS'),
('F19.1', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE MULTIPLES DROGAS'),
('F19.2', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE MULTIPLES DROGAS'),
('F19.3', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE MULTIPLES DROGAS'),
('F19.4', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE MULTIPLES DROGAS'),
('F19.5', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE MULTIPLES DROGAS'),
('F19.6', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE MULTIPLES DROGAS'),
('F19.7', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE MULTIPLES DROGAS'),
('F19.8', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE MULTIPLES DROGAS'),
('F19.9', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO DEBIDOS AL USO DE MULTIPLES DROGAS'),
('F20', 'ESQUIZOFRENIA'),
('F20.0', 'ESQUIZOFRENIA PARANOIDE'),
('F20.1', 'ESQUIZOFRENIA HEBEFRENICA'),
('F20.2', 'ESQUIZOFRENIA CATATONICA'),
('F20.3', 'ESQUIZOFRENIA INDIFERENCIADA'),
('F20.4', 'DEPRESION POSTESQUIZOFRENICA'),
('F20.5', 'ESQUIZOFRENIA RESIDUAL'),
('F20.6', 'ESQUIZOFRENIA SIMPLE'),
('F20.8', 'OTRAS ESQUIZOFRENIAS'),
('F20.9', 'ESQUIZOFRENIA NO ESPECIFICADA'),
('F21', 'TRASTORNO ESQUIZOTIPICO'),
('F22', 'TRASTORNOS DELIRANTES PERSISTENTES'),
('F22.0', 'TRASTORNO DELIRANTE'),
('F22.8', 'OTROS TRASTORNOS DELIRANTES PERSISTENTES'),
('F22.9', 'TRASTORNO DELIRANTE PERSISTENTE NO ESPECIFICADO'),
('F23', 'TRASTORNOS PSICOTICOS AGUDOS Y TRANSITORIOS'),
('F23.0', 'TRASTORNO PSICOTICO AGUDO POLIMORFO SIN SINTOMAS DE ESQUIZOFRENIA'),
('F23.1', 'TRASTORNO PSICOTICO AGUDO POLIMORFO CON SINTOMAS DE ESQUIZOFRENIA'),
('F23.2', 'TRASTORNO PSICOTICO AGUDO DE TIPO ESQUIZOFRENICO'),
('F23.3', 'OTRO TRASTORNO PSICOTICO AGUDO CON PREDOMINIO DE IDEAS DELIRANTES'),
('F23.8', 'OTROS TRASTORNOS PSICOTICOS AGUDOS Y TRANSITORIOS'),
('F23.9', 'TRASTORNO PSICOTICO AGUDO Y TRANSITORIO NO ESPECIFICADO'),
('F24', 'TRASTORNO DELIRANTE INDUCIDO'),
('F25', 'TRASTORNOS ESQUIZOAFECTIVOS'),
('F25.0', 'TRASTORNO ESQUIZOAFECTIVO DE TIPO MANIACO'),
('F25.1', 'TRASTORNO ESQUIZOAFECTIVO DE TIPO DEPRESIVO'),
('F25.2', 'TRASTORNO ESQUIZOAFECTIVO DE TIPO MIXTO'),
('F25.8', 'OTROS TRASTORNOS ESQUIZOAFECTIVOS'),
('F25.9', 'TRASTORNO ESQUIZOAFECTIVO NO ESPECIFICADO'),
('F28', 'OTROS TRASTORNOS PSICOTICOS DE ORIGEN NO ORGANICO'),
('F29', 'PSICOSIS DE ORIGEN NO ORGANICO NO ESPECIFICADA'),
('F30', 'EPISODIO MANIACO'),
('F30.0', 'HIPOMANIA'),
('F30.1', 'MANIA SIN SINTOMAS PSICOTICOS'),
('F30.2', 'MANIA CON SINTOMAS PSICOTICOS'),
('F30.8', 'OTROS EPISODIOS MANIACOS'),
('F30.9', 'EPISODIO MANIACO NO ESPECIFICADO'),
('F31', 'TRASTORNO AFECTIVO BIPOLAR'),
('F31.0', 'TRASTORNO AFECTIVO BIPOLAR EPISODIO HIPOMANIACO PRESENTE'),
('F31.1', 'TRASTORNO AFECTIVO BIPOLAR EPISODIO MANIACO PRESENTE SIN SINTOMAS PSICOTIC'),
('F31.2', 'TRASTORNO AFECTIVO BIPOLAR EPISODIO MANIACO PRESENTE CON SINTOMAS PSICOTIC'),
('F31.3', 'TRASTORNO AFECTIVO BIPOLAR EPISODIO DEPRESIVO PRESENTE LEVE O MODERADO'),
('F31.4', 'TRASTORNO AFECTIVO BIPOLAR EPISODIO DEPRESIVO GRAVE PRESENTE SIN SINTOMAS'),
('F31.5', 'TRASTORNO AFECTIVO BIPOLAR EPISODIO DEPRESIVO GRAVE PRESENTE CON SINTOMAS'),
('F31.6', 'TRASTORNO AFECTIVO BIPOLAR EPISODIO MIXTO PRESENTE'),
('F31.7', 'TRASTORNO AFECTIVO BIPOLAR ACTUALMENTE EN REMISION'),
('F31.8', 'OTROS TRASTORNOS AFECTIVOS BIPOLARES'),
('F31.9', 'TRASTORNO AFECTIVO BIPOLAR NO ESPECIFICADO'),
('F32', 'EPISODIO DEPRESIVO'),
('F32.0', 'EPISODIO DEPRESIVO LEVE'),
('F32.1', 'EPISODIO DEPRESIVO MODERADO'),
('F32.2', 'EPISODIO DEPRESIVO GRAVE SIN SINTOMAS PSICOTICOS'),
('F32.3', 'EPISODIO DEPRESIVO GRAVE CON SINTOMAS PSICOTICOS'),
('F32.8', 'OTROS EPISODIOS DEPRESIVOS'),
('F32.9', 'EPISODIO DEPRESIVO NO ESPECIFICADO'),
('F33', 'TRASTORNO DEPRESIVO RECURRENTE'),
('F33.0', 'TRASTORNO DEPRESIVO RECURRENTE EPISODIO LEVE PRESENTE'),
('F33.1', 'TRASTORNO DEPRESIVO RECURRENTE EPISODIO MODERADO PRESENTE'),
('F33.2', 'TRASTORNO DEPRESIVO RECURRENTE EPISODIO DEPRESIVO GRAVE PRESENTE SIN SINTO'),
('F33.3', 'TRASTORNO DEPRESIVO RECURRENTE EPISODIO DEPRESIVO GRAVE PRESENTE CON SINT'),
('F33.4', 'TRASTORNO DEPRESIVO RECURRENTE ACTUALMENTE EN REMISION'),
('F33.8', 'OTROS TRASTORNOS DEPRESIVOS RECURRENTES'),
('F33.9', 'TRASTORNO DEPRESIVO RECURRENTE NO ESPECIFICADO'),
('F34', 'TRASTORNOS DEL HUMOR [AFECTIVOS] PERSISTENTES'),
('F34.0', 'CICLOTIMIA'),
('F34.1', 'DISTIMIA'),
('F34.8', 'OTROS TRASTORNOS DEL HUMOR [AFECTIVOS] PERSISTENTES'),
('F34.9', 'TRASTORNO PERSISTENTE DEL HUMOR [AFECTIVO] NO ESPECIFICADO'),
('F38', 'OTROS TRASTORNOS DEL HUMOR [AFECTIVOS]'),
('F38.0', 'OTROS TRASTORNOS DEL HUMOR [AFECTIVOS] AISLADOS'),
('F38.1', 'OTROS TRASTORNOS DEL HUMOR [AFECTIVOS] RECURRENTES'),
('F38.8', 'OTROS TRASTORNOS DEL HUMOR [AFECTIVOS] ESPECIFICADOS'),
('F39', 'TRASTORNO DEL HUMOR [AFECTIVO] NO ESPECIFICADO'),
('F40', 'TRASTORNOS FOBICOS DE ANSIEDAD'),
('F40.0', 'AGORAFOBIA'),
('F40.1', 'FOBIAS SOCIALES'),
('F40.2', 'FOBIAS ESPECIFICAS (AISLADAS)'),
('F40.8', 'OTROS TRASTORNOS FOBICOS DE ANSIEDAD'),
('F40.9', 'TRASTORNO FOBICO DE ANSIEDAD NO ESPECIFICADO'),
('F41', 'OTROS TRASTORNOS DE ANSIEDAD'),
('F41.0', 'TRASTORNO DE PANICO [ANSIEDAD PAROXISTICA EPISODICA]'),
('F41.1', 'TRASTORNO DE ANSIEDAD GENERALIZADA'),
('F41.2', 'TRASTORNO MIXTO DE ANSIEDAD Y DEPRESION'),
('F41.3', 'OTROS TRASTORNOS DE ANSIEDAD MIXTOS'),
('F41.8', 'OTROS TRASTORNOS DE ANSIEDAD ESPECIFICADOS'),
('F41.9', 'TRASTORNO DE ANSIEDAD NO ESPECIFICADO'),
('F42', 'TRASTORNO OBSESIVO-COMPULSIVO'),
('F42.0', 'PREDOMINIO DE PENSAMIENTOS O RUMIACIONES OBSESIVAS'),
('F42.1', 'PREDOMINIO DE ACTOS COMPULSIVOS [RITUALES OBSESIVOS]'),
('F42.2', 'ACTOS E IDEAS OBSESIVAS MIXTOS'),
('F42.8', 'OTROS TRASTORNOS OBSESIVO-COMPULSIVOS'),
('F42.9', 'TRASTORNO OBSESIVO-COMPULSIVO NO ESPECIFICADO'),
('F43', 'REACCION AL ESTRES GRAVE Y TRASTORNOS DE ADAPTACION'),
('F43.0', 'REACCION AL ESTRES AGUDO'),
('F43.1', 'TRASTORNO DE ESTRES POSTRAUMATICO'),
('F43.2', 'TRASTORNOS DE ADAPTACION'),
('F43.8', 'OTRAS REACCIONES AL ESTRES GRAVE'),
('F43.9', 'REACCION AL ESTRES GRAVE NO ESPECIFICADA'),
('F44', 'TRASTORNOS DISOCIATIVOS [DE CONVERSION]'),
('F44.0', 'AMNESIA DISOCIATIVA'),
('F44.1', 'FUGA DISOCIATIVA'),
('F44.2', 'ESTUPOR DISOCIATIVO'),
('F44.3', 'TRASTORNOS DE TRANCE Y DE POSESION'),
('F44.4', 'TRASTORNOS DISOCIATIVOS DEL MOVIMIENTO'),
('F44.5', 'CONVULSIONES DISOCIATIVAS'),
('F44.6', 'ANESTESIA DISOCIATIVA Y PERDIDA SENSORIAL'),
('F44.7', 'TRASTORNOS DISOCIATIVOS MIXTOS [Y DE CONVERSION]'),
('F44.8', 'OTROS TRASTORNOS DISOCIATIVOS [DE CONVERSION]'),
('F44.9', 'TRASTORNO DISOCIATIVO [DE CONVERSION] NO ESPECIFICADO'),
('F45', 'TRASTORNOS SOMATOMORFOS'),
('F45.0', 'TRASTORNO DE SOMATIZACION'),
('F45.1', 'TRASTORNO SOMATOMORFO INDIFERENCIADO'),
('F45.2', 'TRASTORNO HIPOCONDRIACO'),
('F45.3', 'DISFUNCION AUTONOMICA SOMATOMORFA'),
('F45.4', 'TRASTORNO DE DOLOR PERSISTENTE SOMATOMORFO'),
('F45.8', 'OTROS TRASTORNOS SOMATOMORFOS'),
('F45.9', 'TRASTORNO SOMATOMORFO NO ESPECIFICADO'),
('F48', 'OTROS TRASTORNOS NEUROTICOS'),
('F48.0', 'NEURASTENIA'),
('F48.1', 'SINDROME DE DESPERSONALIZACION Y DESVINCULACION DE LA REALIDAD'),
('F48.8', 'OTROS TRASTORNOS NEUROTICOS ESPECIFICADOS'),
('F48.9', 'TRASTORNO NEUROTICO NO ESPECIFICADO'),
('F50', 'TRASTORNOS DE LA INGESTION DE ALIMENTOS'),
('F50.0', 'ANOREXIA NERVIOSA'),
('F50.1', 'ANOREXIA NERVIOSA ATIPICA'),
('F50.2', 'BULIMIA NERVIOSA'),
('F50.3', 'BULIMIA NERVIOSA ATIPICA'),
('F50.4', 'HIPERFAGIA ASOCIADA CON OTRAS ALTERACIONES PSICOLOGICAS'),
('F50.5', 'VOMITOS ASOCIADOS CON OTRAS ALTERACIONES PSICOLOGICAS'),
('F50.8', 'OTROS TRASTORNOS DE LA INGESTION DE ALIMENTOS'),
('F50.9', 'TRASTORNO DE LA INGESTION DE ALIMENTOS NO ESPECIFICADO'),
('F51', 'TRASTORNOS NO ORGANICOS DEL SUENIO'),
('F51.0', 'INSOMNIO NO ORGANICO'),
('F51.1', 'HIPERSOMNIO NO ORGANICO'),
('F51.2', 'TRASTORNO NO ORGANICO DEL CICLO SUENIO-VIGILIA'),
('F51.3', 'SONAMBULISMO'),
('F51.4', 'TERRORES DEL SUENIO [TERRORES NOCTURNOS]'),
('F51.5', 'PESADILLAS'),
('F51.8', 'OTROS TRASTORNOS NO ORGANICOS DEL SUENIO'),
('F51.9', 'TRASTORNO NO ORGANICO DEL SUENIO NO ESPECIFICADO'),
('F52', 'DISFUNCION SEXUAL NO OCASIONADA POR TRASTORNO NI ENFERMEDAD ORGANICOS'),
('F52.0', 'FALTA O PERDIDA DEL DESEO SEXUAL'),
('F52.1', 'AVERSION AL SEXO Y FALTA DE GOCE SEXUAL'),
('F52.2', 'FALLA DE LA RESPUESTA GENITAL'),
('F52.3', 'DISFUNCION ORGASMICA'),
('F52.4', 'EYACULACION PRECOZ'),
('F52.5', 'VAGINISMO NO ORGANICO'),
('F52.6', 'DISPAREUNIA NO ORGANICA'),
('F52.7', 'IMPULSO SEXUAL EXCESIVO'),
('F52.8', 'OTRAS DISFUNCIONES SEXUALES NO OCASIONADAS POR TRASTORNO NI POR ENFERMEDAD'),
('F52.9', 'DISFUNCION SEXUAL NO OCASIONADA POR TRASTORNO NI POR ENFERMEDAD ORGANICOS'),
('F53', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO ASOCIADOS CON EL PUERPERIO NO CLA'),
('F53.0', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO LEVES ASOCIADOS CON EL PUERPERIO'),
('F53.1', 'TRASTORNOS MENTALES Y DEL COMPORTAMIENTO GRAVES ASOCIADOS CON EL PUERPERIO'),
('F53.8', 'OTROS TRASTORNOS MENTALES Y DEL COMPORTAMIENTO ASOCIADOS CON EL PUERPERIO'),
('F53.9', 'TRASTORNO MENTAL PUERPERAL NO ESPECIFICADO'),
('F54', 'FACTORES PSICOLOGICOS Y DEL COMPORTAMIENTO ASOCIADOS CON TRASTORNOS O ENFER'),
('F55', 'ABUSO DE SUSTANCIAS QUE NO PRODUCEN DEPENDENCIA'),
('F59', 'SINDROMES DEL COMPORTAMIENTO ASOCIADOS CON ALTERACIONES FISIOLOGICAS Y FACT'),
('F60', 'TRASTORNOS ESPECIFICOS DE LA PERSONALIDAD'),
('F60.0', 'TRASTORNO PARANOIDE DE LA PERSONALIDAD'),
('F60.1', 'TRASTORNO ESQUIZOIDE DE LA PERSONALIDAD'),
('F60.2', 'TRASTORNO ASOCIAL DE LA PERSONALIDAD'),
('F60.3', 'TRASTORNO DE LA PERSONALIDAD EMOCIONALMENTE INESTABLE'),
('F60.4', 'TRASTORNO HISTRIONICO DE LA PERSONALIDAD'),
('F60.5', 'TRASTORNO ANANCASTICO DE LA PERSONALIDAD'),
('F60.6', 'TRASTORNO DE LA PERSONALIDAD ANSIOSA (EVASIVA ELUSIVA)'),
('F60.7', 'TRASTORNO DE LA PERSONALIDAD DEPENDIENTE'),
('F60.8', 'OTROS TRASTORNOS ESPECIFICOS DE LA PERSONALIDAD'),
('F60.9', 'TRASTORNO DE LA PERSONALIDAD NO ESPECIFICADO'),
('F61', 'TRASTORNOS MIXTOS Y OTROS TRASTORNOS DE LA PERSONALIDAD'),
('F62', 'CAMBIOS PERDURABLES DE LA PERSONALIDAD NO ATRIBUIBLES A LESION O A ENFERME'),
('F62.0', 'CAMBIO PERDURABLE DE LA PERSONALIDAD DESPUES DE UNA EXPERIENCIA CATASTROFIC'),
('F62.1', 'CAMBIO PERDURABLE DE LA PERSONALIDAD CONSECUTIVO A UNA ENFERMEDAD PSIQUIATR'),
('F62.8', 'OTROS CAMBIOS PERDURABLES DE LA PERSONALIDAD'),
('F62.9', 'CAMBIO PERDURABLE DE LA PERSONALIDAD NO ESPECIFICADO'),
('F63', 'TRASTORNOS DE LOS HABITOS Y DE LOS IMPULSOS'),
('F63.0', 'JUEGO PATOLOGICO'),
('F63.1', 'PIROMANIA'),
('F63.2', 'HURTO PATOLOGICO [CLEPTOMANIA]'),
('F63.3', 'TRICOTILOMANIA'),
('F63.8', 'OTROS TRASTORNOS DE LOS HABITOS Y DE LOS IMPULSOS'),
('F63.9', 'TRASTORNO DE LOS HABITOS Y DE LOS IMPULSOS NO ESPECIFICADO'),
('F64', 'TRASTORNOS DE LA IDENTIDAD DE GENERO'),
('F64.0', 'TRANSEXUALISMO'),
('F64.1', 'TRANSVESTISMO DE ROL DUAL'),
('F64.2', 'TRASTORNO DE LA IDENTIDAD DE GENERO EN LA NINIEZ'),
('F64.8', 'OTROS TRASTORNOS DE LA IDENTIDAD DE GENERO'),
('F64.9', 'TRASTORNO DE LA IDENTIDAD DE GENERO NO ESPECIFICADO'),
('F65', 'TRASTORNOS DE LA PREFERENCIA SEXUAL'),
('F65.0', 'FETICHISMO'),
('F65.1', 'TRANSVESTISMO FETICHISTA'),
('F65.2', 'EXHIBICIONISMO'),
('F65.3', 'VOYEURISMO'),
('F65.4', 'PEDOFILIA'),
('F65.5', 'SADOMASOQUISMO'),
('F65.6', 'TRASTORNOS MULTIPLES DE LA PREFERENCIA SEXUAL'),
('F65.8', 'OTROS TRASTORNOS DE LA PREFERENCIA SEXUAL'),
('F65.9', 'TRASTORNO DE LA PREFERENCIA SEXUAL NO ESPECIFICADO'),
('F66', 'TRASTORNOS PSICOLOGICOS Y DEL COMPORTAMIENTO ASOCIADOS CON EL DESARROLLO Y'),
('F66.0', 'TRASTORNO DE LA MADURACION SEXUAL'),
('F66.1', 'ORIENTACION SEXUAL EGODISTONICA'),
('F66.2', 'TRASTORNO DE LA RELACION SEXUAL'),
('F66.8', 'OTROS TRASTORNOS DEL DESARROLLO PSICOSEXUAL'),
('F66.9', 'TRASTORNO DEL DESARROLLO PSICOSEXUAL NO ESPECIFICADO'),
('F68', 'OTROS TRASTORNOS DE LA PERSONALIDAD Y DEL COMPORTAMIENTO EN ADULTOS'),
('F68.0', 'ELABORACION DE SINTOMAS FISICOS POR CAUSAS PSICOLOGICAS'),
('F68.1', 'PRODUCCION INTENCIONAL O SIMULACION DE SINTOMAS O DE INCAPACIDADES TANTO F'),
('F68.8', 'OTROS TRASTORNOS ESPECIFICADOS DE LA PERSONALIDAD Y DEL COMPORTAMIENTO EN A'),
('F69', 'TRASTORNO DE LA PERSONALIDAD Y DEL COMPORTAMIENTO EN ADULTOS NO ESPECIFICA'),
('F70', 'RETRASO MENTAL LEVE'),
('F70.0', 'RETRASO MENTAL LEVE DETERIORO DEL COMPORTAMIENTO NULO O MINIMO'),
('F70.1', 'RETRASO MENTAL LEVE DETERIORO DEL COMPORTAMIENTO SIGNIFICATIVO QUE REQUIE'),
('F70.8', 'RETRASO MENTAL LEVE OTROS DETERIOROS DEL COMPORTAMIENTO'),
('F70.9', 'RETRASO MENTAL LEVE DETERIORO DEL COMPORTAMIENTO DE GRADO NO ESPECIFICADO'),
('F71', 'RETRASO MENTAL MODERADO'),
('F71.0', 'RETRASO MENTAL MODERADO DETERIORO DEL COMPORTAMIENTO NULO O MINIMO'),
('F71.1', 'RETRASO MENTAL MODERADO DETERIORO DEL COMPORTAMIENTO SIGNIFICATIVO QUE RE'),
('F71.8', 'RETRASO MENTAL MODERADO OTROS DETERIOROS DEL COMPORTAMIENTO'),
('F71.9', 'RETRASO MENTAL MODERADO DETERIORO DEL COMPORTAMIENTO DE GRADO NO ESPECIFIC'),
('F72', 'RETRASO MENTAL GRAVE'),
('F72.0', 'RETRASO MENTAL GRAVE DETERIORO DEL COMPORTAMIENTO NULO O MINIMO'),
('F72.1', 'RETRASO MENTAL GRAVE DETERIORO DEL COMPORTAMIENTO SIGNIFICATIVO QUE REQUI'),
('F72.8', 'RETRASO MENTAL GRAVE OTROS DETERIOROS DEL COMPORTAMIENTO'),
('F72.9', 'RETRASO MENTAL GRAVE DETERIORO DEL COMPORTAMIENTO DE GRADO NO ESPECIFICADO'),
('F73', 'RETRASO MENTAL PROFUNDO'),
('F73.0', 'RETRASO MENTAL PROFUNDO DETERIORO DEL COMPORTAMIENTO NULO O MINIMO'),
('F73.1', 'RETRASO MENTAL PROFUNDO DETERIORO DEL COMPORTAMIENTO SIGNIFICATIVO QUE RE'),
('F73.8', 'RETRASO MENTAL PROFUNDO OTROS DETERIOROS DEL COMPORTAMIENTO'),
('F73.9', 'RETRASO MENTAL PROFUNDO DETERIORO DEL COMPORTAMIENTO DE GRADO NO ESPECIFIC'),
('F78', 'OTROS TIPOS DE RETRASO MENTAL'),
('F78.0', 'OTROS TIPOS DE RETRASO MENTAL DETERIORO DEL COMPORTAMIENTO NULO O MINIMO'),
('F78.1', 'OTROS TIPOS DE RETRASO MENTAL DETERIORO DEL COMPORTAMIENTO SIGNIFICATIVO'),
('F78.8', 'OTROS TIPOS DE RETRASO MENTAL OTROS DETERIOROS DEL COMPORTAMIENTO'),
('F78.9', 'OTROS TIPOS DE RETRASO MENTAL DETERIORO DEL COMPORTAMIENTO DE GRADO NO ESP'),
('F79', 'RETRASO MENTAL NO ESPECIFICADO'),
('F79.0', 'RETRASO MENTAL NO ESPECIFICADO DETERIORO DEL COMPORTAMIENTO NULO O MINIMO'),
('F79.1', 'RETRASO MENTAL NO ESPECIFICADO DETERIORO DEL COMPORTAMIENTO SIGNIFICATIVO'),
('F79.8', 'RETRASO MENTAL NO ESPECIFICADO OTROS DETERIOROS DEL COMPORTAMIENTO'),
('F79.9', 'RETRASO MENTAL NO ESPECIFICADO DETERIORO DEL COMPORTAMIENTO DE GRADO NO E'),
('F80', 'TRASTORNOS ESPECIFICOS DEL DESARROLLO DEL HABLA Y DEL LENGUAJE'),
('F80.0', 'TRASTORNO ESPECIFICO DE LA PRONUNCIACION'),
('F80.1', 'TRASTORNO DEL LENGUAJE EXPRESIVO'),
('F80.2', 'TRASTORNO DE LA RECEPCION DEL LENGUAJE'),
('F80.3', 'AFASIA ADQUIRIDA CON EPILEPSIA [LANDAU-KLEFFNER]'),
('F80.8', 'OTROS TRASTORNOS DEL DESARROLLO DEL HABLA Y DEL LENGUAJE'),
('F80.9', 'TRASTORNO DEL DESARROLLO DEL HABLA Y DEL LENGUAJE NO ESPECIFICADO'),
('F81', 'TRASTORNOS ESPECIFICOS DEL DESARROLLO DE LAS HABILIDADES ESCOLARES'),
('F81.0', 'TRASTORNO ESPECIFICO DE LA LECTURA'),
('F81.1', 'TRASTORNO ESPECIFICO DEL DELETREO [ORTOGRAFIA]'),
('F81.2', 'TRASTORNO ESPECIFICO DE LAS HABILIDADES ARITMETICAS'),
('F81.3', 'TRASTORNO MIXTO DE LAS HABILIDADES ESCOLARES'),
('F81.8', 'OTROS TRASTORNOS DEL DESARROLLO DE LAS HABILIDADES ESCOLARES'),
('F81.9', 'TRASTORNO DEL DESARROLLO DE LAS HABILIDADES ESCOLARES NO ESPECIFICADO'),
('F82', 'TRASTORNO ESPECIFICO DEL DESARROLLO DE LA FUNCION MOTRIZ'),
('F83', 'TRASTORNOS ESPECIFICOS MIXTOS DEL DESARROLLO'),
('F84', 'TRASTORNOS GENERALIZADOS DEL DESARROLLO'),
('F84.0', 'AUTISMO EN LA NINIEZ'),
('F84.1', 'AUTISMO ATIPICO'),
('F84.2', 'SINDROME DE RETT'),
('F84.3', 'OTRO TRASTORNO DESINTEGRATIVO DE LA NINIEZ'),
('F84.4', 'TRASTORNO HIPERACTIVO ASOCIADO CON RETRASO MENTAL Y MOVIMIENTOS ESTEREOTIPA'),
('F84.5', 'SINDROME DE ASPERGER'),
('F84.8', 'OTROS TRASTORNOS GENERALIZADOS DEL DESARROLLO'),
('F84.9', 'TRASTORNO GENERALIZADO DEL DESARROLLO NO ESPECIFICADO'),
('F88', 'OTROS TRASTORNOS DEL DESARROLLO PSICOLOGICO'),
('F89', 'TRASTORNO DEL DESARROLLO PSICOLOGICO NO ESPECIFICADO'),
('F90', 'TRASTORNOS HIPERCINETICOS'),
('F90.0', 'PERTURBACION DE LA ACTIVIDAD Y DE LA ATENCION'),
('F90.1', 'TRASTORNO HIPERCINETICO DE LA CONDUCTA'),
('F90.8', 'OTROS TRASTORNOS HIPERCINETICOS'),
('F90.9', 'TRASTORNO HIPERCINETICO NO ESPECIFICADO'),
('F91', 'TRASTORNOS DE LA CONDUCTA'),
('F91.0', 'TRASTORNO DE LA CONDUCTA LIMITADO AL CONTEXTO FAMILIAR'),
('F91.1', 'TRASTORNO DE LA CONDUCTA INSOCIABLE'),
('F91.2', 'TRASTORNO DE LA CONDUCTA SOCIABLE'),
('F91.3', 'TRASTORNO OPOSITOR DESAFIANTE'),
('F91.8', 'OTROS TRASTORNOS DE LA CONDUCTA'),
('F91.9', 'TRASTORNO DE LA CONDUCTA NO ESPECIFICADO'),
('F92', 'TRASTORNOS MIXTOS DE LA CONDUCTA Y DE LAS EMOCIONES'),
('F92.0', 'TRASTORNO DEPRESIVO DE LA CONDUCTA'),
('F92.8', 'OTROS TRASTORNOS MIXTOS DE LA CONDUCTA Y DE LAS EMOCIONES'),
('F92.9', 'TRASTORNO MIXTO DE LA CONDUCTA Y DE LAS EMOCIONES NO ESPECIFICADO'),
('F93', 'TRASTORNOS EMOCIONALES DE COMIENZO ESPECIFICO EN LA NINIEZ'),
('F93.0', 'TRASTORNO DE ANSIEDAD DE SEPARACION EN LA NINIEZ'),
('F93.1', 'TRASTORNO DE ANSIEDAD FOBICA EN LA NINIEZ'),
('F93.2', 'TRASTORNO DE ANSIEDAD SOCIAL EN LA NINIEZ'),
('F93.3', 'TRASTORNO DE RIVALIDAD ENTRE HERMANOS'),
('F93.8', 'OTROS TRASTORNOS EMOCIONALES EN LA NINIEZ'),
('F93.9', 'TRASTORNO EMOCIONAL EN LA NINIEZ NO ESPECIFICADO'),
('F94', 'TRASTORNOS DEL COMPORTAMIENTO SOCIAL DE COMIENZO ESPECIFICO EN LA NINIEZ Y E'),
('F94.0', 'MUTISMO ELECTIVO'),
('F94.1', 'TRASTORNO DE VINCULACION REACTIVA EN LA NINIEZ'),
('F94.2', 'TRASTORNO DE VINCULACION DESINHIBIDA EN LA NINIEZ'),
('F94.8', 'OTROS TRASTORNOS DEL COMPORTAMIENTO SOCIAL EN LA NINIEZ'),
('F94.9', 'TRASTORNO DEL COMPORTAMIENTO SOCIAL EN LA NINIEZ NO ESPECIFICADO'),
('F95', 'TRASTORNOS POR TICS'),
('F95.0', 'TRASTORNO POR TIC TRANSITORIO'),
('F95.1', 'TRASTORNO POR TIC MOTOR O VOCAL CRONICO'),
('F95.2', 'TRASTORNO POR TICS MOTORES Y VOCALES MULTIPLES COMBINADOS [DE LA TOURETTE]'),
('F95.8', 'OTROS TRASTORNOS POR TICS'),
('F95.9', 'TRASTORNO POR TIC NO ESPECIFICADO'),
('F98', 'OTROS TRASTORNOS EMOCIONALES Y DEL COMPORTAMIENTO QUE APARECEN HABITUALMENT'),
('F98.0', 'ENURESIS NO ORGANICA'),
('F98.1', 'ENCOPRESIS NO ORGANICA'),
('F98.2', 'TRASTORNO DE LA INGESTION ALIMENTARIA EN LA INFANCIA Y LA NINIEZ'),
('F98.3', 'PICA EN LA INFANCIA Y LA NINIEZ'),
('F98.4', 'TRASTORNOS DE LOS MOVIMIENTOS ESTEREOTIPADOS'),
('F98.5', 'TARTAMUDEZ [ESPASMOFEMIA]'),
('F98.6', 'FARFULLEO'),
('F98.8', 'OTROS TRASTORNOS EMOCIONALES Y DEL COMPORTAMIENTO QUE APARECEN HABITUALMENT'),
('F98.9', 'TRASTORNOS NO ESPECIFICADOS EMOCIONALES Y DEL COMPORTAMIENTO QUE APARECEN'),
('F99', 'TRASTORNO MENTAL NO ESPECIFICADO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`cod_diag`),
  ADD KEY `cod_diag` (`cod_diag`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
