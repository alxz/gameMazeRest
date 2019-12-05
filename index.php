<html lang="en">
<head>

<?php
  if (!empty($_POST['userId'])) {
     $userId = $_POST['userId'];
      } else {
      $userId = 'UNKNOWN';
    }
    //echo ($userId);
?>

   <meta charset="UTF-8" />
   <title>Security Week Challenge Game</title>
    <script src="js/phaser.js"></script>
   <script src="//cdn.jsdelivr.net/npm/phaser@3.11.0/dist/phaser.js"></script>
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
       <h1>Welcome &nbsp;
         <span id="userIUNBox"><?php echo $userId ?> </span> &nbsp;
<!--           <input type="text" name="userIUNBox"> &nbsp;-->
           Time elapsed: <span id="userTimer"></span></h1>
       <br/>
   </div>
   <div id="mainDiv" class="classmainDiv">
     <div id="phaserDiv" class="classPhaserDiv">
         <canvas></canvas>
     </div>
       <br/><br/>
     <div id="mazeWDrsRmsMap" class="mazeContainerRight"></div>
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

    <div id="video"
         class="video-container"
         style="display: none">
         <span class="video-close" id="closeVideo"> [X] </span>
         <p><br>
            <h1><span id="vidScrTxt" class="vidScrMessage">Sorry, wrong answer!!!</span></h1>
            <h1><span id="vidScrTxt2" class="vidScrMessage">You will have to watch the video to find the right answer:</span></h1>
            <br><br>
         </p>
         <div id="divVidPlayer">
<!--            <video id="vplayer" class="video-player" controls width="450">-->
                <!-- <source src="video/vid00001.mp4" type="video/mp4"> Sorry, your browser doesn\'t support embedded videos.</video> -->
         </div>
    </div>
    <div id="finScr"
         class="finScr-container"
         style="display: none">
         <br><br>
          <p><h3><span id="finScrTxtLine1" class="finMessage">Congratulations!</span></h3></p>
          <h3><span id="finScrTxtLine2" class="finMessage"></span></h3>
          <h3><span id="finScrTxtLine3" class="finMessage"></span></h3>
          <h3><span id="finScrTxtLine4" class="finMessage"></span></h3>
         <br>
         <span class="finQuestions">
            1.	Did you enjoy playing an educational game as a tool for learning? <br>
            &nbsp; &nbsp; (Please rate your answer from 1 [min] to 5 [max]):&nbsp;
          </span>
          <div class="divStars">
              <span class="starStyle" id="star1" onclick="star(1);">&#9733;</span>
              <span class="starStyle"  id="star2" onclick="star(2);">&#9733;</span>
              <span class="starStyle"  id="star3" onclick="star(3);">&#9733;</span>
              <span class="starStyle"  id="star4" onclick="star(4);">&#9733;</span>
              <span class="starStyle" id="star5" onclick="star(5);">&#9733;</span>
          </div><br>
         <span class="finQuestions">
            2.	What did you prefer the most and what did you like the least about it? <br>
            &nbsp; &nbsp; (Please say a few words... ):&nbsp;
          </span><br><br>
         <textarea id="finQ2" name="finQ2" rows="5" ols="35" wrap="hard" maxlength="250"></textarea><br><br>

         <span class="finQuestions">
            3.	What would you suggest as an improvement for the future? <br>
            &nbsp; &nbsp; (Please say a few words... ):&nbsp;
          </span><br><br>
         <textarea id="finQ3" name="finQ3" rows="5" ols="35" wrap="hard" maxlength="250"></textarea><br><br>
          <button id="finSubmit" >Submit</button> &nbsp;&nbsp;&nbsp;
          <button id="finExit" >Exit</button>
    </div>


    <!-- <script>
        const Http = new XMLHttpRequest();
        const url='https://www.mymuhc.muhc.mcgill.ca/a/a.php';
        Http.open("GET", url);
        Http.send();

        Http.onreadystatechange = (e) => {
          console.log(Http.responseText)
        }

                //   this.load.json('userInfo', 'https://www.mymuhc.muhc.mcgill.ca/a/a.php');
                //   userInfo = game.cache.json.get('userInfo');
                //   userIUN = (userInfo.REMOTE_USER);
                //   console.log('User name: ' + userIUN);
                // } catch (e) {
                //   console.log('Error retrieving user name! Will use the defaul supplied. ' + e);
                // } finally {
                //   console.log('User name: ' + userIUN);
                // }
     </script> -->
    <script src="./js/miniMap.js" type="text/javascript"></script> <!-- Load phase file -->
    <script src="./js/game.js" type="text/javascript"></script> <!-- Load phase file -->

</body>
</html>
