<?php

$service_url = 'http://www.mymuhc.muhc.mcgill.ca/a/a.php';
include($service_url);
echo '<br><hr/><br>';
include('https://www.mymuhc.muhc.mcgill.ca/a/a.php');

 echo "<h1>Kerberos Auth'd</h1>";
 echo "<br>Remote user: <b>     " . $_SERVER['REMOTE_USER'] . "</b>";
 echo "<br>Auth type: <b>       " . $_SERVER['AUTH_TYPE'] . "</b>" ;
 echo "<br>Remote address: <b>  " . $_SERVER['REMOTE_ADDR'] . "</b>" ;
 echo "<br>SSL Cipher: <b>      " . $_SERVER['SSL_CIPHER'] . "</b>" ;
 echo "<br>WebServer: <b>       " . $_SERVER['SERVER_SOFTWARE'] . "</b>" ;
 echo "<br>Browser: <b>         " . $_SERVER['HTTP_USER_AGENT'] . "</b>" ;
?>

// echo "<h1>Kerberos Auth'd</h1>";
// echo "<br>Remote user: <b>     " . $_SERVER['REMOTE_USER'] . "</b>";
// echo "<br>Auth type: <b>       " . $_SERVER['AUTH_TYPE'] . "</b>" ;
// echo "<br>Remote address: <b>  " . $_SERVER['REMOTE_ADDR'] . "</b>" ;
// echo "<br>SSL Cipher: <b>      " . $_SERVER['SSL_CIPHER'] . "</b>" ;
// echo "<br>WebServer: <b>       " . $_SERVER['SERVER_SOFTWARE'] . "</b>" ;
// echo "<br>Browser: <b>         " . $_SERVER['HTTP_USER_AGENT'] . "</b>" ;
