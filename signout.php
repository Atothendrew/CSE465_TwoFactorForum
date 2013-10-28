<?php
//signout.php
include 'includes/connect.php';


//check if user if signed in
if($_SESSION['signed_in'] == true)
{

	//unset all variables
	$_SESSION['signed_in'] = NULL;
	$_SESSION['user_name'] = NULL;
	$_SESSION['user_id']   = NULL;
	session_destroy();
	
	include 'includes/header.php';
	echo '<h2>Sign out</h2>';
	echo 'Succesfully signed out, thank you for visiting.';	
	
}
else
{
	include 'includes/header.php';
	echo '<h2>Sign out</h2>';
	echo 'You are not signed in. Would you <a href="signin.php">like to</a>?';
}


include 'includes/footer.php';
?>