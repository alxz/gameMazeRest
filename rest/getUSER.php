<?php
require_once('../lib/functions.php');
require_once('../lib/classes.php');
require_once('../lib/config.php');
//this is used to retrieve userID
// $service_url = 'https://www.mymuhc.muhc.mcgill.ca/a/a.php';
// <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN">
?>
<!DOCTYPE HTML>
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
        var selectedValue = document.getElementById('pCount').value;
        var pCountLabel = document.getElementById('pCountLabel');
        pCountLabel.innerHTML = selectedValue;
        console.log('pCount = ' + selectedValue);
        //resultsContainer.value = '' + selectedValue + '';
      }
  </script>
  <!-- /updateRowsCount -->
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
}
th, td {
  text-align: left;
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
  width: 45%;
}
.tdRight {
  text-align: right;
  align: right;
  margin-right: 20px;
  padding-right: 20px;
  width: 45%;
}
.tdCenter {
  text-align: center;
  align: cite;
  width: 30px;
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
        <th class="tdRight">Here are the tables we have:</th>
        <th class="tdCenter">Number of rows:</th>
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
          <?php for($i=25;$i<=200; $i+=25):?>
              <option value="<?php echo $i;?>" <?php echo $i==$pageno? 'selected':'';?> ><?php echo $i;?></option>
          <?php endfor;?>
          </select>
        </td>
        <td class="tdLeft">
          <input type="text" id="tabName" value="tabusers" name="tabName" />
        </td>
      </tr>
      <tr class="trCentered">
        <td class="tdRight">
            <button type="submit" value="GetPrevious" name="submitPrev"> << </button>
          <button type="submit" value="Submit Request" name="submit">Display</button>
            <button type="submit" value="GetNext" name="submitNext"> >> </button>
        </td>
        <td class="trCentered">
          <span id="pCountLabel"></span>
        </td>
        <td class="tdLeft">
          <button onclick="history.go(-1);">Back</button>
        </td>
      </tr>
  </table>
  </div>
  <div id="dbShow">
  </div>
</div>
<hr/><br>
<button type="submit" value="filterShow" name="filterShow">Select Filters</button>
&nbsp; &nbsp; &nbsp;
<button type="submit" value="detailsShow" name="detailsShow">A User Details</button>
&nbsp; &nbsp;
<div id="divFilters" class="filters-hidden" style="display: none;">
  <div id="divButton">
    <input type="checkbox" value="getAll" name="allStat" >All Statistics</input>
     &nbsp; &nbsp;
    <input type="checkbox" value="getFinished" name="allFinished" >All Finished</input>
     &nbsp; &nbsp;
    <input type="checkbox" value="sortBestTime" name="sortBestTime" >Sort By Best time </input>
    <br/><hr/><br/><br/>
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
//echo displayAllTAbles(); //displayAllTAbles - to place a selection of tables
function display() {
  // if (isset($_GET['page'])) {
  //   echo 'Pages Count: '.$_GET['page'];
  // }
  $pagesCount = isset($_POST['pCount'])? $_POST['pCount']:'';
  //$pagesCount = $_GET['pCount'];
  echo 'Showing first '. $pagesCount.' records';
  //$sql = "SELECT * FROM Orders LIMIT 30";

  $outVar = "<br>";
    $tabName = $_POST['tabName'];
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
    $query = "SELECT * FROM ".$tabName." LIMIT ".$pagesCount;
    $result = mysqli_query($connection,$query);
    $run = $connection->query($query) or die("Last error: {$connection->error}\n");
    $all_property = array();  //declare an array for saving property
    //echo '<br> ... still alive<br>';
    //showing property
    echo '<br><table class="data-table" style="table-layout: auto;"><tr class="data-heading">';  //initialize table tag
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
    //echo $outVar;
?>
        <script type="text/JavaScript">
          var toDisplay = '<?php echo $outVar ?>';
          var resultsContainer = document.getElementById("dbShow");
          resultsContainer.innerHTML = `${toDisplay}`;

          var selectedValue = document.getElementById('tabsFromDB').value;
          //alert ('selected: '+selectedValue);
          resultsContainer = document.getElementById('tabName');
          resultsContainer.value = `${selectedValue}`;
        </script>
<?php
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
}

function getFilteredUserData() {
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

  //$query = "SELECT * FROM ".$tabName." WHERE uIsFinished=1 AND uIUN LIKE '".$userID."%'"." ORDER BY uTimer,uRetryCount,uTotalScore ASC";
  $result = mysqli_query($connection,$query);
  $run = $connection->query($query) or die("Last error: {$connection->error}\n");
  $all_property = array();  //declare an array for saving property
  //echo '<br> ... still alive<br>';
  //showing property
  echo '<br><table class="data-table" style="table-layout: auto;"><tr class="data-heading">';  //initialize table tag
  $countCol = -1;
  while ($property = mysqli_fetch_field($result)) {
      echo '<td>' . $property->name . '</td>';  //get field name for header
      array_push($all_property, $property->name);  //save those to array
      $countCol++;
  }
  echo '</tr>'; //end tr tag
  // echo 'Var countCol: '.$countCol.'<br>';
  $tabWidth = (int)(100 / $countCol);
  //showing all data
  while ($row = mysqli_fetch_array($result)) {
      echo "<tr>";
      foreach ($all_property as $item) {
          echo '<td style="width: '.$tabWidth.';">' . $row[$item] . '</td>'; //get items using property value
      }
      echo '</tr>';
  }
  echo "</table>";
}


if(isset($_POST['submit'])) {
  $doc = new DomDocument;
  // We need to validate our document before refering to the id
  $doc->validateOnParse = true;
  //$doc->Load('book.xml');
  //$dom->loadHTMLFile('getUSER.php');
  //echo "The element whose id is pCount is: " . $doc->getElementById('pCount')->value . "\n<br>";
  display();
} elseif (isset($_POST['detailsShow'])) {
  //echo 'HellO!';
  //divDetails
  echo '<script type="text/JavaScript"> document.getElementById("divDetails").style.display = "";</script>';
  // echo '<script type="text/JavaScript">'
  //       .'document.getElementById("divButton").innerHTML = \'<button type="submit" value="getStat" name="getStat" onclick="getUserData()"> Get Statistics </button>\';</script>';
  // echo '<br/><hr/><br/>';
  //getUserDataPHP();
  // $("#finSubmit").unbind("click");
  // $("#finSubmit").bind("click", getUserData);
  //$varDetails = $_POST['detailsShow'];
  //var_dump(isset($varDetails));

} elseif (isset($_POST['filterShow'])) {
  //divDetails
  echo '<script type="text/JavaScript"> document.getElementById("divFilters").style.display = "";</script>';
}

if (isset($_POST['getStat'])) {
  // code...
  getUserDataPHP();
}
if (isset($_POST['getFilteredData'])) {
  getFilteredUserData();
}



// if(isset($_POST['update']))
// {
//       $tabName = $_POST['tabName'];
//       echo '<br>Updating: $tabName<br>';
//       $qTxt = "";
//       $qIsTaken = 0;
//       $qIsAnswered = 0;
//       $questionURL = "";
//       // Create connection
//       $conn = createConnection (DBHOST, DBUSER, DBPASS, DBNAME);
//       // Check connection
//       if (!$conn) {
//           die("Connection failed: " . mysqli_connect_error());
//       }
//
//       $sql = "INSERT INTO $tabName (qTxt, qIsTaken, qIsAnswered, questionURL)
//       VALUES ('$qTxt', $qIsTaken, $qIsAnswered, $questionURL)";
//
//       if (mysqli_query($conn, $sql)) {
//           //echo "<br> New record created successfully <br>";
//           echo "INSERTED";
//       } else {
//         http_response_code(500);
//           echo "Error: " . $sql . "<br>" . mysqli_error($conn);
//       }
//
//       mysqli_close($conn);
//
// }
// if(isset($_POST['tabsFromDB'])) {
//   $selectionMade = $_POST['tabsFromDB'];
//   echo $selectionMade;
// }
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
      // code...
      if ($value == "tabusers") {
        $outVar .= '<option value="'.$value.'" selected>'.$value.'</option>';
      } else {
        $outVar .= '<option value="'.$value.'">'.$value.'</option>';
      }
    }
    //echo 'outVar: '.$outVar."<br>";
    //$outVar = $outVar . "</select>";

return $outVar;
}

?>
