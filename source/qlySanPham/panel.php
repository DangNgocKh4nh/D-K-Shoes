<div id="vien"><div class="center"><div id="ban">
<a id="ba" href="/D&KShoes/source/index.php">Trang chủ</a> > <a id="ba" href="/D&KShoes/source/adminpanel/">Admin Panel</a> > 
<font color="#008744">Quản lý sản phẩm</font></div></div></div>
<div class="list"><a href="/D&KShoes/source/qlySanPham/index.php?mod=add"><button class="button">Thêm sản phẩm</button></a></div>
<?php
// 2. Tạo câu truy vấn (Query): SELECT, INSERT, DELETE, UPDATE
    $sql = "SELECT * FROM sanpham ORDER BY MaSanPham DESC";

    // 3. Thực thi câu truy vấn
    $result = mysqli_query($connection, $sql);

    // 4. Xử lý kết quả của câu truy vấn (SELECT)
    while($row = mysqli_fetch_array($result))
    {
        $mahsx = $row['MaHangSanXuat'];
        $malsp = $row['MaLoaiSanPham'];
        
        $sql1 = "SELECT * FROM hangsanxuat WHERE MaHangSanXuat = '$mahsx'";
        $hangsx = mysqli_query($connection, $sql1);
        $hsx = mysqli_fetch_array($hangsx);
        $sql2 = "SELECT * FROM loaisanpham WHERE MaLoaiSanPham = '$malsp'";
        $loaisp = mysqli_query($connection, $sql2);
        $lsp = mysqli_fetch_array($loaisp);
        if($row['BiXoa'] == 1) {
            echo'<div class="listdel">';
        } else {
            echo '<div class="list">';
        }
        echo ''.$row['MaSanPham'].'. '.$row['TenSanPham'].' <br/>Giá: ';
        echo number_format($row['GiaSanPham'], 0).'₫<br>';
        echo 'Số lượng hàng: '.$row['SoLuong'].' <br/>Ngày nhập: '.$row['NgayNhap'].'';
        echo '<br/>Thương hiệu: '.$hsx['TenHangSanXuat'].' <br/>Loại: '.$lsp['TenLoaiSanPham'].'';
        echo '<br/><img width="100" height="100" src="/D&KShoes/source/images/'.$row['HinhURL'].'"><br/>';
        echo '<div class="tool">
        <a href="/D&KShoes/source/qlySanPham/index.php?mod=update&id='.$row['MaSanPham'].'">
            <button style="
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                text-decoration: none;
                display: inline-block;
                margin: 5px;
            ">Update</button>
        </a>  ';

        if ($row['BiXoa'] == 1) {
        echo '<a href="/D&KShoes/source/qlySanPham/index.php?mod=restore&id='.$row['MaSanPham'].'">
            <button style="
                background-color: #28a745;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                text-decoration: none;
                display: inline-block;
                margin: 5px;
            ">Khôi phục</button>
          </a>';
        } else {
        echo '<a href="/D&KShoes/source/qlySanPham/index.php?mod=del&id='.$row['MaSanPham'].'">
            <button style="
                background-color: #dc3545;
                color: white;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                text-decoration: none;
                display: inline-block;
                margin: 5px;
            ">Xóa</button>
          </a>';
        }

        echo '</div></div>';
    }
?>
