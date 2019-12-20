var App = function () {
};
// by Alexey Zapromyotov (c) 2019
var customIUN="";
App.prototype.start = function () {
    var config = {
        type: Phaser.CANVAS,
        width: 800,
        height: 520,
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
    var isBrowserIE = false;
    isBrowserIE = msieversion();
    var language = '';
    var megaMAP;
    var initMap;
    var roomsMAP = [];
    var userInfo;
    var userIUN;
    var player;
    var room;
    var stars;
    var theGameIsStarted = false;
    var platforms;
    var cursors;
    var score = 0;
    var gameOver = false;
    var scoreText;
    var scoreTextShade;
    var scoreTextShade0;
    var scoreImgs;
    var isPause = false;
    var keyIndex = 0;
    var mapLocContent;
    var game = new Phaser.Game(config);
    var _this;
    var position = {x: 0, y: 0};
    var initMapPos = {initX: 0, initY: 0};
    var maxRoomCountX;
    var maxRoomCountY;
    var hospitalBed;
    var totalQestionsAnswered = 0;
    var totalQestionsAsked = 0;
    var listofquestions = "";
    var doorsHolder = [];
    var music;
    var doorOpen;
    var soundStep;
    var pickupKey;
    var soundOk;
    var soundFail;
    var soundFinal;
    var gameState;
    var isSurveySent = false;
    var langLabel = '';

    var doorsArray = [];
    const questionWindow = document.getElementById("questionWindow");
    const video = document.getElementById("video");
    const finScr = document.getElementById("finScr");
    const divScoreText = document.getElementById("divScoreText");
    const submitAnswerButton = document.getElementById("submitAnswerButton");
    const submitMsgContainer = document.getElementById("submitMsg");

    // var tryUserIUN ="";
    // try {
    //     tryUserIUN = document.getElementById("userIUNBox").innerHTML;
    // } catch {
    //     console.log('variable tryUserIUN seems to be empty!');
    // }

    var tryUserIUN = document.getElementById("userIUNBox");
    if (tryUserIUN != null) {
        tryUserIUN = document.getElementById("userIUNBox").innerHTML;
        userIUN = tryUserIUN;
    } else {
            userIUN = 'UNKNOWN';
            console.log('element userIUNBox seems to be empty!');
    }

    console.log('userIUN from userIUNBox: ', userIUN);

    langLabel = document.getElementById("languages");
    if (langLabel != null) {
        langLabel = document.getElementById("languages").innerHTML; //id="languages"
    } else {
        langLabel = 'English';
    }

    // the language label has inversed logic:
    if (langLabel === 'English') {
      language = 'FRA';
    } else {
      language = 'ENG';
    }
    changeLanguage(false);

    //alert('Lang: ', language);
    //a button action to change the language:
    $("#langChange").unbind("click");
    $("#langChange").bind("click", changeLanguage);

    function preload() {
        this.load.json('megaMAP', 'rest/getMap.php');

        //this.load.image('sky', 'assets/sky.png');
        this.load.audio('theme', [
            'assets/bgCut1.mp3'
        ]);
        //baseRoomBack = RoomBG_red.png 1000 px X 650px
        // scale 0.8 we have: 800 x 520
        this.load.image('RoomBG_01', 'png/RoomBG_01_blue.png');
        this.load.image('RoomBG_02', 'png/RoomBG_02_yellow.png');
        this.load.image('RoomBG_03', 'png/RoomBG_03_red.png');
        this.load.image('RoomBG_04', 'png/RoomBG_04_green.png');
        this.load.image('RoomBG_05', 'png/RoomBG_05_orange.png');
        this.load.audio('soundStep', 'assets/walking0.mp3');

        this.load.audio('doorOpen', 'assets/doorOpen.mp3');
        this.load.audio('soundFail', 'assets/wrongAnswer.mp3');
        this.load.audio('pickupKey', 'assets/pickupKey.mp3');
        this.load.audio('soundOk', 'assets/okay.mp3');
        this.load.audio('soundFinal', 'assets/fanfareFinale.mp3');

        //this.load.image('baseRoomBack', 'png/RoomBG_red_withBG.png');
        this.load.image('finalRoom', 'png/RoomBG_01_final.png');
        // rooms assets section completed!
        this.load.image('hospitalBed', 'png/hospitalBed.png');
        //patientEmptyPlaceHolder.png
        this.load.image('patientEmptyPlaceHolder', 'png/patientEmptyPlaceHolder.png');
        //doors:
        this.load.spritesheet('doorU', 'png/doorUsprite.png', {frameWidth: 180, frameHeight: 180});
        this.load.spritesheet('doorD', 'png/doorDsprite.png', {frameWidth: 180, frameHeight: 180});
        this.load.spritesheet('doorL', 'png/doorLsprite.png', {frameWidth: 180, frameHeight: 180});
        this.load.spritesheet('doorR', 'png/doorRsprite.png', {frameWidth: 180, frameHeight: 180});
        //==============================================
        //blocks:
        //this.load.image('blockRed', 'png/block20x20red.png');
        this.load.image('blockRed', 'png/block20x20.png');
        //==================
        _this = this;
        this.load.image('gold-key', 'png/goldenKey.png'); //gold-key
        this.load.spritesheet('gold-key-sprite', 'png/gold-key.png', { frameWidth: 40, frameHeight: 40 });
        this.load.spritesheet('green-key-sprite', 'png/keyAnimation.png', { frameWidth: 40, frameHeight: 100 });
        this.load.image('messageBoard', 'png/messageBoard600x400.png');

        this.load.image('star', 'assets/star.png');
        //this.load.spritesheet('dude', 'assets/dude.png', { frameWidth: 32, frameHeight: 48 });
        //this.load.spritesheet('dude', 'png/docMUHCR4U1L4.png', {frameWidth: 50, frameHeight: 75});
        //docMUHC50x75L4U4D4R4
        //this.load.spritesheet('docOther', 'png/docOther.png', {frameWidth: 50, frameHeight: 75}); //docOther.png
        this.load.spritesheet('dude', 'png/docMUHC50x75L4U4D4R4.png', {frameWidth: 50, frameHeight: 75});
    }

    function buildGameState(userName, sessionId) {

        return {
            correctCount: 0,
            user: userName,
            customIUN: customIUN,
            isFinished: 0,
            elapsedTime: 0,
            timestart: startTime,
            timefinish: "",
            listofquestions: listofquestions,
            comments: "",
            sessionId: sessionId
        }
    }

    function create() {
      if (!isBrowserIE) {
        if (game.sound.context.state === 'suspended') {
          game.sound.context.resume();
        }
      }

        // init other states
        megaMAP = game.cache.json.get('megaMAP');
        this.cameras.main.setBackgroundColor('#333');
        gameState = buildGameState(userIUN, megaMAP.sessionId);
        gameState.user = userIUN;
        gameState.customIUN = customIUN;
        initMap = megaMAP.initMAP;
        maxRoomCountX = initMap[0].length;
        maxRoomCountY = initMap.length;

        //  music.play();
        //  this.input.addDownCallback(function() {
        //    if (game.sound.context.state === 'suspended') {
        //      game.sound.context.resume();
        //    }
        //  });

        showMazeGfx(megaMAP.doorsMAP, "divMiniMap",language);
        mapLocContent = document.getElementById("y0x0").innerHTML;
        cursors = this.input.keyboard.createCursorKeys();
        // walls = this.physics.add.staticGroup();
        // walls.create(160, 450, 'wall400x230').setScale(0.8).refreshBody();

        buildWorld(this);
        scoreTextShade0 = this.add.text(15, 15, 'keys: 0', {fontSize: '32px', fill: '#0031FF'});
        scoreTextShade = this.add.text(17, 17, 'keys: 0', {fontSize: '32px', fill: '#ff00ff'});

        scoreText = this.add.text(16, 16, 'keys: 0',
          {
            fontSize: '32px',
            fill: '#FDFC00',
            /* backgroundColor: '#479B85',*/
            shadow: "offsetX = 5, offsetY = 5, fill= true"
          });
          divScoreText.style = "scoreText-container";
          divScoreText.innerHTML = "You have keys: <br><hr/><br>";

        //scoreImgs = this.physics.add.group();

        this.cameras.main.startFollow(player);
        this.physics.add.collider(player, walls);
        this.physics.add.collider(player, doors, null, hitTheDoor, this);
        this.physics.add.collider(player, hospitalBed, null, breakingBad, this);
        this.physics.add.overlap(player, doorkeys, collectKey, null, this);
        music = this.sound.add('theme');
        soundStep = this.sound.add('soundStep');
        doorOpen = this.sound.add('doorOpen');
        pickupKey = this.sound.add('pickupKey');
        soundOk = this.sound.add('soundOk');
        soundFail = this.sound.add('soundFail');
        soundFinal = this.sound.add('soundFinal');

    }

    function breakingBad() {
        isPause = true;
        stopPlayer();
        //SOUND MUSIC STOPED To Debug IE11 issues
        if (!isBrowserIE) {
          music.pause();
        }

        gameState.customIUN = customIUN;
        gameState.isFinished = 1;
        gameState.elapsedTime = secondsElapsed;
        var d = new Date();
        gameState.timefinish = getFullDateTime(d);
        userTimer.stop();
        saveState('UPDATE', gameState);
        //show finScr
        Phaser.disable;
        _this.input.keyboard.enabled = false; //to stop keyboard capture
        //_this.input.keyboard.stopImmediatePropagation();
        //Phaser.Input.Keyboard.clearCaptures();
        this.scene.pause();
        game.scene.pause("default");
        showFinalScreen();
    }

    function update() {
        if (gameOver || isPause) {
            return;
        }
        drawScores(_this);
        player.prevPos = {x: player.x, y: player.y};
        playerNavigationHandler();
        playSound(music);  // play background music
    }

    function drawScores(scene) {
      // ('Keys: ' + player.doorKeys + '   *   Score: ' + totalQestionsAnswered)
      scoreTextShade0.setText('Score: ' + totalQestionsAnswered);
      scoreTextShade0.x = 49 + player.x - 400;
      scoreTextShade0.y = 49 + player.y - 300;
        scoreTextShade.setText('Score: ' + totalQestionsAnswered);
        scoreTextShade.x = 51 + player.x - 400;
        scoreTextShade.y = 51 + player.y - 300;
        scoreText.setText('Score: ' + totalQestionsAnswered);
        scoreText.x = 50 + player.x - 400;
        scoreText.y = 50 + player.y - 300;
        if (language === 'FRA') {
          divScoreText.innerHTML = "Vous avez " + player.doorKeys + " clé(s) <br><hr/><br>";
        } else {
          divScoreText.innerHTML = "You have " + player.doorKeys + " key(s) <br><hr/><br>";
        }
    }

    function hitTheDoor(player, door) {
        if (player.doorKeys > 0 && !door.isOpen) {
            playSound(doorOpen);
            stopPlayer();
            door.body.checkCollision.none = true;
            door.isOpen = true;
            player.doorKeys--;
            //console.log("The door has been opened!", door);
            var nextDoor;
            var thisRoomX = door.roomCoord.roomX;
            var thisRoomY = door.roomCoord.roomY;

            switch (door.roomCoord.doorType) {
                case 'U':
                    nextDoor = roomsMAP[thisRoomX][thisRoomY - 1].downDoor;
                    nextDoor.body.checkCollision.none = true;
                    nextDoor.isOpen = true;
                    nextDoor.setTexture('doorD', 1);
                    door.setTexture('doorU', 1);
                    //console.log('Door location is: Up, door: ' + nextDoor.isOpen);
                    break;
                case 'D':
                    nextDoor = roomsMAP[thisRoomX][thisRoomY + 1].upperDoor;
                    nextDoor.body.checkCollision.none = true;
                    nextDoor.isOpen = true;
                    nextDoor.setTexture('doorU', 1);
                    door.setTexture('doorD', 1);
                    //console.log('Door location is: Down, door: ' + nextDoor.isOpen);
                    break;
                case 'L':
                    nextDoor = roomsMAP[thisRoomX - 1][thisRoomY].rightDoor;
                    nextDoor.body.checkCollision.none = true;
                    nextDoor.isOpen = true;
                    nextDoor.setTexture('doorR', 1);
                    door.setTexture('doorL', 1);
                    //console.log('Door location is: Left, door: ' + nextDoor.isOpen);
                    break;
                case 'R':
                    nextDoor = roomsMAP[thisRoomX + 1][thisRoomY].leftDoor;
                    nextDoor.body.checkCollision.none = true;
                    nextDoor.isOpen = true;
                    nextDoor.setTexture('doorL', 1);
                    door.setTexture('doorR', 1);
                    //console.log('Door location is: Right, door: ' + nextDoor.isOpen);
                    break;
                default:
            }
            return true;
        }
        return true;
    }

    function playerStepBack() {
        player.x = player.prevPos.x;
        player.y = player.prevPos.y;
    }

    function collectKey(player, key) {
        try {
          userTimer.start();
        } catch (e) {
          console.log('Error! Can\'t start a timer!',e.toString());
        }

        if (isPause) return;
        // if (theGameIsStarted === false) {
        //   //if the game has started then change the boolean flag:
        //   theGameIsStarted = true;
        //   userTimer.start();
        //   console.log("theGameIsStarted: " + theGameIsStarted);
        // }
        playSound(pickupKey);
        stopPlayer();
        isPause = true;

        totalQestionsAsked++;
        var ifSuccessCallback = function () {
            //submitAnswerButton.style.display = 'none';
            playSound(soundOk);
            key.disableBody(true, true);
            isPause = false;
            player.doorKeys++;
            player.doorKeys+=10;
            totalQestionsAnswered++;

            //save the state to the table:
            gameState.customIUN = customIUN;
            gameState.correctCount = totalQestionsAnswered;
            listofquestions = listofquestions + "qT:" +  key.question.qId + "; ";
            gameState.listofquestions = listofquestions; //+ ":" +  " " + totalQestionsAsked;
            if (totalQestionsAnswered === 1 && (!theGameIsStarted)) {
                saveState('INSERT', gameState);
                theGameIsStarted = true;
            } else {
                saveState('UPDATE', gameState);
            }
            //submitAnswerButton.style.display = "";
        };

        var onVideoCloseCallback = function () {
            hideVideo();
            isPause = false;
            playerStepBack();
        }

        var ifCancelCallback = function (question) {
            //submitAnswerButton.style.display = 'none';
            var videoLangURL ="";
            playSound(soundFail);
            gameState.customIUN = customIUN;
            gameState.correctCount = totalQestionsAnswered;
            listofquestions = listofquestions + "qF:" +  key.question.qId + "; ";
            gameState.listofquestions = listofquestions; //+ ":" +  " " + totalQestionsAsked;

            if (totalQestionsAnswered === 0 && (!theGameIsStarted)) {
                saveState('INSERT', gameState);
                theGameIsStarted = true;
            } else {
                saveState('UPDATE', gameState);
            }

            videoLangURL = question.questionURL; //questionurlFRA
            if (language === 'FRA') {
              videoLangURL = question.questionurlFRA;
            }
            console.log('videoLangURL: ' + videoLangURL);
            showVideo(videoLangURL, onVideoCloseCallback);
            //submitAnswerButton.style.display = "";
        }
        showQuestion(key.question, ifSuccessCallback, ifCancelCallback);
    }

    function stopPlayer() {
        player.setVelocityX(0);
        player.setVelocityY(0);
        player.anims.play('turn');
        //if (!isBrowserIE) {
         soundStep.pause(); //SOUND MUSIC STOPED To Debug IE11 issues
       //}
    }

    function buildWorld(scene) {
        //We get our source from the following rest:
        // megaMAP = game.cache.json.get('megaMAP');
        // roomsMAP = game.cache.json.get('doorsMAP');
        doors = scene.physics.add.group({
            immovable: true
        });
        walls = scene.physics.add.staticGroup();
        doorkeys = scene.physics.add.group();
        hospitalBed = scene.physics.add.group({
            immovable: true
        });

        for (var y = 0; y < megaMAP.doorsMAP.length; y++) {
          //megaMAP.doorsMAP[y]
          var mapDoors = megaMAP.doorsMAP[y];
          var mapDoor=[];
          for (var x = 0; x < mapDoors.length; x++) {
            //mapDoors[x]
            mapDoor = mapDoors[x];
            // TODO:
            var indX = 800 * x;
            var indY = 520 * y;
            //console.log('generateArrayMap mapDoor: ', mapDoor);
            //var roomName = JSON.stringify(mapDoor);
            var roomName = 'u' + mapDoor.U + 'd' + mapDoor.D + 'l' + mapDoor.L + 'r' + mapDoor.R;
            // scene.add.image(400 +indX, 270 + indY, roomName).setScale(0.8);

            if (x == maxRoomCountX - 1 && y == maxRoomCountY - 1) {
              //finalRoom
              scene.add.image(400 + indX, 270 + indY, 'finalRoom').setScale(0.8);
            } else {
              var randomRoom = (Math.round(Math.random() * 4))+1; //RoomBG_0
              scene.add.image(400 + indX, 270 + indY, 'RoomBG_0' + randomRoom).setScale(0.8);
              //scene.add.image(400 + indX, 270 + indY, 'baseRoomBack').setScale(0.8);
            }
            // Since I'm using only one backgroun now: baseRoomBack = RoomBG_red.png
            for (var i = 0; i < 9; i++) {
                // Upper right bar
                walls.create(indX + 500 + (i * 30), indY + 90 + ((i * 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
                // lower left bar
                walls.create(indX + 110 + (i * 20), indY + 360 + ((i * 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
                // upper left bar
                walls.create(indX + 310 - (i * 30), indY + 90 + ((i * 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
                // lower right bar
                walls.create(indX + 480 + (i * 28), indY + 500 - ((i * 0.70) * 28), 'blockRed').setScale(0.8).refreshBody();
            }
            for (var i = 0; i < 6; i++) {
              walls.create(indX + 220 + (i * 20), indY + 370 + ((i * 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
              // lower right bar
              walls.create(indX + 480 + (i * 20), indY + 450 - ((i * 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
            }

          }
        }
        // megaMAP.doorsMAP.forEach((mapDoors, y) => {
        //         mapDoors.forEach(function (mapDoor, x) {
        //             // TODO:
        //             var indX = 800 * x;
        //             var indY = 520 * y;
        //             //console.log('generateArrayMap mapDoor: ', mapDoor);
        //             //var roomName = JSON.stringify(mapDoor);
        //             var roomName = 'u' + mapDoor.U + 'd' + mapDoor.D + 'l' + mapDoor.L + 'r' + mapDoor.R;
        //             // scene.add.image(400 +indX, 270 + indY, roomName).setScale(0.8);
        //
        //             if (x == maxRoomCountX - 1 && y == maxRoomCountY - 1) {
        //               //finalRoom
        //               scene.add.image(400 + indX, 270 + indY, 'finalRoom').setScale(0.8);
        //             } else {
        //               var randomRoom = (Math.round(Math.random() * 4))+1; //RoomBG_0
        //               scene.add.image(400 + indX, 270 + indY, 'RoomBG_0' + randomRoom).setScale(0.8);
        //               //scene.add.image(400 + indX, 270 + indY, 'baseRoomBack').setScale(0.8);
        //             }
        //             // Since I'm using only one backgroun now: baseRoomBack = RoomBG_red.png
        //             for (var i = 0; i < 9; i++) {
        //                 // Upper right bar
        //                 walls.create(indX + 500 + (i * 30), indY + 90 + ((i * 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
        //                 // lower left bar
        //                 walls.create(indX + 110 + (i * 30), indY + 360 + ((i * 0.70) * 30), 'blockRed').setScale(0.8).refreshBody();
        //                 // upper left bar
        //                 walls.create(indX + 310 - (i * 30), indY + 90 + ((i * 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
        //                 // lower right bar
        //                 walls.create(indX + 480 + (i * 28), indY + 500 - ((i * 0.70) * 28), 'blockRed').setScale(0.8).refreshBody();
        //             }
        //             for (var i = 0; i < 6; i++) {
        //               walls.create(indX + 220 + (i * 20), indY + 370 + ((i * 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
        //               // lower right bar
        //               walls.create(indX + 480 + (i * 20), indY + 450 - ((i * 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
        //             }
        //         })
        //         //arrAllDoorsRooms.push(arrOneLevelRooms);
        //     }
        // );

        function randomPlsOrMin(min, max) {
            return random(min, max) * (Math.random() < 0.5 ? -1 : 1);
        }

        function random(min, max) {
            return Math.floor(Math.random() * max) + min;
        }

        var doorsIndex = 0;
        roomsMAP = megaMAP.doorsMAP;

        //megaMAP.doorsMAP
        for (var y = 0; y < megaMAP.doorsMAP.length; y++) {
          //megaMAP.doorsMAP[y]
          var mapDoors = megaMAP.doorsMAP[y];
          var mapDoor=[];
          for (var x = 0; x < mapDoors.length; x++) {
            mapDoor = mapDoors[x];
            //===================================================================
                var indX = 800 * (x);
                var indY = 520 * (y);
                var keysCount = -1;

                if (mapDoor.U === 1) {
                    keysCount++;
                    doorsArray[doorsIndex] = doors.create(indX + 400, indY + 80, 'doorU').setScale(.8);
                    doorsArray[doorsIndex].roomCoord = {roomX: x, roomY: y, doorType: 'U'};
                    roomsMAP[x][y].upperDoor = doorsArray[doorsIndex];
                    doorsIndex++;
                    for (var i = 0; i < 3; i++) {
                      //vertical bars for upper and lower doors:
                        walls.create((indX + 320), indY + (20 + i * 40), 'blockRed').setScale(0.8).refreshBody();
                        walls.create((indX + 480), indY + (20 + i * 40), 'blockRed').setScale(0.8).refreshBody();
                    }
                } else if (mapDoor.U === 0) {
                    roomsMAP[x][y].upperDoor = doors.create(-100, -100, 'star');
                    roomsMAP[x][y].upperDoor.visible = false; // not really a door, just replacement
                    for (var i = 0; i < 9; i++) {
                        walls.create(indX + 320 + (i * 20), indY + 100, 'blockRed').setScale(0.8).refreshBody();
                    }
                }
                if (mapDoor.D === 1) {
                    keysCount++;
                    doorsArray[doorsIndex] = doors.create(indX + 400, indY + 500, 'doorD').setScale(0.8);
                    doorsArray[doorsIndex].roomCoord = {roomX: x, roomY: y, doorType: 'D'};
                    roomsMAP[x][y].downDoor = doorsArray[doorsIndex];
                    doorsIndex++;
                    for (var i = 0; i < 2; i++) {
                      //vertical bars for upper and lower doors:
                        walls.create((indX + 320), indY + (500 + i * 20), 'blockRed').setScale(0.8).refreshBody();
                        walls.create((indX + 480), indY + (500 + i * 20), 'blockRed').setScale(0.8).refreshBody();
                    }
                } else if (mapDoor.D === 0) {
                    roomsMAP[x][y].downDoor = doors.create(-100, -100, 'star');
                    roomsMAP[x][y].downDoor.visible = false; // not really a door, just replacement
                    for (var i = 0; i < 9; i++) {
                        walls.create(indX + 320 + (i * 20), indY + 500, 'blockRed').setScale(0.8).refreshBody();
                    }
                }
                if (mapDoor.L === 1) {
                    keysCount++;
                    doorsArray[doorsIndex] = doors.create(indX + 80, indY + 260, 'doorL').setScale(0.8);
                    doorsArray[doorsIndex].roomCoord = {roomX: x, roomY: y, doorType: 'L'};
                    roomsMAP[x][y].leftDoor = doorsArray[doorsIndex];
                    doorsIndex++;
                    for (var i = 0; i < 4; i++) {
                      //diaganal bars for left door
                        walls.create(indX - 20 + (i * 40), indY + (200 ), 'blockRed').setScale(0.8).refreshBody();
                        //walls.create(indX - 0 + (i * 40), indY + (210 - i * 20), 'blockRed').setScale(0.8).refreshBody();
                        //walls.create(indX - 0 + (i * 40), indY + (340 + i * 20), 'blockRed').setScale(0.8).refreshBody();
                        walls.create(indX - 20 + (i * 25), indY + (340 ), 'blockRed').setScale(0.8).refreshBody();
                    }

                } else if (mapDoor.L === 0) {
                    roomsMAP[x][y].leftDoor = doors.create(-100, -100, 'star');
                    roomsMAP[x][y].leftDoor.visible = false; // not really a door, just replacement
                    for (var i = 0; i < 3; i++) {
                        walls.create(indX + 40, indY + 270 + (i * 40), 'blockRed').setScale(0.8).refreshBody();
                        walls.create(indX + 20 + (i * 40), indY + 240, 'blockRed').setScale(0.8).refreshBody();
                        walls.create(indX + 20 + (i * 40), indY + 380, 'blockRed').setScale(0.8).refreshBody();
                    }
                }
                if (mapDoor.R === 1) {
                    keysCount++;
                    doorsArray[doorsIndex] = doors.create(indX + 720, indY + 260, 'doorR').setScale(0.8);
                    doorsArray[doorsIndex].roomCoord = {roomX: x, roomY: y, doorType: 'R'};
                    roomsMAP[x][y].rightDoor = doorsArray[doorsIndex];
                    doorsIndex++;
                    for (var i = 0; i < 3; i++) {
                        walls.create(indX - 20 - (i * 40), indY + (200 ), 'blockRed').setScale(0.8).refreshBody();
                        walls.create(indX + 700 + (i * 40), indY + (160 + i * 20), 'blockRed').setScale(0.8).refreshBody();
                        walls.create(indX + 700 + (i * 40), indY + (380 - i * 20), 'blockRed').setScale(0.8).refreshBody();
                        walls.create(indX - 20 - (i * 25), indY + (340 ), 'blockRed').setScale(0.8).refreshBody();
                    }

                } else if (mapDoor.R === 0) {
                    roomsMAP[x][y].rightDoor = doors.create(-100, -100, 'star');
                    roomsMAP[x][y].rightDoor.visible = false; // not really a door, just replacement
                    for (var i = 0; i < 3; i++) {
                        walls.create(indX + 740, indY + 270 + (i * 40), 'blockRed').setScale(0.8).refreshBody();
                        walls.create(indX + 700 + (i * 40), indY + 240, 'blockRed').setScale(0.8).refreshBody();
                        walls.create(indX + 700 + (i * 40), indY + 380, 'blockRed').setScale(0.8).refreshBody();
                    }
                }
                //doorkeys
                var arrKeys = [];
                var getKeyCordinateWithProximity = function (keys, minProximity) {
                    //console.log('keys',keys);
                    var c1 = {x: 400 + indX + randomPlsOrMin(50, 80), y: 260 + indY + randomPlsOrMin(50, 30)};
                    var check = 0;
                    for (var i = 0; i < keys.length; i++) {
                        var c0 = keys[i];
                        var isProximityXGood = Math.abs(c0.x - c1.x) > minProximity;
                        var isProximityYGood = Math.abs(c0.y - c1.y) > minProximity;

                        if (!isProximityXGood && !isProximityYGood) {
                            return getKeyCordinateWithProximity(keys, minProximity);
                        }
                    }
                    return c1;
                }
                if (x == 0 && y == 0) {
                    keysCount = keysCount + 1;
                }
                for (var i = 0; i < keysCount; i++) {
                    if (x == maxRoomCountX - 1 && y == maxRoomCountY - 1) {
                        //this is our final room - no keys required...
                        //TODO: place a final room sprite here!!!
                        //draw the patient: hospitalBed
                        hospitalBed.create(400 + 800 * (x), 270 + 520 * (y), 'patientEmptyPlaceHolder').setScale(1.2);
                    } else {
                        var coord = getKeyCordinateWithProximity(arrKeys, 100);
                        //doorkeys.create(coord.x, coord.y, 'star').setScale(0.8); //doors keys
                        //var myKey = doorkeys.create(coord.x, coord.y, 'gold-key').setScale(0.5); //doors keys
                        // 'green-key-sprite', {start: 0, end: 18} -vs- 'gold-key-sprite', {start: 0, end: 6}

                        scene.anims.create({
                            key: 'rotatingKey',
                            frames: scene.anims.generateFrameNumbers('gold-key-sprite', {start: 0, end: 6}),
                            frameRate: 10,
                            repeat: -1
                        });

                        var myKey = doorkeys.create(coord.x, coord.y, 'gold-key-sprite').setScale(0.8); //doors keys
                        myKey.question = megaMAP.questionList[keyIndex];

                        myKey.anims.play('rotatingKey', true);

                        //console.log("question from key", myKey.question);
                        keyIndex++;
                        arrKeys[arrKeys.length] = coord;
                    }
                }
            //=================================================================
          }
        }

        initPlayer(scene);
    }

    function playSound(sound) {
      //sounds: //SOUND MUSIC STOPED To Debug IE11 issues
      // if ( !isBrowserIE ) {
      //     if (!sound.isPlaying) {
      //         sound.play();
      //     }
      // }
      if (!sound.isPlaying) {
          sound.play();
      }
    }

    function calcCoordOnMapPos(thisX,thisY) {
        // player.x and player.y - its a player coordinates
        var deltaX = Math.floor(thisX / 800);
        var deltaY = Math.floor(thisY / 520);
        player.mazeNewCoord = { mazeX: deltaX, mazeY: deltaY };
        //required to id miniMap location
        if ((player.mazePrevCoord.mazeX != player.mazeNewCoord.mazeX)
             || (player.mazePrevCoord.mazeY != player.mazeNewCoord.mazeY)) {
               highlighMapPos(player.mazePrevCoord.mazeY,player.mazePrevCoord.mazeX,player.mazeNewCoord.mazeY,player.mazeNewCoord.mazeX,"magenta");
               player.mazePrevCoord = { mazeX: deltaX, mazeY: deltaY };
        }
    }

    function playerNavigationHandler() {

        if (cursors.left.isDown) {
           calcCoordOnMapPos(player.x,player.y);
            player.setVelocityX(-260);
            player.anims.play('left', true);
            playSound(soundStep);
        } else if (cursors.up.isDown) {
           calcCoordOnMapPos(player.x,player.y);
            player.setVelocityY(-200);
            player.anims.play('up', true);
            playSound(soundStep);
        } else if (cursors.down.isDown) {
           calcCoordOnMapPos(player.x,player.y);
            player.setVelocityY(200);
            player.anims.play('down', true);
            playSound(soundStep);
        } else if (cursors.right.isDown) {
            calcCoordOnMapPos(player.x,player.y);
            player.setVelocityX(260);
            player.anims.play('right', true);
            playSound(soundStep);

        } else {
            stopPlayer();
        }
    }

    function initPlayer(scene) {
        player = scene.physics.add.sprite(400, 300, 'dude');
        //console.log('player', player);
        player.doorKeys = 0;
        player.mazePrevCoord = { mazeX: 0,  mazeY: 0};  //required to id miniMap lcoation
        player.mazeNewCoord = { mazeX: 0,  mazeY: 0}; //required to id miniMap lcoation
         highlighMapPos(0,0,0,0,"magenta");
        //  Player physics properties. Give the little guy a slight bounce.
        player.setBounce(0.2);
        //player.setCollideWorldBounds(true);
        //  Our player animations, turning, walking left and walking right.
        scene.anims.create({
            key: 'left',
            frames: scene.anims.generateFrameNumbers('dude', {start: 0, end: 3}),
            frameRate: 10,
            repeat: -1
        });
        scene.anims.create({
            key: 'up',
            frames: scene.anims.generateFrameNumbers('dude', {start: 8, end: 11}),
            frameRate: 10,
            repeat: -1
        });

        scene.anims.create({
            key: 'turn',
            frames: [{key: 'dude', frame: 4}],
            frameRate: 20
        });

        scene.anims.create({
            key: 'right',
            frames: scene.anims.generateFrameNumbers('dude', {start: 12, end: 15}),
            frameRate: 10,
            repeat: -1
        });

        scene.anims.create({
            key: 'down',
            frames: scene.anims.generateFrameNumbers('dude', {start: 4, end: 7}),
            frameRate: 10,
            repeat: -1
        });
    }

    function highlighMapPos(oldY,oldX,pY,pX,colorCode) {
        var oldMapLocation = document.getElementById('y' + oldY + 'x' + oldX);
        //var oldMapLocationContent = oldMapLocation.innerHTML;
        var newMapLocation = document.getElementById('y' + pY + 'x' + pX);

        document.getElementById('y' + oldY + 'x' + oldX).style.border = "";
        document.getElementById('y' + pY + 'x' + pX).style.border = "3px solid " + colorCode;
        oldMapLocation.innerHTML = mapLocContent;
        mapLocContent = newMapLocation.innerHTML;
        newMapLocation.innerHTML = '<div class="divMinMapTD"> ' +
                                '<img class="imgMapDude" src="./png/docOne.png" alt="}{" height="22" width="20">' +
                                '</div>';
    }

/////////questions functionality
    function showQuestion(question, ifSuccessCallback, ifCancelCallback) {
        // pased: showQuestion(megaMAP.questionMAP[0][0], function ()
        document.getElementById("question").style.display = "";
        //alert(question.qId + ') ' + question.qTxt);
        //_this.input.keyboard.enabled = false;
        buildQuestion(question, ifSuccessCallback, ifCancelCallback);
    }

    function hideQuestion() {
      //_this.input.keyboard.enabled = true;
        document.getElementById("question").style.display = "none";
    }

    //const questionWindow = document.getElementById("questionWindow");

    function buildQuestion(question, ifSuccessCallback, ifCancelCallback) {
        //console.log(question);
        var myQuestions = [question];
        function buildQuiz() {
            // we'll need a place to store the HTML output
            const output = [];
            // for each question...
            for (var questionNumber = 0; questionNumber < myQuestions.length; questionNumber++) {
              currentQuestion = myQuestions[questionNumber];
              // we'll want to store the list of answer choices
              const answers = [];

              // and for each available answer...
              for (var ind in currentQuestion.answers) {
                  // ...add an HTML radio button
                  //var questMsg = Base64Decode(currentQuestion.answers[ind].value);
                  var questMsg = currentQuestion.answers[ind].value;
                  if (language === 'FRA') {
                      // we use FRENCH LANGUAGE
                      //questMsg = Base64Decode(currentQuestion.answersFRA[ind].value);
                      questMsg = currentQuestion.answersFRA[ind].value;
                  }
                  var ansStr = '<label><input type="radio" name="question' + questionNumber + '" value="' + ind + '"> ' + currentQuestion.answers[ind].key + ' : ' + questMsg + '</label>';
                  answers.push (ansStr);
                  //answers.push('<label><input type="radio" name="question${questionNumber}" value="${ind}">  ${currentQuestion.answers[ind].key} :${questMsg}</label>');
                      // `<label>
                      //   <input type="radio" name="question${questionNumber}" value="${ind}">
                      //   ${currentQuestion.answers[ind].key} :
                      //   ${questMsg}
                      //   </label>`

              }
              // add this question and its answers to the output
              //var answerMsg = Base64Decode(currentQuestion.question);
              var answerMsg = currentQuestion.question;
              if (language === 'FRA') {
                //answerMsg = Base64Decode(currentQuestion.questionFRA);
                answerMsg = currentQuestion.questionFRA;
              }
              var ansOutStr = '<div class="slide"><div class="question">' + answerMsg + '<hr/></div> <div class="answers">' + answers.join("") + '</div></div>';
              output.push(ansOutStr);
              // output.push(
              //       `<div class="slide">
              //          <div class="question"> ${atob(currentQuestion.question)}</div>
              //          <div class="answers"> ${answers.join("")} </div>
              //        </div>`
              //   );
            }

            // finally combine our output list into one string of HTML and put it on the page
            quizContainer.innerHTML = output.join("");
            submitAnswerButton.style.display = '';
        }

        function showResults() {
            submitAnswerButton.style.display = 'none';
            // gather answer containers from our quiz
            const answerContainers = quizContainer.querySelectorAll(".answers");

            // keep track of user's answers
            // for each question...
            for (var questionNumber = 0; questionNumber < myQuestions.length; questionNumber++) {
              currentQuestion = myQuestions[questionNumber];
              const answerContainer = answerContainers[questionNumber];
              // const selector = `input[name=question${questionNumber}]:checked`;
              const selector = "input[name=question" + questionNumber + "]:checked";

              const userAnswer = parseInt((answerContainer.querySelector(selector) || {}).value);
              // if answer is correct
              if (userAnswer === currentQuestion.correctAnswer) {
                  answerContainer.style.color = 'lightgreen';
                  if (language === 'FRA') {
                    submitMsgContainer.innerHTML = "<h1><span style='color:yellow'>Felicitations! Bonne reponse!</span></h1>";
                  } else {
                    submitMsgContainer.innerHTML = "<h1><span style='color:yellow'>Congratulations! Correct answer!</span></h1>";
                  }

                  setTimeout(function () {
                      submitMsgContainer.innerHTML = "";
                      //console.log('Corerct Answer given');
                      hideQuestion();
                      ifSuccessCallback(question);
                  }, 1000);
              } else {
                  answerContainer.style.color = 'red';
                  questionWindow.style.border = 'thin solid red';
                  if (language === 'FRA') {
                    submitMsgContainer.innerHTML = "<h1><span style='color:red'>Desole, mauvaise reponse!</span></h1><br>";
                  } else {
                    submitMsgContainer.innerHTML = "<h1><span style='color:red'>Sorry, wrong answer!</span></h1><br>";
                  }

                  setTimeout(function () {
                      submitMsgContainer.innerHTML = "";
                      if (!isBrowserIE) {
                        questionWindow.style.border = 'initial';
                      } else {
                        questionWindow.style.border = 'thin solid white';
                      }

                      hideQuestion();
                      ifCancelCallback(question);
                  }, 1200);
              }
            }
            //submitAnswerButton.style.display = '';
        }

        function showSlide(n) {
            slides[currentSlide].classList.remove("active-slide");
            slides[n].classList.add("active-slide");
            currentSlide = n;
        }

        const quizContainer = document.getElementById("quiz");
        const submitButton = document.getElementById("submit");
        buildQuiz();
        const slides = document.querySelectorAll(".slide");
        var currentSlide = 0;
        showSlide(0);
        // on submit, show results
        $("#submit").unbind("click");
        $("#submit").bind("click", showResults);
    }


    function saveState(opCode, gameState) {
        // to save the current state in the Database
        $.ajax("rest/saveState.php", {
            data: JSON.stringify({opCode: opCode, data: gameState}),
            contentType: 'application/json',
            type: 'POST'
        })
            .done(function (data) {
                console.log("second success", data);
            })
            .fail(function (data) {
                console.log("error", data);
            });
    }

    function changeLanguage(flag) {
      var message="";
      if (flag) {
        if (language === 'FRA') {
          language = 'ENG';
          langLabel = 'Francais';
          message = "You are here:";
        } else {
          language = 'FRA';
          langLabel = 'English';
          message = "Vous êtes ici:";
        }
      } else {
        if (language === 'ENG') {
          message = "You are here:";
        } else {
          message = "Vous êtes ici:";
        }
      }
      document.getElementById("languages").innerHTML = langLabel;
      document.getElementById("divMiniMapText").innerHTML = message;
    }


    function hideVideo() {
        const vidPlayer = document.getElementById("divVidPlayer");
        vidPlayer.innerHTML = "";
        video.style.display = "none";
        //vplayer.pause();
    }

    function showVideo(qVideoURL, onVideoCloseCallback) {
      var messageForVideo;
      if (language === 'FRA') {
          // we use FRENCH LANGUAGE
          messageForVideo = "Desole, mauvaise reponse!!!<br> Vous devrez regarder la vidéo pour trouver la bonne réponse:";
        } else {
          messageForVideo = "Sorry, wrong answer!!! <br>  You will have to watch the video to find the right answer:";
        }
        video.style.display = "";
        // vplayer.play();
        const vidScrTxt = document.getElementById("vidScrTxt");
        //const vidScrTxt2 = document.getElementById("vidScrTxt2");
        vidScrTxt.innerHTML = messageForVideo;
        const vidPlayer = document.getElementById("divVidPlayer");
        vidPlayer.innerHTML = '<div class="embed-container"><iframe src="' + qVideoURL
            + '" width="600" height="480" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div>';
        //<style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0;
        //            overflow: hidden; max-width: 100%; height: auto; }
        //            .embed-container iframe, .embed-container object,
        //            .embed-container embed { position: absolute; top: 0;
        //            left: 0; width: 100%; height: 100%; }</style><div class='embed-container'>
        //            <iframe src='https://player.vimeo.com/video/11712103'
        //            frameborder='0' webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div>

        $("#closeVideo").unbind("click");
        $("#closeVideo").bind("click", onVideoCloseCallback);

    }

    function showFinalScreen() {
        gameState.elapsedTime = secondsElapsed;
        // var element = document.getElementById("customIUN");
        // if (element != null) {
        //     customIUN = document.getElementById("customIUN").value;
        // }  else {
        //     customIUN = userIUN;
        // }
        gameState.customIUN = customIUN;
        playSound(soundFinal);
        var minSpent = Math.floor(gameState.elapsedTime / 60);
        var secSpent = (gameState.elapsedTime % 60);
        var correctAnswers =0;
        correctAnswers = gameState.correctCount;
        finScr.style.display = "";
        _this.scene.pause();
        // game.scene.pause("default");
        _this.input.keyboard.enabled = false;
        _this.input.keyboard.clearCaptures(); //Stop capturing the keyboard
        const finScrTxtLine1 = document.getElementById('finScrTxtLine1');
        const finScrTxtLine2 = document.getElementById('finScrTxtLine2');
        const finScrTxtLine3 = document.getElementById('finScrTxtLine3');
        //const finScrTxtLine4 = document.getElementById('finScrTxtLine4');
        var finScrTxtLine2Msg = "You have responded to : " + correctAnswers + " questions";
        var finScrTxtLine3Msg = "in " + minSpent + " minutes " + secSpent + " seconds";
        if (language === 'FRA') {
          finScrTxtLine2Msg = "Vous avez répondu à : " + correctAnswers + " questions";
          finScrTxtLine3Msg = "en  : " + minSpent + " minutes  " + secSpent + " secondes";
        }
        finScrTxtLine2.innerHTML = finScrTxtLine2Msg;
        finScrTxtLine3.innerHTML = finScrTxtLine3Msg;//gameState.elapsedTime;
        //finScrTxtLine4.innerHTML = "";
        //  the following to prevent cutting space charactes in the textarea field:
          {
            //   $("#finQ2").keyup(function(e){
            //    if(e.keyCode == 32){
            //        // user has pressed backspace
            //        document.getElementById("finQ2").value += " " ;
            //    }
            //  });
            //  $("#finQ3").keyup(function(e){
            //   if(e.keyCode == 32){
            //       // user has pressed backspace
            //       document.getElementById("finQ3").value += " " ;
            //   }
            // });
          }
    }

    function submitFinalAnswer() {
        gameState.customIUN = customIUN;
        //starsCount is global
        var respQ2 = document.getElementById("finQ2").value;
        var respQ2strWithOutQuotes= respQ2.replace(/['"]+/g, '')
        //console.log('respQ2: ',respQ2strWithOutQuotes);
        var respQ3 = document.getElementById("finQ3").value;
        var respQ3strWithOutQuotes= respQ3.replace(/['"]+/g, '')
        //console.log('respQ3: ',respQ3strWithOutQuotes);
        gameState.comments = "1)Stars: " + starsCount
                          + " 2)Likes: " + respQ2strWithOutQuotes
                          + " 3)Suggest: " + respQ3strWithOutQuotes;
        console.log('comments: ',gameState.comments);
        gameState.listofquestions = listofquestions;
        var d = new Date();
        gameState.timefinish = getFullDateTime(d);
        gameState.isFinished = 1;

        if (!isSurveySent) {
            saveState('UPDATE', gameState);
            isSurveySent = true;
            //alert ('The survey has been submitted! Thanks for your opinion!');
            // "Some words are better left unsaid."
            // /<p><h3><span id="finScrTxtLine1" class="finMessage">Félicitations! Congratulations!</span></h3></p>
            finScr.innerHTML = "";
            var finalLastStrMsg = "";
            finalLastStrMsg = '<br><br><br><hr/><p><h3><span id="finScrTxtLine1" class="finMessage">Merci Beaucoup! Thank you!</span></h3></p><hr/><br>';
            var userStat = finalLastStrMsg;
            // var userStat = "";
            // var request = new XMLHttpRequest();
            // var url = "./rest/getIUN.php";
            // var params = "userId=" + userIUN;
            // console.log("params: " + params + " url: "+ url);
            // request.open('POST', url, true);
            // request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            // request.onreadystatechange = function() {
            //     if (request.readyState === XMLHttpRequest.DONE) {
            //       if (request.status === 200) {
            //         var response = JSON.parse(request.response);
            //         console.log(JSON.stringify(response));
            //         console.log(" request.status: "+ request.status);
            //         if (response == "") {
            //           userStat = "The user IUN not found!";
            //           console.log("Error in request: ",userStat);
            //         }else{
            //           //userStat = response.userScoreHistory;
            //           userStat = getTableFromResponce(response);
            //           console.log("Request successfull: ",userStat);
            //         }
            //       }
            //     }
            //   };
            //   request.send(params);
            finScr.innerHTML = finalLastStrMsg + '<br><div><p><h5><span id="finScrTxtLine1" class="finMessage">' + userStat + ' </span></h5></p></div><br>';
            setTimeout(function () {
                finScr.innerHTML = finalLastStrMsg + '<br><div><p><h5><span id="finScrTxtLine1" class="finMessage"> ' + userStat + ' </span></h5></p></div><br>';// '<br><br><br><hr/><p><h3><span id="finScrTxtLine1" class="finMessage">Merci Beaucoup! Thank you!</span></h3></p><hr/><br>';
            }, 2200);

        } else {
            alert ('This survey has already been submitted! Going backwards!');
        }
        //goBack() ; //go back to the previous page
    }

    $("#finSubmit").unbind("click");
    $("#finSubmit").bind("click", submitFinalAnswer);

    // //checking if the browser is IE or others
    // if (!isBrowserIE) {
    // }
    // $("#finExit").unbind("click");
    // $("#finExit").bind("click", opneAnotherURL);

    // by Alexey Zapromyotov (c) 2019
};

var starsCount =0;

function getTableFromResponce(objResponce) {
  var myObj = objResponce.userScoreHistory;
  var result = [];
  for(var i in myObj)
      result.push([i, myObj [i]]);


  return result;
}

function star(starX) {
  try {
    for (var i = 1; i < 6; i++) {
      $('#star'+i).css('color', '');
    }
    for (var i = 1; i < starX + 1; i++) {
      $('#star'+i).css('color', 'yellow');
    }
  } catch (e) {
    console.log('error counting stars! ');
  }
  starsCount = starX;
}

function getStarsCount() {
  return starsCount;
}

function goBack() {
    //go back in history - previous page!
    window.history.back();
}

function opneAnotherURL() {
  window.open("./start.html","_self");
}

window.onload = function () {
    'use strict';
    var app = new App();
    app.start();
}


var today = new Date();
var startTime = getFullDateTime(today);
var userTimer;
userTimer = new easytimer.Timer();
// var startTime = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds(); //Date.now();
var endTime;
var secondsElapsed = 0;
//userTimer.start();  // -------- UNPAUSE when required!!! TIMER

userTimer.addEventListener('secondsUpdated', function (e) {
    $('#userTimer').html(userTimer.getTimeValues().toString());
    //endTime = userTimer.getTimeValues().toString();
    //endTime = endTime.getHours() + ":" + endTime.getMinutes() + ":" + endTime.getSeconds()
    //secondsElapsed = userTimer.getTimeValues().seconds.toString();
    secondsElapsed++;
});

function getFullDateTime(today) {
  var fullDay;
  var fullTime;
  var today = new Date();

  if (!String.prototype.padStart) {
      String.prototype.padStart = function padStart(targetLength,padString) {
          targetLength = targetLength>>0; //truncate if number or convert non-number to 0;
          padString = String((typeof padString !== 'undefined' ? padString : ' '));
          if (this.length > targetLength) {
              return String(this);
          }
          else {
              targetLength = targetLength-this.length;
              if (targetLength > padString.length) {
                  padString += padString.repeat(targetLength/padString.length); //append to original to ensure we are longer than needed
              }
              return padString.slice(0,targetLength) + String(this);
          }
      };
  }

  try {
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    fullDay = mm + '/' + dd + '/' + yyyy;
    var hour = ("0" + today.getHours()).slice(-2); //today.getHours() ;
    var min = ("0" + today.getMinutes()).slice(-2); //today.getMinutes();
    var sec = ("0" + today.getSeconds()).slice(-2); //today.getSeconds();
    fullTime =  hour + ":" + min + ":" + sec;
    today = fullDay + ' ' + fullTime;
  } catch (e) {
    console.log('error getting current time and date!');
  }
    return today;
}


function updateCustomIUN(val) {
    //event
    customIUN = val;
    var element = document.getElementById("customIUN");
    if (element != null) {
        customIUN = document.getElementById("customIUN").value;
    }
    console.log('updateCustomIUN is updated! Now: ' + customIUN);
}
function msieversion()
{  //checking if this is IE or something else?
  var ua = window.navigator.userAgent;
  try {
    function ieVersion(uaString) {
      uaString = uaString || navigator.userAgent;
      var match = /\b(MSIE |Trident.*?rv:|Edge\/)(\d+)/.exec(uaString);
      if (match) return parseInt(match[2])
    }

    var msie = ieVersion(ua);
    if (msie >= 12) { //EDGE!
       return false; //this is not really IE, but better versions - EDGE!
    } else if (msie > 0 ) // If Internet Explorer, return version number
    {
        //alert(parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))));
        return true;
    }
    else  // If another browser, return 0
    {
        //alert('otherbrowser');
        //Thanks GOD this is NOT IE!!!
        return false;
    }

  } catch (e) {
    console.log('Error while identifiing the browser agent! Most likely this is really old IE');
    return true;
  }
    return false;
}

// function Base64Encode(str, encoding) {
//     encoding = 'utf-8';
//     var bytes = new (typeof TextEncoder === "undefined" ? TextEncoderLite : TextEncoder)(encoding).encode(str);
//     return base64js.fromByteArray(bytes);
// }

// function Base64Decode(str, encoding) {
//     encoding = 'utf-8';
//     var bytes = base64js.toByteArray(str);
//     return new (typeof TextDecoder === "undefined" ? TextDecoderLite : TextDecoder)(encoding).decode(bytes);
// }
