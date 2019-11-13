<?php
ob_start();

define("BASEPATH", dirname(__FILE__));
session_start();

include('./include/connection.php');
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>E-Voting | Perolehan</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="./assets/css/AdminLTE.min.css">
    <link rel="stylesheet" href="./assets/css/skins/_all-skins.min.css">
    <style>
        .box {
            padding: 30px;
        }

        img.kandidat {
            width: 250px;
            height: 230px;
        }

        .suara {
            position: absolute;
            right: 20px;
            bottom: 120px;
        }
    </style>
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <header class="main-header">

            <!-- Logo -->
            <a href="./" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>E</b>-V</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>E</b>-Voting</span>
            </a>

            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <!-- Navbar Right Menu -->
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="hidden-xs"><i class="fa fa-user"></i> Administrator</span> &nbsp;<i class="fa fa-caret-down"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li>
                                    <a href="?page=edit_profil">Edit Profil</a>
                                </li>
                                <li>
                                    <a href="?page=change_password">Ganti Password</a>
                                </li>
                                <li>
                                    <a data-toggle="modal" href="#myModal">Sign out</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>

        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu">
                    <li class="header">MAIN NAVIGATION</li>
                    <li <?php if (isset($_GET['page']) && $_GET['page'] == 'perolehan') {
                            echo 'class="active"';
                        } ?>>
                        <a href="?page=perolehan"><i class="fa fa-bar-chart"></i> <span>Perolehan</span></a>
                    </li>
                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Sign Out</h4>
                        </div>
                        <div class="modal-body">
                            Apakah anda yakin ingin keluar dari aplikasi ini?
                        </div>
                        <div class="modal-footer">
                            <a href="?page=logout" class="btn btn-danger">Sign Out</a>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            </nav>
            <!-- Main content -->
            <section class="content">

                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-success">
                            <?php
                            if (isset($_GET['page'])) {
                                switch ($_GET['page']) {
                                    case 'perolehan':
                                        include('./admin/perolehan.php');
                                        break;

                                    default:
                                        include('./welcome.php');
                                        break;
                                }
                            } else {
                                include('./welcome.php');
                            }
                            ?>
                        </div>
                        <!-- /.box -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 2.3.6
            </div>
            <strong>Copyright &copy; 2019 </strong>Powered by : <a href="#">APB Computer</a>
        </footer>

    </div>
    <!-- ./wrapper -->

    <!-- jQuery 2.2.3 -->
    <script src="./assets/js/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="./assets/js/app.min.js"></script>
    <?php if (isset($_GET['page']) && $_GET['page'] == 'perolehan') { ?>
        <script type="text/javascript" src="./assets/js/chart-bundle.js"></script>
        <script type="text/javascript" src="./assets/js/utils.js"></script>
        <script type="text/javascript" src="./assets/js/FileSaver.min.js"></script>
        <script type="text/javascript" src="./assets/js/canvas-toBlob.js"></script>
    <?php } ?>
    <script type="text/javascript">
        // slideToggle()
        $(document).ready(function() {
            $(".dropdown-toggle").click(function() {
                $(this).parent().find(".dropdown-menu").slideToggle();
            });
            $("#menu-toggle").click(function() {
                $(this).parent().find(".menu").slideToggle();
            });
        });

        $("#save-img").click(function() {
            $('#canvas').get(0).toBlob(function(blob) {
                saveAs(blob, 'chart.png');
            });
        });
        <?php
        if (isset($_GET['page']) && $_GET['page'] == 'kandidat') { ?>

            function tampil() {
                $.ajax({
                    url: 'ajax.php',
                    method: "GET",
                    success: function(data) {
                        $('#data').html(data);
                    }
                });
            }

            $(document).ready(function() {
                $('#periode').change(function() {
                    var periode = $('#periode').val();

                    $.ajax({
                        url: "ajax.php",
                        method: "POST",
                        data: {
                            periode: periode
                        },
                        success: function(data) {
                            $('#data').html(data);
                        }
                    });
                });
            });

            window.onload = function() {
                tampil();
            };
        <?php
        }
        ?>
        <?php
        if (isset($_GET['page']) && $_GET['page'] == 'perolehan') {
            $thn = date('Y');
            $dpn = date('Y') + 1;
            $periode = $thn . '/' . $dpn;
            $kan = $con->prepare("SELECT * FROM t_kandidat WHERE periode = ?") or die($con->error);
            $kan->bind_param('s', $periode);
            $kan->execute();
            $kan->store_result();
            $numb = $kan->num_rows();
            $label = '';
            $data = '';
            for ($i = 1; $i <= $numb; $i++) {
                $kan->bind_result($id, $nama, $foto, $visi, $misi, $suara, $kandidat);
                $kan->fetch();
                $label .= "'" . $nama . "',";
                $data .= $suara . ',';
            }
            $labels = trim($label, ',');
            $datas  = trim($data, ',');
            ?>
            var chartData = {
                labels: [
                    <?php
                        echo $labels;
                        ?>
                ],
                datasets: [{
                    type: 'bar',
                    label: 'Jumlah Suara',
                    borderColor: window.chartColors.green,
                    backgroundColor: [
                        window.chartColors.blue,
                        window.chartColors.red,
                        window.chartColors.green,
                    ],
                    borderWidth: 2,
                    fill: false,
                    data: [
                        <?php
                            echo $datas;
                            ?>
                    ]
                }],
            };
            window.onload = function() {
                var ctx = document.getElementById("canvas").getContext("2d");
                window.myMixedChart = new Chart(ctx, {
                    type: 'bar',
                    data: chartData,
                    options: {
                        responsive: true,
                        title: {
                            display: true,
                            text: 'Perolehan Suara',
                            fontSize: 30
                        },
                        legend: {
                            labels: {
                                fontSize: 20
                            }
                        },
                        scales: {
                            xAxes: [{
                                ticks: {
                                    fontSize: 15
                                }
                            }],
                            yAxes: [{
                                ticks: {
                                    fontSize: 14,
                                    min: 0
                                }
                            }]
                        }
                    }
                });
            };
        <?php
        }
        ?>
    </script>
</body>

</html>
<?php ob_flush(); ?>