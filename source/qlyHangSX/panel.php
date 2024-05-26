<div id="vien"><div class="center"><div id="ban">
<a id="ba" href="/D&KShoes/source/index.php">Trang chủ</a> > <a id="ba" href="/D&KShoes/source/adminpanel/">Admin Panel</a> > 
<font color="#008744">Quản lý thương hiệu</font></div></div></div>
<div class="list"><a href="/D&KShoes/source/qlyHangSX/index.php?mod=add"><button class="button">Thêm thương hiệu</button></a></div>
<?php
// 2. Tạo câu truy vấn (Query): SELECT, INSERT, DELETE, UPDATE
    $sql = "SELECT * FROM hangsanxuat";

    // 3. Thực thi câu truy vấn
    $result = mysqli_query($connection, $sql);

    // 4. Xử lý kết quả của câu truy vấn (SELECT)
    while($row = mysqli_fetch_array($result))
    {
        $id = $row['MaHangSanXuat'];
        $name = $row['TenHangSanXuat'];
        $xoa = $row['BiXoa'];
        if($row['BiXoa'] == 1) {
            echo'<div class="listdel">';
        } else {
            echo '<div class="list">';
        }
        echo''.$id.'. '.$name.'';
        echo '<div class="tool">
        <a href="/D&KShoes/source/qlyHangSX/index.php?mod=update&id='.$row['MaHangSanXuat'].'">
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
        echo '<a href="/D&KShoes/source/qlyHangSX/index.php?mod=restore&id='.$row['MaHangSanXuat'].'">
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
        echo '<a href="/D&KShoes/source/qlyHangSX/index.php?mod=del&id='.$row['MaHangSanXuat'].'">
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
