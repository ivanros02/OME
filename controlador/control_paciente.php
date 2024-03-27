<?php
require_once '../modelo/paciente.php';

// Iniciar la sesión si no está iniciada
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

if (isset($_POST['agregar'])) {
    $nombreYapellido = $_POST['nombreYapellido'];
    $benef = $_POST['benef'];
    $cod_prof = $_POST['cod_prof'];
    $cod_practica = $_POST['cod_practica'];
    $fecha = $_POST['fecha'];
    $cod_diag = $_POST['cod_diag']; // Obtener el código de diagnóstico del formulario

    // Llama a la función agregarPaciente con los argumentos necesarios, incluido $cod_diag
    if (agregarPaciente($nombreYapellido, $benef, $cod_prof, $cod_practica, $cod_diag, $fecha)) {
        $_SESSION['alert_message'] = "Paciente agregado correctamente";
    } else {
        $_SESSION['alert_message'] = "Error al agregar el paciente";
    }

    // Redirigir después de agregar para evitar reenvío de formulario
    header("Location: ../pacientePanel/pacientePanel.php");
    exit(); // Asegura que el script se detenga después de la redirección
}



// Procesar la solicitud de eliminar un paciente
if (isset($_GET['eliminar'])) {
    $cod_paci = $_GET['eliminar'];

    // Si se ha confirmado la eliminación, proceder con la eliminación
    if (isset($_GET['confirmar'])) {
        if (eliminarPaciente($cod_paci)) {
            $_SESSION['alert_message'] = "Paciente eliminado correctamente";
        } else {
            $_SESSION['alert_message'] = "Error al eliminar el paciente";
        }

        // Redirigir después de eliminar para evitar reenvío de formulario
        header("Location: ../pacientePanel/pacientePanel.php");
        exit(); // Asegura que el script se detenga después de la redirección
    } else {
        // Si no se ha confirmado, mostrar la ventana de confirmación
        echo "<script>
                var confirmar = confirm('¿Estás seguro de que quieres eliminar este paciente?');
                if (confirmar) {
                    window.location.href = 'pacientePanel.php?eliminar=$cod_paci&confirmar=1';
                } else {
                    window.location.href = 'pacientePanel.php';
                }
              </script>";
        exit();
    }
}

// Función para obtener pacientes con filtros aplicados
function obtenerPacientesConFiltro($fecha_desde, $fecha_hasta, $profesional)
{
    global $conn;

    // Preparar la consulta SQL base para obtener pacientes
    $sql = "SELECT * FROM paciente WHERE 1";

    // Aplicar filtro por fecha desde
    if (!empty($fecha_desde)) {
        $sql .= " AND fecha >= '$fecha_desde'";
    }

    // Aplicar filtro por fecha hasta
    if (!empty($fecha_hasta)) {
        $sql .= " AND fecha <= '$fecha_hasta'";
    }

    // Aplicar filtro por profesional
    if (!empty($profesional)) {
        $sql .= " AND cod_prof = $profesional";
    }

    // Ejecutar la consulta
    $result = $conn->query($sql);

    // Verificar si se encontraron pacientes
    if ($result->num_rows > 0) {
        // Inicializar arrays para almacenar pacientes cargados y no cargados
        $pacientes_cargados = array();
        $pacientes_no_cargados = array();

        // Iterar sobre los resultados y clasificarlos según su estado de carga
        while ($row = $result->fetch_assoc()) {
            if ($row['cargado'] == 'cargado') {
                $pacientes_cargados[] = $row;
            } else {
                $pacientes_no_cargados[] = $row;
            }
        }

        // Combinar los arrays y devolverlos
        return array_merge($pacientes_no_cargados, $pacientes_cargados);
    } else {
        // Devolver un array vacío si no se encontraron pacientes
        return array();
    }
}


function obtenerTotalPacientesParaProfesional($profesional)
{
    global $conn;

    // Preparar la consulta SQL para obtener el total de pacientes para un profesional específico
    $sql = "SELECT COUNT(*) AS total FROM paciente WHERE cod_prof = ?";

    // Preparar la sentencia
    $stmt = $conn->prepare($sql);

    // Vincular el parámetro
    $stmt->bind_param("i", $profesional);

    // Ejecutar la consulta
    $stmt->execute();

    // Obtener el resultado
    $result = $stmt->get_result();

    // Verificar si se encontró el total de pacientes
    if ($result->num_rows > 0) {
        // Obtener el total de pacientes
        $row = $result->fetch_assoc();
        return $row['total'];
    } else {
        // Devolver 0 si no se encontró ningún paciente para el profesional especificado
        return 0;
    }
}

function obtenerTotalPacientes()
{
    global $conn;

    // Preparar la consulta SQL para obtener el total de pacientes
    $sql = "SELECT COUNT(*) AS total FROM paciente";

    // Ejecutar la consulta
    $result = $conn->query($sql);

    // Obtener el resultado
    $row = $result->fetch_assoc();

    // Devolver el total de pacientes
    return $row['total'];
}



function obtenerNombreYApellidoPorBeneficio($beneficio)
{
    global $conn;

    // Preparar la consulta SQL
    $sql = "SELECT nombreYapellido FROM padron WHERE benef = ?";

    // Preparar la sentencia
    $stmt = $conn->prepare($sql);

    // Vincular el parámetro
    $stmt->bind_param("i", $beneficio);

    // Ejecutar la consulta
    $stmt->execute();

    // Obtener el resultado
    $result = $stmt->get_result();

    // Verificar si se encontró el nombre y apellido
    if ($result->num_rows > 0) {
        // Devolver el nombre y apellido
        $row = $result->fetch_assoc();
        return $row['nombreYapellido'];
    } else {
        // Devolver false si no se encontró el nombre y apellido
        return false;
    }
}

// Procesar la solicitud de verificación del número de beneficio
if (isset($_GET['verificarBeneficio']) && isset($_GET['benef'])) {
    $beneficio = $_GET['benef'];
    $nombreYapellido = obtenerNombreYApellidoPorBeneficio($beneficio);
    $completar = 'Completar con nombre y apellido';
    if ($nombreYapellido) {
        echo json_encode(array('success' => true, 'nombreYapellido' => $nombreYapellido));
    } else {
        // Si no se reciben los parámetros esperados, devolver un mensaje de error
        echo json_encode(array('success' => false, 'message' => 'Completar nombre y apellido'));

    }
    exit();
}




function obtenerNombreProfesional($cod_prof)
{
    global $conn;

    // Preparar la consulta SQL
    $sql = "SELECT nombre, apellido FROM prof WHERE cod_prof = ?";

    // Preparar la sentencia
    $stmt = $conn->prepare($sql);

    // Vincular el parámetro
    $stmt->bind_param("i", $cod_prof);

    // Ejecutar la consulta
    $stmt->execute();

    // Obtener el resultado
    $result = $stmt->get_result();

    // Verificar si se encontró el profesional
    if ($result->num_rows > 0) {
        // Obtener el nombre y apellido del profesional
        $row = $result->fetch_assoc();
        return $row['apellido'] . ' ' . $row['nombre'];
    } else {
        // Devolver false si no se encontró el profesional
        return false;
    }
}


function actualizarEstadoCargado($cod_paci, $nuevo_estado)
{
    global $conn;

    // Preparar la consulta SQL para actualizar el estado 'cargado' del paciente
    $sql = "UPDATE paciente SET cargado = ? WHERE cod_paci = ?";

    // Preparar la sentencia
    $stmt = $conn->prepare($sql);

    // Verificar si la preparación de la sentencia fue exitosa
    if (!$stmt) {
        die("Error al preparar la consulta: " . $conn->error);
    }

    // Vincular los parámetros
    $stmt->bind_param("si", $nuevo_estado, $cod_paci);

    // Ejecutar la consulta
    if ($stmt->execute()) {
        return true; // La actualización se realizó con éxito
    } else {
        // Si hay un error en la ejecución, mostrar el mensaje de error
        die("Error al ejecutar la consulta: " . $stmt->error);
    }
}



// Función para obtener los pacientes de un profesional específico
function obtenerPacientesPorProfesional($cod_prof) {
    global $conn;

    // Preparar la consulta SQL para obtener los pacientes del profesional
    $sql = "SELECT * FROM paciente WHERE cod_prof = ?";


    // Preparar la sentencia
    $stmt = $conn->prepare($sql);

    // Vincular el parámetro
    $stmt->bind_param("i", $cod_prof);

    // Ejecutar la consulta
    $stmt->execute();

    // Obtener el resultado
    $result = $stmt->get_result();

    // Verificar si se encontraron pacientes
    if ($result->num_rows > 0) {
        // Inicializar un array para almacenar los pacientes
        $pacientes = array();

        // Iterar sobre los resultados
        while ($row = $result->fetch_assoc()) {
            $pacientes[] = $row;
        }

        // Devolver el array de pacientes
        return $pacientes;
    } else {
        // Si no se encontraron pacientes, devolver un array vacío
        return array();
    }
}



if (isset($_GET['obtenerPacientesPorProfesional']) && isset($_GET['cod_prof'])) {
    $cod_prof = $_GET['cod_prof'];
    $pacientes = obtenerPacientesPorProfesional($cod_prof);
    echo json_encode($pacientes);
    exit();
}

// Procesar la solicitud de obtener el nombre del profesional por su código
if (isset($_GET['obtenerNombreProfesional']) && isset($_GET['cod_prof'])) {
    $cod_prof = $_GET['cod_prof'];
    $nombreProfesional = obtenerNombreProfesional($cod_prof);
    if ($nombreProfesional) {
        echo json_encode(array('success' => true, 'nombreProfesional' => $nombreProfesional));
    } else {
        echo json_encode(array('success' => false, 'message' => 'Profesional no encontrado'));
    }
    exit();
}




function obtenerEspecialidadProfesional($cod_prof)
{
    global $conn;
    $sql = "SELECT especialidad FROM prof WHERE cod_prof = ?";

    // Preparar la sentencia
    $stmt = $conn->prepare($sql);
    // Vincular parámetro
    $stmt->bind_param("i", $cod_prof);
    // Ejecutar consulta
    $stmt->execute();
    // Obtener resultado
    $result = $stmt->get_result();

    // Verificar si se encontró la especialidad
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return $row['especialidad'];
    } else {
        return "Especialidad no especificada"; // O un mensaje apropiado si no se encuentra la especialidad
    }
}

function obtenerDescripcionPractica($cod_practica )
{
    global $conn;
    $sql = "SELECT descript FROM tipo_prac WHERE cod_practica  = ?";

    // Preparar la sentencia
    $stmt = $conn->prepare($sql);
    // Vincular parámetro
    $stmt->bind_param("i", $cod_practica );
    // Ejecutar consulta
    $stmt->execute();
    // Obtener resultado
    $result = $stmt->get_result();

    // Verificar si se encontró la especialidad
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        return $row['descript'];
    } else {
        return "Sin descripcion"; // O un mensaje apropiado si no se encuentra la especialidad
    }
}

function obtenerProfesionales()
{
    global $conn;

    // Preparar la consulta SQL
    $sql = "SELECT cod_prof, nombre, apellido FROM prof";

    // Ejecutar la consulta
    $result = $conn->query($sql);

    // Verificar si se encontraron profesionales
    if ($result->num_rows > 0) {
        // Inicializar un array para almacenar los profesionales
        $profesionales = array();

        // Iterar sobre los resultados y almacenarlos en el array
        while ($row = $result->fetch_assoc()) {
            $profesionales[] = $row;
        }

        // Devolver el array de profesionales
        return $profesionales;
    } else {
        // Devolver un array vacío si no se encontraron profesionales
        return array();
    }
}



function obtenerCodigosPractica()
{
    global $conn;

    // Preparar la consulta SQL
    $sql = "SELECT cod_practica FROM tipo_prac";

    // Ejecutar la consulta
    $result = $conn->query($sql);

    // Verificar si se encontraron códigos de práctica
    if ($result->num_rows > 0) {
        // Inicializar un array para almacenar los códigos de práctica
        $codigos_practica = array();

        // Iterar sobre los resultados y almacenar los códigos de práctica en el array
        while ($row = $result->fetch_assoc()) {
            $codigos_practica[] = $row['cod_practica'];
        }

        // Devolver el array de códigos de práctica
        return $codigos_practica;
    } else {
        // Devolver un array vacío si no se encontraron códigos de práctica
        return array();
    }
}

function obtenerDiagnosticoConDescripcion()
{
    global $conn;

    // Preparar la consulta SQL
    $sql = "SELECT cod_diag, descript FROM diagnostico";

    // Ejecutar la consulta
    $result = $conn->query($sql);

    // Verificar si se encontraron diagnósticos
    if ($result->num_rows > 0) {
        // Inicializar un array para almacenar los diagnósticos con descripciones
        $diagnosticos = array();

        // Iterar sobre los resultados y almacenar cada diagnóstico con su descripción en el array
        while ($row = $result->fetch_assoc()) {
            $diagnosticos[] = $row;
        }

        // Devolver el array de diagnósticos con descripciones
        return $diagnosticos;
    } else {
        // Devolver un array vacío si no se encontraron diagnósticos
        return array();
    }
}

?>