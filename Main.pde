import processing.sound.*;
SoundFile soundtrack;
SoundFile pew;
SoundFile explosionSound;

Background background;
Player player;
Enemy enemy;
PImage bg;
PImage bg2;
boolean start1 = false;
boolean start2 = false;
boolean alive = true;
boolean win1 = false;
boolean win2 = false;

void setup()
{
  
  //Runs once at the beginning of the game
  size(750, 750);
  bg = loadImage("background art.png");
   background(bg);
  
  
  
  //background(255); //Sets background clor
  
  background = new Background(); //instantiation of class Blackground
  enemy = new Enemy();
  soundtrack = new SoundFile(this, "SpaceEscape.mp3");
  soundtrack.amp(.5);
  pew = new SoundFile(this, "Pew.mp3");
  explosionSound = new SoundFile(this, "ExplosionSound.mp3");
  explosionSound.amp(.5);
  
  if (win1 == true)
  {
    bg2 = loadImage("background art 2.png");
    image(bg2,0,0);
    background.level = 2;
    enemy.level = 2;
    win1 = false;
    //explosion.play();
  }
  
  player = new Player(); //instantiation of class Player
  background.platformInit();
  background.drawPlatforms(); //Draws platforms
  player.playerInit(); //Sets player's initial location and velocity
  player.drawPlayer(); //Draws player at appropriate location
  player.assignBulletPos();
  player.drawGun();
  enemy.enemyInit();
  
  if (start1 == false)
  {
    PImage startScreen;
    startScreen = loadImage("StartScreen.png");
    image(startScreen,0,0);
  }
  
}

void draw()
{
  if (keyCode == ' ')
  {
    start1 = true;
  }
  
  if (start1 == true && start2 == false)
  {
    PImage controlScreen;
    controlScreen = loadImage("ControlScreen.png");
    image(controlScreen,0,0);
    
    if (keyCode == ENTER)
    {
      start2 = true;
    }
  }
  
  if (start2 == true)
  {
    if(!soundtrack.isPlaying())
    {
      soundtrack.play();
    }
    if (background.level == 1)
    {
      background(bg); //Refreshes background
    }
    if (background.level == 2)
    {
      background(bg2); //Refreshes background
    }
    background.drawPlatforms(); //Redrwas platforms
    background.movePlatforms();
    
    player.drawPlayer(); // Redraws player
    player.movePlayer(); //Left and Right Movement for controller
    player.drawPlayerLifeBar();
    player.isFalling(); //Checks if player is falling
    player.gravity(); //Implements artificial gravity
    player.jump(); //Makes player jump in correct direction
    player.resetJump();
    player.isFacingRight();
    player.drawGun();
    player.setBulletLocation();
    player.displayBullet();
   // player.resetBullet(); //below
   // player.offsetShooting();
    player.keyCheck(); //Converts key pressed to numeric value and stores past two values
    
    enemy.drawEnemy();
    enemy.drawEnemyLifeBar();
    enemy.moveEnemies();
    enemy.hitEnemies();
    player.resetBullet(); //here
    enemy.drawEnemyGun();
    enemy.moveEnemy();
    enemy.shootPlayer();
    enemy.displayBullet();
    enemy.stopEnemies();
  }
  
  if (player.playerLife <= 0)
  {
    alive = false;
  }
  
  if (alive == false)
  {
    PImage endScreen;
    endScreen = loadImage("EndScreen.png");
    image(endScreen,0,0);
    //fill(200, 50, 50);
    //rect(0, 0, 500, 500); // game over screen
    
    if (keyCode == ENTER)
    {
      start1 = false;
      start2 = false;
      alive = true;
      
      if (background.level == 1)
      {
        //print("Working");
        //win1 = false;
      }
      else
      {
        win1 = true;
      }
      
      win2 = false;
      background.level = 1;
      enemy.level = 1;
      setup();
    }
  }
  
  if (key == 'h')
  {
    //print("Working");
    win1 = true;
  }
  
  if (win1 == true)
  {
    setup();
  }
    
  if (keyCode == '2')
  {
    win2 = true;
  }
  
  if (win2 == true)
  {
    PImage winScreen;
    winScreen = loadImage("WinScreen.png");
    image(winScreen,0,0);
    textSize(75);
    textAlign(CENTER);
    fill(44,227,9);
    text("Score: " + player.score, width/2-20,height/2+20);
    
    if (keyCode == ENTER)
    {
      start1 = false;
      start2 = false;
      alive = true;
      //win1 = false;
      win2 = false;
      background.level = 1;
      enemy.level = 1;
      setup();
    }
  }
}

void playExplosionSound()
{
  if(!explosionSound.isPlaying())
  {
    explosionSound.play();
  }
}

void keyPressed()
{
  //Runs eveerytime a key is pressed
  player.setNumKeysPressed(player.getNumKeysPressed()+1); //Increments value of numKeysPressed by one
}
  
void keyReleased()
{
  //Runs everytime a key is released
  player.setNumKeysPressed(player.getNumKeysPressed()-1); //Decrements value of numKeysPressed by one
  if(key == ' ') //shoots player laser
  {
    pew.play();
    player.setNumBullets(player.getNumBullets()+1);
  }
}
