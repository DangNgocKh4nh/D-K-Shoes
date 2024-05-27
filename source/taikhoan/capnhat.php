<?php
if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Fetch the current user's information
    $sql = "SELECT * FROM taikhoan WHERE MaTaiKhoan = '$id'";
    $query = mysqli_query($connection, $sql);
    $result = mysqli_fetch_array($query);
    
    // Ensure the current user is updating their own information
    if ($result['TenDangNhap'] == $_SESSION['username']) {
        if (isset($_POST['capnhatthongtin'])) {
            // Fetch and sanitize input values
            $HoTen = isset($_POST['HoTen']) ? $_POST['HoTen'] : '';
            $DiaChi = isset($_POST['DiaChi']) ? $_POST['DiaChi'] : '';
            $DienThoai = isset($_POST['DienThoai']) ? $_POST['DienThoai'] : '';
            $Email = isset($_POST['Email']) ? $_POST['Email'] : '';
            $NgaySinh = isset($_POST['NgaySinh']) ? $_POST['NgaySinh'] : '';
            
            // Check for password update
            if (!empty($_POST['password'])) {
                $password = $_POST['password'];
                $password_confirm = $_POST['password_confirm'];

                // Validate passwords
                if ($password !== $password_confirm) {
                    echo '<div class="list">Mật khẩu xác nhận không khớp. <a href="/D&KShoes/source/taikhoan/index.php?&id='.$id.'">Quay lại</a></div>';
                    exit;
                }
                
                // Update user information including password
                $sql = "UPDATE taikhoan
                        SET HoTen = '$HoTen',
                            DiaChi = '$DiaChi',
                            DienThoai = '$DienThoai',
                            Email = '$Email',
                            NgaySinh = '$NgaySinh',
                            MatKhau = '$password'
                        WHERE MaTaiKhoan = '$id'";
            } else {
                // Update user information without password
                $sql = "UPDATE taikhoan
                        SET HoTen = '$HoTen',
                            DiaChi = '$DiaChi',
                            DienThoai = '$DienThoai',
                            Email = '$Email',
                            NgaySinh = '$NgaySinh'
                        WHERE MaTaiKhoan = '$id'";
            }

            // Execute the update query
            if (mysqli_query($connection, $sql)) {
                echo '<div class="list">Cập nhật thông tin cá nhân thành công. <a href="/D&KShoes/source/taikhoan/index.php?&id='.$id.'">Quay lại</a></div>';
                exit;
            } else {
                echo '<div class="list">Đã có lỗi xảy ra. <a href="/D&KShoes/source/taikhoan/index.php?&id='.$id.'">Quay lại</a></div>';
                exit;
            }
        }

        // Display the update form
        echo '<div class="vien"><div class="center">';
        echo '<form action="../taikhoan/index.php?mod=capnhat&id='.$id.'" method="POST">';
        echo '<p><input id="HoTen" type="text" size="50" name="HoTen" value="'.$result['HoTen'].'"/></p>';
        echo '<p><input id="DiaChi" type="text" size="50" name="DiaChi" value="'.$result['DiaChi'].'"/></p>';
        echo '<p><input id="DienThoai" type="number" size="50" name="DienThoai" value="'.$result['DienThoai'].'"/></p>';
        echo '<p><input id="Email" type="email" size="50" name="Email" value="'.$result['Email'].'"/></p>';
        echo '<p><input id="NgaySinh" type="date" size="50" name="NgaySinh" value="'.$result['NgaySinh'].'"/></p>';
        echo '<p><input id="password" type="password" size="50" name="password" placeholder="Nhập mật khẩu mới (nếu muốn thay đổi)"/></p>';
        echo '<p><input id="password_confirm" type="password" size="50" name="password_confirm" placeholder="Xác nhận mật khẩu mới"/></p>';
        echo '<p><input type="submit" name="capnhatthongtin" value="Cập nhật" onclick=" return Check()" /></p>';
        echo '</form>';
        echo '</div></div>';

    } else {
        echo '<div class="list">Bạn chỉ có thể thay đổi thông tin cá nhân của mình thôi.</div>';
    }
}
?>
