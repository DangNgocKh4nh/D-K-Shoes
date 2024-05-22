<?php

$connection = mysqli_connect('localhost', 'mysqli', '270503', 'mysqli');
mysqli_query($connection, "SET NAMES 'utf8'");

if (!$connection) {
    exit('Kết nối không thành công!');
}
?>