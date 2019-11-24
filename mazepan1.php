<!doctype html> 
<html lang="en"> 
<head>
    <?php
        /* // // Create connection
        session_start();
        require_once('config.php');
        require_once('functions.php');
        require_once('classes.php');
        if (!isset($_SESSION['time'])) {
        $_SESSION['time'] = date("H:i:s");
        }
        $_SESSION['id'] = uuid();
        $sessionID = $_SESSION['id'];

        if (isset($_POST['userId'])) {
          $userIUN = $_POST['userId'];
        } else {
          $userIUN = "JOHN-DOE";
        } */
    ?>
 
    <meta charset="UTF-8" />
    <title>Maze Pan with Phaser 3 Game</title>
    <script src="//cdn.jsdelivr.net/npm/phaser@3.11.0/dist/phaser.js"></script>
    <style type="text/css">
        body {
            margin: 0;
        }
    </style>
</head>
<body>
    <div>
        <h1>Maze Game To demonstrate a phaser engine!</h1>
    </div>
    <div id="phaserDiv" class="classPhaserDiv">
        <canvas></canvas>
    </div>
    <div id="mazeWDrsRmsMap" class="mazeContainerRight"></div>
    <div class="mapsCont">
      <div id="mazeMap" class="mazeContainerLeft"></div>
    </div>
    <!-- <div id="results"></div>
      <script type="text/JavaScript">var scoreData = {};</script>
    <div id="result"></div>
 -->    <div>
      <div id="mazeQeustions" class="mazeQuestions"></div>
    </div>

</body>
</html>
<script type="text/php">

</script>
<script type="text/JavaScript">
  var isSurveySent = <?php echo $isSurveySent ?>;
  var listQuestions = <?php echo $jsonListAllQ ?>;
  var arrMazeInit = <?php echo $arrMazeInit ?>;
  var mazeQuestionsArr = <?php echo $mazeQuestionsArr ?>; //questions and answers JSON array
  var mazeWDrsRms =<?php echo $mazeWithRoomsDoors ?>;
  var startTime, endTime;
  var posX = 0; //player position at X-axis
  var posY = 0; // player position at Y-axis
  var numCorrect = 0;
  var starsCount = 1;
    var userName = "";
    var sessionID =  '<?php echo $sessionID ?>';
    var isCompleted = 0;
    var timeElapsedVar = 0;
    var isFinishedMaze = 0;
    var totalQuestAsked = 0;
    var questionsListStr = "";
    var commentsStr = "Have a nice day!";
    var maxYSize = <?php echo $maxYSize ?>; //Max axis Y
    var maxXSize = <?php echo $maxXSize ?>; // Max axis X
  startTimer(); //to start the timer event
  //showMaze(arrMazeInit, "mazeMap");
  showMazeGfx(mazeWDrsRms, "mazeWDrsRmsMap");
  //showMazeObj(mazeQuestionsArr, "mazeQeustions");


function showMaze (mazePassed,targetId) {
          //here we are going to display the maze table/array
          //const mazeDiv = document.getElementById("mazeMap");
          const mazeDiv = document.getElementById(targetId);
          var maze = mazePassed;
          mazeDiv.innerHTML = "MAP: "+targetId+ "<br>"+makeTableHTML(maze);
          // document.getElementById(mazePassed).className = "mazeContainerLeft";
            //mazeDiv.innerHTML = `${numCorrect} out of ${myQuestions.length}`;
        }

        function makeTableHTML(myArray) {
            var result = "<table id='table1' class='myTable'>";
            for(var i=0; i<myArray.length; i++) {
                result += "<tr>";
                for(var j=0; j<myArray[i].length; j++){
                  if ((i == posY) & (j == posX)) {
                    result += "<td>X</td>";
                  } else {
                    result += "<td>"+myArray[i][j]+"&nbsp; </td>";
                  }

                }
                result += "</tr>";
            }
            result += "</table>";
            return result;
        }

        function showMazeGfx (mazePassed,targetId) {
          //here we are going to display the maze table/array
          //const mazeDiv = document.getElementById("mazeMap");
          const mazeDiv = document.getElementById(targetId);
          var maze = mazePassed;
          mazeDiv.innerHTML = "Map: "+targetId+ "<br>"+makeTableHTMLGfx(maze);
          // document.getElementById(mazePassed).className = "mazeContainerLeft";
            //mazeDiv.innerHTML = `${numCorrect} out of ${myQuestions.length}`;
        }

        function makeTableHTMLGfx(myArray) {
            var result = "<pre><table id='table1'>";
            var resultStr ="";
            for(var i=0; i<myArray.length; i++) {
                result += "<tr>";
                for(var j=0; j<myArray[i].length; j++){
                    //result += "<td>"+myArray[i][j]+"</td>";
                    var obj = new Object(myArray[i][j]);
                    for(var key in obj)
                    {
                      var value = obj[key];
                      resultStr += (key.toLowerCase() + value + '');
                    }
                    tabCellXId = 'y' + i + 'x' + j;
                    result += '<td id="' + tabCellXId + '"><img src="./jpg/minimap/'+ resultStr +'.jpg" alt="[]" height="40" width="50"></td>';
                    resultStr = "";
                }
                result += '';
            }
            result += "</table></pre>";
            return result;
        }

        function showMazeObj (mazePassed,targetId) {
          //here we are going to display the maze table/array
          //const mazeDiv = document.getElementById("mazeMap");
          const mazeDiv = document.getElementById(targetId);
          var maze = mazePassed;
          mazeDiv.innerHTML = "MAP: "+targetId+ "<br>"+makeTableHTMLObj(maze);
          // document.getElementById(mazePassed).className = "mazeContainerLeft";
            //mazeDiv.innerHTML = `${numCorrect} out of ${myQuestions.length}`;
        }

        function makeTableHTMLObj(myArray) {
            var result = "<table id='table1' class='myTable' style='width: 90%;'>";
            var resultStr = "";
            for(var i=0; i<myArray.length; i++) {
                result += "<tr>";
                for(var j=0; j<myArray[i].length; j++){
                  //  result += "<td>"+myArray[i][j]+"&nbsp; </td>";
                  var obj = new Object(myArray[i][j]);
                  if (obj.qId == '-1') {
                    result = result + '<td> This room is EMPTY';
                    result += resultStr + '</td>';
                    resultStr = "";
                  } else {
                    result = result + '<td>';
                    resultStr = resultStr + 'Qid: ' + obj.qId + '; Text: ' + obj.qTxt + ' <br>';
                    resultStr = resultStr + 'validAnswer: ' + (parseInt(obj.validAnswer)+1)  + ' <br>' + ' listAnswers:<br>';

                    for (let key in obj.listAnswers) {
                      let value = obj.listAnswers[key];
                      //console.log(key, value);
                      resultStr = resultStr + 'Answer [' + (value.key) + '] value: ' + value.value + '<br>';
                    }
                    result += resultStr + '</td>';
                    resultStr = "";
                  }
                }
                result += "</tr>";
            }
            result += "</table>";
            return result;
        }

    //calculate time elapsed:
          function startTimer() {
            startTime = new Date();
          };

          function endTimer() {
            endTime = new Date();
            var timeDiff = endTime - startTime; //in ms
            // strip the ms
            timeDiff /= 1000;

            // get seconds
            var seconds = Math.round(timeDiff);
            //console.log(seconds + " seconds");
            return seconds;
          }
</script>

<script type="text/javascript">

        //const phaserDiv = document.getElementById('phaserDiv'); //mazeWDrsRmsMap          
        //phaserDiv.innerHTML = "";
       // document.getElementById('phaserDiv').textContent = Phaser;          

var App = function() {};

App.prototype.start = function() 
{
    var config = {
        type: Phaser.AUTO,
        width: 800,
        height: 600,
        physics: {
            default: 'arcade',
            arcade: {
                debug: false
            }
        },
        scene: {
            preload: preload,
            create: create,
            update: update
        },
        canvas: document.querySelector('canvas')
    };

        var player;
        var room;
        var stars;
        var bombs;
        var platforms;
        var cursors;
        var score = 0;
        var gameOver = false;
        var scoreText;

        var game = new Phaser.Game(config);

        function preload ()
        {
            this.load.json('megaMAP', '../rest/getMap.php');

            this.load.image('sky', 'assets/sky.png');
            this.load.image('ground', 'assets/platform.png');
            this.load.image('star', 'assets/star.png');
            this.load.image('bomb', 'assets/bomb.png');
            this.load.spritesheet('dude', 'assets/dude.png', { frameWidth: 32, frameHeight: 48 });
        }

        function create ()
        {
            console.log(game.cache.json.get('megaMAP'));
            //  A simple background for our game
            this.add.image(400, 300, 'sky');

            //  The platforms group contains the ground and the 2 ledges we can jump on
            platforms = this.physics.add.staticGroup();

            //  Here we create the ground.
            //  Scale it to fit the width of the game (the original sprite is 400x32 in size)
            platforms.create(400, 568, 'ground').setScale(2).refreshBody();

            //  Now let's create some ledges
            platforms.create(600, 400, 'ground');
            platforms.create(50, 250, 'ground');
            platforms.create(750, 220, 'ground');

            // The player and its settings
            player = this.physics.add.sprite(100, 450, 'dude');

            //  Player physics properties. Give the little guy a slight bounce.
            player.setBounce(0.2);
            player.setCollideWorldBounds(true);

            //  Our player animations, turning, walking left and walking right.
            this.anims.create({
                key: 'left',
                frames: this.anims.generateFrameNumbers('dude', { start: 0, end: 3 }),
                frameRate: 10,
                repeat: -1
            });

            this.anims.create({
                key: 'turn',
                frames: [ { key: 'dude', frame: 4 } ],
                frameRate: 20
            });

            this.anims.create({
                key: 'right',
                frames: this.anims.generateFrameNumbers('dude', { start: 5, end: 8 }),
                frameRate: 10,
                repeat: -1
            });

            //  Input Events
            cursors = this.input.keyboard.createCursorKeys();

            //  Some stars to collect, 12 in total, evenly spaced 70 pixels apart along the x axis
            stars = this.physics.add.group({
                key: 'star',
                repeat: 11,
                setXY: { x: 12, y: 0, stepX: 70 }
            });

            stars.children.iterate(function (child) {

                //  Give each star a slightly different bounce
                child.setBounceY(Phaser.Math.FloatBetween(0.4, 0.8));

            });

            bombs = this.physics.add.group();

            //  The score
            scoreText = this.add.text(16, 16, 'score: 0', { fontSize: '32px', fill: '#000' });

            //  Collide the player and the stars with the platforms
            this.physics.add.collider(player, platforms);
            this.physics.add.collider(stars, platforms);
            this.physics.add.collider(bombs, platforms);

            //  Checks to see if the player overlaps with any of the stars, if he does call the collectStar function
            this.physics.add.overlap(player, stars, collectStar, null, this);

            this.physics.add.collider(player, bombs, hitBomb, null, this);
        }

        function update ()
        {
            if (gameOver)
            {
                return;
            }

            if (cursors.left.isDown)
            {
                player.setVelocityX(-160);

                player.anims.play('left', true);
            }
            else if (cursors.right.isDown)
            {
                player.setVelocityX(160);

                player.anims.play('right', true);
            }
            else
            {
                player.setVelocityX(0);

                player.anims.play('turn');
            }

            if (cursors.up.isDown && player.body.touching.down)
            {
                player.setVelocityY(-330);
            }

        }

        function collectStar (player, star)
        {
            star.disableBody(true, true);

            //  Add and update the score
            score += 10;
            scoreText.setText('Score: ' + score);

            if (stars.countActive(true) === 0)
            {
                //  A new batch of stars to collect
                stars.children.iterate(function (child) {

                    child.enableBody(true, child.x, 0, true, true);

                });

                var x = (player.x < 400) ? Phaser.Math.Between(400, 800) : Phaser.Math.Between(0, 400);

                var bomb = bombs.create(x, 16, 'bomb');
                bomb.setBounce(1);
                bomb.setCollideWorldBounds(true);
                bomb.setVelocity(Phaser.Math.Between(-200, 200), 20);
                bomb.allowGravity = false;

            }
        }

        function hitBomb (player, bomb)
        {
            this.physics.pause();

            player.setTint(0xff0000);

            player.anims.play('turn');

            gameOver = true;
        }
};

window.onload = function()
{
    'use strict';    
    var app = new App();
    app.start();
}
</script>


