<?php
include 'conn.php';
$username = $_POST['username'];
$password = $_POST['password'];

$conn->query("insert into login(username,password) values('".$username."','".$password."')");


?>