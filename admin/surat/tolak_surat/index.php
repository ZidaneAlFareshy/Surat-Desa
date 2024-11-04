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
          <li class="active">
            <a href="#"><i class="fa fa-circle-notch"></i> Surat Tertolak
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
          <li>
            <a href="../../surat/surat_selesai/"><i class="fa fa-circle-notch"></i> Surat Selesai
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
    <h1>Surat Tertolak</h1>
    <ol class="breadcrumb">
      <li><a href="../../dashboard/"><i class="fa fa-tachometer-alt"></i> Dashboard</a></li>
      <li class="active">Surat Tertolak</li>
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
              <th><strong>Nomor Telepon</strong></th>
              <th><strong>Jenis Surat</strong></th>
              <th><strong>Status</strong></th>
              <th><strong>Alasan Penolakan</strong></th> <!-- Kolom baru -->
            </tr>
          </thead>
          <tbody>
            <?php
              include ('../../../config/koneksi.php');

              $no = 1;
              $surat_types = [
                  'surat_keterangan' => 'id_sk',
                  'surat_pengantar_kelakuan_baik' => 'id_spkb',
                  'surat_keterangan_domisili' => 'id_skd',
                  'surat_keterangan_tidak_mampu' => 'id_sktm',
                  'surat_keterangan_kehilangan' => 'id_skk',
                  'surat_keterangan_usaha' => 'id_sku',
                  'surat_lahir' => 'id_sl',
                  'surat_keterangan_wali_murid' => 'id_skwm',
                  'surat_mati' => 'id_sm',
              ];

              $subqueries = [];
              foreach ($surat_types as $table => $id_field) {
                  $subqueries[] = "
                      SELECT penduduk.nama, $table.$id_field AS id_sk, $table.no_surat, 
                          $table.nik, $table.jenis_surat, $table.whatsapp, 
                          $table.status_surat, $table.tanggal_surat, $table.alasan_tolak 
                      FROM penduduk 
                      LEFT JOIN $table ON $table.nik = penduduk.nik 
                      WHERE $table.status_surat='tertolak'
                  ";
              }

              $qTampil = mysqli_query($connect, implode(' UNION ', $subqueries));

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
              <td><a class="btn btn-danger btn-sm" href='#'><i class="fa fa-times"></i><b> <?php echo $row['status_surat']; ?></b></a></td>
              <td><?php echo $row['alasan_tolak']; ?></td> <!-- Tampilkan alasan penolakan -->
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