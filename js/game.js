var App = function() {};

App.prototype.start = function()
{
    var config = {
        type: Phaser.AUTO,
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

        var megaMAP;
        var roomsMAP;
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
        var _this;
        var position = {x: 0, y: 0};

        var doorsHolder = { right: {image: 'png/doorR.png', key: 'doorR', offsetX: 340, offsetY: 80 },
                            down: {image: 'png/doorD.png', key: 'doorD', offsetX: -20, offsetY: 160 },
                            up: {image: 'png/doorU.png', key: 'doorU', offsetX: -20, offsetY: -180 },
                            left: {image: 'png/doorL.png', key: 'doorL', offsetX: -340, offsetY: 80 }}

        var doorsArray = [];//[[doorsHolder.right, doorsHolder.down],[doorsHolder.up,doorsHolder.right],[doorsHolder.left,doorsHolder.right]];

        function preload ()
        {
            this.load.json('megaMAP', 'rest/getMap.php');
            this.load.image('sky', 'assets/sky.png');
            // loading rooms assets: 16 rooms types in total!
            this.load.image('u0d1l0r1', 'jpg/u0d1l0r1.jpg');
            this.load.image('u0d1l1r0', 'jpg/u0d1l1r0.jpg');
            this.load.image('u1d0l0r1', 'jpg/u1d0l0r1.jpg');
            this.load.image('u1d0l1r1', 'jpg/u1d0l1r1.jpg');
            this.load.image('u0d0l1r1', 'jpg/u0d0l1r1.jpg');
            this.load.image('u1d0l1r0', 'jpg/u1d0l1r0.jpg');
            this.load.image('u0d0l0r0', 'jpg/u0d0l0r0.jpg');
            this.load.image('u0d0l0r1', 'jpg/u0d0l0r1.jpg');
            this.load.image('u0d0l1r0', 'jpg/u0d0l1r0.jpg');
            this.load.image('u0d1l0r0', 'jpg/u0d1l0r0.jpg');
            this.load.image('u0d1l1r1', 'jpg/u0d1l1r1.jpg');
            this.load.image('u1d0l0r0', 'jpg/u1d0l0r0.jpg');
            this.load.image('u1d1l0r0', 'jpg/u1d1l0r0.jpg');
            this.load.image('u1d1l0r1', 'jpg/u1d1l0r1.jpg');
            this.load.image('u1d1l1r0', 'jpg/u1d1l1r0.jpg');
            this.load.image('u1d1l1r1', 'jpg/u1d1l1r1.jpg');

            //baseRoomBack = RoomBG_red.png 1000 px X 650px
            // scale 0.8 we have: 800 x 520
            this.load.image('baseRoomBack', 'png/RoomBG_red.png');
            // rooms assets section completed!

            //doors:
            this.load.image('doorU', 'png/doorU.png');
            this.load.image('doorD', 'png/doorD.png');
            this.load.image('doorL', 'png/doorL.png');
            this.load.image('doorR', 'png/doorR.png');
            //==============================================
            //blocks:
            this.load.image('blockRed', 'png/block20x20red.png');
            //==================
            this.load.image('wall400x230', 'jpg/glassWall400x230.png');
            this.load.image('wall400x300', 'jpg/glassWall400x300.png');
            _this = this;

            Object.values(doorsHolder).forEach( function(door) {
                    _this.load.image(door.key, door.image);
                    console.log(door);
            });

            this.load.image('star', 'assets/star.png');
            this.load.image('bomb', 'assets/bomb.png');
            //this.load.spritesheet('dude', 'assets/dude.png', { frameWidth: 32, frameHeight: 48 });
            this.load.spritesheet('dude', 'png/docMUHCR4U1L4.png', { frameWidth: 50, frameHeight: 100 });

        }

        function create ()
        {
            // init other states
            megaMAP = game.cache.json.get('megaMAP');

            // console.log("megaMAP: "+megaMAP);
            // console.log("roomsMAP: "+roomsMAP);
            showMazeGfx(megaMAP.doorsMAP, "mazeWDrsRmsMap");
            buildWorld(this);

            cursors = this.input.keyboard.createCursorKeys();
            scoreText = this.add.text(16, 16, 'score: 0', { fontSize: '32px', fill: '#000' });

            // walls = this.physics.add.staticGroup();
            // for (var i = 0; i < 9; i++) {
            //   walls.create(480 + (i * 20), 120 + ((i* 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
            //   walls.create(150 + (i * 20), 380 + ((i* 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
            //   walls.create(320 - (i * 20), 120 + ((i* 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
            //   walls.create(490 + (i * 20), 490 - ((i* 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
            // }
            // walls.create(160, 450, 'wall400x230').setScale(0.8).refreshBody();
            // walls.create(640, 450, 'wall400x230').setScale(0.8).refreshBody();
            // walls.create(160, 120, 'wall400x300').setScale(0.8).refreshBody();
            // walls.create(640, 120, 'wall400x300').setScale(0.8).refreshBody();

            // The player and its settings
            player = this.physics.add.sprite(400, 300, 'dude');
            initPlayer(this);
            // walls.create(400, 270, 'hollowRoom').setScale(0.8).refreshBody();
            this.cameras.main.startFollow(player);
            this.physics.add.collider(player, walls);

            this.physics.add.overlap(player, doors, hitTheDoor, null, this);
            //  The platforms group contains the ground and the 2 ledges we can jump on
            // platforms = this.physics.add.staticGroup();

            //  Here we create the ground.
            //  Scale it to fit the width of the game (the original sprite is 400x32 in size)
            // platforms.create(400, 568, 'ground').setScale(2).refreshBody();

            // //  Now let's create some ledges
            // platforms.create(600, 400, 'ground');
            // platforms.create(50, 250, 'ground');
            // platforms.create(750, 220, 'ground');
            //  Input Events

            //  Some stars to collect, 12 in total, evenly spaced 70 pixels apart along the x axis
            // stars = this.physics.add.group({
            //     key: 'star',
            //     repeat: 11,
            //     setXY: { x: 12, y: 0, stepX: 70 }
            // });

            // stars.children.iterate(function (child) {

            //     //  Give each star a slightly different bounce
            //     child.setBounceY(Phaser.Math.FloatBetween(0.4, 0.8));

            // });

            // bombs = this.physics.add.group();

            //  The score

            //  Collide the player and the stars with the platforms
            // this.physics.add.collider(player, platforms);
            // this.physics.add.collider(stars, platforms);
            // this.physics.add.collider(bombs, platforms);

            //  Checks to see if the player overlaps with any of the stars, if he does call the collectStar function
            // this.physics.add.overlap(player, stars, collectStar, null, this);

            // this.physics.add.collider(player, bombs, hitBomb, null, this);

        }

        function update ()
        {
            if (gameOver)
            {
                return;
            }

            playerNavigationHandler();

        }

        function hitTheDoor(player, door) {
            console.log(door.settings);
        }

        function buildWorld(scene) {
          //We get our source from the following rest:
          // megaMAP = game.cache.json.get('megaMAP');
          // showMazeGfx(megaMAP.doorsMAP, "mazeWDrsRmsMap");
          // roomsMAP = game.cache.json.get('doorsMAP');
          doors = scene.physics.add.group();
          var arrAllDoorsRooms = [];
          var arrOneLevelRooms = [];
          var idx = 0;
          megaMAP.doorsMAP.forEach( (mapDoors,y) => { mapDoors.forEach( function(mapDoor,x) {
               // TODO:
                   var indX = 800 * x;
                   var indY = 540 * y;
                    //console.log('generateArrayMap mapDoor: ', mapDoor);
                    //var roomName = JSON.stringify(mapDoor);
                    var roomName = 'u'+mapDoor.U+'d'+mapDoor.D+'l'+mapDoor.L+'r'+mapDoor.R;
                    // scene.add.image(400 +indX, 270 + indY, roomName).setScale(0.8);

                    // Since I'm using only one backgroun now: baseRoomBack = RoomBG_red.png
                    scene.add.image(400 +indX, 270 + indY, 'baseRoomBack').setScale(0.8);

                    //console.log('Coordinates: ', { x:x, y:y, mapDoor: mapDoor});
                    // var arrDoorsInRoom = [];
                    // if (mapDoor.U === 1) {
                    //   arrDoorsInRoom.push ({up: {image: 'jpg/doorU.png', key: 'doorU', offsetX: -20, offsetY: -200 }});
                    // }
                    // if (mapDoor.D === 1) {
                    //   arrDoorsInRoom.push ({ down: {image: 'jpg/doorD.png', key: 'doorD', offsetX: -20, offsetY: 220 }});
                    // }
                    // if (mapDoor.L === 1) {
                    //   arrDoorsInRoom.push ({ left: {image: 'jpg/doorL.png', key: 'doorL', offsetX: -340, offsetY: 60 }});
                    // }
                    // if (mapDoor.R === 1) {
                    //   arrDoorsInRoom.push ({ right: {image: 'jpg/doorR.png', key: 'doorR', offsetX: 340, offsetY: 60 }});
                    // }
                    //console.log('arrDoorsInRoom: ' + arrDoorsInRoom);
                 })
              //arrAllDoorsRooms.push(arrOneLevelRooms);
              }
             );
             for (var i = 0; i < 9; i++) {
               walls.create(480 + (i * 20), 120 + ((i* 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
               walls.create(150 + (i * 20), 380 + ((i* 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
               walls.create(320 - (i * 20), 120 + ((i* 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
               walls.create(490 + (i * 20), 490 - ((i* 0.70) * 20), 'blockRed').setScale(0.8).refreshBody();
             }

             // doors
             /* { right: {image: 'png/doorR.png', key: 'doorR', offsetX: 340, offsetY: 80 },
                                 down: {image: 'png/doorD.png', key: 'doorD', offsetX: -20, offsetY: 160 },
                                 up: {image: 'png/doorU.png', key: 'doorU', offsetX: -20, offsetY: -180 },
                                 left: {image: 'png/doorL.png', key: 'doorL', offsetX: -340, offsetY: 80 }}
              */


             walls = scene.physics.add.staticGroup();
             megaMAP.doorsMAP.forEach( (mapDoors,y) => { mapDoors.forEach( function(mapDoor,x) {
                     var indX = 800 * (x + 0);
                     var indY = 540 * (y + 0);

                     if (mapDoor.U === 1) {
                       console.log ('x: ' + x + '/ y: ' + y);
                       doors.create(indX + 400 , indY + 80, 'doorU').setScale(.8);
                     }
                     if (mapDoor.D === 1) {
                       doors.create(indX +400, indY + 500, 'doorD').setScale(0.8);
                     }
                     if (mapDoor.L === 1) {
                       doors.create(indX + 50, indY + 310, 'doorL').setScale(0.8);
                     }
                     if (mapDoor.R === 1) {
                       doors.create(indX + 750, indY + 310, 'doorR').setScale(0.8);
                     }
                     console.log('doors location:  U' + mapDoor.U + 'D'+ mapDoor.D + 'L' +  mapDoor.L + 'R' + mapDoor.R);
                     // var d = doors.create(400 + door.offsetX + indX, 270 + door.offsetY + indY, door.key).setScale(0.8);
                     // d.settings = { key: door.key, x:x, y:y};
                     // console.log(door);
                     // console.log(d);
               })
             }
             );

             // doorsArray.forEach( (mapDoors,y) => mapDoors.forEach( function(door,x) {
             //         var indX = 800 * x;
             //         var indY = 540 * y;
             //         var d = doors.create(400 + door.offsetX + indX, 270 + door.offsetY + indY, door.key).setScale(0.8);
             //         d.settings = { key: door.key, x:x, y:y};
             //         // console.log(door);
             //         // console.log(d);
             //   })
             // );


          // for (var i = 0; i < roomsMAP.length; i++) {
          //   console.log("roomsMAP[" + i + "]: " + roomsMAP[i]);
          // }
          //    scene.add.image(400, 270, 'u0d1l0r1').setScale(0.8);
          //    scene.add.image(400+800, 270, 'u0d1l1r0').setScale(0.8);
          //    scene.add.image(400, 270 + 540, 'u1d0l0r1').setScale(0.8);
          //    scene.add.image(400+800, 270 + 540, 'u1d0l1r1').setScale(0.8);
          //
          //    scene.add.image(400+1600, 270, 'u0d0l1r1').setScale(0.8);
          //    scene.add.image(400+2400, 270, 'u0d1l1r0').setScale(0.8);
          //    scene.add.image(400+1600, 270 + 540, 'u0d0l1r1').setScale(0.8);
          //    scene.add.image(400+2400, 270 + 540, 'u1d0l1r0').setScale(0.8);

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

       function playerNavigationHandler () {
        if (cursors.left.isDown)
            {
                player.setVelocityX(-260);
                player.anims.play('left', true);
            }
            else if (cursors.up.isDown)
            {
                player.setVelocityY(-200);
                player.anims.play('up', true);
            }
            else if (cursors.down.isDown)
            {
                player.setVelocityY(200);
                player.anims.play('down', true);
            }
            else if (cursors.right.isDown)
            {
                player.setVelocityX(260);
                player.anims.play('right', true);
            }
            else
            {
                player.setVelocityX(0);
                player.setVelocityY(0);
                player.anims.play('turn');
            }

            // if (cursors.up.isDown && player.body.touching.down)
            // {
            //     player.setVelocityY(-330);
            // }
       }

        function initPlayer(scene) {
                        //  Player physics properties. Give the little guy a slight bounce.
            player.setBounce(0.2);
            //player.setCollideWorldBounds(true);
                        //  Our player animations, turning, walking left and walking right.
            scene.anims.create({
                key: 'left',
                frames: scene.anims.generateFrameNumbers('dude', { start: 0, end: 3 }),
                frameRate: 10,
                repeat: -1
            });

            scene.anims.create({
                key: 'up',
                frames: scene.anims.generateFrameNumbers('dude', { start: 0, end: 3 }),
                frameRate: 10,
                repeat: -1
            });

            scene.anims.create({
                key: 'turn',
                frames: [ { key: 'dude', frame: 4 } ],
                frameRate: 20
            });

            scene.anims.create({
                key: 'right',
                frames: scene.anims.generateFrameNumbers('dude', { start: 5, end: 8 }),
                frameRate: 10,
                repeat: -1
            });

            scene.anims.create({
                key: 'down',
                frames: scene.anims.generateFrameNumbers('dude', { start: 5, end: 8 }),
                frameRate: 10,
                repeat: -1
            });
        }
};

window.onload = function()
{
    'use strict';
    var app = new App();
    app.start();
}
