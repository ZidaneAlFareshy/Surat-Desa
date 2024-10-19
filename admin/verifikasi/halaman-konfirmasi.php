<?php 
  include ('../part/akses.php');
  include ('../part/header.php');
  include ('../../config/koneksi.php');

  $nik = $_GET['nik'];
  $sql = "SELECT * FROM login WHERE nik = ?";
  $stmt = $connect->prepare($sql);
  $stmt->bind_param("s", $nik);
  $stmt->execute();
  $result = $stmt->get_result();
  $data = $result->fetch_assoc();
?>

<style>
  .zoom {
    transition: transform .2s; /* Animasi untuk zoom */
    max-width: 300px; /* Lebar default gambar */
    cursor: pointer; /* Menunjukkan bahwa gambar bisa di-klik */
  }
  /* Style untuk modal gambar */
  #imageModal {
    display: none; 
    position: fixed; 
    z-index: 9999; 
    padding-top: 100px;
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%; 
    overflow: auto; 
    background-color: rgba(0,0,0,0.9); /* Latar belakang hitam dengan sedikit transparansi */
  }

  /* Gambar di dalam modal */
  #modalImage {
    margin: auto;
    display: block;
    max-width: 80%; /* Gambar maksimal 80% dari lebar layar */
    max-height: 80%; /* Gambar maksimal 80% dari tinggi layar */
  }

  /* Tombol untuk menutup modal */
  #closeModal {
    position: absolute;
    top: 20px;
    right: 35px;
    color: #fff;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
  }

  #closeModal:hover,
  #closeModal:focus {
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
  }
</style>
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
      <li><a href="../dashboard/"><i class="fas fa-tachometer-alt"></i> <span>&nbsp;&nbsp;Dashboard</span></a></li>
      <li><a href="../penduduk/"><i class="fa fa-users"></i><span>&nbsp;Data Penduduk</span></a></li>
      <li class="active"><a href="index.php"><i class="fa fa-check-circle"></i> <span>Verifikasi Akun</span></a></li>
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
      <li><a href="../laporan/"><i class="fas fa-chart-line"></i> <span>&nbsp;&nbsp;Laporan</span></a></li>
    </ul>
  </section>
</aside>

<div class="content-wrapper">
  <section class="content-header">
    <h1>&nbsp;</h1>
    <ol class="breadcrumb">
      <li><a href="../dashboard/"><i class="fa fa-tachometer-alt"></i> Dashboard</a></li>
      <li class="active">Konfirmasi Akun</li>
    </ol>
  </section>
  
  <section class="content">      
    <div class="row">
      <div class="col-md-12">
        <div class="box box-default">
          <div class="box-header with-border">
            <h2 class="box-title"><i class="fas fa-check-circle"></i> Konfirmasi Akun</h2>
          </div>
          <div class="box-body">
            <form class="form-horizontal" method="POST" action="proses_konfirmasi.php">
              <div class="form-group">
                <label class="col-sm-2 control-label">NIK</label>
                <div class="col-sm-10">
                  <input type="text" name="nik" value="<?php echo $data['nik']; ?>" class="form-control" readonly>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">No WhatsApp</label>
                <div class="col-sm-10">
                  <input type="text" name="whatsapp" value="<?php echo $data['whatsapp']; ?>" class="form-control" readonly>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Gambar KTP</label>
                <div class="col-sm-10">
                  <img src="../../register/uploads/<?php echo $data['ktp']; ?>" alt="KTP" style="max-width: 300px;" class="zoom">
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Gambar KK</label>
                <div class="col-sm-10">
                  <img src="../../register/uploads/<?php echo $data['kk']; ?>" alt="KK" style="max-width: 300px;" class="zoom">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" formaction="proses_konfirmasi.php" class="btn btn-success">Konfirmasi</button>
                  <a href="proses_tolak.php?nik=<?php echo $data['nik']; ?>" class="btn btn-danger" onclick="return confirm('Apakah Anda yakin ingin menolak akun ini?')">Tolak</a>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<!-- Modal untuk menampilkan gambar -->
<div id="imageModal">
  <span id="closeModal">&times;</span>
  <img id="modalImage">
</div>


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- AdminLTE App (untuk treeview, dropdown, dll) -->
<script src="https://cdn.jsdelivr.net/npm/admin-lte@2.4.18/dist/js/adminlte.min.js"></script>
<script>
  $(document).ready(function(){
    // Ketika gambar KTP diklik
    $('.zoom').click(function(){
      var src = $(this).attr('src'); // Ambil sumber gambar
      $('#modalImage').attr('src', src); // Set modal gambar
      $('#imageModal').fadeIn(); // Tampilkan modal
    });

    // Tutup modal saat tombol X diklik
    $('#closeModal').click(function(){
      $('#imageModal').fadeOut(); // Sembunyikan modal
    });

    // Tutup modal jika area di luar gambar diklik
    $(window).click(function(event) {
      if (event.target.id === 'imageModal') {
        $('#imageModal').fadeOut(); // Sembunyikan modal
      }
    });
  });
</script>

<?php 
  include ('../part/footer.php');
?>
