<?php
	session_start();
	echo '<h3>session called</h3><br />';

	function logged_in() {
		return isset($_SESSION['user_id']);
	}
	
	function confirm_logged_in() {
		if (!logged_in()) {
			redirect_to("./signin.php");
		}
	}
?>
