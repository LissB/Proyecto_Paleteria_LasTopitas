<?php
include_once '../Cruds/Db.php';
$rs ="SELECT max(idcontrolMerma) as id from controlmerma"; $SQL=$MySQLiconn->query($rs);
if ($row = $SQL->fetch_array()) { $idcontrolMerma = trim($row[0]); }
  
/* Codigo para Insertar Datos */
if(isset($_POST['guardar']))
{
  $fechaMerma = $MySQLiconn->real_escape_string($_POST['fechaMerma']); //fecha de venta es fecha de evento 
  $SQL = $MySQLiconn->query("INSERT INTO controlmerma(fechaMerma,cTotalMerma,totalPerdida) VALUES ('$fechaMerma','0','0')");
  if(!$SQL)
  {
   echo $MySQLiconn->error;
  } 
  header("Location:../paginas/controlMerma.php");
}

/* Codigo para eliminar Datos */
if(isset($_GET['eliminar']))
{
 $SQL = $MySQLiconn->query("DELETE FROM controlmerma WHERE idcontrolMerma=".$idcontrolMerma);
 header("Location:../paginas/controlMerma.php");
}

/* Codigo para Editar Datos */
if(isset($_GET['editar']))
{
 $SQL = $MySQLiconn->query("SELECT fechaMerma FROM controlmerma WHERE idcontrolMerma=".$idcontrolMerma);
 $getROW = $SQL->fetch_array();
}

/* Codigo para Actualizar Datos */
if(isset($_POST['actualizar']))
{
 $SQL = $MySQLiconn->query("UPDATE controlmerma SET fechaMerma='".$_POST['fechaMerma']."' WHERE idcontrolMerma=".$idcontrolMerma);

 header("Location:../paginas/controlMerma.php");
}
?>