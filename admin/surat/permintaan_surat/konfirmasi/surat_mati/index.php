<?php 
  include ('../part/akses.php');
  include ('../../../../../config/koneksi.php');
  include ('../part/header.php');

  $id = $_GET['id'];
  $qCek = mysqli_query($connect,"SELECT penduduk.*, surat_mati.* FROM penduduk LEFT JOIN surat_mati ON surat_mati.nik = penduduk.nik WHERE surat_mati.id_sm='$id'");
  while($row = mysqli_fetch_array($qCek)){
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
            echo '<img src="../../../../../assets/img/ava-admin-female.png" class="img-circle" alt="User Image">';
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
        <a href="../../../../dashboard/">
          <i class="fas fa-tachometer-alt"></i> <span>&nbsp;&nbsp;Dashboard</span>
        </a>
      </li>
      <li>
        <a href="../../../../penduduk/">
          <i class="fa fa-users"></i><span>&nbsp;Data Penduduk</span>
        </a>
      </li>
      <li>
        <a href="../../../verifikasi/">
          <i class="fa fa-check-circle"></i> <span>Verifikasi Akun</span>
        </a>
      </li>
      <li class="active treeview">
        <a href="#">
          <i class="fas fa-envelope-open-text"></i> <span>&nbsp;&nbsp;Surat</span>
          <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
        </a>
        <ul class="treeview-menu">
          <li>
            <a href="../../../permintaan_surat/">
              <i class="fa fa-circle-notch"></i> Permintaan Surat
            </a>
          </li>
          <li>
            <a href="../../../tolak_surat/">
              <i class="fa fa-circle-notch"></i> Surat Tertolak
            </a>
          </li>
          <li>
            <a href="../../../surat_dalam_proses/"><i class="fa fa-circle-notch"></i> Surat Dalam Proses
            </a>
          </li>
          <li>
            <a href="../../../surat_dapat_diambil/"><i class="fa fa-circle-notch"></i> Surat Dapat Diambil
            </a>
          </li>
          <li>
            <a href="../../../surat_selesai/"><i class="fa fa-circle-notch"></i> Surat Selesai
            </a>
          </li>
        </ul>
      </li>
      <li>
        <a href="../../../../laporan/">
          <i class="fas fa-chart-line"></i> <span>&nbsp;&nbsp;Laporan</span>
        </a>
      </li>
    </ul>
  </section>
</aside>
<div class="content-wrapper">
  <section class="content-header">
    <h1>&nbsp;</h1>
    <ol class="breadcrumb">
      <li><a href="../../../../dashboard/"><i class="fa fa-tachometer-alt"></i> Dashboard</a></li>
      <li class="active">Permintaan Surat</li>
    </ol>
  </section>
  <section class="content">      
    <div class="row">
      <div class="col-md-12">
        <div class="box box-default">
          <div class="box-header with-border">
            <h2 class="box-title"><i class="fas fa-envelope"></i> Konfirmasi Surat Kematian</h2>
            <div class="box-tools pull-right">
              <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
            </div>
          </div>
          <div class="box-body">
            <form class="form-horizontal" method="post" action="update-konfirmasi.php">
              <div class="row">
                <div class="col-md-6">
                  <div class="box-body">
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Tanda Tangan</label>
                      <div class="col-sm-9">
                        <select name="ft_tangan" class="form-control" style="text-transform: uppercase;" required>
                          <option value="">-- Pilih Tanda Tangan --</option>
                          <?php
                            $selectedPejabat  = $row['jabatan'];
                            $qTampilPejabat   = "SELECT * FROM pejabat_desa";
                            $tampilPejabat  = mysqli_query($connect, $qTampilPejabat);
                            while($rows = mysqli_fetch_assoc($tampilPejabat) ){
                              if($rows['jabatan'] == $selectedPejabat){
                          ?>
                          <option value="<?php echo $rows['id_pejabat_desa']; ?>" selected="selected"><?php echo $rows['jabatan']; ?></option>
                          <?php
                              }else{
                          ?>
                          <option value="<?php echo $rows['id_pejabat_desa']; ?>"><?php echo $rows['jabatan'], " (", $rows['nama_pejabat_desa'], ")"; ?></option>

                          <?php 
                              } 
                            }
                          ?>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="box-body">
                    <div class="form-group">
                      <label class="col-sm-3 control-label">No. Surat</label>
                      <div class="col-sm-9">
                        <input type="text" name="fno_surat" value="<?php echo $row['no_surat']; ?>" class="form-control" placeholder="Masukkan No. Surat" required>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <h5 class="box-title pull-right" style="color: #696969;"><i class="fas fa-info-circle"></i> <b>Informasi Penduduk</b></h5>
              <br><hr style="border-bottom: 1px solid #DCDCDC;">
              <div class="row">
                <div class="col-md-6">
                  <div class="box-body">
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Nama Lengkap</label>
                      <div class="col-sm-9">
                        <input type="text" name="fnama" style="text-transform: uppercase;" value="<?php echo $row['nama']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <?php
                      $tgl_lhr = date($row['tgl_lahir']);
                      $tgl = date('d ', strtotime($tgl_lhr));
                      $bln = date('F', strtotime($tgl_lhr));
                      $thn = date(' Y', strtotime($tgl_lhr));
                      $blnIndo = array(
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
                    ?>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Tempat, Tgl Lahir</label>
                      <div class="col-sm-9">
                        <input type="text" name="ft_lahir" style="text-transform: capitalize;" value="<?php echo $row['tempat_lahir'] . ", " . $tgl . $blnIndo[$bln] . $thn; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Pekerjaan</label>
                      <div class="col-sm-9">
                        <input type="text" name="fpekerjaan" style="text-transform: capitalize;" value="<?php echo $row['pekerjaan']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Alamat</label>
                      <div class="col-sm-9">
                        <textarea rows="3" name="falamat" class="form-control" style="text-transform: capitalize;" readonly><?php echo $row['jalan'] . ", RT" . $row['rt'] . "/RW" . $row['rw'] . ", Dusun " . $row['dusun'] . ", Desa " . $row['desa'] . ", Kecamatan " . $row['kecamatan'] . ", " . $row['kota']; ?></textarea>
                      </div>
                    </div>
                    <div>
                      <input type="hidden" name="id" value="<?php echo $row['id_sm']; ?>" class="form-control">
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="box-body">
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Jenis Kelamin</label>
                      <div class="col-sm-9">
                        <input type="text" name="fj_kelamin" value="<?php echo $row['jenis_kelamin']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Agama</label>
                      <div class="col-sm-9">
                        <input type="text" name="fagama" style="text-transform: capitalize;" value="<?php echo $row['agama']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">NIK</label>
                      <div class="col-sm-9">
                        <input type="text" name="fnik" value="<?php echo $row['nik']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Kewarganegaraan</label>
                      <div class="col-sm-9">
                        <input type="text" name="fkewarganegaraan" style="text-transform: uppercase;" value="<?php echo $row['kewarganegaraan']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <br><br>
                  </div>
                </div>
              </div>
              <h5 class="box-title pull-right" style="color: #696969;"><i class="fas fa-info-circle"></i> <b>Informasi Persyaratan</b></h5>
              <br><hr style="border-bottom: 1px solid #DCDCDC;">
              <div class="row">
                <div class="col-md-6">
                  <div class="box-body">
                    <div class="form-group">
                      <label class="col-sm-3 control-label">KTP Orang Meningal</label>
                      <div class="col-sm-9">
                        <img src="../../../../../surat/surat_mati/uploads/<?php echo $row['ktp_meninggal']; ?>" alt="ktp_meninggal" style="max-width: 300px;" class="zoom">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">KK Orang Meninggal</label>
                      <div class="col-sm-9">
                        <img src="../../../../../surat/surat_mati/uploads/<?php echo $row['kk_meninggal']; ?>" alt="kk_meninggal" style="max-width: 300px;" class="zoom">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="box-body">
                  <div class="form-group">
                      <label class="col-sm-3 control-label">Surat Keterangan Kematian dari Dokter/Rumah Sakit/Kepolisian</label>
                      <div class="col-sm-9">
                        <img src="../../../../../surat/surat_mati/uploads/<?php echo $row['suket_kematian']; ?>" alt="suket_kematian" style="max-width: 300px;" class="zoom">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="box-body">
                  <div class="form-group">
                      <label class="col-sm-3 control-label">Surat Pengantar RT diketahui RW</label>
                      <div class="col-sm-9">
                        <img src="../../../../../surat/surat_mati/uploads/<?php echo $row['surat_pengantar']; ?>" alt="surat_pengantar" style="max-width: 300px;" class="zoom">
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <h5 class="box-title pull-right" style="color: #696969;"><i class="fas fa-info-circle"></i> <b>Informasi Meninggal</b></h5>
              <br><hr style="border-bottom: 1px solid #DCDCDC;">
              <div class="row">
                <div class="col-md-6">
                  <div class="box-body">
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Nama</label>
                      <div class="col-sm-9">
                        <input type="text" name="fnama_meninggal" style="text-transform: uppercase;" value="<?php echo $row['nama_meninggal']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">NIK</label>
                      <div class="col-sm-9">
                        <input type="number" name="fnama_ayah" style="text-transform: uppercase;" value="<?php echo $row['nik_meninggal']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Status Perkawinan</label>
                      <div class="col-sm-9">
                        <input type="text" name="fstatus_perkawinan_meninggal" style="text-transform: uppercase;" value="<?php echo $row['status_perkawinan_meninggal']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Pekerjaan</label>
                      <div class="col-sm-9">
                        <input type="text" name="fumur_ayah" style="text-transform: uppercase;" value="<?php echo $row['pekerjaan_meninggal']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Jenis Kelamin</label>
                      <div class="col-sm-9">
                        <input type="text" name="fjenis_kelamin_meninggal" style="text-transform: uppercase;" value="<?php echo $row['jenis_kelamin_meninggal']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Kewarganegaraan</label>
                      <div class="col-sm-9">
                        <input type="text" name="fkewarganegaraan_meninggal" style="text-transform: uppercase;" value="<?php echo $row['kewarganegaraan_meninggal']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Alamat</label>
                      <div class="col-sm-9">
                        <textarea rows="3" name="falamat_meninggal" class="form-control" style="text-transform: capitalize;" readonly><?php echo $row['alamat_meninggal']; ?></textarea>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="box-body">
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Sebab Meninggal</label>
                      <div class="col-sm-9">
                        <input type="text" name="fsebab_meninggal" style="text-transform: uppercase;" value="<?php echo $row['sebab_meninggal']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Hari Meninggal</label>
                      <div class="col-sm-9">
                        <input type="text" name="fhari_meninggal" style="text-transform: uppercase;" value="<?php echo $row['hari_meninggal']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Tanggal Meninggal</label>
                      <div class="col-sm-9">
                        <input type="text" name="ftanggal_meninggal" style="text-transform: uppercase;" value="<?php echo $row['tanggal_meninggal']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Hari Meninggal</label>
                      <div class="col-sm-9">
                        <input type="text" name="fhari_meninggal" style="text-transform: uppercase;" value="<?php echo $row['hari_meninggal']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Tempat Meninggal</label>
                      <div class="col-sm-9">
                        <input type="text" name="ftempat_meninggal" style="text-transform: uppercase;" value="<?php echo $row['tempat_meninggal']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label">Tempat Pemakaman</label>
                      <div class="col-sm-9">
                        <input type="text" name="ftempat_pemakaman" style="text-transform: uppercase;" value="<?php echo $row['tempat_pemakaman']; ?>" class="form-control" readonly>
                      </div>
                    </div>
                </div>
                <div class="col-md-6">
                  <div class="box-body pull-right">
                    <input type="submit" name="tolak" class="btn btn-danger" value="Tolak" onclick="return confirmReject()">
                  </div>
                  <div class="box-body pull-right">
                    <input type="submit" name="konfirmasi" class="btn btn-success" value="Konfirmasi">
                  </div>
                </div>
                <input type="hidden" id="reasonInput" name="alasan_tolak" value="">
              </div>
            </form>
          </div>
          <div class="box-footer">
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
    // Ketika gambar diklik
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

<script>
function confirmReject() {
    var reason = prompt("Masukkan alasan penolakan surat:");
    if (reason == null || reason == "") {
        return false; // Jika tidak ada alasan yang diisi, pembatalan aksi form
    } else {
        // Simpan alasan penolakan ke dalam input hidden
        document.getElementById('reasonInput').value = reason;
        return true; // Lanjutkan pengiriman form
    }
}
</script>

<?php
  }

  include ('../part/footer.php');
?>