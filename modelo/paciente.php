<?php
require_once '../conexion/conexion.php';

function agregarPaciente($nombreYapellido, $benef, $cod_prof, $cod_practica, $cod_diag, $fecha)
{
    global $conn;

    // Verificar si el beneficio existe en la tabla padron
    $sql_check_beneficio = "SELECT COUNT(*) AS count FROM padron WHERE benef=$benef";
    $result_check_beneficio = $conn->query($sql_check_beneficio);
    $row_check_beneficio = $result_check_beneficio->fetch_assoc();
    $beneficio_existente = $row_check_beneficio['count'] > 0;

    // Si el beneficio existe, realizar la inserción del paciente
    if ($beneficio_existente) {
        $sql_insert_paciente = "INSERT INTO paciente (nombreYapellido, benef, cod_prof, cod_practica, fecha ,cod_diag) VALUES ('$nombreYapellido', '$benef', '$cod_prof', '$cod_practica', '$fecha' , '$cod_diag')";
        return $conn->query($sql_insert_paciente);
    } else {
        // Si el beneficio no existe, insertar los datos en la tabla padron y luego en la tabla paciente
        $sql_insert_padron = "INSERT INTO padron (benef, nombreYapellido) VALUES ('$benef', '$nombreYapellido')";
        $result_insert_padron = $conn->query($sql_insert_padron);

        if ($result_insert_padron) {
            // Después de insertar en padron, insertar en la tabla paciente
            $sql_insert_paciente = "INSERT INTO paciente (nombreYapellido, benef, cod_prof, cod_practica, fecha ,cod_diag) VALUES ('$nombreYapellido', '$benef', '$cod_prof', '$cod_practica', '$fecha' , '$cod_diag')";
            return $conn->query($sql_insert_paciente);
        } else {
            return false; // Si hay un error al insertar en padron, retornar false
        }
    }
}



function eliminarPaciente($cod_paci)
{
    global $conn;
    $sql = "DELETE FROM paciente WHERE cod_paci=$cod_paci";
    return $conn->query($sql);
}

function obtenerPacientes()
{
    global $conn;
    $sql = "SELECT * FROM paciente";
    $result = $conn->query($sql);
    $pacientes = array();
    while ($row = $result->fetch_assoc()) {
        $pacientes[] = $row;
    }
    return $pacientes;
}

function editarPaciente($cod_paci, $nombreYapellido, $benef, $cod_prof, $cod_practica, $cod_diag, $fecha)
{
    global $conn;

    // Verificar si el beneficio existe en la tabla padron
    $sql_check_beneficio = "SELECT COUNT(*) AS count FROM padron WHERE benef=$benef";
    $result_check_beneficio = $conn->query($sql_check_beneficio);
    $row_check_beneficio = $result_check_beneficio->fetch_assoc();
    $beneficio_existente = $row_check_beneficio['count'] > 0;

    // Si el beneficio existe, realizar la actualización del paciente
    if ($beneficio_existente) {
        $sql_update_paciente = "UPDATE paciente SET nombreYapellido='$nombreYapellido', benef='$benef', cod_prof='$cod_prof', cod_practica='$cod_practica', fecha='$fecha', cod_diag='$cod_diag' WHERE cod_paci=$cod_paci";
        return $conn->query($sql_update_paciente);
    } else {
        // Si el beneficio no existe, insertar los datos en la tabla padron y luego actualizar el paciente
        $sql_insert_padron = "INSERT INTO padron (benef, nombreYapellido) VALUES ('$benef', '$nombreYapellido')";
        $result_insert_padron = $conn->query($sql_insert_padron);

        if ($result_insert_padron) {
            // Después de insertar en padron, actualizar el paciente
            $sql_update_paciente = "UPDATE paciente SET nombreYapellido='$nombreYapellido', benef='$benef', cod_prof='$cod_prof', cod_practica='$cod_practica', fecha='$fecha', cod_diag='$cod_diag' WHERE cod_paci=$cod_paci";
            return $conn->query($sql_update_paciente);
        } else {
            return false; // Si hay un error al insertar en padron, retornar false
        }
    }
}


function obtenerPacientePorID($cod_paci)
{
    global $conn;
    $sql = "SELECT * FROM paciente WHERE cod_paci=$cod_paci";
    $result = $conn->query($sql);
    return $result->fetch_assoc();
}
?>