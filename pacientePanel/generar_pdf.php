<?php
// Importar la clase TCPDF
require_once('../tcpdf/tcpdf.php');

// Incluir el controlador de pacientes
require_once '../controlador/control_paciente.php';

// Obtener el ID del profesional desde la solicitud GET
$profesional = isset($_GET['profesional']) ? $_GET['profesional'] : '';

// Obtener pacientes del profesional
$pacientes = obtenerPacientesPorProfesional($profesional);

// Crear un nuevo documento PDF
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetTitle('Reporte de Pacientes del Profesional');
$pdf->AddPage();

// Obtener el nombre del profesional utilizando su ID
$nombreProfesional = obtenerNombreProfesional($profesional);

// Definir el contenido del PDF
$content = '<h1>Reporte de Pacientes del Profesional:' . $nombreProfesional .'</h1>';


// Verificar si hay pacientes para mostrar
if (!empty($pacientes)) {
    // Crear una tabla para mostrar los datos
    $content .= '<table border="1" style="border-collapse: collapse; width: 100%;">
                    <tr>
                        <th>Nombre y Apellido</th>
                        <th>Beneficio</th>
                        <th>Código de Práctica</th>
                        <th>Fecha</th>
                    </tr>';
    
    // Iterar sobre los pacientes y agregarlos a la tabla
    foreach ($pacientes as $paciente) {
        $content .= '<tr>
                        <td>'.$paciente["nombreYapellido"].'</td>
                        <td>'.$paciente["benef"].'</td>
                        <td>'.$paciente["cod_practica"].'</td>
                        <td>'.date('d/m/Y H:i:s', strtotime($paciente["fecha"])).'</td>
                    </tr>';
    }

    $content .= '</table>';
} else {
    $content .= '<p>No hay datos disponibles para el profesional seleccionado.</p>';
}

// Agregar el contenido al PDF
$pdf->writeHTML($content, true, false, true, false, '');

// Salida del PDF (enviar al navegador o guardar en el servidor)
$pdf->Output('reporte_pacientes_profesional.pdf', 'D');
?>
