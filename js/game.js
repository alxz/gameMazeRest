var App = function() {};

App.prototype.start = function() 
{
    var config = {
        type: Phaser.AUTO,
        width: 800,
        height: 540,
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

        var doorsHolder = { right: {image: 'jpg/doorR.png', key: 'doorR', offsetX: 340, offsetY: 20 }, 
                            down: {image: 'jpg/doorD.png', key: 'doorD', offsetX: -20, offsetY: 120 }}

        var doorsArray = [[doorsHolder.right, doorsHolder.down],[doorsHolder.right]];

        function preload ()
        {
            this.load.json('megaMAP', 'rest/getMap.php');
            this.load.image('sky', 'assets/sky.png');
            this.load.image('u0d1l0r1', 'jpg/u0d1l0r1.jpg');
            this.load.image('u0d1l1r0', 'jpg/u0d1l1r0.jpg');
            this.load.image('u1d0l0r1', 'jpg/u1d0l0r1.jpg');
            this.load.image('u1d0l1r1', 'jpg/u1d0l1r1.jpg');
            
            
            this.load.image('wall400x230', 'jpg/glassWall400x230.png');
            this.load.image('wall400x300', 'jpg/glassWall400x300.png');
            _this = this;

            Object.values(doorsHolder).forEach( function(door) {
                    _this.load.image(door.key, door.image);
                    console.log(door);
            });
            
            this.load.image('star', 'assets/star.png');
            this.load.image('bomb', 'assets/bomb.png');
            this.load.spritesheet('dude', 'assets/dude.png', { frameWidth: 32, frameHeight: 48 });


        }

        function create ()
        {
            // init other states
            megaMAP = game.cache.json.get('megaMAP');
            showMazeGfx(megaMAP.doorsMAP, "mazeWDrsRmsMap");            
            //  A simple background for our game
            buildWorld(this);

            // The player and its settings
            player = this.physics.add.sprite(400, 270, 'dude');
            initPlayer(this);

            cursors = this.input.keyboard.createCursorKeys();
            scoreText = this.add.text(16, 16, 'score: 0', { fontSize: '32px', fill: '#000' });

            this.cameras.main.startFollow(player);

            walls = this.physics.add.staticGroup();
            walls.create(160, 450, 'wall400x230').setScale(0.8).refreshBody();
            walls.create(640, 450, 'wall400x230').setScale(0.8).refreshBody();
            walls.create(160, 120, 'wall400x300').setScale(0.8).refreshBody();
            walls.create(640, 120, 'wall400x300').setScale(0.8).refreshBody();
            // doors
            doors = this.physics.add.group();

            console.log(doorsArray);
            // for(var i = 0; i < doorsArray.length; i++) {
            //     var door = doorsArray[i]
            //     var d = doors.create(400+door.offsetX, 300+door.offsetY, door.key).setScale(0.8);
            //     d.settings = { key: door.key };
            //     console.log(d);
            // }
            megaMAP.doorsMAP.forEach( (mapDoors,y) => mapDoors.forEach( function(mapDoor,x) {
                 // TODO: 
                 // console.log('generateArrayMap mapDoor: ', mapDoor);
                 // console.log('', { x:x, y:y, mapDoor: mapDoor});
               }) 
            );

            doorsArray.forEach( (mapDoors,y) => mapDoors.forEach( function(door,x) {
                    var indX = 800 * x;
                    var indY = 540 * y;
                    var d = doors.create(400 + door.offsetX + indX, 270 + door.offsetY + indY, door.key).setScale(0.8);
                    d.settings = { key: door.key, x:x, y:y};
                    console.log(door);
                    console.log(d);
              })
            );
            // walls.create(400, 270, 'hollowRoom').setScale(0.8).refreshBody();
            
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
             scene.add.image(400, 270, 'u0d1l0r1').setScale(0.8);
             scene.add.image(400+800, 270, 'u0d1l1r0').setScale(0.8);
             scene.add.image(400, 270 + 540, 'u1d0l0r1').setScale(0.8);
             scene.add.image(400+800, 270 + 540, 'u1d0l1r1').setScale(0.8);
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
                player.setVelocityX(-160);
                player.anims.play('left', true);
            }
            else if (cursors.up.isDown)
            {
                player.setVelocityY(-100);
                player.anims.play('up', true);
            }
            else if (cursors.down.isDown)
            {
                player.setVelocityY(100);
                player.anims.play('down', true);
            }
            else if (cursors.right.isDown)
            {
                player.setVelocityX(160);
                player.anims.play('right', true);
            }
            else
            {
                player.setVelocityX(0);
                player.setVelocityY(0);
                player.anims.play('turn');
            }

            if (cursors.up.isDown && player.body.touching.down)
            {
                player.setVelocityY(-330);
            }
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