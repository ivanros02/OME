<?php
require_once '../controlador/control_paciente.php';

// Inicializar variables de filtro
$fecha_desde = isset($_GET['fecha_desde']) ? $_GET['fecha_desde'] : '';
$fecha_hasta = isset($_GET['fecha_hasta']) ? $_GET['fecha_hasta'] : '';
$profesional = isset($_GET['profesional']) ? $_GET['profesional'] : '';

// Obtener la lista de profesionales para el filtro
$profesionales = obtenerProfesionales();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Actualizar el estado 'cargado' del paciente en la base de datos
    $cod_paci = $_POST['cod_paci'];
    $nuevo_estado = $_POST['nuevo_estado'];
    actualizarEstadoCargado($cod_paci, $nuevo_estado);
}

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabla de Pacientes</title>
    <!-- Enlace al archivo de Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>

<body class="bg-gray-100">

    <!-- Lista de pacientes existentes -->
    <hr class="border-t border-gray-400 my-8">
    <h2 class="text-2xl font-bold mb-2">Pacientes Existentes</h2>

    <!-- Formulario de filtro -->
    <form method="GET">
        <div class="flex space-x-4 mb-4">
            <div>
                <label for="fecha_desde" class="block font-semibold">Desde:</label>
                <input type="date" id="fecha_desde" name="fecha_desde" class="border px-2 py-1">
            </div>
            <div>
                <label for="fecha_hasta" class="block font-semibold">Hasta:</label>
                <input type="date" id="fecha_hasta" name="fecha_hasta" class="border px-2 py-1">
            </div>
            <div>
                <label for="profesional" class="block font-semibold">Profesional:</label>
                <select name="profesional" id="profesional" class="border px-2 py-1">
                    <option value="">Todos</option>
                    <?php foreach ($profesionales as $profesional_item): ?>
                        <option value="<?php echo $profesional_item['cod_prof']; ?>" <?php echo ($profesional == $profesional_item['cod_prof']) ? 'selected' : ''; ?>>
                            <?php echo obtenerNombreProfesional($profesional_item['cod_prof']); ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div>
                <button type="submit"
                    class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Filtrar</button>
            </div>
        </div>
    </form>
    <?php if (!empty($profesional)): ?>
        <p>Total de pacientes para
            <?php echo obtenerNombreProfesional($profesional); ?>:
            <?php echo obtenerTotalPacientesParaProfesional($profesional); ?>
        </p>
    <?php endif; ?>
    <div class="overflow-x-auto">
        <table class="table-auto w-full">
            <thead>
                <tr>
                    <th class="px-4 py-2">Nombre y Apellido</th>
                    <th class="px-4 py-2">Beneficio</th>
                    <th class="px-4 py-2">Profesional</th>
                    <th class="px-4 py-2">Especialidad</th>
                    <th class="px-4 py-2">Código de Práctica</th>
                    <th class="px-4 py-2">Fecha</th>
                    <th class="px-4 py-2">Cargado</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Obtener pacientes con filtros aplicados
                $pacientes = obtenerPacientesConFiltro($fecha_desde, $fecha_hasta, $profesional);
                foreach ($pacientes as $paciente) {
                    echo "<tr>";
                    echo "<td class='border px-4 py-2'>" . $paciente["nombreYapellido"] . "</td>";
                    echo "<td class='border px-4 py-2'>" . $paciente["benef"] . "</td>";
                    echo "<td class='border px-4 py-2'>" . obtenerNombreProfesional($paciente["cod_prof"]) . "</td>";
                    echo "<td class='border px-4 py-2'>" . obtenerEspecialidadProfesional($paciente["cod_prof"]) . "</td>";
                    echo "<td class='border px-4 py-2'>" . $paciente["cod_practica"] . "</td>";
                    echo "<td class='border px-4 py-2'>" . $paciente["fecha"] . "</td>";
                    echo "<td class='border px-4 py-2'>";
                    // Formulario para cambiar el estado 'cargado'
                    echo "<form method='post'>";
                    echo "<input type='hidden' name='cod_paci' value='" . $paciente["cod_paci"] . "'>";
                    echo "<select name='nuevo_estado' onchange='this.form.submit()'>";
                    echo "<option value='no_cargado'" . ($paciente["cargado"] == 'no_cargado' ? " selected" : "") . ">No cargado</option>";
                    echo "<option value='cargado'" . ($paciente["cargado"] == 'cargado' ? " selected" : "") . ">Cargado</option>";
                    echo "</select>";
                    echo "</form>";
                    echo "</td>";
                    echo "</tr>";
                }

                ?>
            </tbody>
        </table>
    </div>

</body>

</html>