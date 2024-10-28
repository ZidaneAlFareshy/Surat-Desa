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
            echo '<img src="../../../assets/img/ava-admin-female.png" class="img-circle" alt="User Image">';
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
        <a href="../../dashboard/">
          <i class="fas fa-tachometer-alt"></i> <span>&nbsp;&nbsp;Dashboard</span>
        </a>
      </li>
      <li>
        <a href="../../penduduk/">
          <i class="fa fa-users"></i> <span>Data Penduduk</span>
        </a>
      </li>
      <li>
        <a href="../../verifikasi/">
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
            <a href="../../surat/permintaan_surat/">
              <i class="fa fa-circle-notch"></i> Permintaan Surat
            </a>
          </li>
          <li>
            <a href="../../surat/tolak_surat/">
              <i class="fa fa-circle-notch"></i> Surat Tertolak
            </a>
          </li>
          <li>
            <a href="../../surat/surat_dalam_proses/">
              <i class="fa fa-circle-notch"></i> Surat Dalam Proses
            </a>
          </li>
          <li>
            <a href="../../surat/surat_dapat_diambil/">
              <i class="fa fa-circle-notch"></i> Surat Dapat Diambil
            </a>
          </li>
          <li class="active">
            <a href="#"><i class="fa fa-circle-notch"></i> Surat Selesai
            </a>
          </li>
        </ul>
      </li>
      <li>
        <a href="../../laporan/">
          <i class="fas fa-chart-line"></i> <span>&nbsp;&nbsp;Laporan</span>
        </a>
      </li>
    </ul>
  </section>
</aside>
<div class="content-wrapper">
  <section class="content-header">
    <h1>Surat Selesai</h1>
    <ol class="breadcrumb">
      <li><a href="../../dashboard/"><i class="fa fa-tachometer-alt"></i> Dashboard</a></li>
      <li class="active">Surat Selesai</li>
    </ol>
  </section>
  <section class="content">      
    <div class="row">
      <div class="col-md-12">
        <br><br>
        <table class="table table-striped table-bordered table-responsive" id="data-table" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th><strong>Tanggal</strong></th>
              <th><strong>No. Surat</strong></th>
              <th><strong>NIK</strong></th>
              <th><strong>Nama</strong></th>
              <th><strong>WhatsApp</strong></th>
              <th><strong>Jenis Surat</strong></th>
              <th><strong>Status</strong></th>
              <th><strong>Aksi</strong></th>
            </tr>
          </thead>
          <tbody>
            <?php
              include ('../../../config/koneksi.php');

              $no = 1;
              $qTampil = mysqli_query($connect, "
    SELECT penduduk.nama, surat_keterangan.id_sk, surat_keterangan.no_surat, surat_keterangan.nik, surat_keterangan.jenis_surat, surat_keterangan.whatsapp, surat_keterangan.status_surat, surat_keterangan.tanggal_surat 
    FROM penduduk 
    LEFT JOIN surat_keterangan ON surat_keterangan.nik = penduduk.nik
    LEFT JOIN login ON login.nik = penduduk.nik 
    WHERE surat_keterangan.status_surat='selesai' 

    UNION 

    SELECT penduduk.nama, surat_pengantar_kelakuan_baik.id_spkb AS id_sk, surat_pengantar_kelakuan_baik.no_surat, surat_pengantar_kelakuan_baik.nik, surat_pengantar_kelakuan_baik.jenis_surat, surat_pengantar_kelakuan_baik.whatsapp, surat_pengantar_kelakuan_baik.status_surat, surat_pengantar_kelakuan_baik.tanggal_surat 
    FROM penduduk 
    LEFT JOIN surat_pengantar_kelakuan_baik ON surat_pengantar_kelakuan_baik.nik = penduduk.nik
    LEFT JOIN login ON login.nik = penduduk.nik 
    WHERE surat_pengantar_kelakuan_baik.status_surat='selesai' 

    UNION 

    SELECT penduduk.nama, surat_keterangan_domisili.id_skd AS id_sk, surat_keterangan_domisili.no_surat, surat_keterangan_domisili.nik, surat_keterangan_domisili.jenis_surat, surat_keterangan_domisili.whatsapp, surat_keterangan_domisili.status_surat, surat_keterangan_domisili.tanggal_surat 
    FROM penduduk 
    LEFT JOIN surat_keterangan_domisili ON surat_keterangan_domisili.nik = penduduk.nik
    LEFT JOIN login ON login.nik = penduduk.nik 
    WHERE surat_keterangan_domisili.status_surat='selesai' 

    UNION 

    SELECT penduduk.nama, surat_keterangan_tidak_mampu.id_sktm AS id_sk, surat_keterangan_tidak_mampu.no_surat, surat_keterangan_tidak_mampu.nik, surat_keterangan_tidak_mampu.jenis_surat, surat_keterangan_tidak_mampu.whatsapp, surat_keterangan_tidak_mampu.status_surat, surat_keterangan_tidak_mampu.tanggal_surat 
    FROM penduduk 
    LEFT JOIN surat_keterangan_tidak_mampu ON surat_keterangan_tidak_mampu.nik = penduduk.nik
    LEFT JOIN login ON login.nik = penduduk.nik 
    WHERE surat_keterangan_tidak_mampu.status_surat='selesai'

    UNION 

    SELECT penduduk.nama, surat_keterangan_kehilangan.id_skk AS id_sk, surat_keterangan_kehilangan.no_surat, surat_keterangan_kehilangan.nik, surat_keterangan_kehilangan.jenis_surat, surat_keterangan_kehilangan.whatsapp, surat_keterangan_kehilangan.status_surat, surat_keterangan_kehilangan.tanggal_surat 
    FROM penduduk 
    LEFT JOIN surat_keterangan_kehilangan ON surat_keterangan_kehilangan.nik = penduduk.nik
    LEFT JOIN login ON login.nik = penduduk.nik 
    WHERE surat_keterangan_kehilangan.status_surat='selesai'

    UNION 

    SELECT penduduk.nama, surat_keterangan_usaha.id_sku AS id_sk, surat_keterangan_usaha.no_surat, surat_keterangan_usaha.nik, surat_keterangan_usaha.jenis_surat, surat_keterangan_usaha.whatsapp, surat_keterangan_usaha.status_surat, surat_keterangan_usaha.tanggal_surat 
    FROM penduduk 
    LEFT JOIN surat_keterangan_usaha ON surat_keterangan_usaha.nik = penduduk.nik
    LEFT JOIN login ON login.nik = penduduk.nik 
    WHERE surat_keterangan_usaha.status_surat='selesai'

    UNION 

    SELECT penduduk.nama, surat_lahir.id_sl AS id_sk, surat_lahir.no_surat, surat_lahir.nik, surat_lahir.jenis_surat, surat_lahir.whatsapp, surat_lahir.status_surat, surat_lahir.tanggal_surat 
    FROM penduduk 
    LEFT JOIN surat_lahir ON surat_lahir.nik = penduduk.nik 
    WHERE surat_lahir.status_surat='selesai' 

    UNION 

    SELECT penduduk.nama, surat_keterangan_wali_murid.id_skwm AS id_sk, surat_keterangan_wali_murid.no_surat, surat_keterangan_wali_murid.nik, surat_keterangan_wali_murid.jenis_surat, surat_keterangan_wali_murid.whatsapp, surat_keterangan_wali_murid.status_surat, surat_keterangan_wali_murid.tanggal_surat 
    FROM penduduk 
    LEFT JOIN surat_keterangan_wali_murid ON surat_keterangan_wali_murid.nik = penduduk.nik 
    WHERE surat_keterangan_wali_murid.status_surat='selesai'

    UNION 

    SELECT penduduk.nama, surat_mati.id_sm AS id_sk, surat_mati.no_surat, surat_mati.nik, surat_mati.jenis_surat, surat_mati.whatsapp, surat_mati.status_surat, surat_mati.tanggal_surat 
    FROM penduduk 
    LEFT JOIN surat_mati ON surat_mati.nik = penduduk.nik 
    WHERE surat_mati.status_surat='selesai' 
");

              foreach($qTampil as $row){
            ?>
            <tr>
              <?php
                $tgl_lhr = date($row['tanggal_surat']);
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
              <td><?php echo $tgl . $blnIndo[$bln] . $thn; ?></td>
              <td><?php echo $row['no_surat']; ?></td>
              <td><?php echo $row['nik']; ?></td>
              <td style="text-transform: capitalize;"><?php echo $row['nama']; ?></td>
              <td><?php echo $row['whatsapp']; ?></td>
              <td><?php echo $row['jenis_surat']; ?></td>
              <td><a class="btn btn-success btn-sm" href='#'><i class="fa fa-check"></i><b> <?php echo $row['status_surat']; ?></b></a></td>
              <td>
                <?php  
                  if($row['jenis_surat']=="Surat Keterangan KTP Sementara"){
                ?>
                <a name="cetak" target="output" class="btn btn-primary btn-sm" href='../cetak/surat_keterangan/index.php?id=<?php echo $row['id_sk']; ?>'><i class="fa fa-print"></i><b> CETAK</b></a>
                <?php
                  } else if($row['jenis_surat']=="Surat Pengantar Kelakuan Baik"){
                ?>
                <a name="cetak" target="output" class="btn btn-primary btn-sm" href='../cetak/surat_pengantar_kelakuan_baik/index.php?id=<?php echo $row['id_sk']; ?>'><i class="fa fa-print"></i><b> CETAK</b></a>
                <?php
                  } else if($row['jenis_surat']=="Surat Keterangan Domisili"){
                ?>
                <a name="cetak" target="output" class="btn btn-primary btn-sm" href='../cetak/surat_keterangan_domisili/index.php?id=<?php echo $row['id_sk']; ?>'><i class="fa fa-print"></i><b> CETAK</b></a>
                <?php
                  } else if($row['jenis_surat']=="Surat Keterangan Tidak Mampu"){
                ?>
                <a name="cetak" target="output" class="btn btn-primary btn-sm" href='../cetak/surat_keterangan_tidak_mampu/index.php?id=<?php echo $row['id_sk']; ?>'><i class="fa fa-print"></i><b> CETAK</b></a>
                <?php
                  } else if($row['jenis_surat']=="Surat Keterangan Kehilangan"){
                ?>
                <a name="cetak" target="output" class="btn btn-primary btn-sm" href='../cetak/surat_keterangan_kehilangan/index.php?id=<?php echo $row['id_sk']; ?>'><i class="fa fa-print"></i><b> CETAK</b></a>
                <?php
                  } else if($row['jenis_surat']=="Surat Keterangan Usaha"){
                ?>
                <a name="cetak" target="output" class="btn btn-primary btn-sm" href='../cetak/surat_keterangan_usaha/index.php?id=<?php echo $row['id_sk']; ?>'><i class="fa fa-print"></i><b> CETAK</b></a>
                <?php
                  } else if($row['jenis_surat']=="Surat Kelahiran"){
                ?>
                <a name="cetak" target="output" class="btn btn-primary btn-sm" href='../cetak/surat_lahir/index.php?id=<?php echo $row['id_sk']; ?>'><i class="fa fa-print"></i><b> CETAK</b></a>
                <?php
                  } else if($row['jenis_surat']=="Surat Kematian"){
                ?>
                <a name="cetak" target="output" class="btn btn-primary btn-sm" href='../cetak/surat_mati/index.php?id=<?php echo $row['id_sk']; ?>'><i class="fa fa-print"></i><b> CETAK</b></a>
                <?php
                  } else if($row['jenis_surat']=="Surat Keterangan Wali Murid"){
                ?>
                <a name="cetak" target="output" class="btn btn-primary btn-sm" href='../cetak/surat_keterangan_wali_murid/index.php?id=<?php echo $row['id_sk']; ?>'><i class="fa fa-print"></i><b> CETAK</b></a>
                <?php
                  }
                ?>
              </td>
            </tr>
            <?php
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