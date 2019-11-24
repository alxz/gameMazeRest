
<?php

        require_once('../lib/config.php');
        require_once('../lib/functions.php');
        require_once('../lib/classes.php');

    $connVar = createConnection (DBHOST, DBUSER, DBPASS, DBNAME);
    $listOfAllQ = getAllQuestions("tabquestions",$connVar);
    $jsonListAllQ = [];
    foreach ($listOfAllQ as $question) {
      // code...
      //going over a llist of questions to create a JSON array:
      $qId = $question->get_qId();
      $text = $question->get_qTxt();
      $jsonListAllAns = [];
      $answers = $question->get_listAnswers();
      $ansIndex = 0;
      $correctAns = 0;
        foreach ($answers as $answer) {
          // code...
          $arrAnswers = array('key'=>$ansIndex+1,'value'=>$answer->get_ansTxt());
          $jsonListAllAns[] = $arrAnswers;
          if ($answer->get_ansIsValid() == 1) {
            // code...
            $correctAns = $ansIndex;
          }
          $ansIndex++;
        }
      $arr = array ('qId'=>$qId , 'question'=>$text , 'answers'=>$jsonListAllAns, 'correctAnswer'=> $correctAns);
      $jsonListAllQ[] = $arr;
    }
    shuffle($jsonListAllQ);
    // echo '<br>=====<br>';
    $mazeMapArr = mazeStruc();
    $maxYSize = count($mazeMapArr) - 1; //array indexes starts from 0
    $maxXSize = count(reset($mazeMapArr)) - 1;

    $jsonListAllQ = json_encode($jsonListAllQ);
    
    $mazeQuestionsArr = mazeQuestionsArr($mazeMapArr,$jsonListAllQ); // create questionMAP
    $mazeWithRoomsDoors = mazeRoomsDoors($mazeMapArr); // create DoorsMap

    $megaMAP = array ( 'initMAP' => $mazeMapArr, 'questionMAP' => $mazeQuestionsArr, 'doorsMAP' => $mazeWithRoomsDoors );

    // $arrMazeInit = json_encode($mazeMapArr);
    // $mazeQuestionsArr = json_encode($mazeQuestionsArr);
    // $mazeWithRoomsDoors = json_encode($mazeWithRoomsDoors);


header('Content-Type: application/json');
echo json_encode($megaMAP);

?>