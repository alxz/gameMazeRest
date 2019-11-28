<?php

//next example will recieve all messages for specific conversation
$service_url = 'https://www.mymuhc.muhc.mcgill.ca/a/a.php';
$curl = curl_init($service_url);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
$curl_response = curl_exec($curl);
if ($curl_response === false) {
    $info = curl_getinfo($curl);
    curl_close($curl);
    die('error occured during curl exec. Additioanl info: ' . var_export($info));
}
curl_close($curl);
$decoded = json_decode($curl_response);
if (isset($decoded->response->status) && $decoded->response->status == 'ERROR') {
    die('error occured: ' . $decoded->response->errormessage);
}
echo 'response ok!';
var_export($decoded->response);

// echo "<h1>Kerberos Auth'd</h1>";
// echo "<br>Remote user: <b>     " . $_SERVER['REMOTE_USER'] . "</b>";
// echo "<br>Auth type: <b>       " . $_SERVER['AUTH_TYPE'] . "</b>" ;
// echo "<br>Remote address: <b>  " . $_SERVER['REMOTE_ADDR'] . "</b>" ;
// echo "<br>SSL Cipher: <b>      " . $_SERVER['SSL_CIPHER'] . "</b>" ;
// echo "<br>WebServer: <b>       " . $_SERVER['SERVER_SOFTWARE'] . "</b>" ;
// echo "<br>Browser: <b>         " . $_SERVER['HTTP_USER_AGENT'] . "</b>" ;
?>
