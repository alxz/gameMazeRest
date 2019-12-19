<?php
        require_once('../lib/config.php');
        require_once('../lib/functions.php');
        require_once('../lib/classes.php');
    // by Alexey Zapromyotov (c) 2019
    if (isset($_POST['userId'])) { //=========== EXPORT To CSV ================
     $userID = $_POST['userId'];
     $userID = chop($userId,"@MUHCAD.MUHCFRD.CA");
    } else {
      $userID = "pacs";
    }
      $tabName = 'tabusers';
      $connection = createConnection (DBHOST, DBUSER, DBPASS, DBNAME);
      if(mysqli_connect_errno()){
          die("connection failed: "
              . mysqli_connect_error()
              . " (" . mysqli_connect_errno()
              . ")");
      }
      $query = "SELECT * FROM ".$tabName." WHERE uIsFinished=1 AND uIUN LIKE '".$userID."%'"." ORDER BY uTimer,uRetryCount,uTotalScore ASC";
      $result = mysqli_query($connection,$query);
      $run = $connection->query($query) or die("Last error: {$connection->error}\n");
      $all_property = array();  //declare an array for saving property
      //showing property
      while ($property = mysqli_fetch_field($result)) {
          array_push($all_property, $property->name);  //save those to array
      }
      //showing all data
      $lineData =array();
      while ($row = mysqli_fetch_array($result)) {
          foreach ($all_property as $item) {
            $strCellData = $row[$item];
            $status = ( $row[$item] == '1')?'Finished':'No';
            if ($item == 'uIsFinished') {
              $strCellData = $status;
            }
            array_push($lineData, $strCellData);
          }
        }
      mysqli_close($connection);
    $userScoreHistory = array ( 'userScoreHistory' => $lineData);
    header('Content-Type: application/json');
    //echo json_encode($userScoreHistory);
    //https://poanchen.github.io/blog/2016/10/16/how-to-create-simple-rest-api-in-php-and-call-them-in-js
    echo json_encode($userScoreHistory, JSON_PRETTY_PRINT);

?>
