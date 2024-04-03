<?php
require_once '../controlador/control_paciente.php';


// Verificar si el usuario está autenticado
if (!isset($_SESSION['usuario'])) {
    header("Location: ../index.php");
    exit; // Asegura que el script se detenga después de redirigir
}



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

        /* Estilos para la tabla */
        .table {
            width: 100%;
            border-collapse: collapse;
        }

        /* Estilos para las celdas de la tabla */
        .table td,
        .table th {
            padding: 8px;
            border: 1px solid #dddddd;
            text-align: left;
        }

        /* Estilos para el encabezado de la tabla */
        .table th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body class="bg-gray-100">
    <!-- Botón para volver al panel -->
    <a href="../panelMain/panelMain.php"
        class="bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-4 rounded">Volver</a>

    <?php

    if (isset($_SESSION['alert_message'])) {
        // Muestra el mensaje de alerta
        echo "<script>alert('" . $_SESSION['alert_message'] . "');</script>";
        // Elimina el mensaje de alerta de la sesión para que no se muestre de nuevo
        unset($_SESSION['alert_message']);
    }
    ?>
    <div class="container mx-auto px-4 py-8 relative"> <!-- Añadir relative para el posicionamiento absoluto -->
        <img src="../img/prestaciones.jpeg" alt="Imagen" class="image-top-right hidden sm:block">
        <h1 class="text-3xl font-bold mb-4">Panel de Prestaciones</h1>

        <!-- Formulario para agregar nuevo paciente -->
        <h2 class="text-2xl font-bold mb-2">Agregar Nueva Prestacion</h2>
        <form method="post" class="mb-4" id="formAgregar">
            <!-- Formulario para seleccionar el profesional -->
            <div class="mb-4">
                <label for="cod_prof" class="block text-sm font-medium text-gray-700">Profesional:</label>
                <select id="cod_prof" name="cod_prof" required
                    class="mt-1 p-2 block w-full border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
                    <option value="">Seleccionar Profesional</option>
                    <?php
                    require_once '../controlador/control_paciente.php';
                    // Obtener la lista de profesionales
                    $profesionales = obtenerProfesionales();

                    // Ordenar los profesionales alfabéticamente por apellido
                    usort($profesionales, function ($a, $b) {
                        return strcmp($a['apellido'], $b['apellido']);
                    });

                    // Mostrar los profesionales ordenados
                    foreach ($profesionales as $profesional) {
                        echo "<option value='" . $profesional['cod_prof'] . "'>" . $profesional['apellido'] . " " . $profesional['nombre'] . "</option>";
                    }
                    ?>
                    ?>
                </select>
            </div>


            <div class="mb-4 flex items-center">
                <label for="benef" class="block text-sm font-medium text-gray-700 mr-2">Beneficio:</label>
                <input type="text" id="benef" name="benef" required
                    class="mt-1 p-2 block w-1/2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500 mr-2">
                <button type="button" id="verificarBeneficio"
                    class="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded">
                    Verificar
                </button>
            </div>

            <div class="mb-4 flex items-center">
                <label for="dni" class="block text-sm font-medium text-gray-700 mr-2">DNI:</label>
                <input type="text" id="dni" name="dni" required
                    class="mt-1 p-2 block w-1/2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500 mr-2">
                <button type="button" id="verificarDni"
                    class="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded">
                    Verificar
                </button>
            </div>




            <div class="mb-4 flex items-center">
                <label for="nombreYapellido" class="block text-sm font-medium text-gray-700 mr-2">Nombre y
                    Apellido:</label>
                <input type="text" id="nombreYapellido" name="nombreYapellido" required
                    class="mt-1 p-2 block w-1/2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500 mr-2">
                <button type="button" id="buscarPorNombreApellido"
                    class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
                    Buscar
                </button>
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
                <label for="fecha" class="block text-sm font-medium text-gray-700">Fecha y Hora:</label>
                <input type="datetime-local" id="fecha" name="fecha" required
                    class="mt-1 p-2 block w-full border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
            </div>
            <button type="submit" name="agregar" id="btnAgregar"
                class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded" disabled>
                Agregar
            </button>

        </form>

        <button id="btnGenerarPDF" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded">
            Generar PDF
        </button>

        <div id="contenedorPacientes"></div>
        <!-- Aquí va el script de JavaScript -->
        <script>

            // Capturar el campo de entrada del número de beneficio
            const beneficioInput = document.getElementById('benef');
            // Capturar el botón de agregar
            const btnAgregar = document.getElementById('btnAgregar');

            // Agregar un event listener para el evento blur (cuando el campo pierde el foco)
            beneficioInput.addEventListener('blur', function () {
                // Verificar si el campo de entrada contiene menos de 14 caracteres
                if (beneficioInput.value.trim().length < 14) {
                    // Si contiene menos de 14 caracteres, deshabilitar el botón de agregar
                    btnAgregar.setAttribute('disabled', 'disabled');
                }
            });



            //funcion para maximo de beneficio:
            document.getElementById("benef").addEventListener("input", function () {
                var input = this.value.trim();
                // Eliminar caracteres no numéricos
                input = input.replace(/\D/g, '');
                // Limitar a 14 caracteres
                input = input.slice(0, 14);
                this.value = input;
            });

            document.getElementById('btnGenerarPDF').addEventListener('click', function () {
                // Llamar a la función para generar el PDF
                generarPDF();

            });

            function generarPDF() {
                // Obtener el ID del profesional seleccionado
                var cod_prof = document.getElementById('cod_prof').value;

                // Crear la URL para generar el PDF con el ID del profesional como parámetro
                var url = './generar_pdf.php?profesional=' + cod_prof;

                // Redireccionar a la URL para generar el PDF
                window.location.href = url;
            }

            // Dentro de tu función cargarPacientesPorProfesional en tu archivo HTML
            function cargarPacientesPorProfesional(cod_prof) {
                console.log("Cargando pacientes para el profesional con el código: " + cod_prof);

                fetch('../controlador/control_paciente.php?obtenerPacientesPorProfesional=true&cod_prof=' + cod_prof)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Hubo un problema al cargar los pacientes. Estado de la respuesta: ' + response.status);
                        }
                        return response.json();
                    })
                    .then(data => {
                        console.log("Datos de pacientes cargados con éxito:", data);
                        mostrarPacientes(data); // Llamar a la función para mostrar los pacientes
                    })
                    .catch(error => {
                        console.error('Error al cargar pacientes:', error);
                        // Aquí puedes mostrar un mensaje de error al usuario si lo deseas
                    });
            }



            // Función para editar un paciente
            function editarPaciente(cod_paci) {
                // Aquí puedes implementar la lógica para editar el paciente con el ID cod_paci
                // Por ejemplo, puedes redirigir a una página de edición con el ID del paciente en la URL
                window.location.href = 'editarPaciente.php?editar=' + cod_paci;
            }

            function mostrarPacientes(pacientes) {
                var contenedorPacientes = document.getElementById('contenedorPacientes');
                contenedorPacientes.innerHTML = ''; // Limpiar cualquier contenido anterior de pacientes

                // Ordenar pacientes por fecha de forma descendente
                pacientes.sort(function (a, b) {
                    return new Date(b.fecha) - new Date(a.fecha);
                });

                // Crear la tabla y sus encabezados
                var table = document.createElement('table');
                table.classList.add('table'); // Agregar la clase 'table'
                var thead = document.createElement('thead');
                var headerRow = document.createElement('tr');
                headerRow.innerHTML = '<th>Nombre y Apellido</th><th>Beneficio</th><th>Profesional</th><th>Práctica</th><th>Diagnóstico</th><th>Fecha</th><th>Acciones</th>'; // Agregado: Fecha y Acciones
                thead.appendChild(headerRow);
                table.appendChild(thead);

                // Crear el cuerpo de la tabla
                var tbody = document.createElement('tbody');
                pacientes.forEach(function (paciente) {
                    var row = document.createElement('tr');
                    // Llamar a la función para obtener el nombre del profesional por AJAX
                    fetch('../controlador/control_paciente.php?obtenerNombreProfesional&cod_prof=' + paciente.cod_prof)
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                // Formatear la fecha
                                var fecha = new Date(paciente.fecha);
                                var dia = fecha.getDate();
                                var mes = fecha.getMonth() + 1;
                                var año = fecha.getFullYear();
                                var hora = fecha.getHours();
                                var minutos = fecha.getMinutes();
                                var segundos = fecha.getSeconds();

                                // Asegurar que los números de día, mes, hora, minutos y segundos estén en el formato de dos dígitos
                                dia = (dia < 10 ? '0' : '') + dia;
                                mes = (mes < 10 ? '0' : '') + mes;
                                hora = (hora < 10 ? '0' : '') + hora;
                                minutos = (minutos < 10 ? '0' : '') + minutos;
                                segundos = (segundos < 10 ? '0' : '') + segundos;

                                var fechaFormateada = dia + '/' + mes + '/' + año + ' ' + hora + ':' + minutos + ':' + segundos;

                                // Agregar los datos del paciente a la fila de la tabla
                                row.innerHTML = '<td>' + paciente.nombreYapellido + '</td><td>' + paciente.benef + '</td><td>' + data.nombreProfesional + '</td><td>' + paciente.cod_practica + '</td><td>' + paciente.cod_diag + '</td><td>' + fechaFormateada + '</td><td><button onclick="editarPaciente(' + paciente.cod_paci + ')">Editar</button></td>'; // Agregado: Fecha y botón de Editar
                            } else {
                                console.error('Error al obtener el nombre del profesional:', data.message);
                                // Si hay un error, mostrar solo los detalles del paciente sin el nombre del profesional
                                row.innerHTML = '<td>' + paciente.nombreYapellido + '</td><td>' + paciente.benef + '</td><td></td><td>' + paciente.cod_practica + '</td><td>' + paciente.cod_diag + '</td><td>' + paciente.fecha + '</td><td><button onclick="editarPaciente(' + paciente.cod_paci + ')">Editar</button></td>'; // Agregado: Fecha y botón de Editar
                            }
                            // Agregar la fila a la tabla
                            tbody.appendChild(row);
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            // Si hay un error, mostrar solo los detalles del paciente sin el nombre del profesional
                            row.innerHTML = '<td>' + paciente.nombreYapellido + '</td><td>' + paciente.benef + '</td><td></td><td>' + paciente.cod_practica + '</td><td>' + paciente.cod_diag + '</td><td>' + paciente.fecha + '</td><td><button onclick="editarPaciente(' + paciente.cod_paci + ')">Editar</button></td>'; // Agregado: Fecha y botón de Editar
                            // Agregar la fila a la tabla
                            tbody.appendChild(row);
                        });
                });
                // Agregar el cuerpo de la tabla al elemento contenedor
                table.appendChild(tbody);
                contenedorPacientes.appendChild(table);
            }



            // Agrega un event listener para detectar cambios en el elemento select con id cod_prof
            document.getElementById('cod_prof').addEventListener('change', function () {
                var cod_prof = this.value; // Obtener el valor seleccionado del profesional
                cargarPacientesPorProfesional(cod_prof); // Llamar a la función para cargar pacientes por profesional
            });


            document.getElementById('verificarBeneficio').addEventListener('click', function () {
                var beneficio = document.getElementById('benef').value;
                if (beneficio.trim() !== '') {
                    // Comprobar la longitud del beneficio ingresado
                    if (beneficio.trim().length < 14) {
                        alert('El número de beneficio debe tener al menos 14 caracteres.');
                        return; // Salir de la función si no se cumplen los requisitos de longitud
                    }

                    // Realizar la verificación del beneficio si tiene al menos 14 caracteres
                    fetch('../controlador/control_paciente.php?verificarBeneficio&benef=' + beneficio)
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                document.getElementById('nombreYapellido').value = data.nombreYapellido;
                                document.getElementById('dni').value = data.dni;
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

            // Definir una función para verificar el DNI
            function verificarDNI() {
                var dni = document.getElementById('dni').value;
                if (dni.trim() !== '') {
                    // Realizar la verificación del DNI
                    fetch('../controlador/control_paciente.php?verificarDni&dni=' + dni)
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                document.getElementById('nombreYapellido').value = data.nombreYapellido;
                                document.getElementById('benef').value = data.benef;
                                document.getElementById('btnAgregar').disabled = false;
                            } else {
                                if (data.completar) {
                                    alert('Completar número de DNI.');
                                } else {
                                    alert(data.message);
                                }
                                document.getElementById('nombreYapellido').value = ''; // Limpiar el campo si el DNI no existe
                                document.getElementById('benef').value = ''; // Limpiar el campo si el DNI no existe
                                document.getElementById('btnAgregar').disabled = true; // Deshabilitar el botón si el DNI no existe
                            }
                        })
                        .catch(error => console.error('Error:', error));
                } else {
                    alert('Por favor ingrese un número de DNI.');
                }
            }

            // Agregar un event listener al botón para verificar el DNI
            document.getElementById('verificarDni').addEventListener('click', verificarDNI);



            document.getElementById('buscarPorNombreApellido').addEventListener('click', function () {
                var nombreYapellido = document.getElementById('nombreYapellido').value;
                if (nombreYapellido.trim() !== '') {
                    fetch('../controlador/control_paciente.php?buscarPorNombreApellido&nombreYapellido=' + nombreYapellido)
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                document.getElementById('benef').value = data.benef;
                                document.getElementById('dni').value = data.dni;
                                document.getElementById('btnAgregar').disabled = false;
                            } else {
                                alert(data.message);
                                document.getElementById('benef').value = '';
                                document.getElementById('btnAgregar').disabled = false; // Limpiar el campo si no se encuentra el beneficio
                            }
                        })
                        .catch(error => console.error('Error:', error));
                } else {
                    alert('Por favor ingrese un nombre y apellido.');
                }
            });






        </script>

</body>

</html>