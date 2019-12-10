<!doctype html> <html lang="en">
<?php
  $userId = 'UNKNOWN';
    //languages
  $languages = 'FRA';
  $langLabel = 'English';

  if (!empty($_POST['languages'])) {
    if ($_POST['languages'] == 'French') {
      $languages = 'FRA';
      $langLabel = 'English';
    } else if ($_POST['languages'] == 'English') {
      $languages = 'ENG';
      $langLabel = 'Francais';
    }
  }

  try {
    //include('https://www.mymuhc.muhc.mcgill.ca/a/a.php');
    //$userId = $_SERVER['REMOTE_USER'];
    if(isset($_SERVER['REMOTE_USER'])) {
      $userId = $_SERVER['REMOTE_USER'];
    }
  } catch (\Exception $e) {
    $errorLog = $e;
  }

  if (!empty($_POST['userId'])) {
     $userId = $_POST['userId'];
      } else {
      $userId = 'UNKNOWN';
    }
    //echo ($userId);
?>
<head>
   <meta charset="UTF-8" />
   <title>Security Week Challenge Game</title>
    <script src="js/phaser.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/phaser@3.21.0/dist/phaser.js"></script>
    <script src="//cdn.jsdelivr.net/npm/phaser@3.21.0/dist/phaser.min.js"></script>
   <!-- <script src="//cdn.jsdelivr.net/npm/phaser@3.16.2/dist/phaser.js"></script> -->
   <link rel="stylesheet" href="css/style.css">
   <script src="js/jquery-3.4.1.min.js"></script>
   <script src="lib/easytimer.min.js" type="text/javascript"></script>
   <style type="text/css">
       body {
           margin: 0;
       }
   </style>
</head>
<body style="background-color: #333;">
   <div class="divTopLabel">
       <h1>Salut &nbsp;
         <span id="userIUNBox"><?php echo $userId ?> </span> &nbsp; * &nbsp;
         Timer: <span id="userTimer"></span> &nbsp; &nbsp; * &nbsp;
           <button id="langChange" class="buttonAsLink">
             <span id="languages"><?php echo $langLabel ?></span>
           </button>
       </h1>
       <br/>
   </div>
   <div id="mainDiv" class="classmainDiv">
     <div id="phaserDiv" class="classPhaserDiv">
         <canvas></canvas>
     </div>
       <br/><br/>
     <div id="mazeWDrsRmsMap" class="scoreAndMiniMap-container">
       <div id="divScoreText" class="scoreText-container"></div>
       <div id="divMiniMapText" class="scoreText-container"></div>
       <div id="divMiniMap" class="miniMap-container"></div>

     </div>
   </div>
   <div class="mapsCont">
     <div id="mazeMap" class="mazeContainerLeft"></div>
   </div>
    <div>
    <div id="mazeQeustions" class="mazeQuestions"></div>
    </div>
    <div id="question" style="display: none" class="question-popup">
        <div id="questionWindow" class="question-container question-hide">
            <div class="quiz-container">
                <div id="quiz">
                </div>
            </div>
            <div class="submitMsg-container">
                <div id="submitMsg">
                </div>
            </div>
            <button id="submit">Submit</button>
        </div>
    </div>

    <div id="video" class="video-container" style="display: none">
         <p>
            <h1><span id="vidScrTxt" class="vidScrMessage">Sorry, wrong answer!!!</span></h1>
         </p>
         <span class="video-close" id="closeVideo"> [X] </span>
         <div id="divVidPlayer">
         </div>
    </div>
    <div id="finScr"
         class="finScr-container"
         style="display: none">
         <br><br>
          <p><h3><span id="finScrTxtLine1" class="finMessage">Félicitations! Congratulations!</span></h3></p>
          <h3><span id="finScrTxtLine2" class="finMessage"></span></h3>
          <h3><span id="finScrTxtLine3" class="finMessage"></span></h3>
          <h3><span id="finScrTxtLine4" class="finMessage"></span></h3>
         <br>
         <span class="finQuestions">
            1. Avez-vous aimé jouer à un jeu éducatif comme outil d'apprentissage?<br>
            &nbsp;	Did you enjoy playing an educational game as a tool for learning?  <br>
          </span>
          <div class="divStars">
              <span class="starStyle" id="star1" onclick="star(1);">&#9733;</span>
              <span class="starStyle"  id="star2" onclick="star(2);">&#9733;</span>
              <span class="starStyle"  id="star3" onclick="star(3);">&#9733;</span>
              <span class="starStyle"  id="star4" onclick="star(4);">&#9733;</span>
              <span class="starStyle" id="star5" onclick="star(5);">&#9733;</span>
          </div><br>
         <span class="finQuestions">
            2. Qu'avez-vous aimé le plus et qu'avez-vous le moins aimé du jeu? <br>
            &nbsp; 	What did you prefer the most and what did you like the least about it?
          </span><br><br>
         <textarea id="finQ2" name="finQ2" rows="3" cols="65" wrap="hard" maxlength="250" placeholder="Please say a few words..."></textarea><br><br>

         <span class="finQuestions">
            3. Que suggéreriez-vous comme une amélioration pour l'avenir? <br>
            &nbsp; 	What would you suggest as an improvement for the future?
          </span><br><br>
         <textarea id="finQ3" name="finQ3" rows="3" cols="65" wrap="hard" maxlength="250" placeholder="Please say a few words..."></textarea><br><br>
          <button id="finSubmit" >Submit</button>
    </div>

    <script src="./js/miniMap.js" type="text/javascript"></script> <!-- Load phase file -->
    <script src="./js/game.js" type="text/javascript"></script> <!-- Load phase file -->

</body>
</html>
