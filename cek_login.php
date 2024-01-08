<?php
error_reporting(0);
include "config/koneksi.php";
$pass=$_POST[pass];
$level=$_POST[level];
$username = $_POST[user];
if ($level=='admin')
{
$login=mysql_query("SELECT * FROM pegawai
			WHERE username='".mysql_real_escape_string($username)."' AND password='$pass'");
$cocok=mysql_num_rows($login);
$r=mysql_fetch_array($login);

if ($cocok > 0){
	session_start();
	
	$_SESSION[namauser]     = $r[username];
	$_SESSION[email]    	= $r[email];
  	$_SESSION[namalengkap]  = $r[nama_lengkap];
  	$_SESSION[passuser]     = $r[password];
  	$_SESSION[leveluser]    = $r[level];

	header('location:./');
	}
else {
echo "<script>window.alert('Username atau Password anda salah.');
				window.location='administrator.php'</script>";
	}
}

else if ($level=='pegawai'){
$login=mysql_query("SELECT * FROM pegawai
			WHERE username='".mysql_real_escape_string($username)."' AND password='$pass'");
$cocok=mysql_num_rows($login);
$r=mysql_fetch_array($login);

if ($cocok > 0){
	session_start();
	$_SESSION[user]     = $r[username];
	$_SESSION[passuser]     = $r[password];
  	$_SESSION[namalengkap]  = $r[nama_lengkap];
  	$_SESSION[leveluser]    = $r[level];

	header('location:http:media.php?module=home');
	}
else {
echo "<script>window.alert('Username atau Password anda salah.');
				window.location='login.html'</script>";
	}
}

else if ($level=='leader'){
$login=mysql_query("SELECT * FROM rb_login
			WHERE username='".mysql_real_escape_string($username)."' AND password='$pass'");
$cocok=mysql_num_rows($login);
$r=mysql_fetch_array($login);

if ($cocok > 0){
	session_start();
	$_SESSION[user]     = $r[username];
	$_SESSION[passuser]     = $r[password];
  	$_SESSION[namalengkap]  = $r[nama_lengkap];
  	$_SESSION[leveluser]    = $r[level];

	header('location:http:./');
	}
else {
echo "<script>window.alert('Username atau Password anda salah.');
				window.location='login.html'</script>";
	}
}


?>
