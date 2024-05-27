<?php
if (isset($_GET["id"])) {
    $id = $_GET["id"];

    // Kiểm tra kết nối cơ sở dữ liệu
    if (!$connection) {
        die("Kết nối cơ sở dữ liệu thất bại: " . mysqli_connect_error());
    }

    // Cập nhật sản phẩm
    if (isset($_POST['updatesp'])) {
        // Kiểm tra và gán giá trị các biến từ form
        $TenSanPham = isset($_POST['TenSanPham']) ? $_POST['TenSanPham'] : '';
        $GiaSanPham = isset($_POST['GiaSanPham']) ? $_POST['GiaSanPham'] : '';
        $NgayNhap = isset($_POST['NgayNhap']) ? $_POST['NgayNhap'] : '';
        $Soluong = isset($_POST['Soluong']) ? $_POST['Soluong'] : '';
        $BaoHanh = isset($_POST['BaoHanh']) ? $_POST['BaoHanh'] : '';
        $Mota = isset($_POST['Mota']) ? $_POST['Mota'] : '';
        $LoaiSanPham = isset($_POST['LoaiSanPham']) ? $_POST['LoaiSanPham'] : '';
        $HangSanXuat = isset($_POST['HangSX']) ? $_POST['HangSX'] : '';

        // Tạo truy vấn SQL
        $sql = "UPDATE sanpham
                SET TenSanPham = '$TenSanPham',
                    GiaSanPham = '$GiaSanPham',
                    NgayNhap = '$NgayNhap',
                    SoLuong = '$Soluong',
                    BaoHanh = '$BaoHanh',
                    MoTa = '$Mota',
                    MaLoaiSanPham = '$LoaiSanPham',
                    MaHangSanXuat = '$HangSanXuat'
                WHERE MaSanPham = '$id'";


        // Thực thi truy vấn và kiểm tra kết quả
        if (mysqli_query($connection, $sql)) {
            echo "<div class='list'>Cập nhật sản phẩm thành công. <a href='/D&KShoes/source/qlySanPham'>Quay lại</a></div>";
            exit;
        } else {
            echo "Lỗi cập nhật sản phẩm: " . mysqli_error($connection);
            exit;
        }
    }

    // Lấy thông tin sản phẩm hiện tại
    $sql = "SELECT * FROM sanpham WHERE MaSanPham='$id'";
    $query = mysqli_query($connection, $sql);
    $row = mysqli_fetch_array($query);
?>

<div id="vien">
    <div class="center">
        <div id="ban">
            <a id="ba" href="/D&KShoes/source/index.php">Trang chủ</a> > 
            <a id="ba" href="/">Admin Panel</a> > 
            <a id="ba" href="/D&KShoes/source/qlySanPham/index.php?mod=panel">Quản lý sản phẩm</a> > 
            <font color="#008744">Cập nhật sản phẩm</font>
        </div>
    </div>
</div>
<div class="list">
<?php
echo '<form action="?mod=update&id='.$id.'" method="POST">';
?>
    <table>
        <tr>
            <td>
                <p>Tên sản phẩm </p>
                <?php
                echo '<p><input id="TenSanPham" type="text" size="50" name="TenSanPham" value="'.$row['TenSanPham'].'"/></p>';
                ?>
                </td><td>
                <p>Giá sản phẩm </p>
                <?php
                echo '<p><input id="GiaSanPham" type="number" size="50" name="GiaSanPham" value="'.$row['GiaSanPham'].'" /></p>';
                ?>
                </td></tr><tr><td>
                <p>Ngày nhập hàng </p>
                <?php
                echo '<p><input id="NgayNhap" type="text" size="50" name="NgayNhap" value="'.$row['NgayNhap'].'"/></p>';
                ?>
                </td><td>
                <p>Số lượng hàng </p>
                <?php
                echo '<p><input id="Soluong" type="number" size="50" name="Soluong" value="'.$row['SoLuong'].'"/></p>';
                ?>
                </td></tr><tr><td>
                <p>Loại sản phẩm </p>
                    <p><select name="LoaiSanPham">
                        <?php
                        $loai = "SELECT * FROM loaisanpham WHERE BiXoa = 0";
                        $loaisp = mysqli_query($connection, $loai);
                        while ($row2 = mysqli_fetch_array($loaisp)) {
                            echo '<option value="'.$row2["MaLoaiSanPham"].'"'.($row2["MaLoaiSanPham"] == $row["MaLoaiSanPham"] ? ' selected' : '').'>'.$row2['TenLoaiSanPham'].'</option>';
                        }
                        ?>
                        </select></p>
                </td><td>
                <p>Bảo hành </p>
                <?php
                echo '<p><input id="BaoHanh" type="number" size="50" name="BaoHanh" value="'.$row['BaoHanh'].'"/></p>';
                ?>
            </td></tr></table>
            <p>Hãng sản xuất </p>
            <p><select name="HangSX">
                        <?php
                        $th = "SELECT * FROM hangsanxuat WHERE BiXoa = 0";
                        $thuonghieu = mysqli_query($connection, $th);
                        while ($row1 = mysqli_fetch_array($thuonghieu)) {
                            echo '<option value="'.$row1["MaHangSanXuat"].'"'.($row1["MaHangSanXuat"] == $row["MaHangSanXuat"] ? ' selected' : '').'>'.$row1['TenHangSanXuat'].'</option>';
                        }
                        ?>
                        </select></p>
            <p>Mô tả </p>
            <?php
            echo '<p><textarea name="Mota" id="Mota" rows="10" cols="50">'.$row['MoTa'].'</textarea></p>';
            ?>
          
            <p><input type='submit' name="updatesp" value='Cập nhật sản phẩm' onclick=" return Check()" />
            <a href='/D&KShoes/source/qlySanPham/index.php?mod=panel'>Quay lại</a></p>
    </form>
</div>
<?php
}
?>
