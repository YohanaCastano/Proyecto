<?php
// Inicia la sesión (asegúrate de que no haya salida HTML antes de esto)
session_start();

// Elimina todas las variables de sesión
session_unset();

// Destruye la sesión
session_destroy();

// Redirige al formulario de inicio de sesión
header('Location: formularioLogin.php');
exit;
?>