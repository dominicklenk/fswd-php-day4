<?php
ob_start();
session_start();
require_once 'dbconnect.php';

// if session is not set this will redirect to login page
if( !isset($_SESSION['user']) ) {
 header("Location: index.php");
 exit;
}
// select logged-in user detail
$res=mysqli_query($conn, "SELECT * FROM user WHERE userId=".$_SESSION['user']);
$userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
<title>Welcome - <?php echo $userRow['userName']; ?></title>
</head>
<body>
           Hi' <?php echo $userRow['userName']; ?>
            
           <a href="logout.php?logout">Sign Out</a>
  
        
  
</body>
</html>
<?php ob_end_flush(); ?>