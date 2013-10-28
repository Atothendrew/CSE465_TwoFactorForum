<!-- SCRIPT -->
<?php
//ob_clean();
//session_start(); // Start Session
include "db.php"; // Include File With DB Conn.


echo "button 1 has been pressed"; 
 



// function rpt_eml() {
// 	if(isset($_POST['emailaddress'])) // If email address entered
// 	{
// 		echo($_POST['emailaddress']);
// 	}
// }
// 
// if(isset($_POST['form'])) // If a form is executed
// {
// 	if($_POST['form'] == "req") // If the form is "req"
// 	{
// 		$r = rand(100000,999999).rand(100000,999999).rand(100000,999999); // Generate Rand
// 		$mr = md5($r); // MD5 $r
// 		$message = "Thanks for using otp.\n Your password is:\n" . $mr; // message for eml
// 		$query_otpnew = 'INSERT INTO `gend` (`emailaddress`, `pass`) VALUES (\''.$_POST['emailaddress'].'\', MD5(\''.$mr.'\'));'; // MySQL Query - Request
// 		$headers = 'From:'; //Header
// 		$result = mysql_query($query_otpnew); // Execute Query
// 		mail($_POST['emailaddress'], "One-time Password :: Password", $message, $headers); // Mail OTP
// 		echo "Success on " . $_POST['emailaddress'] . "!<BR>"; // Success Message
// 	}
// 	if($_POST['form'] == "login") // If the form is "login"
// 	{
// 		$query_login = "SELECT emailaddress FROM gend WHERE emailaddress='".$_POST['eml']."' AND pass='".md5($_POST['pwd'])."'"; // MySQL Query - Login
// 		$result = mysql_query($query_login); // Execute Query
// 		$chk1 = mysql_num_rows($result); // Get True/False
// 		if($chk1 > 0) // Check True/False
// 		{
// 			echo "Logged In!"; // Success Msg
// 			$_SESSION['auth'] = 1; // Create Session Detail
// 			$query_reg = 'INSERT INTO `logins` (`ID`, `emailaddress`, `time`) VALUES (NULL, \''.$_POST['eml'].'\', NOW());'; // MySQL Query - register
// 			$query_done = 'DELETE FROM gend WHERE emailaddress=\''.$_POST['eml'].'\';'; // MySQL Query - Done/Delete
// 			$result = mysql_query($query_done); // Execute Query
// 			$reg_result = mysql_query($query_reg); // Execute Query
// 		}
// 		else // OR
// 		{
// 			echo "Login Failed!"; // Failure Msg
// 		}
// 	}
// }
?>

<!-- END SCRIPT --><html>
<head>
<style>
input {
	display: block;
	text-decoration: bold;
}

input.text {
	display: block;
	font-size: 20pt;
	text-decoration: bold;
}
</style>
<title>One-time Password</title>
</head>
<body>
<center>

<font face="helvetica">
<BR><BR><BR>
<!-- Request -->
Please enter your email address to get your password:<BR>
<form name="otpreq" action="./index.php" method="post"><!-- FORM - Request -->
	<input type="hidden" name="form" value="req"><!-- HIDDEN - To Give Form -->
	<input type="text" name="emailaddress" class="text"><!-- TEXT - Eml --> <input type="submit" value="Go!">
</form>
<!-- End Request -->
<BR><BR>
<!-- Login -->
Please enter your email address & password you got sent:<BR>
<form name="otplog" action="./index.php" method="post"><!-- FORM - Login -->
	<input type="hidden" name="form" value="login"><!-- HIDDEN - To Give Form -->
	Email Address:<input type="text" name="eml" class="text" value="<?php rpt_eml(); ?>"><!-- TEXT - Eml --><BR>
	Password:<input type="text" name="pwd" class="text"><!-- TEXT - Pwd --><BR>
	<input type="submit" value="Login!">
</form>
<!-- End Login-->
</font>
</center>
</body>
</html>
