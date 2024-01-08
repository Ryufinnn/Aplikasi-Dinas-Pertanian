-- phpMyAdmin SQL Dump
-- version 3.1.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 10, 2017 at 11:56 PM
-- Server version: 5.1.35
-- PHP Version: 5.2.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pertanian`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `foto` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  `blokir` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `nama_lengkap`, `email`, `no_telp`, `foto`, `level`, `blokir`, `id_session`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'yundi@yahoo.com', '082170214495', '15me_yundi.jpg', 'admin', 'N', 'q173s8hs1jl04st35169ccl8o7');

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE IF NOT EXISTS `agenda` (
  `id_agenda` int(5) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(10) NOT NULL,
  `jenis_agenda` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `tema` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `isi_agenda` text COLLATE latin1_general_ci NOT NULL,
  `tempat` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `tgl_mulai` date NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_agenda`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=70 ;

--
-- Dumping data for table `agenda`
--

INSERT INTO `agenda` (`id_agenda`, `id_kategori`, `jenis_agenda`, `tema`, `isi_agenda`, `tempat`, `tgl_mulai`, `username`) VALUES
(65, 0, 'Umum', 'Rapat Pelaksanaan izin usaha mikro kecil di Kota Payakumbuh', 'Membahas izin usaha mikro kecil di Kota Payakumbuh\r\n', 'Balaikota Payakumbuh', '2016-11-29', 'admin'),
(68, 21, 'Khusus', 'Tes ', 'Mantap\r\n', 'Padang', '2017-01-10', 'admin'),
(69, 21, 'Khusus', 'Agenda Rapat Tahunan', 'Membahas Rapat\r\n', 'Balaikota Payakumbuh', '2017-01-20', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE IF NOT EXISTS `berita` (
  `id_berita` int(5) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(5) NOT NULL,
  `username` varchar(30) COLLATE latin1_general_ci NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `judul_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `headline` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N',
  `utama` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `isi_berita` text COLLATE latin1_general_ci NOT NULL,
  `hari` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `dibaca` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_berita`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=662 ;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id_berita`, `id_kategori`, `username`, `judul`, `judul_seo`, `headline`, `aktif`, `utama`, `isi_berita`, `hari`, `tanggal`, `jam`, `gambar`, `dibaca`) VALUES
(657, 46, 'admin', 'Walikota Riza Ajak Petani Wujudkan Target Nasional 42.000 Ton Padi', 'walikota-riza-ajak-petani-wujudkan-target-nasional-42000-ton-padi', 'Y', 'Y', 'Y', 'Target nasional untuk Kota Payakumbuh, sebesar&nbsp; 42.000 ton padi pada 2017, menjadi perhatian serius Walikota H. Riza Falepi. Di depan lebih kurang 250 anggota kelompok tani, kelompok wanita tani, gabungan kelompok tani, pengelola sub terminal agribisnis (STA), Walikota Riza Falepi, mengajak, para pelaku pertanian itu untuk menyukseskan target nasional dimaksud.<br />\r\n&ldquo;Saya berharap, target nasional terhadap peningkatan ketahanan pangan itu harus mampu kita wujudkan. Mudah-mudah pada 2017 nanti, target nasional 42.000 ton padi selama setahun itu, dapat kita wujudkan,&rdquo; imbau Walikota Riza Falepi,&nbsp; dalam acara temu ramah dengan para pelaku pertanian tersebut, di Balairung rumah dinas kediaman walikota di Jalan Rky. Rasuna Said Payakumbuh, Jumat (16/9) malam.<br />\r\nTemu ramah atau silaturahmi dengan pelaku pertanian itu juga dihadiri Sekdako Payakumbuh H. Benni Warlis, Kepala Dinas Tanaman Pangan Perkebunan dan Kehutanan yang diwakili Sekretaris Ir. Syahril dan sejumlah pimpinan SKPD terkait lainnya. Walikota meminta jajaran Dinas Tanaman Pangan Payakumbuh, untuk menyikapi target nasional itu dengan sentuhan program pada tahun anggaran 2017, yang dapat mengkatrol&nbsp; produksi yang signifikan.<br />\r\nProduksi padi Payakumbuh sepanjang&nbsp; 2015, seperti dilaporkan Syahril, baru mencatat 35.967 ton. Angka tersebut, meningkat tajam 2.540 ton, jika dibanding&nbsp; tahun 2014 yang hanya berejumlah 33.427 ton. Peningkatan produksi di tahun berjalan ini, tambahnya, bakal melebih tahun sebelumnya, karena beberapa sampel yang dilakukan oleh beberapa keltan di lima kecamatan, produksinya cukup meningkat tajam. Mudah-mudahan, di akhir tahun 2016, produksi padi Payakumbuh bakal mencapai 38 ribu ton lebih, tegasnya.<br />\r\nDikatakan, produksi padi yang dicapai Payakumbuh, boleh dikatakan sudah surplus. Artinya, Payakumbuh sudah swasembada beras, jelas Syahril. Asumsinya, jika produksi padi yang sudah 35.967 ton, jika dijadikan beras, hasilnya menjadi 21.580 beras. Sementara, kebutuhan beras Payakumbuh dengan jumlah penduduk sekitar 125 ribu jiwa, dan kebutuhan beras penduduk hanya 114 Kg/kapita, berarti Payakumbuh haya butuh beras 14.250 ton selama setahun. Sedangkan, produksi sudah mencapai 21 ribu ton lebih, jelas Syahril.<br />\r\nNamun, Walikota H. Riza Falepi tak ingin&nbsp; produksi beras Payakumbuh sebatas di angka itu. Menurutnya, target nasional 42.000 ton padi di tahun 2017 harus dicapai, dalam rangka memastikan dan menyukseskan program pemerintah dibidang ketahanan pangan. Karena, kebutuhan padi bukan untuk warga kota saja, melainkan buat seluruh penduduk Indonesia dan dunia. &ldquo;Kota Payakumbuh harus berada dalam barisan daerah penghasil beras terbesar di Sumatera Barat, tegasnya.<br />\r\nDi bagian lain, Walikota Riza Falepi, juga mengajak petani yang bergerak pada tanaman holtikultura untuk meningkatkan produksi. Hasil produksi sayuran Payakumbuh baru memenuhi 60% permintaan pasar. Sementara, kebutuhan 40% lagi, disuplay oleh daerah tetangga. Walikota meminta, agar seluruh jajaran pertanian melakukan pembinaan yang intensif, agar permintaan pasar 40% lagi, termasuk untuk kebutruhan daerah Riau dan Kepri, dapat disuplay oleh petani Payakumbuh. Soal fasilitas pertanian, pemko bersama DPRD, serta pemprov dan pemerintah pusat, siap memberikan kebutuhan petani, simpulnya.<br />\r\n', 'Selasa', '2016-11-29', '21:58:14', '85Riza-Falepi-Timun.jpg', 3),
(658, 46, 'admin', 'Peringatan Hari Pahlawan Berlangsung Khidmat dan Lancar', 'peringatan-hari-pahlawan-berlangsung-khidmat-dan-lancar', 'Y', 'Y', 'Y', 'Peringatan Hari Pahlawan di Kota Payakumbuh berlangsung di lapangan&nbsp; Kubu Gadang, Kamis (10/11),&nbsp; dengan Inspektur Upacara Plt. Walikota Payakumbuh Priadi Syukur, sekaligus membacakan amanat tertulis Menteri Sosial RI Khofifah Indar Parawansa.<br />\r\nUpacara tersebut berjalan khidmat, tertib dan lancar yang ditandai dengan menaikan bendera merah putih. Diikuti ratusan pelajar, PNS, TNI/Polri dan OKP beserta.&nbsp; Wakil Ketua DPRD Suparman, Kapolresta Payakumbuh AKBP Kuswoto, bersama anggota Forkopimda lainnya. Kemudian juga hadir, sejumlah anggota DPRD, Sekdako Benni Warlis, Asisten, Staf Ahli Walikota, pimpinan SKPD, Camat, Lurah, kepsek dan para pejuang dan undangan lainnya.<br />\r\nMensos Khofifah Indar Parawansa mengatakan peringatan hari Pahlawn harus mampu menggali apinya, bukan abunya. Dengan meminjam ungkapan Bung Karno, semangat kepahlawanan itu adalah semangat rela berjuang, berjuang mati-matian dengan penuh idealisme dengan mengutamakan kepentingan umum&nbsp; diatas kepentingan pribadi.<br />\r\nLebih jauh dikatakannya tantangan dan persoalan yang kita hadapi saat ini memang berat. Akan tetapi, kita tidak boleh putus pengharapan. Para Pahlawan Kusuma Bangsa mengajarkan pada kita arti penting perjuangan,<br />\r\nketabahan dan harapan. Bahwa barang siapa yang ingin memiliki mutiara harus kuat menahan nafas, dan berani terjun menyelami samudera sedalam dalamnya, ujar Khofifiah.<br />\r\nMelalui momentum Peringatan Hari Pahlawan 10 November 2016 yang dilaksanakan dengan berbagai kegiatan, kita dapat mengambil makna yang terkandung didalamnya dengan meneladani nilai-nilai luhur yang diwarisi kepada kita semua seperti ; tagwa kepada Tuhan YME, pantang menyerah, jujur dan adil, percaya kepada kemampuan sendiri serta kerja keras untuk membangun Indonesia yang sejahtera sebagaimana cita-cita para Pahlawan Bangsa, pungkasnya.<br />\r\nSetelah membacakan amanat Mensos dimaksud, Plt.Walikota Priadi Syukur, mengajak seluruh Aparatur dan warga kota seyogianya memaknai momentum Hari Pahlawan ini untuk terus berjuang, berkarya mari bersatu bahu membahu mewujudkan payakumbuh yang maju dan sejahtera, ujar Priadi Syukur.<br />\r\nUsai upacara, Plt. Walikota bersama anggota Forkopimda dan pimpinan SKPD Ziarah dan Tabur bunga ke TMP Kusuma Bangsa Jalan Pahlawan,&nbsp; kemudian tabur bunga di Jembatan Ratapan Ibu di Jalan A.Yani serta Ziarah ke Taman Makam Pejuang 45 Koto Nan Gadang Payakumbuh Utara<br />\r\n', 'Selasa', '2016-11-29', '22:00:23', '19a.jpg', 3),
(659, 46, 'admin', 'Riza Falepi Panen Mentimun bersama Petani dan Temu Lapang Pengembangan Cluster Holtikultura', 'riza-falepi-panen-mentimun-bersama-petani-dan-temu-lapang-pengembangan-cluster-holtikultura', 'Y', 'Y', 'Y', 'Warta Payakumbuh- Walikota Payakumbuh Riza Falepi hadiri Kegiatan Temu Lapang Pengembangan cluster Holtikultura yang dilaksanakan di Pondok pertemuan Poktan Bina Bersama Kelurahan Koto Baru Kecamatan Payakumbuh Timur, Kamis (6/10) kemaren. Kegiatan tersebut merupakan tindak lanjut kerjasama Bank Indonesia Perwakilan Sumbar dengan Pemko Payakumbuh yang ditanda tangani 2015 lalu.<br />\r\nSelain Temu Lapang diwaktu bersamaan juga dilakukan Tanam Perdana Rintisan Pengembangan Komoditas Aren oleh Walikota bersama Kepala Perwakilan Bank Indonesia Sumbar Puji Atmoko, bertempat di Poktan tanjung Dama di Kelurahan Koto Panjang Dalam Kecamatan Lamposi Tigo Nagari (Latina).<br />\r\nTurut hadir Kepala Dinas Pertanian Tanaman Pangan Prop.Sumbar Nasrul, Kepala BPPT Sumbar Ismon, Kepala Dinas Tanaman Pangan Perkebunan dan Kehutanan Kota Payakumbuh Zulinda Kamal beserta jajarannya, sejumlah SKPD, Camat Payakumbuh Timur L.Kefrinasdi, Lurah Koto Baru Erfaniyulma, Ketua KAN Payobasung Dt.Tan Mamat Nan Kayo, Ketua Keltan Bina bersama dan Anggota serta undangan lainnya.<br />\r\nKadis Tanaman Pangan Perkebunan dan Kehutanan Zulinda Kamal mengucapkan terima kasih pada Bank Indonesia perwakilanan Sumbar dan Dinas Pertanian Tanaman Pangan Propinsi yang telah memberikan bantuannya buat peningkatan produksi yang pada gilirannya nanti dapat meningkatkan pendapatan dan kesejahteraan petani.<br />\r\nSementara itu Kepala Perwakilan Bank Indonesia Sumbar Puji Atmoko mengatakan Bank Indonesia yang merupakan sebagai Lembaga Negara bertugas mengelola keuangan Negara dengan menjaga kestabilan nilai rupiah terhadap harga barang dan mata uang, mengucapkan terima kasih pada pemko Payakumbuh beserta jajarannya yang telah ikut menjaga sektor pangan dan Bank Indonesia siap membantu memberikan kontribusinya untuk masyarakat daerah ini demi meningkatkan kesejahteraannya, ujar Puji.<br />\r\nWalikota Payakumbuh Riza Falepi dalam sambutannya menyebutkan pengembangan komoditi sayuran ini untuk Payakumbuh mempunyai prosfek cukup cerah karena didukung oleh sarana dan prasarana Kelembagaan Pemasaran (STA dan TA). Apalagi petani kita sudah terbiasa membudidayakan komoditas sayuran begitu juga pasarnya terjamin, ujar Riza<br />\r\nOleh karena itu Walikota mengucapkan terima kasih pada Bank Indonesia yang telah membantu program pengembangan Klaster Hortikultura yang merupakan langkah tepat dalam usaha meningkatkan produksi yang dapat meningkatkan pendapatan dan kesejahteraan petani.<br />\r\nDitambahkan Walikota disegi produksi saat ini sudah baik ,kedepan disegi manejerialnya perlu ditingkatkan yaitu disegi pengetahuan serta perbaikan struktur usaha petani, simpul Riza.<br />\r\nAcara tersebut ditandai dengan penyerahan bantuan alsintan berupa I unit hand tractor, Sarana dan prasarana peralatan pertanian senilai Rp.15 juta serta penyerahan pembayaran Klem Asuransi Usaha tani Bakung Jaya senilai Rp.35 juta, oleh Walikota Riza Falepi kepada Perwakilan Kelompok Tani Bina Bersama di saksikan Kepala perwakilan Bank Indonesia Puji Atmiko.<br />\r\n', 'Selasa', '2016-11-29', '22:02:05', '40b.jpg', 9);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE IF NOT EXISTS `gallery` (
  `id_gallery` int(5) NOT NULL AUTO_INCREMENT,
  `id_kategori` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `jdl_gallery` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `gallery_seo` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `keterangan` text COLLATE latin1_general_ci NOT NULL,
  `gbr_gallery` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_gallery`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=248 ;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id_gallery`, `id_kategori`, `username`, `jdl_gallery`, `gallery_seo`, `keterangan`, `gbr_gallery`) VALUES
(243, '0', 'admin', 'Mengajak Warga Bercocok Tanam', 'mengajak-warga-bercocok-tanam', 'Wali Kota Riza Memberikan Arahan Untuk Bercocok Tanam\r\n', '28Riza-Falepi-Timun.jpg'),
(242, '0', 'admin', 'Bercocok Tanam Bersama Warga', 'bercocok-tanam-bersama-warga', 'Walikota Riza Memberikan Arahan kepada Petani\r\n', '42Riza-Falepi-Timun.jpg'),
(241, '0', 'admin', 'Bercocok Tanam Bersama Warga', 'bercocok-tanam-bersama-warga', 'Walikota Riza ajak petani bercocok tanam\r\n', '143.-WALIKOTA-MENINJAU-CABE-DALAM-POLIBAG3.jpg'),
(247, '22', 'admin', 'jk', '', 'kkl\r\n', '78musium.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int(5) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id_kategori`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=56 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `aktif`) VALUES
(19, 'Teknologi', 'Y'),
(2, 'Olahraga', 'Y'),
(21, 'Ekonomi', 'N'),
(22, 'Politik', 'N'),
(23, 'Hiburan', 'Y'),
(31, 'Kesehatan ', 'Y'),
(34, 'Seni & Budaya', 'N'),
(44, 'Wisata', 'N'),
(46, 'Tes', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE IF NOT EXISTS `komentar` (
  `id_komentar` int(5) NOT NULL AUTO_INCREMENT,
  `id_berita` int(5) NOT NULL,
  `nama_komentar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `isi_komentar` text COLLATE latin1_general_ci NOT NULL,
  `tgl` date NOT NULL,
  `jam_komentar` time NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_komentar`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=145 ;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id_komentar`, `id_berita`, `nama_komentar`, `url`, `isi_komentar`, `tgl`, `jam_komentar`, `aktif`, `email`) VALUES
(142, 659, 'Jaka', 'jaka@gmail.com', ' Waw   ', '2016-12-14', '22:40:30', 'Y', ''),
(139, 659, 'Yundi', 'yundi@gmail.com', 'Mantap', '2016-12-09', '22:24:30', 'Y', '');

-- --------------------------------------------------------

--
-- Table structure for table `lakip`
--

CREATE TABLE IF NOT EXISTS `lakip` (
  `id_lakip` int(10) NOT NULL AUTO_INCREMENT,
  `indikator_kinerja` varchar(100) NOT NULL,
  `capaian_sblm` varchar(10) NOT NULL,
  `target` varchar(10) NOT NULL,
  `realisasi` varchar(10) NOT NULL,
  `nilai` varchar(10) NOT NULL,
  `kategori` varchar(10) NOT NULL,
  `target_akhir` varchar(10) NOT NULL,
  `capaian_akhir` varchar(10) NOT NULL,
  PRIMARY KEY (`id_lakip`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `lakip`
--

INSERT INTO `lakip` (`id_lakip`, `indikator_kinerja`, `capaian_sblm`, `target`, `realisasi`, `nilai`, `kategori`, `target_akhir`, `capaian_akhir`) VALUES
(1, 'Jumlah Produksi Padi', '33424', '34000', '35948', '105,73', '', '35000', '102,71');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE IF NOT EXISTS `pegawai` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nohp` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`username`, `password`, `nama_lengkap`, `level`, `email`, `nohp`, `alamat`) VALUES
('pegawai', 'pegawai', 'pegawai', 'pegawai', 'pegawai@gmail.com', '082170214495', 'Padang'),
('yundi', '12345', 'Yundi', 'pegawai', 'yundi@gmail.com', '082170214488', 'Jl. Aru Indah no 21');

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE IF NOT EXISTS `pengumuman` (
  `id_pengumuman` int(5) NOT NULL AUTO_INCREMENT,
  `id_kategori` int(10) NOT NULL,
  `jenis_pengumuman` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `isi_pengumuman` text COLLATE latin1_general_ci NOT NULL,
  `file` text COLLATE latin1_general_ci NOT NULL,
  `tgl_posting` date NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_pengumuman`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=72 ;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`id_pengumuman`, `id_kategori`, `jenis_pengumuman`, `judul`, `isi_pengumuman`, `file`, `tgl_posting`, `username`) VALUES
(70, 0, 'Umum', 'Seleksi Terbuka Pengisian Jabatan Kepala Dinas Pertanian', 'Tentang pengumuman seleksi terbuka pengisian jabatan Kepala Dinas Pertanian\r\n', 'SELEKSI-TERBUKA-PENGISIAN-JABATAN-KEPALA-DINAS-PERTANIAN-KOTA-PAYAKUMBUH.pdf', '2016-12-14', 'admin'),
(71, 46, 'Khusus', 'Tes', 'Manta\r\n', 'Bab III OK.doc', '2017-01-10', 'admin');
