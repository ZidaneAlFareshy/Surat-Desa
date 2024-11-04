<?php
include ('../part/akses.php');
include ('../part/header.php');
?>

<aside class="main-sidebar">
  <section class="sidebar">
    <div class="user-panel">
     <div class="pull-left image">
      <?php  
      if(isset($_SESSION['lvl']) && ($_SESSION['lvl'] == 'Administrator')){
        echo '<img src="../../assets/img/ava-admin-female.png" class="img-circle" alt="User Image">';
      }
      ?>
    </div>
    <div class="pull-left info">
      <p><?php echo $_SESSION['lvl']; ?></p>
      <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
    </div>
  </div>
  <ul class="sidebar-menu" data-widget="tree">
    <li class="header">MAIN NAVIGATION</li>
    <li class="active">
     <a href="#">
       <i class="fas fa-tachometer-alt"></i> <span>&nbsp;&nbsp;Dashboard</span>
     </a>
   </li>
   <li>
    <a href="../penduduk/">
      <i class="fa fa-users"></i> <span>Data Penduduk</span>
    </a>
  </li>
   <li>
    <a href="../verifikasi/">
      <i class="fa fa-check-circle"></i> <span>Verifikasi Akun</span>
    </a>
  </li>
  <?php
  if(isset($_SESSION['lvl']) && ($_SESSION['lvl'] == 'Administrator')){
    ?>
    <li class="treeview">
      <a href="#">
        <i class="fas fa-envelope-open-text"></i> <span>&nbsp;&nbsp;Surat</span>
        <span class="pull-right-container">
         <i class="fa fa-angle-left pull-right"></i>
       </span>
     </a>
     <ul class="treeview-menu">
       <li>
         <a href="../surat/permintaan_surat/"><i class="fa fa-circle-notch"></i> Permintaan Surat</a>
       </li>
       <li>
         <a href="../surat/tolak_surat/"><i class="fa fa-circle-notch"></i> Surat Tertolak</a>
       </li>
       <li>
        <a href="../surat/surat_dalam_proses/"><i class="fa fa-circle-notch"></i> Surat Dalam Proses</a>
       </li>
       <li>
        <a href="../surat/surat_dapat_diambil/"><i class="fa fa-circle-notch"></i> Surat Dapat Diambil</a>
       </li>
       <li>
         <a href="../surat/surat_selesai/"><i class="fa fa-circle-notch"></i> Surat Selesai</a>
       </li>
     </ul>
   </li>
   <?php 
 }else{
  
 }
 ?>
 <li>
  <a href="../laporan/"><i class="fas fa-chart-line"></i> <span>&nbsp;&nbsp;Laporan</span></a>
</li>
</ul>
</section>
</aside>
<div class="content-wrapper">
  <section class="content-header">
  	<h1>Dashboard</h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-tachometer-alt"></i> Dashboard</a></li>
    </ol>
  </section>
  <section class="content">
    <div class="row">
      <?php 
      if(isset($_SESSION['lvl']) && ($_SESSION['lvl'] == 'Administrator')){
        ?>
        <div class="col-lg-4 col-xs-6">
         <div class="small-box bg-aqua">
           <div class="inner">
            <h3>
              <?php
              include ('../../config/koneksi.php');

              $qTampil = mysqli_query($connect, "SELECT * FROM penduduk");
              $jumlahPenduduk = mysqli_num_rows($qTampil);
              echo $jumlahPenduduk;
              ?>
            </h3>
            <p>Data Penduduk</p>
          </div>
          <div class="icon">
            <i class="fas fa-users" style="font-size:70px"></i>
          </div>
          <a href="../penduduk/" class="small-box-footer">Lihat detail <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>
      <div class="col-lg-4 col-xs-6">
        <div class="small-box bg-primary">
          <div class="inner">
            <h3>
              <?php
              $qBelumVerifikasi = mysqli_query($connect, "SELECT id FROM login WHERE status_verifikasi = 0");
              $jumlahAkunBelumVerifikasi = mysqli_num_rows($qBelumVerifikasi);
              echo $jumlahAkunBelumVerifikasi;
              ?>
            </h3>
            <p>Akun Belum Diverifikasi</p>
          </div>
          <div class="icon">
            <i class="fas fa-user-clock" style="font-size:70px"></i>
          </div>
          <a href="../verifikasi/" class="small-box-footer">Lihat detail <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>
      <div class="col-lg-4 col-xs-6">
        <div class="small-box bg-green">
            <div class="inner">
                <h3>
                    <?php
                    $surat_tables = [
                        'surat_keterangan', 
                        'surat_pengantar_kelakuan_baik', 
                        'surat_keterangan_domisili', 
                        'surat_keterangan_tidak_mampu', 
                        'surat_keterangan_kehilangan', 
                        'surat_keterangan_usaha', 
                        'surat_lahir', 
                        'surat_mati', 
                        'surat_keterangan_wali_murid'
                    ];

                    $subqueries = [];
                    foreach ($surat_tables as $table) {
                        $subqueries[] = "SELECT tanggal_surat FROM $table WHERE status_surat='pending'";
                    }

                    $query = implode(' UNION ', $subqueries);
                    $qTampil = mysqli_query($connect, $query);
                    $jumlahPermintaanSurat = mysqli_num_rows($qTampil);
                    echo $jumlahPermintaanSurat;
                    ?>
                </h3>
                <p>Permintaan Surat</p>
            </div>
            <div class="icon">
                <i class="fas fa-envelope-open-text" style="font-size:70px"></i>
            </div>
            <a href="../surat/permintaan_surat/" class="small-box-footer">Lihat detail <i class="fa fa-arrow-circle-right"></i></a>
        </div>
    </div>
   <div class="col-lg-4 col-xs-6">
    <div class="small-box bg-red">
      <div class="inner">
       <h3>
       <?php
       $surat_tables = [
        'surat_keterangan', 
        'surat_pengantar_kelakuan_baik', 
        'surat_keterangan_domisili', 
        'surat_keterangan_tidak_mampu', 
        'surat_keterangan_kehilangan', 
        'surat_keterangan_usaha', 
        'surat_lahir', 
        'surat_mati', 
        'surat_keterangan_wali_murid'
      ];
      $subqueries = [];
      foreach ($surat_tables as $table) {
        $subqueries[] = "SELECT tanggal_surat FROM $table WHERE status_surat='tertolak'";
      }
      $query = implode(' UNION ', $subqueries);
      $qTampil = mysqli_query($connect, $query);
      $jumlahSuratTertolak = mysqli_num_rows($qTampil);
      echo $jumlahSuratTertolak;
      ?>
      </h3>
      <p>Surat Tertolak</p>
    </div>
    <div class="icon">
      <i class="fas fa-times-circle" style="font-size:70px"></i>
    </div>
   <a href="../surat/tolak_surat/" class="small-box-footer">Lihat detail <i class="fa fa-arrow-circle-right"></i></a>
 </div>
</div>
<div class="col-lg-4 col-xs-6">
  <div class="small-box bg-orange">
    <div class="inner">
      <h3>
        <?php
        $surat_tables = [
          'surat_keterangan', 
          'surat_pengantar_kelakuan_baik', 
          'surat_keterangan_domisili', 
          'surat_keterangan_tidak_mampu', 
          'surat_keterangan_kehilangan', 
          'surat_keterangan_usaha', 
          'surat_lahir', 
          'surat_mati', 
          'surat_keterangan_wali_murid'
        ];
        $subqueries = [];
        foreach ($surat_tables as $table) {
          $subqueries[] = "SELECT tanggal_surat FROM $table WHERE status_surat='dalam proses'";
        }
        $query = implode(' UNION ', $subqueries);
        $qTampil = mysqli_query($connect, $query);
        $jumlahSuratDalamProses = mysqli_num_rows($qTampil);
        echo $jumlahSuratDalamProses;
        ?>
      </h3>
      <p>Surat Dalam Proses</p>
    </div>
    <div class="icon">
      <i class="fas fa-hourglass-half" style="font-size:70px"></i>
    </div>
    <a href="../surat/surat_dalam_proses/" class="small-box-footer">Lihat detail <i class="fa fa-arrow-circle-right"></i></a>
  </div>
</div>
<div class="col-lg-4 col-xs-6">
  <div class="small-box bg-purple">
    <div class="inner">
      <h3>
        <?php
        $surat_tables = [
          'surat_keterangan', 
          'surat_pengantar_kelakuan_baik', 
          'surat_keterangan_domisili', 
          'surat_keterangan_tidak_mampu', 
          'surat_keterangan_kehilangan', 
          'surat_keterangan_usaha', 
          'surat_lahir', 
          'surat_mati', 
          'surat_keterangan_wali_murid'
        ];
        $subqueries = [];
        foreach ($surat_tables as $table) {
          $subqueries[] = "SELECT tanggal_surat FROM $table WHERE status_surat='dapat diambil'";
        }
        $query = implode(' UNION ', $subqueries);
        $qTampil = mysqli_query($connect, $query);
        $jumlahSuratDapatDiambil = mysqli_num_rows($qTampil);
        echo $jumlahSuratDapatDiambil;
        ?>
      </h3>
      <p>Surat Dapat Diambil</p>
    </div>
    <div class="icon">
      <i class="fas fa-check-circle" style="font-size:70px"></i>
    </div>
    <a href="../surat/surat_dapat_diambil/" class="small-box-footer">Lihat detail <i class="fa fa-arrow-circle-right"></i></a>
  </div>
</div>
<div class="col-lg-4 col-xs-6">
  <div class="small-box bg-yellow">
    <div class="inner">
      <h3>
      <?php
       $surat_tables = [
        'surat_keterangan', 
        'surat_pengantar_kelakuan_baik', 
        'surat_keterangan_domisili', 
        'surat_keterangan_tidak_mampu', 
        'surat_keterangan_kehilangan', 
        'surat_keterangan_usaha', 
        'surat_lahir', 
        'surat_mati', 
        'surat_keterangan_wali_murid'
      ];
      $subqueries = [];
      foreach ($surat_tables as $table) {
        $subqueries[] = "SELECT tanggal_surat FROM $table WHERE status_surat='selesai'";
      }
      $query = implode(' UNION ', $subqueries);
      $qTampil = mysqli_query($connect, $query);
      $jumlahSuratSelesai = mysqli_num_rows($qTampil);
      echo $jumlahSuratSelesai;
      ?>
      </h3>
      <p>Surat Selesai</p>
    </div>
    <div class="icon">
     <i class="fas fa-envelope" style="font-size:70px"></i>
    </div>
    <a href="../surat/surat_selesai/" class="small-box-footer">Lihat detail <i class="fa fa-arrow-circle-right"></i></a>
  </div>
</div>
<div class="col-lg-4 col-xs-6">
      <div class="small-box bg-blue">
        <div class="inner">
          <h3>
          <?php
          $surat_tables = [
            'surat_keterangan', 
            'surat_pengantar_kelakuan_baik', 
            'surat_keterangan_domisili', 
            'surat_keterangan_tidak_mampu', 
            'surat_keterangan_kehilangan', 
            'surat_keterangan_usaha', 
            'surat_lahir', 
            'surat_mati', 
            'surat_keterangan_wali_murid'
          ];
          $subqueries = [];
          foreach ($surat_tables as $table) {
            $subqueries[] = "SELECT tanggal_surat FROM $table WHERE status_surat='selesai'";
          }
          $query = implode(' UNION ', $subqueries);
          $qTampil = mysqli_query($connect, $query);
          $jumlahLaporanSurat = mysqli_num_rows($qTampil);
          echo $jumlahLaporanSurat;
          ?>
          </h3>
          <p>Laporan Surat Keluar</p>
        </div>
        <div class="icon">
          <i class="fas fa-file-alt" style="font-size:70px"></i>
        </div>
        <a href="../laporan/" class="small-box-footer">Lihat detail <i class="fa fa-arrow-circle-right"></i></a>
      </div>
    </div>
<?php 
} else if(isset($_SESSION['lvl']) && ($_SESSION['lvl'] == 'Kepala Desa')){
  ?>
  <div class="col-lg-1"></div>
  <div class="col-lg-5 col-xs-6">
    <div class="small-box bg-aqua">
      <div class="inner">
        <h3>
          <?php
          include ('../../config/koneksi.php');

          $qTampil = mysqli_query($connect, "SELECT * FROM penduduk");
          $jumlahPenduduk = mysqli_num_rows($qTampil);
          echo $jumlahPenduduk;
          ?>
        </h3>
        <p>Data Penduduk</p>
      </div>
      <div class="icon">
        <i class="fas fa-users" style="font-size:70px"></i>
      </div>
      <a href="../penduduk/" class="small-box-footer">Lihat detail <i class="fa fa-arrow-circle-right"></i></a>
    </div>
  </div>
  <div class="col-lg-5 col-xs-6">
    <div class="small-box bg-yellow">
      <div class="inner">
        <h3>
          <?php
          $qTampil = mysqli_query($connect, "SELECT tanggal_surat FROM surat_keterangan WHERE status_surat='selesai' 
            UNION SELECT tanggal_surat FROM surat_pengantar_kelakuan_baik WHERE status_surat='selesai' 
            UNION SELECT tanggal_surat FROM surat_keterangan_domisili WHERE status_surat='selesai'
            UNION SELECT tanggal_surat FROM surat_keterangan_tidak_mampu WHERE status_surat='selesai'
            UNION SELECT tanggal_surat FROM surat_keterangan_kehilangan WHERE status_surat='selesai'
            UNION SELECT tanggal_surat FROM surat_keterangan_usaha WHERE status_surat='selesai'
            UNION SELECT tanggal_surat FROM surat_lahir WHERE status_surat='selesai'
            UNION SELECT tanggal_surat FROM surat_keterangan_wali_murid WHERE status_surat='selesai'");
          $jumlahPermintaanSurat = mysqli_num_rows($qTampil);
          echo $jumlahPermintaanSurat;
          ?>
        </h3>
        <p>Laporan Surat Administrasi Desa - Surat Keluar</p>
      </div>
      <div class="icon">
        <i class="fas fa-envelope" style="font-size:70px"></i>
      </div>
      <a href="../laporan/" class="small-box-footer">Lihat detail <i class="fa fa-arrow-circle-right"></i></a>
    </div>
  </div>
  <div class="col-lg-1"></div>
  <?php  
}
?>
</div>
<div class="container-fluid">
 <div class="row">
  <div class="box box-default">
    <div class="box-header with-border">
     <h3 class="box-title">Welcome Home!</h3>
     <div class="box-tools pull-right">
      <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
      <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
    </div>
  </div>
  <div class="box-body">
   <div class="row">
     <form class="form-horizontal" method="post" action="simpan-penduduk.php">
      <div class="col-md-12">
        <div class="col-md-4" style="text-align: center;">
          <img style="max-width:300px; width:100%; height:auto;" src="../../assets/img/logo-cirebon.png"><br>
          <?php  
          $qTampilDesa = mysqli_query($connect, "SELECT * FROM profil_desa WHERE id_profil_desa = '1'");
          foreach($qTampilDesa as $row){
            ?>
            <p style="font-size: 20pt; font-weight: 500; text-transform: uppercase;"><strong>DESA <?php echo $row['nama_desa']; ?></strong><hr>
              <?php  
            }
            ?>
          </div>
          <div class="col-md-8">
            <div class="pull-right">
              <?php
              $tanggal = date('D d F Y');
              $hari = date('D', strtotime($tanggal));
              $bulan = date('F', strtotime($tanggal));
              $hariIndo = array(
                'Mon' => 'Senin',
                'Tue' => 'Selasa',
                'Wed' => 'Rabu',
                'Thu' => 'Kamis',
                'Fri' => 'Jumat',
                'Sat' => 'Sabtu',
                'Sun' => 'Minggu',
              );
              $bulanIndo = array(
                'January' => 'Januari',
                'February' => 'Februari',
                'March' => 'Maret',
                'April' => 'April',
                'May' => 'Mei',
                'June' => 'Juni',
                'July' => 'Juli',
                'August' => 'Agustus',
                'September' => 'September',
                'October' => 'Oktober',
                'November' => 'November',
                'December' => 'Desember'
              );
              echo $hariIndo[$hari] . ', ' . date('d ') . $bulanIndo[$bulan] . date(' Y');
              ?>
            </div><br>
            <div style="font-size: 35pt; font-weight: 500;"><p>Halo, <strong><?php echo $_SESSION['lvl']; ?></strong></div>
              <div style="font-size: 15pt; font-weight: 500;"><p>Selamat datang di <a href="#" style="text-decoration:none"><strong>Web Aplikasi Pelayanan Surat Keterangan Desa Online.</strong></a></p></div><br><br><br>
              <div style="font-size: 10pt; font-weight: 500;">© <b>Universitas Ahmad Dahlan</b>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
</div>
</section>
</div>

<?php 
include ('../part/footer.php');
?>