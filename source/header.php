<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php
    require("db.php");
    include("func.php");
    ?>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="/D&KShoes/source/giaodien/mystyle.css">
    <title>D&K Shoes</title>
    <script src="https://kit.fontawesome.com/6d2e813cd5.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <div class="header">
        <div class="topbar">
            <div class="center">
                <span>Mở cửa: 9h đến 20h, chủ nhật 10h đến 16h</span>
                <ul class="listtopbar">
                    <li><a href="/D&KShoes/source/dangnhap.php"><i style='font-size:12px' class='fas'>&#xf007;</i> 
                    <?php
                        if(isset($_SESSION['username']) && $_SESSION['username']) {
                            $username = $_SESSION['username'];
                            $sql = "SELECT * FROM taikhoan WHERE TenDangNhap='$username'";
                            $query = mysqli_query($connection, $sql);
                            $row = mysqli_fetch_array($query);
                            if ($row['Quyen'] == 1) {
                                echo '<font color="red">'.$username.'</font>';
                            } else {
                                echo $username;
                            }
                        } else {
                            ?> 
                            Tài khoản
                            <?php
                        }
                        ?>
                    </a>
                    <ul id="loginout">
                    <?php
                    if(isset($_SESSION['username']) && $_SESSION['username']) {
                        if ($row['Quyen'] == 1) {
                            echo'<li id="adm"><a href="/D&KShoes/source/adminpanel">Admin Panel</a></li>';
                        }    
                        echo'
                        <li id="login"><a href="/D&KShoes/source/taikhoan/index.php?&id='.$row['MaTaiKhoan'].'">Trang cá nhân</a></li>
                        <li id="reg"><a href="/D&KShoes/source/dangxuat.php">Đăng xuất</a></li>';
                    } else {
                        echo'<li id="login"><a href="/D&KShoes/source/dangnhap.php">Đăng nhập</a></li>
                        <li id="reg"><a href="/D&KShoes/source/dangky.php">Đăng ký</a></li>';
                    }
                        ?>
                    </ul>
                    </li>
                    <li><a href="/"><i style='font-size:12px' class='fas'></i>               </a></li>
                </ul>
            </div>
        </div> 
        <div class="cenbar">
            <div class="center">
                <a class="logo" href="/D&KShoes/source/"><img src="/D&KShoes/source/logo.png"></a>
                <div class="search">
                    <form action="/D&KShoes/source/timkiem.php" method="get"><input type="text" size="50" name="search" style="display: inline-block;">
                    <button type="submit" name="ok"><i class="fas fa-search"></i>Tìm kiếm</button>
                    </form>
                </div>
                <div class="lienlac">
                    <div id="phone">
                    <a href="/D&KShoes/source/giohang/index.php" style="text-decoration: none; color: #fff;">
                        <i class="fas fa-shopping-basket"></i>
                    </a>
                    </div>
                    <div id="number">
                    <?php
                        if(isset($_SESSION['cart'])) {
                            
                            echo'<a href="/D&KShoes/source/giohang/index.php" style="text-decoration: none;">
                            <span id="sdt">('.count($_SESSION['cart']).') sản phẩm</span></a><br/>';
                        } else { 
                            echo'<a href="/D&KShoes/source/giohang/index.php" style="text-decoration: none;">
                            <span id="sdt">(0) sản phẩm</span></a><br/>';
                        }
                    ?>
                        <a href="/D&KShoes/source/giohang/index.php" style="text-decoration: none;"><span id="dd"><font color="#ffdada">Giỏ hàng</font> </span>
                        </a>
                    </div> 
                </div> 
            </div>
        </div>
        <div class="thanhmenu">
            <div class="center">
                <ul class="menu">
                <li id="danhmucsp">
                    <i style='font-size:24px' class='fas'>&#xf0c9;</i> <b>Danh sách sản phẩm</b>
                    <ul class="dssp">
                        <?php
                        $loai = "SELECT * FROM loaisanpham WHERE BiXoa = 0";
                        $loaisp = mysqli_query($connection, $loai);
                        while($row = mysqli_fetch_array($loaisp)) {                           
                            $id = $row['MaLoaiSanPham'];
                            echo '<li id="n">
                            <a href="/D&KShoes/source//SanPham/index.php?mod=dssp&id='.$id.'">
                            <i class="far fa-star"></i>&nbsp;&nbsp;&nbsp;'.$row['TenLoaiSanPham'].'</a></li>';
                        }
                        ?>
                    </ul>
                </li>
                    <li id="m"><a href="/D&KShoes/source/">TRANG CHỦ</a></li>
                </ul>
            </div>
        </div>
