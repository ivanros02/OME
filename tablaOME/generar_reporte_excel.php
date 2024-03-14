<?php
// Importar la clase PhpSpreadsheet
require '../vendor/autoload.php';

// Cargar el controlador de pacientes
require_once '../controlador/control_paciente.php';

// Obtener los parámetros de filtro de la URL
$fecha_desde = isset($_GET['fecha_desde']) ? $_GET['fecha_desde'] : '';
$fecha_hasta = isset($_GET['fecha_hasta']) ? $_GET['fecha_hasta'] : '';
$profesional = isset($_GET['profesional']) ? $_GET['profesional'] : '';

// Crear un nuevo objeto PhpSpreadsheet
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

// Crear una instancia de la hoja de cálculo
$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

// Establecer los encabezados de columna
$sheet->setCellValue('A1', 'Código de Paciente');
$sheet->setCellValue('B1', 'Nombre y Apellido');
$sheet->setCellValue('C1', 'Beneficio');
$sheet->setCellValue('D1', 'Código de Profesional');
$sheet->setCellValue('E1', 'Especialidad de Profesional');
$sheet->setCellValue('F1', 'Código de Práctica');
$sheet->setCellValue('G1', 'Fecha');
$sheet->setCellValue('H1', 'Código de Diagnóstico');
$sheet->setCellValue('I1', 'Estado Cargado');

// Obtener datos filtrados de la base de datos
$pacientes = obtenerPacientesConFiltro($fecha_desde, $fecha_hasta, $profesional);

// Inicializar la fila
$row = 2;

// Llenar la hoja de cálculo con los datos de los pacientes filtrados
foreach ($pacientes as $paciente) {
    $sheet->setCellValue('A' . $row, $paciente["cod_paci"]);
    $sheet->setCellValue('B' . $row, $paciente["nombreYapellido"]);
    $sheet->setCellValue('C' . $row, $paciente["benef"]);
    $sheet->setCellValue('D' . $row, obtenerNombreProfesional($paciente["cod_prof"]));
    $sheet->setCellValue('E' . $row, obtenerEspecialidadProfesional($paciente["cod_prof"]));
    $sheet->setCellValue('F' . $row, $paciente["cod_practica"]);
    $sheet->setCellValue('G' . $row, date('d/m/Y', strtotime($paciente["fecha"])));
    $sheet->setCellValue('H' . $row, $paciente["cod_diag"]);
    $sheet->setCellValue('I' . $row, $paciente["cargado"]);
    $row++;
}

// Configurar el tipo de contenido y el nombre del archivo
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="reporte_pacientes.xlsx"');
header('Cache-Control: max-age=0');

// Crear un objeto Writer para guardar el archivo
$writer = new Xlsx($spreadsheet);
// Guardar el archivo en la salida
$writer->save('php://output');
