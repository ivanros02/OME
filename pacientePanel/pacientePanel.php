<?php
require_once '../controlador/control_paciente.php';

?>


<!DOCTYPE html>
<html lang="es" charset="UTF-8">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Prestaciones</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Agregar el archivo CSS de Tailwind CSS -->
    <style>
        .image-top-right {
            position: absolute;
            top: 10px;
            /* Ajustar según la distancia desde la parte superior */
            right: 10px;
            /* Ajustar según la distancia desde el lado derecho */
            max-width: 100%;
            /* Ancho máximo de la imagen */
            height: auto;
            /* Altura ajustada automáticamente según el ancho */
            border-radius: 12px;
            /* Radio de borde para hacerlo más redondeado */
        }
    </style>
</head>

<body class="bg-gray-100">
    <!-- Botón para volver al panel -->
    <a href="../panelMain/panelMain.php"
        class="bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-4 rounded">Volver</a>

    <?php

    if (isset ($_SESSION['alert_message'])) {
        // Muestra el mensaje de alerta
        echo "<script>alert('" . $_SESSION['alert_message'] . "');</script>";
        // Elimina el mensaje de alerta de la sesión para que no se muestre de nuevo
        unset($_SESSION['alert_message']);
    }
    ?>
    <div id="modalContainer" class="modal-container">
        <div class="modal-content" id="qrModalContent"></div>
    </div>
    <div class="container mx-auto px-4 py-8 relative"> <!-- Añadir relative para el posicionamiento absoluto -->
        <img src="../img/prestaciones.jpeg" alt="Imagen" class="image-top-right hidden sm:block">
        <h1 class="text-3xl font-bold mb-4">Panel de Prestaciones</h1>

        <!-- Formulario para agregar nuevo paciente -->
        <h2 class="text-2xl font-bold mb-2">Agregar Nueva Prestacion</h2>
        <form method="post" class="mb-4" id="formAgregar">

            <div class="mb-4">
                <label for="cod_prof" class="block text-sm font-medium text-gray-700">Profesional:</label>
                <select id="cod_prof" name="cod_prof" required
                    class="mt-1 p-2 block w-full border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
                    <option value="">Seleccionar Profesional</option>
                    <?php
                    $profesionales = obtenerProfesionales();
                    foreach ($profesionales as $profesional) {
                        echo "<option value='" . $profesional['cod_prof'] . "'>" . $profesional['nombre'] . " " . $profesional['apellido'] . "</option>";
                    }
                    ?>
                </select>
            </div>





            <div class="mb-4 flex items-center">
                <label for="benef" class="block text-sm font-medium text-gray-700 mr-2">Beneficio:</label>
                <input type="number" id="benef" name="benef" required pattern="[0-9]*"
                    class="mt-1 p-2 block w-1/2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500 mr-2">
                <button type="button" id="verificarBeneficio"
                    class="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded">
                    Verificar
                </button>
            </div>


            <div class="mb-4">
                <label for="nombreYapellido" class="block text-sm font-medium text-gray-700">Nombre y Apellido:</label>
                <input type="text" id="nombreYapellido" name="nombreYapellido" required
                    class="mt-1 p-2 block w-full border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="cod_practica" class="block text-sm font-medium text-gray-700">Código de Práctica:</label>
                <select id="cod_practica" name="cod_practica" required
                    class="mt-1 p-2 block w-full border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
                    <option value="">Seleccionar Código de Práctica</option>
                    <?php
                    $codigos_practica = obtenerCodigosPractica();
                    foreach ($codigos_practica as $cod_practica) {
                        echo "<option value='" . $cod_practica . "'>" . $cod_practica . "</option>";
                    }
                    ?>
                </select>
            </div>

            <div class="mb-4">
                <label for="cod_diag" class="block text-sm font-medium text-gray-700">Diagnóstico:</label>
                <select id="cod_diag" name="cod_diag" required
                    class="mt-1 p-2 block w-full border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
                    <option value="">Seleccionar Diagnóstico</option>
                    <?php
                    $diagnosticos = obtenerDiagnosticoConDescripcion(); // Obtener la lista de diagnósticos con descripciones
                    foreach ($diagnosticos as $diagnostico) {
                        echo "<option value='" . $diagnostico['cod_diag'] . "'>" . $diagnostico['cod_diag'] . " - " . $diagnostico['descript'] . "</option>";
                    }
                    ?>
                </select>
            </div>




            <div class="mb-4">
                <label for="fecha" class="block text-sm font-medium text-gray-700">Fecha:</label>
                <input type="date" id="fecha" name="fecha" required
                    class="mt-1 p-2 block w-full border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
            </div>



            <button type="submit" name="agregar" id="btnAgregar"
                class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded" disabled>
                Agregar
            </button>
        </form>


    </div>


    </div>

    <script>
        document.getElementById('verificarBeneficio').addEventListener('click', function () {
            var beneficio = document.getElementById('benef').value;
            if (beneficio.trim() !== '') {
                fetch('../controlador/control_paciente.php?verificarBeneficio&benef=' + beneficio)
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            document.getElementById('nombreYapellido').value = data.nombreYapellido;
                            document.getElementById('btnAgregar').disabled = false;
                        } else {
                            if (data.completar) {
                                alert('Completar número de beneficio.');
                            } else {
                                alert(data.message);
                            }
                            document.getElementById('nombreYapellido').value = ''; // Limpiar el campo si el beneficio no existe
                            document.getElementById('btnAgregar').disabled = false; // Deshabilitar el botón si el beneficio no existe
                        }
                    })
                    .catch(error => console.error('Error:', error));
            } else {
                alert('Por favor ingrese un número de beneficio.');
            }
        });




    </script>

</body>

</html>