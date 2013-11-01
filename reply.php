<?php
//create_cat.php
include 'includes/connect.php';
include 'includes/header.php';

if($_SERVER['REQUEST_METHOD'] != 'POST')
{
	//someone is calling the file directly, which we don't want
	echo 'This file cannot be called directly.';
}
else
{
	//check for sign in status
	if(!$_SESSION['signed_in'])
	{
		echo 'You must be signed in to post a reply.';
	}
	else
	{


		if (empty($_POST['reply-content'])) {
			echo 'Your reply content cannot be empty!';
		}
		else if (strlen($_POST['reply-content']) > 800) {
				echo 'Your reply content length ('.strlen($_POST['reply-content']).') exceeds 800 characters. It cannot exceed 800 characters.';
			}
		else {

			$badChars = array ('<', '>', '*', '%', '/');
			$contentToBeAdded = $_POST['reply-content'];
			$hadBadChar = false;

			foreach ($badChars as $char) {
				if (strpos($contentToBeAdded,strval($char)) !== false) {
					$hasBadChar = true;
				}
			}

			if (!$hasBadChar) {

				//a real user posted a real reply
				$sql = "INSERT INTO
					posts(post_content,
						  post_date,
						  post_topic,
						  post_by)
				VALUES ('" . $_POST['reply-content'] . "',
						NOW(),
						" . mysql_real_escape_string($_GET['id']) . ",
						" . $_SESSION['user_id'] . ")";

				$result = mysql_query($sql);

				if(!$result)
				{
					echo 'Your reply has not been saved, please try again later.' . mysql_error();
				}
				else
				{
					echo 'Your reply has been saved, check out <a href="topic.php?id=' . htmlentities($_GET['id']) . '">the topic</a>.' ;
				}
			}
			else {
				echo 'Your reply contains one or more of the following invalid characters: (<, >, *, %, /). For security reasons, we cannot post your reply. Please remove the characters and try again.';
			}
		}

	}
}

include 'includes/footer.php';
?>