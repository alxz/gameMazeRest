<?php
require_once('../lib/functions.php');
require_once('../lib/classes.php');
require_once('../lib/config.php');
header_remove();
function saveSetToCSV($tabName, $filename = "export.csv", $delimiter=";") {
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
      if (($property->name) == 'listofquestions') {
        for ($i=1; $i < 28; $i++) {
          //array_push($fields,"Q".($i)."True");
          array_push($fields,"Q".$i."-Fail");
        }
      } else {
          array_push($fields,$property->name);
      }
    }
    fputcsv($f, $fields, $delimiter);
    $lineData =array();
    $strCellDataArray =array();
    //to calculate max number of cols for questions user faced with:
    //  $maxQuestionsCount = is_array($listQuestions) || $listQuestions instanceof Countable ? count($listQuestions) : 0;

    //showing all data
    while ($row = mysqli_fetch_array($result)) {
        foreach ($all_property as $item) {
          $strCellData = $row[$item];
          $status = ( $row[$item] == '1')?'Finished':'No';
          if ($item == 'uIsFinished') {
            $strCellData = $status;
          }
          if ($item == 'listofquestions') {
            $qAssocArray = array();
            $qArrayTrue = array();
            $qArrayFalse = array();
            $strCellDataArray = explode(';', $strCellData);
            //print_r($strCellDataArray);
            //$strCellData = $status;
            $maxSize = sizeof($strCellDataArray);
            $bigStr = "";
            //$maxSize = count($strCellDataArray);
            foreach ($strCellDataArray as $value){
              $subElementArr = explode(':', $value);
              $qState =  trim(strtoupper($subElementArr[0]));
              //echo  $subElementArr[1]." - Element State: ".$qState." \n";
              if ($qState == strtoupper ('qT')) {
                  //echo  $subElementArr[1]." - True \n";
                  array_push($qArrayTrue,$subElementArr[1]);
              }
              if ($qState == strtoupper ('qF')) {
                  //echo  $subElementArr[1]." - False \n";
                  array_push($qArrayFalse,$subElementArr[1]);
              }
            }
            $uniqueQArrayTrue = (array_unique($qArrayTrue));
            $uniqueQArrayFalse = (array_unique($qArrayFalse));
            $bigArray  = array_fill(1,27,"null");
            $bigArrayT = array_fill(1,27,0);
            $bigArrayF = array_fill(1,27,0);
            sort($qArrayTrue);
            sort($qArrayFalse);
              foreach ($qArrayTrue as $arrValue) {
                // populating array of questions numbers with question counts:
                  $bigArrayT[$arrValue] +=1;
              }
              foreach ($qArrayFalse as $arrValue) {
                // populating array of questions numbers with question counts:
                  $bigArrayF[$arrValue] +=1;
              }
            $z=0;
            foreach ($bigArray as $value) {
              $z +=1;
              // if ($bigArrayF[$z] == "") {
              //   $bigArrayF[$z] = "0";
              // }
              // if ($bigArrayT[$z] == "") {
              //   $bigArrayT[$z] = "0";
              // }
              //$bigStr = $bigStr."Q".$z.": "."T:".$bigArrayT[$z]." , F:".$bigArrayF[$z].";";
              // $bigStr = "T:".$bigArrayT[$z].",F:".$bigArrayF[$z];
              // array_push($lineData, $bigStr);
              //array_push($lineData, $bigArrayT[$z]);
              array_push($lineData, $bigArrayF[$z]);
            }
          } else {
            array_push($lineData, $strCellData);
          }
        }
        fputcsv($f, $lineData, $delimiter);
        $lineData = array();
    }
    fpassthru($f);
    fclose($f);
    $f = ob_get_clean();
    mysqli_close($connection);
}
?>
