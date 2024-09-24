<?php 
include ('../part/akses.php');
include ('../part/header.php');

if (isset($_GET['pesan'])) {
  if ($_GET['pesan'] == "akun-berhasil-diverifikasi") {
      echo "<div class='alert alert-success'>Akun berhasil diverifikasi dan pesan telah dikirim ke WhatsApp pengguna.</div>";
  } else if ($_GET['pesan'] == "akun-berhasil-ditolak") {
      echo "<div class='alert alert-success'>Akun berhasil ditolak dan pesan telah dikirim ke WhatsApp pengguna.</div>";
  } else if ($_GET['pesan'] == "error-verifikasi-akun" || $_GET['pesan'] == "error-menghapus-akun") {
      echo "<div class='alert alert-danger'>Terjadi kesalahan saat memproses akun.</div>";
  }
}
?>

<aside class="main-sidebar">
  <section class="sidebar">
    <div class="user-panel">
      <div class="pull-left image">
        <?php  
          if(isset($_SESSION['lvl']) && ($_SESSION['lvl'] == 'Administrator')){
            echo '<img src="../../assets/img/ava-admin-female.png" class="img-circle" alt="User Image">';
          } else if(isset($_SESSION['lvl']) && ($_SESSION['lvl'] == 'Kepala Desa')){
            echo '<img src="../../assets/img/ava-kades.png" class="img-circle" alt="User Image">';
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
      <li>
        <a href="../dashboard/">
          <i class="fas fa-tachometer-alt"></i> <span>&nbsp;&nbsp;Dashboard</span>
        </a>
      </li>
      <li>
        <a href="../penduduk/"><i class="fa fa-users"></i> <span>Data Penduduk</span></a>
      </li>
      <li class="active">
        <a href="#"><i class="fa fa-check-circle"></i> <span>Verifikasi Akun</span></a>
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
          <li><a href="../surat/permintaan_surat/"><i class="fa fa-circle-notch"></i> Permintaan Surat</a></li>
          <li><a href="../surat/tolak_surat/"><i class="fa fa-circle-notch"></i> Surat Tertolak</a></li>
          <li><a href="../surat/surat_belum_selesai/"><i class="fa fa-circle-notch"></i> Surat Belum Selesai</a></li>
          <li><a href="../surat/surat_selesai/"><i class="fa fa-circle-notch"></i> Surat Selesai</a></li>
        </ul>
      </li>
      <?php 
        }
      ?>
      <li>
        <a href="../laporan/">
          <i class="fas fa-chart-line"></i> <span>&nbsp;&nbsp;Laporan</span>
        </a>
      </li>
    </ul>
  </section>
</aside>

<div class="content-wrapper">
  <section class="content-header">
    <h1>Verifikasi Akun</h1>
    <ol class="breadcrumb">
      <li><a href="../dashboard/"><i class="fa fa-tachometer-alt"></i> Dashboard</a></li>
      <li class="active">Verifikasi Akun</li>
    </ol>
  </section>
  
  <section class="content">      
    <div class="row">
      <div class="col-md-12">
        <br><br>
        <table class="table table-striped table-bordered table-responsive" id="data-table" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>No</th>
              <th>NIK</th>
              <th>No WhatsApp</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            <?php
              include ('../../config/koneksi.php');
              $qTampil = mysqli_query($connect, "SELECT * FROM login WHERE status_verifikasi = 0"); // Ambil user yang belum terverifikasi

              if (mysqli_num_rows($qTampil) > 0) {
                $no = 1;
                while ($row = mysqli_fetch_assoc($qTampil)) {
            ?>
                <tr>
                  <td><?php echo $no++; ?></td>
                  <td><?php echo $row['nik']; ?></td>
                  <td><?php echo $row['whatsapp']; ?></td>
                  <td>
                    <a class="btn btn-success btn-sm" href='halaman-konfirmasi.php?nik=<?php echo $row['nik']; ?>'>
                      Konfirmasi
                    </a>
                  </td>
                </tr>
            <?php
                }
              } else {
                // Jika tidak ada data
                echo '<tr><td colspan="4" class="text-center">No data available in table</td></tr>';
              }
            ?>
          </tbody>
        </table>
      </div>
    </div>
  </section>
</div>

<?php 
include ('../part/footer.php');
?>
