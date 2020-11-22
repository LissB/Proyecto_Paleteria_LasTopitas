<?php session_start();
  if (isset($_SESSION['usuario'])){
    require 'views/producto.view.php';
  }else{
    header ('Location: login.php');
  }
?>