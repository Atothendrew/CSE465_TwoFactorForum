<?php require_once("functions.php"); ?>
<?php require_once("constants.php"); ?>
<?php 
session_start();
//connect.php

function confirm_logged_in() {
		if (!logged_in()) {
			redirect_to("signin.php");
		}
	}

	//echo '<h3>session called</h3><br />';

if(!mysql_connect($server, $username, $password))
{
 	exit('Error: could not establish database connection');
}
if(!mysql_select_db($database))
{
 	exit('Error: could not select the database');
}


?>