<?php
require_once('../lib/functions.php');
require_once('../lib/classes.php');
require_once('../lib/config.php');
header_remove();
function saveToCSVPHP($tabName, $filename = "export.csv", $delimiter=";") {
  $pagesCount = $recordsDisplayCount;
  //$tabName = $_POST['tabName'];
  if (isset($_POST['tabName']) && $tabName=="") {
    $tabName = $_POST['tabName'];
  }
  $delimiter = ",";
  $filename = "export_".$tabName. date('Y-m-d') . ".csv";
    $connection = createConnection (DBHOST, DBUSER, DBPASS, DBNAME);
    //test if connection failed
    if(mysqli_connect_errno()){
        die("connection failed: "
            . mysqli_connect_error()
            . " (" . mysqli_connect_errno()
            . ")");
    }
    //get results from database
    $query = "SELECT * FROM ".$tabName." ;";
    $result = mysqli_query($connection,$query);
    $run = $connection->query($query) or die("Last error: {$connection->error}\n");
    //create a file pointer
    header('Content-Type: text/csv; charset=utf-8');
    header('Content-Disposition: attachment; filename="' . $filename . '";');
    //$f = fopen('php://memory', 'w');
    $f = fopen('php://output', 'w');
    fprintf($f, chr(0xEF).chr(0xBB).chr(0xBF));
    $all_property = array();  //declare an array for saving property
    //showing property
    $fields = array();
    while ($property = mysqli_fetch_field($result)) {
      array_push($all_property, $property->name);  //save those to array
      //set column headers
      array_push($fields,$property->name);
    }
    fputcsv($f, $fields, $delimiter);
    $lineData =array();
    $ind = 0;
    //showing all data
    while ($row = mysqli_fetch_array($result)) {
        foreach ($all_property as $item) {
          $strCellData = $row[$item];
          $status = ( $row[$item] == '1')?'Finished':'No';
          if ($item == 'uIsFinished') {
            $strCellData = $status;
          }
          array_push($lineData, $strCellData);
        }
        fputcsv($f, $lineData, $delimiter);
        $lineData = array();
        $ind++;
    }
    fpassthru($f);
    fclose($f);
    $f = ob_get_clean();
    mysqli_close($connection);

}
?>
