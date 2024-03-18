<?php
// Importar la clase TCPDF
require_once('../tcpdf/tcpdf.php');

// Incluir el controlador de pacientes
require_once '../controlador/control_paciente.php';

// Obtener los parámetros de filtro de la URL
$fecha_desde = isset($_GET['fecha_desde']) ? $_GET['fecha_desde'] : '';
$fecha_hasta = isset($_GET['fecha_hasta']) ? $_GET['fecha_hasta'] : '';
$profesional = isset($_GET['profesional']) ? $_GET['profesional'] : '';

// Obtener pacientes con filtros
$pacientes = obtenerPacientesConFiltro($fecha_desde, $fecha_hasta, $profesional);

// Crear un nuevo documento PDF
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// Establecer el título del documento
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetTitle('Reporte de Pacientes');

// Agregar una página
$pdf->AddPage();

// Definir el contenido del PDF
$content = '<h1>Reporte de Pacientes</h1>';

// Verificar si hay pacientes para mostrar
if (!empty($pacientes)) {
    // Crear una tabla para mostrar los datos
    $content .= '<table border="1">
                    <tr>
                        <th>Código de Paciente</th>
                        <th>Nombre y Apellido</th>
                        <th>Beneficio</th>
                        <th>Profesional</th>
                        <th>Especialidad de Profesional</th>
                        <th>Código de Práctica</th>
                        <th>Fecha</th>
                        <th>Código de Diagnóstico</th>
                        <th>Estado Cargado</th>
                    </tr>';

    // Iterar sobre los pacientes y agregarlos a la tabla
    foreach ($pacientes as $paciente) {
        $content .= '<tr>
                        <td>'.$paciente["cod_paci"].'</td>
                        <td>'.$paciente["nombreYapellido"].'</td>
                        <td>'.$paciente["benef"].'</td>
                        <td>'.obtenerNombreProfesional($paciente["cod_prof"]).'</td>
                        <td>'.obtenerEspecialidadProfesional($paciente["cod_prof"]).'</td>
                        <td>'.$paciente["cod_practica"].'</td>
                        <td>'.date('d/m/Y H:i:s', strtotime($paciente["fecha"])).'</td>
                        <td>'.$paciente["cod_diag"].'</td>
                        <td>'.$paciente["cargado"].'</td>
                    </tr>';
    }

    $content .= '</table>';
} else {
    $content .= '<p>No hay datos disponibles para los filtros seleccionados.</p>';
}

// Agregar el contenido al PDF
$pdf->writeHTML($content, true, false, true, false, '');

// Salida del PDF (enviar al navegador o guardar en el servidor)
$pdf->Output('reporte_pacientes.pdf', 'D');
?>
