
  <?php
  include_once('config_fb.php');
  ?>
  
   <div class='main-column-wrapper'>
   <div class='main-column-left'>
   <?php
	$detail=mysql_query("SELECT * FROM berita,admin,kategori    
                      WHERE admin.username=berita.username 
                      AND kategori.id_kategori=berita.id_kategori 
                      AND id_berita='$_GET[judul]'");
	$d   = mysql_fetch_array($detail);
	$tgl = tgl_indo($d[tanggal]);
	$baca = $d[dibaca]+1;
	echo "<div class='post post-style-1'>
	
   
    <div class='sub_judul2'>$d[sub_judul]</div>
	
	<h2 class='article-title'>$d[judul]</h2>
	
    <div class='info'> <span class='date'><b>$d[nama_lengkap]</b> <span class style=\"color:#EA1C1C;\">|</span> 
	 $d[hari], $tgl - $d[jam] WIB 
    <span class style=\"color:#EA1C1C;\">|</span> dibaca: $baca pembaca</span> 
	
  <div class='section'>  
   
  <div class='addthis_toolbox addthis_default_style'>
  <a class='addthis_button_preferred_1'></a>
  <a class='addthis_button_preferred_2'></a>
  <a class='addthis_button_preferred_3'></a>
  <a class='addthis_button_preferred_4'></a>
  <a class='addthis_button_compact'></a>
  <a class='addthis_counter addthis_bubble_style'></a>
  </div>
  <script type='text/javascript' src='http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4f8aab4674f1896a'></script>
  
  </div>

  </div>";
   
  if ($d[gambar]!=''){
  echo "<div class='image2'><img src='foto_berita/$d[gambar]' width=350  border=0 class='image' >
  <p class='ket_gambar'>$d[keterangan_gambar]</p></div>";}
  echo "<p>$d[isi_berita]</p>

  
  <div class='garis'></div><br/>";	 
  
  
			  
 
 
  $pisah_kata  = explode(",",$d[tag]);
  $jml_katakan = (integer)count($pisah_kata);

  $jml_kata = $jml_katakan-1; 
  $ambil_id = substr($d[id_berita],0,4);

  
  $cari = "SELECT * FROM berita WHERE (id_berita<'$ambil_id') and (id_berita!='$ambil_id') and (" ;
  for ($i=0; $i<=$jml_kata; $i++){
  $cari .= "tag LIKE '%$pisah_kata[$i]%'";
  if ($i < $jml_kata ){
  $cari .= " OR ";}}
  $cari .= ") ORDER BY id_berita DESC LIMIT 5";

  $hasil  = mysql_query($cari);
  while($h=mysql_fetch_array($hasil)){
  echo "<li><a href=media.php?module=detailberita&judul=$h[id_berita]>$h[judul]</a></li>";}      
  echo "</ul>";
  mysql_query("UPDATE berita SET dibaca=$d[dibaca]+1 WHERE id_berita='$_GET[judul]'");
  
  
  // FB Comment//////////////////////////////////////////////////////////////////////////
 
  //////////////////////////////////////////////////////////////////////////////////////////////
  
  $komentar = mysql_query("select count(komentar.id_komentar) as jml from komentar WHERE id_berita='$d[id_berita]' AND aktif='Y'");
  $k = mysql_fetch_array($komentar); 
  echo "<br/><div class='post-title2'><class style=\"color:#EA1C1C;font-size:14px\"><h5>
  <b>Komentar Via Website : <class style=\"color:#EA1C1C;\">$k[jml]</b></h5></div>";

  $p      = new Paging7;
  $batas  = 10;
  $posisi = $p->cariPosisi($batas);

  $sql = mysql_query("SELECT * FROM komentar WHERE id_berita='$d[id_berita]' AND aktif='Y' LIMIT $posisi,$batas");
  $jml = mysql_num_rows($sql);
 
  if ($jml > 0){
  while ($s = mysql_fetch_array($sql)){
  $tanggal = tgl_indo($s[tgl]);
  $grav_url = 'http://www.gravatar.com/avatar/' . md5( strtolower( trim( $s[url] ) ) ) . '?d=' . urlencode( $default ) . '&s=' .  
  $size;;
 
 
  if ($s[url]!=''){
  echo " <div class='komen'>
  <h5><a name=$s[id_komentar] id=$s[id_komentar]>
  <a href='mailto:$s[url]' target='_blank'><div class='sub_judul2'>$s[nama_komentar]</div></a></a></h5>";}
  else{
  echo "<div class='komen'><h5>$s[nama_komentar]</h5>";}

  echo "<span class='tanggal01'>$tanggal - $s[jam_komentar] WIB</span><div>";
  
  $isian=nl2br($s[isi_komentar]); 
  $isikan=sensor($isian); 
  echo autolink($isikan);
  
  echo "</div></div>";}

  $jmldata = mysql_num_rows(mysql_query("SELECT * FROM komentar WHERE id_berita='$d[id_berita]' AND aktif='Y'"));
  $jmlhalaman  = $p->jumlahHalaman($jmldata, $batas);
  $linkHalaman = $p->navHalaman($_GET['halkomentar'], $jmlhalaman);

   echo "<div class='pages'> $linkHalaman</div>";}
   

  echo "<br/><br/><div id='container'>
  
  <form name='form' action=simpankomentar.php method=POST onSubmit=\"return validasi(this)\">
  
  <input type=hidden name=id value=$d[id_berita]>			   
  
  <h3 class='tag_title'>Nama</h3>
  <input type='text' class='tag_form' name='nama_komentar'/>
			
  <h3 class='tag_title'>Email</h3>
  <input type='text' class='tag_form' name='url' />
			
  <h3 class='tag_title'>Komentar</h3>
  <textarea class='tag_form' name='isi_komentar'></textarea>
			
  <br/><img src='captcha.php'><br>
  Masukkan 6 kode diatas)<br><input type=text name='kode' size=6 maxlength=6 class='tag_form2'>

  </div>
		
  <input type='submit' name='submit' value='Kirim Komentar' class='tag_button'/>
  </form></div>";  
  
  echo "</div>";  
  ?>
 

  <div class="sidebar">
  
 <!------------- TABS BERITA -------------------->
  <div class="sidebar-item">
  <div class="latest-activity">
								
  <!-- TAB JUDUL -->
  <div class="tabs-1">
  <table><tr>
  
  <td><a href="#" class="tab-1 kernel_triple_btn active" id="kernel_triple_popular_btn_kernel_3">
  <span>Terpopuler</span></a></td>
  
  <td><a href="#" class="tab-1 tab-1-disabled kernel_triple_btn" id="kernel_triple_recent_btn_kernel_3">
  <span>Terkini</span></a></td>
  
  <td><a href="#" class="tab-1 tab-1-disabled kernel_triple_btn" id="kernel_triple_comments_btn_kernel_3">
  <span>Komentar</span></a></td>
  
  </tr></table>
  </div>
  <!-- AKHIR TAB JUDUL -->	
									
   <!-- BAGIAN POPULER -->								
 
  <div id="kernel_triple_popular_kernel_3">
  <div class="list">
  <?php    

  $sql=mysql_query("SELECT * FROM berita ORDER BY dibaca DESC LIMIT 5"); 
  
  while($p=mysql_fetch_array($sql)){
  
  echo "
  <div class='item'>
  <div class='image'>
  <a href=media.php?module=detailberita&judul=$p[id_berita]>
  <img src='foto_berita/small_$p[gambar]' width=60 height=50 border=0></a>
  </div>";
  
  echo "<div class='text'>
  <a href=media.php?module=detailberita&judul=$p[id_berita]><span class='judulberita1'>$p[judul]</span></a>
  <p><span class='tanggal01'><span> dibaca : $p[dibaca] pembaca</span></p></div>
  </div>";
  }
  ?>
  </div>
  </div>	
  <!-- AKHIR BAGIAN POPULER -->								
								

  <!-- BAGIAN TERKINI -->	
   <div id="kernel_triple_recent_kernel_3" style="display: none;">
  <div class="list">
  <?php    
  $terkini=mysql_query("SELECT * FROM berita ORDER BY id_berita DESC LIMIT 5");
  while($t=mysql_fetch_array($terkini)){
  $tgl = tgl_indo($t['tanggal']);
  $isi_berita = strip_tags($t['isi_berita']); 
  $isi = substr($isi_berita,0,150); 
  $isi = substr($isi_berita,0,strrpos($isi," ")); 
  
  echo "
  <div class='item'>
  <div class='image'>
  <a href=media.php?module=detailberita&judul=$t[id_berita]>
  <img src='foto_berita/small_$t[gambar]' width=60 height=50 border=0></a>
  </div>";
  
  echo "<div class='text'>
  <a href=media.php?module=detailberita&judul=$t[id_berita]><span class='judulberita1'>$t[judul]</span></a>
  <p><span class='tanggal01'><span> $t[hari], $tgl</span></p></div>
  </div>";
  }
  ?>
  </div>
  </div>	
  <!-- AKHIR BAGIAN TERKINI -->	

  <!-- BAGIAN KOMENTAR -->	
  <div id="kernel_triple_comments_kernel_3" style="display: none;">
  <div class="list">
  <?php    
  $komentar=mysql_query("SELECT * FROM berita,komentar 
  WHERE komentar.id_berita=berita.id_berita  
  ORDER BY id_komentar DESC LIMIT 6");
  while($k=mysql_fetch_array($komentar)){
  $isi_komentar = strip_tags($k['isi_komentar']); 
  $isi = substr($isi_komentar,0,100); 
  $isi = substr($isi_komentar,0,strrpos($isi," ")); 
  echo "
  <div class='item'>
  <div class='image'>
  </div>";
  echo "<div class='text2'>
  <span class='judulberita1'><a href='http://$k[url]' target='_blank'>$k[nama_komentar]</span></a>
  <p><class style=\"color:#EA1C1C;font-size:12px\">pada 
  <a href='media.php?module=detailberita&judul=$k[id_berita]#$k[id_komentar]' class='tooltip' title='$isi ...'><b>$k[judul]</b></a></div>
  </div>";}
  ?>
  </div>
  </div>	
  <!-- AKHIR BAGIAN KOMENTAR -->	
  </div>
  </div>	
  <!------------- AKHIR TABS BERITA -------------------->


  <!------------- AGENDA HARI INI  -------------------->
  <div class="sidebar-item">
  <div class="latest-news">
  <div class="sidebar-title"><b>AGENDA</b></div>
  <div class="list">
  
  <div id="test-widget" class="widget">
  <div class="nav">
  <span id="prev_test"></span>
  <span id="next_test"></span></div>
  <ul>
						  
  <?php    
  $agenda=mysql_query("SELECT * FROM agenda where jenis_agenda='Umum' ORDER BY rand() DESC LIMIT 6");
  while($a=mysql_fetch_array($agenda)){
  $tgl_mulai = tgl_indo($a[tgl_mulai]);
  
  $isi_agenda = strip_tags($a['isi_agenda']);
  $isi = substr($isi_agenda,0,150);
  $isi = substr($isi_agenda,0,strrpos($isi," ")); 
  
  echo "							  
  <li><p><span class='tanggal02'><span>$tgl_mulai </span></p>
  <a href='media.php?module=semuaagenda'><b>$a[tema]</b></a>
  <p>'$isi ...'</p>
  </li>";}
  ?>
  
  </ul></div></div>
  </div></div>
  
  <!------------- AKHIR AGENDA HARI INI  -------------------->
 
  <div class="sidebar-item">
  <div class="latest-news">
  <div class="sidebar-title"><b>PENGUMUMAN</b></div>
  <div class="list">
  
  <div id="test-widget" class="widget">
  <div class="nav">
  <span id="prev_test"></span>
  <span id="next_test"></span></div>
  <ul>
						
  
  <?php    
  $pengumuman=mysql_query("SELECT * FROM pengumuman where jenis_pengumuman='Umum' ORDER BY rand() DESC LIMIT 6");
  while($a=mysql_fetch_array($pengumuman)){
  $tgl_post = tgl_indo($a[tgl_post]);

  echo "							  
  <li><p><span class='tanggal02'><span>$tgl_post</span></p>
  <a href='media.php?module=pengumuman'><b>$a[judul]</b></a>
  
  </li>";}
  ?>
  
  </ul></div></div>
  </div></div>
  
  

  </div>
  <div class="clear">&nbsp;</div>
  </div>
  </div><br />