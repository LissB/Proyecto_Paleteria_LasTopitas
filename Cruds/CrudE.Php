<?php
include_once '../Cruds/Db.php';
$rs ="SELECT max(idVentas) as id from ventas"; $SQL=$MySQLiconn->query($rs);
if ($row = $SQL->fetch_array()) { $Ventas_idVentas = trim($row[0]); }

$ridE ="SELECT max(idEventos) as id from eventos"; $SQL=$MySQLiconn->query($ridE);
if ($row = $SQL->fetch_array()) { $idEventos = trim($row[0]); }

/* Codigo para Insertar Datos */
if(isset($_POST['guardar']))
{
  $fechaVenta = $MySQLiconn->real_escape_string($_POST['fechaEvento']); //fecha de venta es fecha de evento 
  $descuento = $MySQLiconn->real_escape_string($_POST['descuento']);
  $SQL = $MySQLiconn->query("INSERT INTO ventas(totalProductoVendido, fechaVenta, importeTotal,descuento) VALUES ('0', '$fechaVenta', '0','$descuento')");
  /* CREAR UN EVENTO*/
  $nombreEvento  = $MySQLiconn->real_escape_string($_POST['nombreEvento']);
  $nombreCliente = $MySQLiconn->real_escape_string($_POST['nombreCliente']);
  $telefonoCliente = $MySQLiconn->real_escape_string($_POST['telefonoCliente']);
  $correoCliente = $MySQLiconn->real_escape_string($_POST['correoCliente']);
  $direccionEvento = $MySQLiconn->real_escape_string($_POST['direccionEvento']);
  $fechaEvento = $MySQLiconn->real_escape_string($_POST['fechaEvento']);
  $SQL = $MySQLiconn->query("INSERT INTO eventos(nombreEvento,nombreCliente,telefonoCliente,correoCliente,direccionEvento,fechaEvento) VALUES ('$nombreEvento','$nombreCliente','$telefonoCliente','$correoCliente','$direccionEvento','$fechaEvento')");
  
  if(!$SQL)
  {
   echo $MySQLiconn->error;
  } 
  header("Location:../paginas/eventos.php");
}

/* Codigo para eliminar Datos */
if(isset($_GET['eliminar']))
{
 $SQL = $MySQLiconn->query("DELETE FROM eventos WHERE idEventos=".$idEventos);
 header("Location:../paginas/eventos.php");
}

/* Codigo para Editar Datos */
if(isset($_GET['editar']))
{
 $SQL = $MySQLiconn->query("SELECT eventos.idEventos, eventos.nombreEvento,eventos.nombreCliente,eventos.telefonoCliente,eventos.correoCliente,eventos.direccionEvento,eventos.fechaEvento, ventas.fechaVenta, ventas.idVentas, ventas.descuento FROM eventos,ventas WHERE idEventos=".$idEventos." AND idVentas=".$Ventas_idVentas);
 $getROW = $SQL->fetch_array();
}

/* Codigo para Actualizar Datos */
if(isset($_POST['actualizar']))
{
 $SQL = $MySQLiconn->query("UPDATE eventos SET nombreEvento='".$_POST['nombreEvento']."', nombreCliente='".$_POST['nombreCliente']."', telefonoCliente='".$_POST['telefonoCliente']."', correoCliente='".$_POST['correoCliente']."', direccionEvento='".$_POST['direccionEvento']."', fechaEvento='".$_POST['fechaEvento']."' WHERE eventos =".$idEventos);
 
 $SQL = $MySQLiconn->query("UPDATE ventas SET fechaVenta='".$_POST['fechaEvento']."', descuento='".$_POST['descuento']."' WHERE idVentas=".$Ventas_idVentas);

 header("Location:../paginas/eventos.php");
}
?>