<?php session_start();
  if (isset($_SESSION['usuario'])){?>
<?php
include_once '../Cruds/crudCM.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <!-- Site Metas -->
    <title>Paletería las Topitas</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
	<meta name="author" content="">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
	<!-- Site CSS -->
    <link rel="stylesheet" href="../css/style.css">
    <!-- Responsive CSS -->
	<link rel="stylesheet" href="../css/responsive.css">
</head>
<body>
<!-- Start header -->
<header class="top-navbar">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container">
        <a class="navbar-brand" href="../index.php"><img src="../images/logo.jpg" alt="" /></a>
        <div class="text-center ba">
          <h1 class="titPrin">Registro de Merma</h1>
        </div>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbars-rs-food">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="../index.php">Inicio</a></li>
            <li class="nav-item"><a class="nav-link" href="productoEm.php">Productos</a></li>
            <li class="nav-item"><a class="nav-link" href="compras.php">Compras</a></li>
            <li class="nav-item"><a class="nav-link" href="ventasEm.php">Ventas</a></li>
            <li class="nav-item"><a class="nav-link" href="eventos.php">Eventos</a></li>
            <li class="nav-item active"><a class="nav-link" href="controlMerma.php">Control Merma</a></li>
            <li class="nav-item"><a class="nav-link" href="../actualizarperfil.php">Actualizar Perfil</a></li>
            <li class="nav-item"><a class="nav-link" href="../Cerrar.php">Cerrar Sesión</a></li>
          </ul>
        </div>
      </div>
    </nav>
  </header>	<!-- End header --> <br></br><br></br><br></br>

<div class="container-fluid ">
 <form method="post">
    
    <div class="form-group obtds">
      <label class="control-label tamla" for="fechaMerma">Fecha:</label>
      <div class="col bg-info">
        <input type="text" class="form-control text-uppercase" name="fechaMerma" placeholder="0000-00-00" maxlength="10"
        value="<?php if(isset($_GET['editar'])) echo $getROW['fechaMerma'];  ?>" />
      </div>
    </div>
    
    <div class="form-group">
      <?php if(isset($_GET['editar']))
      {
      ?>
        <div class="col-12">
          <button type="submit" class="btn btncamf" name="actualizar">Actualizar</button>
        </div>
        <?php if(!empty($errores)):?>
                <div class="errror">
                    <ul>
                        <?php echo $errores; ?>
                    </ul>
          </div>
        <?php endif;?>
      <?php
      }
      else
      {
      ?>
        <div class="col-12">
          <button type="submit" class="btn btncamf" name="guardar">Guardar</button>
        </div>
        <?php if(!empty($errores)):?>
                <div class="errror">
                    <ul>
                        <?php echo $errores; ?>
                    </ul>
          </div>
        <?php endif;?>
      <?php
      }
      ?>
    </div>
    <div class="form-group">
      <div class="col-12"><li class="active estMe btns"><a href="controlMermaD.php">AGREGAR O ELIMINAR PRODUCTOS</a></li></div>
    </div>
  </form>
<?php
 include_once '../Cruds/Db.php';
 $rs ="SELECT max(idcontrolMerma) as id from controlmerma"; $SQL=$MySQLiconn->query($rs);
 if ($row = $SQL->fetch_array()) { $id = trim($row[0]); }
 $filtro="SELECT producto.nombre, detallecontrolmerma.motivoMerma,detallecontrolmerma.cantidadMerma, producto.costoCompra, detallecontrolmerma.subTotalMerma FROM producto, detallecontrolmerma, controlmerma WHERE controlmerma.idcontrolMerma= '$id' AND detallecontrolmerma.Producto_idProducto= producto.idProducto AND detallecontrolmerma.controlmerma_idcontrolMerma= controlmerma.idcontrolMerma";
 $SQL = $MySQLiconn->query($filtro); 

?>
 <h3 class="textoTa text-center">Listado de Productos perdidos</h3>
 <table class="table table-hover table-bordered shadow p-3 mb-5 bg-white rounded">
    <tr class="tabTit">
      <th>Nombre del producto</th>
      <th>Motivo de Merma</th>
      <th>Cantidad</th>
      <th>Costo unitario</th>
      <th>Subtotal</th>      
    </tr>
  <?php 
    while($row=$SQL->fetch_array())
    {
  ?>
    <tr class="tabCont">
      <td><?php echo $row['nombre']; ?></td>      
      <td><?php echo $row['motivoMerma']; ?></td>
      <td><?php echo $row['cantidadMerma']; ?></td>
      <td><?php echo $row['costoCompra']; ?></td>
      <td><?php echo $row['subTotalMerma']; ?></td>
    </tr>
  <?php
    }
  ?>
</table> 
<a href="?editar=<?php echo $row['idcontrolMerma'];?>" onclick="return confirm('¿Deseas Editarlo ?'); "><svg class="bi bi-pencil" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M11.293 1.293a1 1 0 011.414 0l2 2a1 1 0 010 1.414l-9 9a1 1 0 01-.39.242l-3 1a1 1 0 01-1.266-1.265l1-3a1 1 0 01.242-.391l9-9zM12 2l2 2-9 9-3 1 1-3 9-9z" clip-rule="evenodd"/><path fill-rule="evenodd" d="M12.146 6.354l-2.5-2.5.708-.708 2.5 2.5-.707.708zM3 10v.5a.5.5 0 00.5.5H4v.5a.5.5 0 00.5.5H5v.5a.5.5 0 00.5.5H6v-1.5a.5.5 0 00-.5-.5H5v-.5a.5.5 0 00-.5-.5H3z" clip-rule="evenodd"/></svg></a>
<a href="?eliminar=<?php echo $row['idcontrolMerma']; ?>" onclick="return confirm('¿Seguro deseas eliminarlo?'); "><svg class="bi bi-trash" width="2em" height="2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path d="M5.5 5.5A.5.5 0 016 6v6a.5.5 0 01-1 0V6a.5.5 0 01.5-.5zm2.5 0a.5.5 0 01.5.5v6a.5.5 0 01-1 0V6a.5.5 0 01.5-.5zm3 .5a.5.5 0 00-1 0v6a.5.5 0 001 0V6z"/><path fill-rule="evenodd" d="M14.5 3a1 1 0 01-1 1H13v9a2 2 0 01-2 2H5a2 2 0 01-2-2V4h-.5a1 1 0 01-1-1V2a1 1 0 011-1H6a1 1 0 011-1h2a1 1 0 011 1h3.5a1 1 0 011 1v1zM4.118 4L4 4.059V13a1 1 0 001 1h6a1 1 0 001-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" clip-rule="evenodd"/></svg></a><br>
<?php
  $datos="SELECT controlmerma.cTotalMerma, controlmerma.totalPerdida, producto.nombre, detallecontrolmerma.motivoMerma,detallecontrolmerma.cantidadMerma, producto.costoCompra, detallecontrolmerma.subTotalMerma FROM producto, detallecontrolmerma, controlmerma WHERE controlmerma.idcontrolMerma= '$id' AND detallecontrolmerma.Producto_idProducto= producto.idProducto AND detallecontrolmerma.controlmerma_idcontrolMerma= controlmerma.idcontrolMerma";
  $SQL = $MySQLiconn->query($datos); $Totalp=0; $TotalI=0;
  while($row=$SQL->fetch_array()){
    $Totalp = $Totalp + $row['cantidadMerma'];
    $TotalI = $TotalI + $row['subTotalMerma'];
  }
  $filtro="SELECT Producto_idProducto,controlmerma_idcontrolMerma,motivoMerma,cantidadMerma,subTotalMerma, fechaMerma,cTotalMerma,totalPerdida, producto.idProducto,producto.nombre,producto.costoCompra FROM detallecontrolmerma, controlmerma, producto WHERE controlmerma.idcontrolMerma= '$id' AND detallecontrolmerma.Producto_idProducto= producto.idProducto AND detallecontrolmerma.controlmerma_idcontrolMerma= controlmerma.idcontrolMerma";
  $SQL = $MySQLiconn->query($filtro); 
  if ($row = $SQL->fetch_array()) {
?>
  <label>Fecha: <?php echo $row['fechaMerma'];?></label><br>
  <label>Total Productos: <?php echo $Totalp;?></label><br>
  <label>Importe Total: <?php echo $TotalI;?></label><br>
  <?php
    $SQL = $MySQLiconn->query("UPDATE controlmerma SET cTotalMerma= '$Totalp',totalPerdida='".$TotalI."' WHERE idcontrolMerma='".$id."'");
  ?>
  
<?php
  } //fin if
?> </div><br><br>

<!-- Start Footer -->
<div class="copyright">
	<div class="container">
		<div class="row">
	  	<div class="col-lg-12">
				<p class="company-name">TODOS LOS DERECHOS RESERVADOS. &copy;MAYO 2020 <a href="#">Paleteria Las Topitas</a>
			</div>
		</div>
	</div>
</div>

<!-- ALL JS FILES -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<!-- ALL PLUGINS -->
<script src="js/custom.js"></script>
</body>
</html>
<?php  
  }else{
    header ('Location: ../login.php');
  }
?>
