<?php
session_start();
 if (empty($_SESSION['username']) AND empty($_SESSION['passuser'])){
  echo "<link href='style.css' rel='stylesheet' type='text/css'>
 <center>Untuk mengakses modul, Anda harus login <br>";
  echo "<a href=../../index.php><b>LOGIN</b></a></center>";
}
else{

include "../../../config/koneksi.php";
include "../../../config/fungsi_seo.php";
include "../../../config/library.php";
include "../../../config/fungsi_thumb.php";

$module=$_GET[module];
$act=$_GET[act];

// Hapus agenda
if ($module=='agenda' AND $act=='hapus'){
  
 
  
  mysql_query("DELETE FROM agenda WHERE id_agenda='$_GET[id]'");  
  
  header('location:../../media.php?module='.$module);
}

// Input agenda
elseif ($module=='agenda' AND $act=='input'){
   $mulai=$_POST[thn_mulai].'-'.$_POST[bln_mulai].'-'.$_POST[tgl_mulai];
  
  
  $tema_seo = seo_title($_POST['tema']);

  // Apabila ada gambar yang diupload
  
    
    mysql_query("INSERT INTO agenda(tema,id_kategori,jenis_agenda,
                                  
                                  isi_agenda,
                                  tempat,
                                  
                                  tgl_mulai,
                                   
                                  username) 
					                VALUES('$_POST[tema]','$_POST[kategori]','$_POST[jenis]',
					                       
                                 '$_POST[isi_agenda]',
                                 '$_POST[tempat]',
                                 
                                 '$mulai',
                                                                  '$_SESSION[namauser]')");
  header('location:../../media.php?module='.$module);
  
}

// Update agenda
elseif ($module=='agenda' AND $act=='update'){
  
  $mulai=$_POST[thn_mulai].'-'.$_POST[bln_mulai].'-'.$_POST[tgl_mulai];
 

  $tema_seo = seo_title($_POST['tema']);

  // Apabila gambar tidak diganti
  
  mysql_query("UPDATE agenda SET tema        = '$_POST[tema]',
                                 
                                 isi_agenda  = '$_POST[isi_agenda]',
                                 tgl_mulai   = '$mulai',
                                
                                 tempat      = '$_POST[tempat]' 
                                
                           WHERE id_agenda   = '$_POST[id]'");
  header('location:../../media.php?module='.$module);
 
  
}
}
?>
