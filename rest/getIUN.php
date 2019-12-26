<?php
        require_once('../lib/config.php');
        require_once('../lib/functions.php');
        require_once('../lib/classes.php');
    // by Alexey Zapromyotov (c) 2019
    //$jsondata = file_get_contents("php://input");
    //$resultSet = json_decode( $jsondata, true ); // 2nd arg true to convert objects to associative arrays
    $opCode = $_GET['opCode']; //$resultSet['opCode'];
    $userID = $_GET['userId'];//$resultSet['uIUN'];

    if ( $opCode == 'ALLSTAT') {
      $tabName = 'tabusers';
      $connection = createConnection (DBHOST, DBUSER, DBPASS, DBNAME);
      if(mysqli_connect_errno()){
          die("connection failed: "
              . mysqli_connect_error()
              . " (" . mysqli_connect_errno()
              . ")");
      } else {
          $tabName = 'tabusers';
          $connection = createConnection (DBHOST, DBUSER, DBPASS, DBNAME);
          if(mysqli_connect_errno()){
              die("connection failed: "
                  . mysqli_connect_error()
                  . " (" . mysqli_connect_errno()
                  . ")");
          }
      }
      //$userID = 'ZAAL6006';
      //$query = "SELECT * FROM ".$tabName." WHERE uIUN='".$userID."' ORDER BY uTimer,uRetryCount,uTotalScore ASC";
      $query = "SELECT * FROM ".$tabName." WHERE uIUN='".$userID."' ORDER BY uTimer,uRetryCount,uTotalScore ASC";
      $result = mysqli_query($connection,$query);
      $run = $connection->query($query) or die("Last error: {$connection->error}\n");
      $all_property = array();  //declare an array for saving property
      //showing property
      while ($property = mysqli_fetch_field($result)) {
          array_push($all_property, $property->name);  //save those to array
      }
      //showing all data
      $colsData = array();
      while ($row = mysqli_fetch_array($result)) {
        $lineData =array();
          foreach ($all_property as $item) {
            $strCellData = $row[$item];
            $status = ( $row[$item] == '1')?'Finished':'No';
            if ($item == 'uIsFinished') {
              $strCellData = $status;
            }
            array_push($lineData, $strCellData);
          }
          array_push($colsData,$lineData);
        }
        mysqli_close($connection);
            // $userScoreHistory = array ('userScoreHistory' => $lineData); //$colsData
            $userScoreHistory = array ('userScoreHistory' => $colsData);
            header('Content-Type: application/json');
        //echo json_encode($userScoreHistory, JSON_PRETTY_PRINT);
        echo json_encode($userScoreHistory);
    } else {
      $userScoreHistory = ['Not found'];
      http_response_code(500);
      echo json_encode($userScoreHistory);
    }

    // if (isset($_POST['userId'])) {
    //  $userID = $_POST['userId'];
    //  $userID = chop($userID,"@MUHCAD.MUHCFRD.CA");
    // } else {
    //   $userID = "UNKNOWN";
    // }


?>
