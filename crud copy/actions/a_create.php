<?php

 

require_once 'db_connect.php';

 

if($_POST) {

    $fname = $_POST['first_name'];

    $lname = $_POST['last_name'];

    $dob = $_POST['date_of_birth'];

 

    $sql = "INSERT INTO user (first_name, last_name, date_of_birth) VALUES ('$fname', '$lname', '$dob')";

    if($connect->query($sql) === TRUE) {

        echo "<p>New Record Successfully Created</p>";

        echo "<a href='../create.php'><button type='button'>Back</button></a>";

        echo "<a href='../index.php'><button type='button'>Home</button></a>";

    } else {

        echo "Error " . $sql . ' ' . $connect->connect_error;

    }

 

    $connect->close();

}

 

?>