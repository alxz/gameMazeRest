<?php 

require_once('../lib/functions.php');
require_once('../lib/classes.php');
require_once('../lib/config.php');

$jsondata = file_get_contents("php://input");

$resultSet = json_decode( $jsondata, true ); // 2nd arg true to convert objects to associative arrays
$opCode = $resultSet['opCode'];
$data = $resultSet['data'];

// $sql = "INSERT INTO tabusers (uIUN, uFName, uLName, uRetryCount, uTimer, uTotalScore, uIsFinished, timestart, timefinish, listofquestions, comment, sessionid)
// VALUES ('$userIUN', '$userFName', '$userLName', $retyCount, $timeElapsed, $scoreTotal, $isFinished, '$timeStarted', '$timeFinish', '$listOfQuestions', '$comments', '$sessionId')";

if ( $opCode == 'INSERT') {
	// code... insert data to the table
	//echo "INSERT!";
	$isFinished = 0;
	$userIUN = $data['user']; //uIUN,
	$userFName = $data['user'];//uFName,
	$userLName = $data['user']; //uLName,

	$timeElapsed = $data['elapsedTime']; // uTimer,
	$scoreTotal = $data['correctCount']; //uTotalScore,	
	$reultsCount = getUserRetriesCountFromDB($userIUN);
	//echo '<br>Previous results count: '.$reultsCount;

	$retyCount = $reultsCount + 1; //uRetryCount,

	$timeStarted = $data['timestart']; // date+time when started. text,
	$timeFinish = $data['timefinish']; // date+time when finished. text,
	$listOfQuestions = $data['listofquestions']; //listofquestions
	$comments = $data['comments']; //Comments goes here
	$sessionId = $data['sessionId']; // Current Session ID

		// Create connection
		$conn = createConnection (DBHOST, DBUSER, DBPASS, DBNAME);
		// Check connection
		if (!$conn) {
		    die("Connection failed: " . mysqli_connect_error());
		}

		$sql = "INSERT INTO tabusers (uIUN, uFName, uLName, uRetryCount, uTimer, uTotalScore, uIsFinished, timestart, timefinish, listofquestions, comment, sessionid)
		VALUES ('$userIUN', '$userFName', '$userLName', $retyCount, $timeElapsed, $scoreTotal, $isFinished, '$timeStarted', '$timeFinish', '$listOfQuestions', '$comments', '$sessionId')";

		if (mysqli_query($conn, $sql)) {
		    //echo "<br> New record created successfully <br>";
		    echo "INSERTED";
		} else {
			http_response_code(500);
		    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
		}

		mysqli_close($conn);


} else if ( $opCode == 'UPDATE'){
	// update data in the table
	//echo "INSERT!";
	$timeElapsed = $data['elapsedTime']; // uTimer,
	$scoreTotal = $data['correctCount']; //uTotalScore,	
	$timeFinish = $data['timefinish']; // date+time when finished. text,
	$listOfQuestions = $data['listofquestions']; //listofquestions
	$comments = $data['comments']; //Comments goes here
	$sessionId = $data['sessionId']; // Current Session ID
	
	// Create connection
	//$conn = mysqli_connect($servername, $username, $password, $dbname);
	$conn = createConnection (DBHOST, DBUSER, DBPASS, DBNAME);
	// Check connection
	if (!$conn) {
	    die("Connection failed: " . mysqli_connect_error());
	}

	$sql = "Update tabusers SET uTimer=$timeElapsed,".
	                           " uTotalScore=$scoreTotal,".
	                           " timefinish='$timeFinish',".
	                           " listofquestions='$listOfQuestions',".
	                           " comment='$comments'".
	                           " WHERE sessionid = '$sessionId'";

	if (mysqli_query($conn, $sql)) {
		echo "UPDATED SUCCESSFULLY!";
	} else {
		http_response_code(500);
	    echo "Error: " . $sql. "  ----  " . mysqli_error($conn);
	}

	mysqli_close($conn);

} else {
	//error code
	http_response_code(500);
	echo "ERROR! Wrong operation code: ".$opCode;
}

?>
