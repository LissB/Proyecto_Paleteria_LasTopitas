<?php
include_once 'Db.php';
/*$rs ="SELECT max(idcontrolMerma) as id from controlmerma"; $SQL=$MySQLiconn->query($rs);
if ($row = $SQL->fetch_array()) { $controlmerma_idcontrolMerma = trim($row[0]); }*/
 
/* Codigo para Insertar Datos */
if(isset($_POST['guardar']))
{
  echo "Guardandoooooooooooooooooooo";
  $Producto_idProducto = $MySQLiconn->real_escape_string($_POST['Producto_idProducto']);
  $motivoMerma = $MySQLiconn->real_escape_string($_POST['motivoMerma']);
  $cantidadMerma = $MySQLiconn->real_escape_string($_POST['cantidadMerma']);
  $costoP= "SELECT producto.costoCompra FROM producto WHERE producto.idProducto ='$Producto_idProducto'"; $SQL = $MySQLiconn->query($costoP);
  if ($row = $SQL->fetch_array()) {  $cp=$row['costoCompra'];  }
  $subTotalMerma = $cantidadMerma * $cp;  
  
  $rs ="SELECT max(idcontrolMerma) as id from controlmerma"; $SQL=$MySQLiconn->query($rs); if ($row = $SQL->fetch_array()) { $controlmerma_idcontrolMerma = trim($row[0]); }
  $SQL = $MySQLiconn->query("INSERT INTO detallecontrolmerma(Producto_idProducto,controlmerma_idcontrolMerma,motivoMerma,cantidadMerma,subTotalMerma) VALUES ('$Producto_idProducto','$controlmerma_idcontrolMerma','$motivoMerma','$cantidadMerma','$subTotalMerma')");
  if(!$SQL){
   echo $MySQLiconn->error;
  } 
  header("Location:../paginas/controlMerma.php");
}

/* Codigo para eliminar Datos */
if(isset($_GET['eliminar']))
{
 $SQL = $MySQLiconn->query("DELETE FROM detallecontrolmerma WHERE Producto_idProducto=".$_GET['eliminar']);
 header("Location:../paginas/controlMerma.php");
}

/* Codigo para Editar Datos */
if(isset($_GET['editar']))
{
  $rs ="SELECT max(idcontrolMerma) as id from controlmerma"; $SQL=$MySQLiconn->query($rs);
  if ($row = $SQL->fetch_array()) { $controlmerma_idcontrolMerma = trim($row[0]); }
  $SQL = $MySQLiconn->query("SELECT * FROM detallecontrolmerma WHERE controlmerma_idcontrolMerma = '$controlmerma_idcontrolMerma' AND Producto_idProducto=".$_GET['editar']);
  $getROW = $SQL->fetch_array();
}

/* Codigo para Actualizar Datos */
if(isset($_POST['actualizar']))
{
  $costoP= "SELECT producto.costoCompra FROM producto WHERE producto.idProducto ='".$_POST['Producto_idProducto']."'";$SQL = $MySQLiconn->query($costoP);
  if ($row = $SQL->fetch_array()) { $cp=$row['costoCompra']; }
  $rs ="SELECT max(idcontrolMerma) as id from controlmerma"; $SQL=$MySQLiconn->query($rs);
  if ($row = $SQL->fetch_array()) { $controlmerma_idcontrolMerma = trim($row[0]); }
  $subTotalMerma = $_POST['cantidadMerma'] * $cp;  

  $SQL = $MySQLiconn->query("UPDATE detallecontrolmerma SET Producto_idProducto='".$_POST['Producto_idProducto']."', controlmerma_idcontrolMerma='".$controlmerma_idcontrolMerma."', motivoMerma='".$_POST['motivoMerma']."', cantidadMerma='".$_POST['cantidadMerma']."', subTotalMerma='".$subTotalMerma."' WHERE iddetallecontrolmerma = '$controlmerma_idcontrolMerma' AND Producto_idProducto=".$_GET['editar']);
  header("Location:../paginas/controlMerma.php");
}
?>