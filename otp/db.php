<?
//Mail From address
$mailaddress='info@jmorcs.com';

// hostname or ip of server
$servername='cse465.db.10904897.hostedresource.com';

// username and password to log onto db server
$dbusername='andre124_andrew';
$dbpassword='atown2424';

// name of database
$dbname='andre124_jeff';

////////////// Do not  edit below/////////

connecttodb($servername,$dbname,$dbusername,$dbpassword);
function connecttodb($servername,$dbname,$dbuser,$dbpassword)
{
global $link;
$link=mysql_connect ("$servername","$dbuser","$dbpassword");
if(!$link){die("Could not connect to MySQL");}
$db = mysql_select_db("$dbname",$link) or die ("could not open db".mysql_error());
}
?>
