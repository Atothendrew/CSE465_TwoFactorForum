<?php
//signin.php
include 'includes/connect.php';
include 'includes/header.php';

echo '<h3>Sign in</h3><br />';

$outputLabelText = '';

if (isset($_POST['ot_pass_gen'])) {
    
    if (!isset($_POST['user_name']) || mysql_real_escape_string($_POST['user_name']) == '') {
        $outputLabelText = 'The username field must not be empty.';
    } else {
        
        $sql = "SELECT 
					user_email
				FROM
				users
				WHERE
			user_name = '" . mysql_real_escape_string($_POST['user_name']) . "'";
        
        $email_result = mysql_query($sql);
        if (!$email_result) {
            
        } 
        else {
            
            $row = mysql_fetch_assoc($email_result);
            
            if (count($row) == 1) {
                
                // generate otp
                
                $to = '<' . $row['user_email'] . '>';
                
                
                $r       = rand(100000, 999999) . rand(100000, 999999) . rand(100000, 999999); // Generate Rand
                $mr      = md5($r); // MD5 $r
                $message = $_POST['user_name'] . ",\n Thanks for using otp.\n Your password is:\n" . $mr; // message for eml
                
                
                require_once "./Mail/Mail.php";
                
                $from    = 'CSE Information Assurance';
                $subject = 'Your OTP';
                
                $headers = array(
                    'From' => $from,
                    'To' => $to,
                    'Subject' => $subject
                );
                
                $smtp = Mail::factory('smtp', array(
                    'host' => 'ssl://smtp.gmail.com',
                    'port' => '465',
                    'auth' => true,
                    'username' => 'cse465.information.assurance@gmail.com',
                    'password' => 'CSECSECSE'
                ));
                
                $mail = $smtp->send($to, $headers, $message);
                
                if (PEAR::isError($mail)) {
                    $outputLabelText = ('<p>' . $mail->getMessage() . '</p>');
                } else {
                    //   echo('<p>Message successfully sent!</p>');
                    
                }
                
                // check database for preexisting otp
                $sql = "SELECT 
					otp_pass
						FROM
						otp
						WHERE
						user_name = '" . mysql_real_escape_string($_POST['user_name']) . "'";
						
                
                $otp_result = mysql_query($sql);
                if (!$otp_result) {
                    $outputLabelText = ('<p>Returned no results when checking for preexisting otp!</p>');
                } else {
                    
                    $otp_row = mysql_fetch_assoc($otp_result);
                    
                    // otp exists
                    if (count($otp_row) == 1 && $otp_row['otp_pass'] != "") {
                                        
                     //   $sql = "UPDATE otp
					//			SET otp_pass = '" . $mr . ", date_created = " . time() . "
					//			WHERE user_name = '" . mysql_real_escape_string($_POST['user_name']) . "'";
								
							

						$sql = "UPDATE otp
SET otp_pass='" . $mr . "',date_created='".date('Y-m-d H:i:s',time())."'
WHERE user_name='" . mysql_real_escape_string($_POST['user_name']) ."';";
                                                
                        $result = mysql_query($sql);
                        
                        if (!$result) {
                           die("Database query failed: " . mysql_error());
                        }
                                      
                        
                //        $outputLabelText = ($result);
                        $outputLabelText = ('<p>Check your email!</p>');

                        
                    }
                    // no otp exists
                    else {
                    
                        $sql = "INSERT INTO
			otp(user_name, otp_pass)
		VALUES('" . mysql_real_escape_string($_POST['user_name']) . "',
		'" . $mr . "')
		";
		                        $result = mysql_query($sql);

		
                        $outputLabelText = ('<p>Check your email!</p>');


                    }
                    
                    
                }
            } 
            else if (count($row) > 1) {
                $outputLabelText = ('<p>Too many results returned!</p>');
                
            }
            else  {
                $outputLabelText = ('<p>No email results returned!</p>');
                
            }
        }
    }
}

else if (isset($_POST['sign_in'])) {

 /* so, the form has been posted, we'll process the data in three steps:
        1.	Check the data
        2.	Let the user refill the wrong fields (if necessary)
        3.	Varify if the data is correct and return the correct response
        */
        $errors = array();
        /* declare the array for later use */
        
        if (!isset($_POST['user_name'])) {
            $errors[] = 'The username field must not be empty.';
        }
        
        if (!isset($_POST['user_pass'])) {
            $errors[] = 'The password field must not be empty.';
        }
        
        if (!isset($_POST['ot_pass'])) {
            
            $errors[] = 'The otp field must not be empty.';
            
        }
        
        if (!empty($errors)) /*check for an empty array, if there are errors, they're in this array (note the ! operator)*/ {
            echo 'Uh-oh.. a couple of fields are not filled in correctly..<br /><br />';
            echo '<ul>';
            foreach ($errors as $key => $value) /* walk through the array so all the errors get displayed */ {
                echo '<li>' . $value . '</li>';
                /* this generates a nice error list */
            }
            echo '</ul>';
        } else {
            //the form has been posted without errors, so save it
            //notice the use of mysql_real_escape_string, keep everything safe!
            //also notice the sha1 function which hashes the password
            
            // check OTP timestamp
                        $sql = "SELECT 
date_created
FROM
otp
WHERE
otp_pass = '" . $_POST['ot_pass'] . "'";
            
             $result = mysql_query($sql);
                    
                    if (!result) {
                        echo 'Failed to check OTP!';
                    } else {
                    	$row = mysql_fetch_assoc($result);
                    	
                    	$dateOTPCreated = $row['date_created'];
                    	$subtraction = date('Y-m-d H:i:s') - $dateOPTCreated;

                    	
                    	$today = strtotime(date('Y-m-d H:i:s'));
						$expireDay = strtotime($dateOTPCreated);
						$timeToEnd = ($today - $expireDay) / (60*60*24);
						
						if ($timeToEnd >= 1) {
							die("OTP timed out! Use the back button on your browser to generate a new one!");
						}
                    	
                    }
            
            $sql = "SELECT 
user_id,
user_name,
user_level
FROM
users
WHERE
user_name = '" . mysql_real_escape_string($_POST['user_name']) . "'
AND
user_pass = '" . sha1($_POST['user_pass']) . "'";
            
            $user_result = mysql_query($sql);
            if (!$user_result) {
                //something went wrong, display the error
                echo 'Something went wrong while signing in. Please try again later.';
                //echo mysql_error(); //debugging purposes, uncomment when needed
            } else {
                //the query was successfully executed, there are 2 possibilities
                //1. the query returned data, the user can be signed in
                //2. the query returned an empty result set, the credentials were wrong
                
                if (mysql_num_rows($user_result) == 0) {
                    echo 'You have supplied a wrong user/password combination. Please try again.';
                } else {
                    
                    $sql = "SELECT 
	user_name
FROM
otp
WHERE
otp_pass = '" . $_POST['ot_pass'] . "'";
                    
                    $result = mysql_query($sql);
                    
                    if (!result) {
                        echo 'Something went wrong while accessing the database. Please try again.';
                    } else {
                        if (mysql_num_rows($result) == 0) {
                        	echo 'You have supplied a incorrect one-time-password! Please try again.';
                        } else if (mysql_num_rows($result) == 1) { 
                            //set the $_SESSION['signed_in'] variable to TRUE
                            $_SESSION['signed_in'] = true;
                            
                            //we also put the user_id and user_name values in the $_SESSION, so we can use it at various pages
                            $row = mysql_fetch_assoc($user_result);
                            
                            
                                $_SESSION['user_id']    = $row['user_id'];
                                $_SESSION['user_name']  = $row['user_name'];
                                $_SESSION['user_level'] = $row['user_level'];
                            
                            
                            echo 'Welcome, ' . $_SESSION['user_name'] . '. <br /><a href="index.php">Proceed to the forum overview</a>.';
                            
                            $sql="DELETE FROM otp WHERE user_name= '" . $_SESSION['user_name'] . "'";
							mysql_query($sql);
                        }
                        else {
                                                echo 'Internal error. Multiple users returned';

                        }
                    }

                }
            }
        }

}

//first, check if the user is already signed in. If that is the case, there is no need to display this page
if (isset($_SESSION['signed_in']) && $_SESSION['signed_in'] == true) {
    echo 'You are already signed in, you can <a href="signout.php">sign out</a> if you want.';
} 
else {
//    if ($_SERVER['REQUEST_METHOD'] != 'POST') {
        /*the form hasn't been posted yet, display it
        note that the action="" will cause the form to post to the same page it is on */
        
        if (isset($_POST['user_name'])) {
        
        echo '<form method="post" action="">
Username: <input type="text" name="user_name" value="'.mysql_real_escape_string($_POST['user_name']).'"/><br />
<input type="submit" name="ot_pass_gen" value="Email me one-time-password" /><br /><br />
Password: <input type="password" name="user_pass"><br />
One Time Password: <input type="password" name="ot_pass"><br />
<input type="submit" name="sign_in" value="Sign in" /><br /><br />
<label>'.$outputLabelText.'</label>
</form>';
}
else {
        echo '<form method="post" action="">
Username: <input type="text" name="user_name" /><br />
<input type="submit" name="ot_pass_gen" value="Email me one-time-password" /><br /><br />
Password: <input type="password" name="user_pass"><br />
One Time Password: <input type="password" name="ot_pass"><br />
<input type="submit" name="sign_in" value="Sign in" /><br /><br />
<label>'.$outputLabelText.'</label>
</form>';

//    } 
}
}


include 'includes/footer.php';
?>