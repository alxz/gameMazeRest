<?php
require_once('../lib/functions.php');
require_once('../lib/classes.php');
require_once('../lib/config.php');
require_once('./exportData.php');
session_start();
if (!isset($_SESSION['time'])) {
    $_SESSION['time'] = date("H:i:s");
}
$GLOBALS[retryLimit] = 3;
if(isset($_POST['saveToCSV'])) { //=========== EXPORT To CSV ================
  $tabsToSave = "";
  if (!isset($_POST['tabsFromDB'])) {
    $tabsToSave = 'tabusers';
  } else {
      $tabsToSave = ($_POST['tabsFromDB']);
  }
  saveToCSVPHP($tabsToSave);
  exit;
}
?>
<html>
<head>
  <meta charset="UTF-8">
  <title>To review the table(s) data</title>
  <link rel="stylesheet" href="../css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="../js/jquery-3.4.1.min.js"></script>
  <script type="text/JavaScript">
      function SubmitForm(formId) {
          //var oForm = document.getElementById(formId);
          //tabName
          var resultsContainer = document.getElementById('tabName');
          var selectedValue = document.getElementById('tabsFromDB').value;
          //resultsContainer.value = `${selectedValue}`;
          resultsContainer.value = '' + selectedValue + '';
      }
      function updateRowsCount(formId) {
        const selectedValue = document.getElementById('pCount').value;
        const pCountLabel = document.getElementById('pCountLabel');
        const hiddenRecCount = document.getElementById('hiddenRecCount');
        pCountLabel.innerHTML = selectedValue;
        document.getElementById('hiddenRecCount').value = selectedValue;
        console.log('pCount = ' + selectedValue);
        console.log('hiddenRecCount.value = ' + hiddenRecCount.value);
      }
      function updateRetryLimit(formId) {
        // check updateRetryLimit
        const retryLimit = document.getElementById('retryLimit').value;
        document.getElementById('retryLimitLabel').value = retryLimit;
        //$GLOBALS['retryLimit']
      }
  </script>
</head>
<style>
.data-table{
	border: 1px solid black;
	margin-left: auto;
  margin-right: auto;
  width: 90%;
  font-size: 0.8em;
}
table {
  border-collapse: collapse;
  width: 90%;
  margin-left: auto;
  margin-right: auto;
}
th, td {
  text-align: left;
  border-bottom: 1px solid #ddd;
}
.allColsTable {
  table-layout: auto;
  border: 1px solid black;
  width: 100%;
  margin-left: auto;
  margin-right: auto;
  font-size: 0.8em;
}
.allColsTableTd {
  text-align: left;
  padding-bottom: 5px;
  border-bottom: 1px solid #ddd;
}
.trCentered {
  align-items: center;
  text-align: center;
}
.tdLeft {
  text-align:  left;
  align: left;
  margin-left: 20px;
  padding-left: 20px;
  padding-top: 10px;
  width: 30%;
  font-size: 0.8em;
}
.tdRight {
  text-align: right;
  align: right;
  margin-right: 20px;
  padding-right: 20px;
  padding-top: 10px;
  width: 30%;
  font-size: 0.8em;
}
.tdCenter {
  text-align: center;
  align: cite;
  width: 30%;
  padding-top: 10px;
  font-size: 0.8em;
}
</style>
<body>
<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
<h1>Display user and score statistics: &nbsp; &nbsp; &nbsp; &nbsp;
<a href="../index.php" id="link" style="color: #FFFF00">... back to game</a></h1>
<div>
  <div>
    <br>
    <table class="data-table">
      <tr class="trCentered">
        <th class="tdRight">Tables list:</th>
        <th class="tdCenter">Row start: <span id="rowsNum"></span> &nbsp;
          <br>rows count: <span id="pCountLabel"></span>
          <input type="hidden" id="hiddenRecCount" name="hiddenRecCount" value="">
          <br>Number of rows:</th>
        <th class="tdLeft">Table to display:</th>
      <tr>
      <tr class="trCentered">
        <td class="tdRight">
          <select name="tabsFromDB" id="tabsFromDB" onchange="SubmitForm('');"><?php echo displayDBTAblesInAList(); ?>
          </select>
        </td>
        <td class="trCentered">
          <?php $pageno = isset($_POST['pCount'])?$_POST['pCount']:''; ?>
          <select name='pCount' id='pCount' onchange="updateRowsCount('');">
          <?php for($i=50;$i<=1000; $i+=50):?>
              <option value="<?php echo $i;?>"<?php echo $i==$pageno? 'selected':'';?>><?php echo $i;?></option>
          <?php endfor;?>
          </select>
        </td>
        <td class="tdLeft">
          <input type="text" id="tabName" value="tabusers" name="tabName" />
        </td>
      </tr>
      <tr class="trCentered">
        <td class="tdRight">
          <button type="submit" value="Submit Request" name="submit">Display All</button>
        </td>
        <td class="tdCenter">
          <button type="submit" value="filterShow" name="filterShow">Show Filters</button>
          &nbsp; &nbsp; &nbsp;
          <button type="submit" value="detailsShow" name="detailsShow">User Details</button>

        </td>
        <td class="tdLeft">
          <button type="submit" value="saveToCSV" name="saveToCSV">Export->CSV</button>
          <!-- <button onclick="history.go(-1);">Go Page Back</button> -->
        </td>
      </tr>
  </table>
  </div>
  <div id="dbShow">
  </div>
</div>
<hr/>
<div id="divFilters" class="filters-hidden" style="display: none;">
  <div id="divButton">
    <input type="checkbox" value="getAll" name="allStat" >All Statistics</input>
     &nbsp; &nbsp;
    <input type="checkbox" value="getFinished" name="allFinished" >All Finished</input>
     &nbsp; &nbsp;
    <input type="checkbox" value="sortBestTime" name="sortBestTime" >Sort By Best time </input>
    &nbsp; &nbsp;
    Mark Retry Limit over:&nbsp;
    <?php $retryLimit = isset($_POST['retryLimit'])?$_POST['retryLimit']:''; ?>
    <select name='retryLimit' id='retryLimit' onchange="updateRetryLimit('');">
    <?php for($i=1;$i<=10; $i++):?>
        <option value="<?php echo $i;?>" <?php echo $i==$retryLimit? 'selected':'';?>><?php echo $i;?></option>
    <?php endfor;?>
    </select>
    <input type="hidden" id="retryLimitLabel" name="retryLimitLabel" value="">
    <br/><hr/><br/>
    <button type="submit" value="getStat" name="getFilteredData" >Show Filetered Stats</button>
  </div>
</div>
<div id="divDetails" class="details-hidden" style="display: none;">
  <div id="dvInput" class="input-info">
    <p>IUN: &nbsp;<input type="text" id="userIUNVar" name="userIUNVar" /> &nbsp; Use % to show all records</p>
  </div>
  <div id="divButton">
    <button type="submit" value="getStat" name="getStat" > Get User Stats </button>
  </div>
</div>
<div id="divNavBtn" class="naviButtonsDiv-hidden" style="display: none; font-size: 0.8em;">
  <table>
    <tr class="trCentered">
      <td class="tdRight">
        <button type="submit" value="GetPrevious" name="submitPrev" id="btnSubmitPrev"> << </button>
      </td>
      <td class="trCentered" id="navTabCenterCell" style="border: solid 2px lightgray; border-radius: 3px;">
        <!-- <button type="submit" value="resetRowLimit" name="resetRowLimit">Reset rows</button> -->
      </td>
      <td class="tdLeft">
        <button type="submit" value="GetNext" name="submitNext" id="btnSubmitNext"> >> </button>
      </td>
    </tr>
  </table>
</div>
</form>

</body>
</html>
<script type="text/JavaScript">
  function getUserData() {
    //console.log('userIUNVar');
    var userIUN = document.getElementById("userIUNVar").value;
    //alert('User name: ' + userIUN);
  }
</script>
<?php
      if (!isset($_SESSION['nextRecsCount'])) {
        echo '<script type="text/JavaScript"> document.getElementById("rowsNum").innerHTML = '.
              " 0 ".
              ';</script>';
      } else {
        echo '<script type="text/JavaScript"> document.getElementById("rowsNum").innerHTML = "'.
              ($_SESSION['nextRecsCount']).
              '";</script>';
        echo '<script type="text/JavaScript"> document.getElementById("btnSubmitNext").innerHTML = "next >> '.
              ($_POST['pCount']).
                    '";</script>';
        echo '<script type="text/JavaScript"> document.getElementById("btnSubmitPrev").innerHTML = "<< prev '.
              ($_POST['pCount']).
              '";</script>';
      }
      if (!isset($_POST['retryLimit'])) {
        $GLOBALS[retryLimit] = 3;
      } else {
        $GLOBALS[retryLimit] = ($_POST['retryLimit']);
      }
$nextRecsCount = 0;
if(isset($_POST['submit'])) {
  $recsCount = isset($_POST['pCount'])? $_POST['pCount']:'';
  if (!isset($_SESSION['nextRecsCount'])) {
    $_SESSION['nextRecsCount'] = 0;
  } else {
    $_SESSION['nextRecsCount'] = 0;
  }
  echo '<script type="text/JavaScript"> document.getElementById("rowsNum").innerHTML = "'.
        ($_SESSION['nextRecsCount']).
        '";</script>';
  echo '<script type="text/JavaScript"> document.getElementById("hiddenRecCount").value = 0;</script>';
  display(0,$recsCount);
} elseif (isset($_POST['resetRowLimit'])) {
    $_SESSION['nextRecsCount'] = 0;
    //document.getElementById('hiddenRecCount').value
    echo '<script type="text/JavaScript"> document.getElementById("hiddenRecCount").value = 0;</script>';
} elseif (isset($_POST['submitNext'])) { //======================== next button >>>> ================
  //submitNext
  $recsCount = isset($_POST['pCount'])? $_POST['pCount']:'';
  $countUniqueuId = getCountBy('uId',1);
  //echo 'recsCount: '.$recsCount.'<br>';
  $hiddenRecCount = isset($_POST['hiddenRecCount'])? $_POST['hiddenRecCount']:$recsCount;
  //echo 'hiddenRecCount: '.$hiddenRecCount.'<br>';
  if (!isset($_SESSION['nextRecsCount'])) {
    $_SESSION['nextRecsCount'] = $recsCount;
  } else {
    $nextRecsCount = $_SESSION['nextRecsCount'];
  }
  //echo 'Showning next records(nextRecsCount): '.$nextRecsCount.'<br>';
  if (($nextRecsCount + $recsCount) > $countUniqueuId) {
    $nextRecsCount = 0; //(($nextRecsCount + $recsCount) - ($countUniqueuId));
    display($nextRecsCount,$recsCount);
  } else {
    if ($nextRecsCount == 0) {
      $nextRecsCount = $nextRecsCount + $recsCount;
      display(0,$recsCount);
    } else {
      display($nextRecsCount,$recsCount);
      $nextRecsCount = $nextRecsCount + $recsCount;
    }
  }
  $_SESSION['nextRecsCount'] = $nextRecsCount;
}  elseif (isset($_POST['submitPrev'])) {  // ===================== <<<<< previous button ==============
  $recsCount = isset($_POST['pCount'])? $_POST['pCount']:'';
  $countUniqueuId = getCountBy('uId',1);
  //echo 'recsCount: '.$recsCount.'<br>';
  $hiddenRecCount = isset($_POST['hiddenRecCount'])? $_POST['hiddenRecCount']:$recsCount;
  //echo 'hiddenRecCount: '.$hiddenRecCount.'<br>';
  if (!isset($_SESSION['nextRecsCount'])) {
    $_SESSION['nextRecsCount'] = $recsCount;
  } else {
    $nextRecsCount = $_SESSION['nextRecsCount'];
  }
  //echo 'Showning next records(nextRecsCount): '.$nextRecsCount.'<br>';
  if (($nextRecsCount - $recsCount) < 0) {
    $nextRecsCount = 0;
  } else {
    $nextRecsCount = $nextRecsCount - $recsCount;
  }
  display($nextRecsCount,$recsCount);
  $_SESSION['nextRecsCount'] = $nextRecsCount;
} elseif (isset($_POST['detailsShow'])) {
  echo '<script type="text/JavaScript"> document.getElementById("divDetails").style.display = "";</script>';
} elseif (isset($_POST['filterShow'])) {
  //divDetails
  echo '<script type="text/JavaScript"> document.getElementById("divFilters").style.display = "";</script>';
}
if (isset($_POST['getStat'])) {
  getUserDataPHP();
}
if (isset($_POST['getFilteredData'])) {
  $recsCount = isset($_POST['pCount'])? $_POST['pCount']:10;
  echo 'only show: '.$recsCount.' records<br>';
  getFilteredUserData($recsCount);
}
//echo displayAllTAbles(); //displayAllTAbles - to place a selection of tables
function display($startFrom = 0, $recordsDisplayCount = 1) {
  $pagesCount = $recordsDisplayCount;
  $tabName = $_POST['tabName'];
  //$sql = "SELECT * FROM Orders LIMIT 30";
  if (strcasecmp($tabName, "tabusers") == 0) {
    // The strcasecmp() function is a built-in function in PHP and is used to compare two given strings.
    //  It is case-insensitive:  strcasecmp($string1, $string2)
    /* This function returns an integer based on the conditions as described below:
      strcasecmp() returns 0 – if the two strings are equal.
      strcasecmp() returns < 0 – if string1 is less than string2
      strcasecmp() returns > 0 – if string1 is greater than string2
    */
    $countUniqueuId = getCountBy('uId',1);
    $countUniqueuIUN = getCountBy('uIUN',1);
    $countUniqueuFName = getCountBy('uFName',1);
    if (!isset($_SESSION['nextRecsCount'])) {
      $_SESSION['nextRecsCount'] = $recordsDisplayCount;
    } else {
      $_SESSION['nextRecsCount'] = $recordsDisplayCount;
    }
    //navTabCenterCell
    // div id="divNavBtn" class="naviButtonsDiv"
    echo '<script type="text/JavaScript"> document.getElementById("divNavBtn").style.display = "";</script>';

    $msgStr = 'Total records('. $countUniqueuId .'),<br> where unique'.
          '  By[uIUN]: '. $countUniqueuIUN.
          ' ;  By[uFName]:  '.$countUniqueuFName.
          ' records<br>';
    echo '<script type="text/JavaScript"> document.getElementById("navTabCenterCell").innerHTML = "'.
          $msgStr.'";</script>';
  }
  // echo 'Showing up to '. $pagesCount.' records<br>';
  $outVar = "<br>";
    $connection = createConnection (DBHOST, DBUSER, DBPASS, DBNAME);
    //test if connection failed
    if(mysqli_connect_errno()){
        die("connection failed: "
            . mysqli_connect_error()
            . " (" . mysqli_connect_errno()
            . ")");
    }
    //echo '<br> ... still alive<br>';
    //get results from database
    $query = "SELECT * FROM ".$tabName." LIMIT ".$startFrom.", ".$pagesCount.";";
    $result = mysqli_query($connection,$query);
    $run = $connection->query($query) or die("Last error: {$connection->error}\n");
    $all_property = array();  //declare an array for saving property
    //echo '<br> ... still alive<br>';
    //showing property
    echo '<br><table class="allColsTable"><tr class="data-heading">';  //initialize table tag
    while ($property = mysqli_fetch_field($result)) {
        echo '<td>' . $property->name . '</td>';  //get field name for header
        array_push($all_property, $property->name);  //save those to array
    }
    echo '</tr>'; //end tr tag
    $ind = 0;
    //showing all data
    while ($row = mysqli_fetch_array($result)) {
        foreach ($all_property as $item) {
          $strCellData = $row[$item];
          if (($item == 'uRetryCount') && ($row[$item] > $GLOBALS[retryLimit])) {
              echo '<td class="allColsTableTd" style="color:red;"><strong>' . $strCellData . '</strong></td>';
          } else {
            echo '<td class="allColsTableTd">' . $strCellData . '</td>'; //get items using property value
          }
          // $strToShow =  $row[$item];
          // // if (strlen($strToShow) > 5) {
          // //   //$strToShow = '<textarea readonly rows="4" cols="20">'.$strToShow.'</textarea>';
          // //   echo '<td style="width:20px">' . $strToShow . '</td>';
          // // } else {
          //   echo '<td class="allColsTableTd">' . $strToShow . '</td>'; //get items using property value
          // // }
        }
        echo '</tr>';
        $ind++;
    }
    echo "</table>";
    echo "<hr/>Total: ".$ind." rows displayed <br>";
    mysqli_close($connection);
    //echo $outVar;
?><script type="text/JavaScript">
          var toDisplay = '<?php echo $outVar ?>';
          var resultsContainer = document.getElementById("dbShow");
          resultsContainer.innerHTML = `${toDisplay}`;

          var selectedValue = document.getElementById('tabsFromDB').value;
          //alert ('selected: '+selectedValue);
          resultsContainer = document.getElementById('tabName');
          resultsContainer.value = `${selectedValue}`;
  </script><?php
}
function getUserDataPHP() {
  $outVar = "<br>";
    //$tabName = $_POST['tabName']; //tabusers
      $tabName = 'tabusers';
  $userID = $_POST['userIUNVar'];
//  $text="<script type='text/JavaScript'>document.writeln(document.getElementById('userIUNVar').innerHTML);</script>";
  echo 'userID: '.$userID.'<br>';
  echo 'Sorting ascending by less time elapsed time (column name is uTimer) and only those finished the task: <br>';
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
  echo '<br><table class="data-table" style="table-layout: auto;" ><tr class="data-heading">';  //initialize table tag
  while ($property = mysqli_fetch_field($result)) {
      echo '<td>' . $property->name . '</td>';  //get field name for header
      array_push($all_property, $property->name);  //save those to array
  }
  echo '</tr>'; //end tr tag
  //showing all data
  while ($row = mysqli_fetch_array($result)) {
      echo "<tr>";
      foreach ($all_property as $item) {
          echo '<td>' . $row[$item] . '</td>'; //get items using property value
      }
      echo '</tr>';
  }
  echo "</table>";
  mysqli_close($connection);
}
function getFilteredUserData($limitRecords = 10) {
  $outVar = "<br>";
    //$tabName = $_POST['tabName']; //tabusers
      $tabName = 'tabusers';
  $userID = $_POST['userIUNVar'];
//  $text="<script type='text/JavaScript'>document.writeln(document.getElementById('userIUNVar').innerHTML);</script>";
  echo 'Showing filtered data:<br>';
  $connection = createConnection (DBHOST, DBUSER, DBPASS, DBNAME);
  if(mysqli_connect_errno()){
      die("connection failed: "
          . mysqli_connect_error()
          . " (" . mysqli_connect_errno()
          . ")");
  }
  // <input type="checkbox" value="getAll" name="allStat" > Get Statistics </input>
  // <input type="checkbox" value="getFinished" name="allFinished" >All Finished </input>
  // <input type="checkbox" value="sortBestTime" name="sortBestTime" >Sort By Best time </input>
  if (!empty($_POST['allStat']) && !empty($_POST['allFinished']) && empty($_POST['sortBestTime']))  {
    $query = "SELECT * FROM ".$tabName." WHERE uIsFinished=1 ";
    echo "Show only finished users results not sorted: <".$_POST['allFinished']."><br>";
  } elseif  (!empty($_POST['allStat']) && !empty($_POST['sortBestTime'])) {
    $query = "SELECT * FROM ".$tabName." ORDER BY uTimer,uRetryCount,uTotalScore ASC";
    echo "Show all but sort by uTimer,uRetryCount,uTotalScore ASC: <".$_POST['allStat']."><br>";
  } elseif (!empty($_POST['allFinished']) && ($_POST['allFinished'] == "getFinished") && empty($_POST['sortBestTime'])) {
    $query = "SELECT * FROM ".$tabName." WHERE uIsFinished=1 ORDER BY uId ASC";
    echo "Show only finished users results sorted by user IUN: <".$_POST['allFinished']."><br>";
  } elseif (!empty($_POST['sortBestTime']) && !empty($_POST['allFinished'])) {
    $query = "SELECT * FROM ".$tabName." WHERE uIsFinished=1 ORDER BY uTimer ASC";
    echo "Show best time for Finished ONLY: <".$_POST['sortBestTime']."><br>";
  } elseif (!empty($_POST['sortBestTime']) && empty($_POST['allFinished'])) {
    $query = "SELECT * FROM ".$tabName." ORDER BY uTimer,uId,uRetryCount ASC";
    echo "Show best time for Finished ONLY sorted by Best Time, IUN and retries count: <".$_POST['sortBestTime']."><br>";
  } else {
    $query = "SELECT * FROM ".$tabName." ORDER BY uId ASC";
    echo "Sorted by userIUN show all results: <".$_POST['allStat']."> and <".$_POST['allFinished']."><br>";
  }
  $query = $query.' LIMIT '.$limitRecords;
  //$query = "SELECT * FROM ".$tabName." WHERE uIsFinished=1 AND uIUN LIKE '".$userID."%'"." ORDER BY uTimer,uRetryCount,uTotalScore ASC";
  $result = mysqli_query($connection,$query);
  $run = $connection->query($query) or die("Last error: {$connection->error}\n");
  $all_property = array();  //declare an array for saving property
  //echo '<br> ... still alive<br>';
  //showing property
  echo '<br><table class="data-table" style="table-layout: inline;"><tr class="data-heading">';  //initialize table tag
  $countCol = -1;
  while ($property = mysqli_fetch_field($result)) {
      echo '<td>' . $property->name . '</td>';  //get field name for header
      array_push($all_property, $property->name);  //save those to array
      $countCol++;
  }
  echo '</tr>'; //end tr tag
  // echo 'Var countCol: '.$countCol.'<br>';
  $tabWidth = (int)(100 / $countCol);
  $ind = 0;
  //showing all data
  while ($row = mysqli_fetch_array($result)) {
      echo "<tr>";
      foreach ($all_property as $item) {
        $strCellData = $row[$item];
        if (($item == 'uRetryCount') && ($row[$item] > $GLOBALS[retryLimit])) {
            echo '<td style="color:red; width: '.$tabWidth.'; "><strong>' . $strCellData . '</strong></td>';
        } else {
          echo '<td style="width: '.$tabWidth.';">' . $strCellData . '</td>'; //get items using property value
        }
      }
      echo '</tr>';
      $ind++;
  }
  echo "</table>";
  echo "<hr/>Total: ".$ind." rows displayed <br>";
  mysqli_close($connection);
}
function displayDBTAblesInAList() {
  //to create a select HTML object with tables names
  $outVar = "";
    $conn = createConnection (DBHOST, DBUSER, DBPASS, DBNAME);

    // Check connection
    if ($conn->connect_error) {
        die("Connection with the database failed: </br>" . $conn->connect_error);
    }
    if($result = $conn->query('SHOW TABLES')){
      while($row = $result->fetch_array()){
        $tables[] = $row[0];
      }
    }
    // $outVar = '<select name=\"tabsFromDB\" onchange=\"this.form.submit();\">';
    foreach($tables as $key => $value) {
      if ($value == "tabusers") {
        $outVar .= '<option value="'.$value.'" selected>'.$value.'</option>';
      } else {
        $outVar .= '<option value="'.$value.'">'.$value.'</option>';
      }
    }
    //echo 'outVar: '.$outVar."<br>";
    //$outVar = $outVar . "</select>";
mysqli_close($connection);
return $outVar;
}
function getCountBy($colName,$isUnique = 0) {
  $tabName = $_POST['tabName'];
  if ($tabName == "") {
    die("Error! Nodata provided!<br>");
  }
  //echo "isUnique: ".$isUnique." vardump: ".var_dump($isUnique)."<br>";
  //echo 'tabName: '.$tabName.'<br><br>';
  $query = "SELECT * FROM '.$tabName.';";
  //getting statistics by a certain field name, default - unique records (1):
  if ($isUnique == 0) {
    // not uniqe, but all records to count
    $query = "SELECT ".$colName." FROM ".$tabName.";";
    //echo 'All $query: '.$query.'<br>';
  } else {
    //count only uniqe
    $query = "SELECT DISTINCT ".$colName." FROM ".$tabName.";";
   //echo 'Unique $query: '.$query.'<br>';
  }
  $connection = createConnection (DBHOST, DBUSER, DBPASS, DBNAME);
    if(mysqli_connect_errno()){
        die("connection failed: "
            . mysqli_connect_error()
            . " (" . mysqli_connect_errno()
            . ")");
    }
    //$query = "SELECT uIUN FROM ".$tabName.";";
    $result = mysqli_query($connection,$query);
    $run = $connection->query($query) or die("Last error: {$connection->error}\n");
    //$all_property = array();  //declare an array for saving property
    //showing property
    $countCol = 0;
    while ($row = mysqli_fetch_array($result)) {
        $countCol++;
    }
    mysqli_close($connection);
    return $countCol;
}?>
