<?php
        require_once('../lib/config.php');
        require_once('../lib/functions.php');
        require_once('../lib/classes.php');
    // by Alexey Zapromyotov (c) 2019
      session_start();
      if (!isset($_SESSION['time'])) {
          $_SESSION['time'] = date("H:i:s");
      }
      $_SESSION['id'] = uuid();
      $sessionID = $_SESSION['id'];

    $connVar = createConnection (DBHOST, DBUSER, DBPASS, DBNAME);
    $listOfAllQ = getAllQuestions("tabquestions",$connVar);
    $jsonListAllQ = [];
    foreach ($listOfAllQ as $question) {
      // code...
      //going over a llist of questions to create a JSON array:
      $qId = $question->get_qId();
      $text = base64_encode($question->get_qTxt());
      $questionURL = $question->get_questionURL();
      $jsonListAllAns = [];
      $jsonListAllAnsFRA = [];
      $answers = $question->get_listAnswers();
      $textFRA = base64_encode($question->get_qTxtFRA()); //qTxtFRA
      $ansIndex = 0;
      $correctAns = 0;
        shuffle($answers);
        foreach ($answers as $answer) {
          // code...
          $arrAnswers = array('key'=>$ansIndex+1,'value'=>(base64_encode($answer->get_ansTxt())));
          $arrAnswersFRA = array('key'=>$ansIndex+1,'value'=>(base64_encode($answer->get_ansTxtFRA())));
          $jsonListAllAns[] = $arrAnswers;
          $jsonListAllAnsFRA[] = $arrAnswersFRA;
          if ($answer->get_ansIsValid() == 1) {
            // code...
            $correctAns = $ansIndex;
          }
          $ansIndex++;
        }

        $arr = array ('qId'=>$qId , 'question'=>$text , 'answers'=>$jsonListAllAns, 'correctAnswer'=> $correctAns,
                        'questionURL' => $questionURL, 'questionFRA'=>$textFRA, 'answersFRA'=>$jsonListAllAnsFRA );
        //echo "<br/>".$arr['questionurl']."<br/>";
        $jsonListAllQ[] = $arr;
    }
    shuffle($jsonListAllQ); //
    $creator = "by Alexey Zapromyotov (c) 2019";
    // echo '<br>=====<br>';
    $mazeMapArr = mazeStruc();
    $maxYSize = count($mazeMapArr) - 1; //array indexes starts from 0
    $maxXSize = count(reset($mazeMapArr)) - 1;
    $jsonListAllQuestions = $jsonListAllQ;
    $jsonListAllQ = json_encode($jsonListAllQ);

    $mazeQuestionsArr = mazeQuestionsArr($mazeMapArr,$jsonListAllQ); // create questionMAP
    $mazeWithRoomsDoors = mazeRoomsDoors($mazeMapArr); // create DoorsMap

    $megaMAP = array ( 'initMAP' => $mazeMapArr, 'questionMAP' => $mazeQuestionsArr, 'doorsMAP' => $mazeWithRoomsDoors, 'questionList' =>  $jsonListAllQuestions, 'sessionId' => $sessionID);

    // $arrMazeInit = json_encode($mazeMapArr);
    // $mazeQuestionsArr = json_encode($mazeQuestionsArr);
    // $mazeWithRoomsDoors = json_encode($mazeWithRoomsDoors);
header('Content-Type: application/json');
echo json_encode($megaMAP);

?>
