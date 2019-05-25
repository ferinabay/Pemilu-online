<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin_adminhmti'])==0)
	{	
header('location:index.php');
}
else{

if(isset($_REQUEST['del']))
	{
$delid=intval($_GET['del']);
$sql = "delete from calon_ketum WHERE nim=:delid";
$query = $dbh->prepare($sql);
$query -> bindParam(':delid',$delid, PDO::PARAM_STR);
$query -> execute();
$msg="Caketum record deleted successfully";
}


 ?>

<!doctype html>
<html lang="en" class="no-js">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="theme-color" content="#3e454c">
	
	<title>Pemilu Polinema | Admin Manage Calon Ketua Umum   </title>

	<!-- Font awesome -->
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<!-- Sandstone Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap Datatables -->
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
	<!-- Bootstrap social button library -->
	<link rel="stylesheet" href="css/bootstrap-social.css">
	<!-- Bootstrap select -->
	<link rel="stylesheet" href="css/bootstrap-select.css">
	<!-- Bootstrap file input -->
	<link rel="stylesheet" href="css/fileinput.min.css">
	<!-- Awesome Bootstrap checkbox -->
	<link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
	<!-- Admin Stye -->
	<link rel="stylesheet" href="css/style.css">
  <style>
		.errorWrap {
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #dd3d36;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
.succWrap{
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #5cb85c;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
		</style>

</head>

<body>
	<?php include('includes/header-adminorg.php');?>

	<div class="ts-main-content">
		<?php include('includes/leftbar-adminorg.php');?>
		<div class="content-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-md-12">

						<h2 class="page-title">Kelola Calon Ketua Umum</h2>

						<!-- Zero Configuration Table -->
						<div class="panel panel-default">
							<div class="panel-heading"> Detail Calon Ketua Umum</div>
							<div class="panel-body">
							<?php if($error){?><div class="errorWrap"><strong>ERROR</strong>:<?php echo htmlentities($error); ?> </div><?php } 
				else if($msg){?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php }?>
								<table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
									<thead>
										<tr>
										<th>#</th>
											<th>NIM</th>
											<th>Nama Calon</th>
                                            <th>Tempat Lahir</th>
                                            <th>Tanggal lahir</th>
                                            <th>Agama</th>
                                            <th>Visi</th>
                                            <th>Misi</th>
                                            <th>Event</th>
											<th>Action</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
										<th>#</th>
										    <th>NIM</th>
											<th>Nama Calon</th>
                                            <th>Tempat Lahir</th>
                                            <th>Tanggal lahir</th>
                                            <th>Agama</th>
                                            <th>Visi</th>
                                            <th>Misi</th>
                                            <th>Event</th>
											<th>Action</th>
										</tr>
										</tr>
									</tfoot>
									<tbody>

									<?php 
										$sql = "SELECT calon_ketum.nim, calon_ketum.nama_calon, calon_ketum.tmp_lhr, calon_ketum.tgl_lahir, calon_ketum.agama, calon_ketum.visi, calon_ketum.misi, tblevent.nama_event 
													from calon_ketum join tblevent 
													on tblevent.id_event = calon_ketum.id_event
													where calon_ketum.id_organisasi = 206";
										$query = $dbh -> prepare($sql);
										$query->execute();
										$results=$query->fetchAll(PDO::FETCH_OBJ);
										$cnt=1;
										if($query->rowCount() > 0)
										{
										foreach($results as $result)
										{				
									?>	
										<tr>
											<td><?php echo htmlentities($cnt);?></td>
											<td><?php echo htmlentities($result->nim);?></td>
											<td><?php echo htmlentities($result->nama_calon);?></td>
                                            <td><?php echo htmlentities($result->tmp_lhr);?></td>
                                            <td><?php echo htmlentities($result->tgl_lahir);?></td>
                                            <td><?php echo htmlentities($result->agama);?></td>
                                            <td><?php echo htmlentities($result->visi);?></td>
                                            <td><?php echo htmlentities($result->misi);?></td>
                                            <td><?php echo htmlentities($result->nama_event);?></td>
		<td><a href="edit-caketum.php?nim=<?php echo $result->nim;?>"><i class="fa fa-edit"></i></a>&nbsp;&nbsp;
<a href="manage-caketum.php?del=<?php echo $result->nim;?>" onclick="return confirm('Do you want to delete');"><i class="fa fa-close"></i></a></td>
										</tr>
										<?php $cnt=$cnt+1; }} ?>
										
									</tbody>
								</table>

						

							</div>
						</div>

					

					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Loading Scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	<script src="js/Chart.min.js"></script>
	<script src="js/fileinput.js"></script>
	<script src="js/chartData.js"></script>
	<script src="js/main.js"></script>
</body>
</html>
<?php } ?>