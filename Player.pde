class Player
{
  PImage player;
  PImage playerLeft;
  
  int playerX;
  int playerY;
  int playerVelX;
  int playerVelY;
  int numKeysPressed = 0;
  
  boolean hasJumped = false;
  boolean isFalling = false;
  boolean hasMoved = false;
  
  boolean canMoveRight = true;
  boolean canMoveLeft = true;
  boolean rightMovement[] = new boolean[60];
  boolean leftMovement[] = new boolean[60];
  
  int rightCounter = 0;
  int leftCounter = 0;
  
  boolean hasCollided[] = new boolean[60];
  int collisionCounter = 0;
  
  int gunX;
  int gunY;
  
  int bulletX[] = new int[50];
  int bulletY[] = new int[50];
  int bulletVelX[] = new int[50];
  int bulletVelY[] = new int[50];
  
  boolean bulletIsMoving[] = new boolean[50];
  
  int numBullets = 0;
  
  boolean isFacingRight = true;
  
  String keys[] = new String[2];
  String lastKey = "";
  
  boolean wantToMove = false;
  
  int playerLife;
  boolean playerIsAlive;
  
  int score;
  
  PImage[] playerRunning = new PImage[3];
  PImage[] playerRunningLeft = new PImage[3];
  
  boolean isMoving = false;

  
  void playerInit()
  {
    playerX = 100;
    playerY = 350;
    playerVelX = 0;
    playerVelY = 0;
    gunX = playerX + 60;
    gunY = playerY + 55;
    playerLife = 10;
    playerIsAlive = true;
    score = 0;
    
    player = loadImage("player.png");
    playerLeft = loadImage("PlayerLeft.png");
    
    playerRunning[0] = loadImage("Run1.png");
    playerRunning[1] = loadImage("Run2.png");
    playerRunning[2] = loadImage("Run3.png");
    playerRunningLeft[0] = loadImage("LeftRun1.png");
    playerRunningLeft[1] = loadImage("LeftRun2.png");
    playerRunningLeft[2] = loadImage("LeftRun3.png");
    
    for(int i=0; i<keys.length; i++)
    {
      keys[i] = null; //Sets the last two keys pressed to null
    }
  }
  
  void drawPlayer()
  {
   // fill(50, 200, 50);
    playerX += playerVelX;
    playerY += playerVelY;
    player.resize(50,100);
    playerLeft.resize(50,100);

   if(isFacingRight)
   {
     image(player, playerX, playerY);
   }
   else
   {
     image(playerLeft, playerX, playerY);
   }
  }
  
  void drawPlayerLifeBar()
  {
    if (playerIsAlive)
    {
      float z = (float) playerLife/10;
      float b = (float) z*50;
      int remainingLife = (int) b;
      fill(0,255,0);
      rect(playerX, playerY - 7, remainingLife, 5);
      fill(255,0,0);
      rect(playerX+remainingLife, playerY - 7, 50-remainingLife, 5);
    }
  }
  
  void movePlayer()
  {
    hasMoved = false;
    if(numKeysPressed > 2) //Prevents numKeysPressed from presenting incorrect value from holding the same button
    {
      numKeysPressed = 0; //Used to be = 0
    }
    if(numKeysPressed == 1 && keyPressed && keyCode != RIGHT && keyCode != LEFT)
    {
      wantToMove = false;
    }
    else
    {
      wantToMove = true;
    }
    if(keyPressed && isFacingRight && playerX <= width-50 && canMoveRight && wantToMove) //Move right
    {
      playerX += 6;
      hasMoved = true;
      isMoving = true;
    }
    else if(keyPressed && !isFacingRight && playerX >= 0 && canMoveLeft && wantToMove) //Move left
    {
      playerX -= 6;
      hasMoved = true;
      isMoving = true;
    }
    else if(numKeysPressed <= 0)
    {
      playerVelX = 0;
      numKeysPressed = 0;
    }
  }
  
  void isFalling()
  {
    for(int i=0; i<background.getPlatformX().length; i++)
    {
      //if(playerX > background.getPlatformX()[i] - 60 && playerX + 50 <= background.getPlatformX()[i] && playerY + 100 > background.getPlatformY()[i] && playerY < background.getPlatformY()[i] + background.getPlatformHeight()[i])
      if(playerX > background.getPlatformX()[i] - 65 && playerX + 50 <= background.getPlatformX()[i] && playerY + 100 > background.getPlatformY()[i] && playerY < background.getPlatformY()[i] + background.getPlatformHeight()[i])
      {
        if(win1 == false && i == 57)
        {
          win1 = true;
        }
        if(win1 == false && i == 58)
        {
          playerLife = 0;
        }
        if(background.level == 2 && i == 37)
        {
          win2 = true;
        }
        if(background.level == 2 && i >= 38)
        {
          playerLife = 0;
        }
        rightMovement[i] = false;
        playerVelX = -playerVelX; //0
        playerX = background.getPlatformX()[i] - 60;
      }
      else
      {
        rightMovement[i] = true;
      }
      
      if(playerX < background.getPlatformX()[i] + background.getPlatformWidth()[i] + 15 && playerX >= background.getPlatformX()[i] + background.getPlatformWidth()[i] && playerY + 100 > background.getPlatformY()[i] && playerY < background.getPlatformY()[i] + background.getPlatformHeight()[i])
      {
        if(win1 == false && i == 57)
        {
          win1 = true;
        }
        if(win1 == false && i == 58)
        {
          playerLife = 0;
        }
        if(background.level == 2 && i == 37)
        {
          win2 = true;
        }
        if(background.level == 2 && i >= 38)
        {
          playerLife = 0;
        }
        leftMovement[i] = false;
        playerVelX = -playerVelX; //0
        playerX = background.getPlatformX()[i] + background.getPlatformWidth()[i] + 10;
      }
      else
      {
        leftMovement[i] = true;
      }
      
      //println(win1);
      
      if(playerX + 50 >= background.getPlatformX()[i] && playerX <= background.getPlatformX()[i] + background.getPlatformWidth()[i] && playerY + 100 >= background.getPlatformY()[i] && playerY <= background.getPlatformY()[i] + background.getPlatformHeight()[i])
      { 
        if(win1 == false && i == 57)
        {
          win1 = true;
          background.level = 2;
        }
        if(win1 == false && i == 58)
        {
          playerLife = 0;
        }
        if(background.level == 2 && i == 37)
        {
          win2 = true;
        }
        if(background.level == 2 && i >= 38)
        {
          playerLife = 0;
        }
        if(playerY >= background.getPlatformY()[i]) //This entire if-block evidently does literally nothing; this hitbox works by magic
        {
          playerVelY = -1;
          hasCollided[i] = false;
        }
        
        if(playerY + 100 <= background.getPlatformY()[i] + background.getPlatformHeight()[i])
        {
          hasCollided[i] = true;
          playerY = background.getPlatformY()[i] + background.getPlatformHeight()[i] - 150;
        }
      }
      else
      {
        hasCollided[i] = false;
      }
      
      if(playerX + 50 >= background.getPlatformX()[i] && playerX <= background.getPlatformX()[i] + background.getPlatformWidth()[i] && playerY + 100 > background.getPlatformY()[i] && playerY <= background.getPlatformY()[i] + background.getPlatformHeight()[i]) //+15
      {
        playerY = background.getPlatformY()[i] + background.getPlatformHeight()[i]; //+15
        playerVelY = 1;
      }
    }
    
    collisionCounter = 0;
    rightCounter = 0;
    leftCounter = 0;
    
    for(int i=0; i<hasCollided.length; i++)
    {
      if(hasCollided[i])
      {
        collisionCounter++;
      }
      
      if(rightMovement[i])
      {
        rightCounter++;
      }
      
      if(leftMovement[i])
      {
        leftCounter++;
      }
    }
    
    
    if(collisionCounter > 0)
    {
      isFalling = false;
    }
    else
    {
      isFalling = true;
    }
    
    if(rightCounter == background.getPlatformX().length)
    {
      canMoveRight = true;
    }
    else
    {
      canMoveRight = false;
    }
    
    if(leftCounter == background.getPlatformX().length)
    {
      canMoveLeft = true;
    }
    else
    {
      canMoveLeft = false;
    }
  }
  
  void gravity()
  {
    //Makes the player fall
    if(isFalling)
    {
      playerVelY += 1;
    }
    else
    {
      playerVelY = 0;
      playerVelX = 0;
    }
  }
  
  void resetJump()
  {
    if(hasJumped && !isFalling && numKeysPressed > 1) //1
    {
      hasJumped = false;
    }
  }
  
  void jump()
  {
    //Allows the player to jump while moving in the same direction as before
    if(keyPressed && keyCode == UP && !hasJumped)
    {
      playerVelY = -18;
      hasJumped = true;
      //if(keys[0] == "LEFT" && numKeysPressed == 2 && canMoveLeft) //Used to be >= 2
      //{
      //  playerVelX -= 6; //4
      //}
      //else if(keys[0] == "RIGHT" && numKeysPressed == 2 && canMoveRight) //Used to be >= 2
      //{
      //  playerVelX += 6; //4
      //}
    }
  }
  
  void drawGun()
  {
    PImage rightGun;
    rightGun = loadImage("RightGun.png");
    PImage leftGun;
    leftGun = loadImage("LeftGun.png");
    
    gunX = playerX + 60;
    gunY = playerY + 55;
    
    if(isFacingRight)
    {
      gunX = playerX + 40;
      gunY = playerY + 50;
      image(rightGun,gunX,gunY);
    }
    else
    {
      gunX = playerX - 20;
      gunY = playerY + 50;
      image(leftGun,gunX,gunY);
    }
    //fill(200,0,0);
    //rect(playerX+40,playerY+50,20,10);
    //fill(0);
  }
  
  void assignBulletPos()
  {    
    for (int i=0; i<bulletX.length; i++)
    {
      bulletX[i] = gunX;
      bulletY[i] = gunY;
    }
  }
  
  void setBulletLocation()
  {    
    for (int i=0; i<numBullets; i++)
    {
      if(Math.abs(bulletX[i] - gunX) < 7 && isFacingRight)
      {
        bulletVelX[i] = 15;
      }
      else if(Math.abs(bulletX[i] - gunX) < 7 && !isFacingRight)
      {
        bulletVelX[i] = -15;
      }
      bulletX[i] += bulletVelX[i];
    }
    
    for(int i=0; i<bulletX.length; i++)
    {
      if(i < numBullets)
      {
        bulletIsMoving[i] = true;
      }
      else
      {
        bulletIsMoving[i] = false;
      }
      
      if(!bulletIsMoving[i])
      {
        bulletX[i] = gunX;
        bulletY[i] = gunY;
      }
    }
  } 
  
  void resetBullet()
  {
    for (int i=0; i<numBullets; i++)
    {
      for(int k=0; k<enemy.getEnemyX().length; k++)
      {
        if(bulletX[i] > width || bulletX[i] < 0 || (bulletX[i] >= enemy.getEnemyX()[k]+10 && bulletX[i] <= enemy.getEnemyX()[k]+40 && bulletY[i] >= enemy.getEnemyY()[k] && bulletY[i] <= enemy.getEnemyY()[k] + 93))
        {
          for (int j=1; j<=numBullets; j++)
          {
            if (j > i)
            {
              bulletX[j-1] = bulletX[j];
              bulletY[j-1] = bulletY[j];
            }
          }
          numBullets--;
        }
      }
    }
  }
  
  public void resetBullet(int distance)
  {
    for (int i=0; i<numBullets; i++)
    {
      if (bulletX[i] >= distance && bulletX[i] <= distance+50)
      {
        for (int j=1; j<=numBullets; j++)
        {
          if (j > i)
          {
            bulletX[j-1] = bulletX[j];
            bulletY[j-1] = bulletY[j];
          }
        }
        numBullets--;
      }
    }
  }
  
  void displayBullet()
  {
    for (int i=0; i<numBullets; i++) 
    {
      PImage leftBullet;
      leftBullet = loadImage("LeftBullet.png");
      PImage rightBullet;
      rightBullet = loadImage("RightBullet.png");
      
      if(bulletVelX[i] > 0)
      {
        image(leftBullet,bulletX[i],bulletY[i]);
      }
      else if (bulletVelX[i] < 0)
      {
        image(rightBullet,bulletX[i],bulletY[i]);
      }
    }
  }
  
  //void offsetShooting()
  //{
  //  if(keyPressed && key == ' ' && isFacingRight && keys[0] != "RIGHT")//&& keys[0] != "RIGHT") //numKeysPressed == 2
  //  {
  //    playerX -= 6;
  //  }
  //  else if(keyPressed && key == ' ' && !isFacingRight && keys[0] != "LEFT")//&& keys[0] != "LEFT") //&& numKeysPressed == 2
  //  {
  //    playerX += 6;
  //  }
  //}
  
  void keyCheck()
  {
    //Keeps track of two most recently typed keys
    if(keyPressed && key != ' ') //&& key != ' '
    {
      keys[0] = keys[1];
      if(keyCode == 37)
      {
        keys[1] = "LEFT";
      }
      else if(keyCode == 39)
      {
        keys[1] = "RIGHT";
      }
    }
  }
  
  void isFacingRight()
  {
    if(keyCode == RIGHT)
    {
      isFacingRight = true;
    }
    if(keyCode == LEFT)
    {
      isFacingRight = false;
    }
  }
  
  public int getNumKeysPressed()
  {
    return numKeysPressed;
  }
  
  void setNumKeysPressed(int newNum)
  {
    numKeysPressed = newNum;
  }
  
  public int getPlayerX()
  {
    return playerX;
  }
  
  public int getPlayerY()
  {
    return playerY;
  }
  
  void setPlayerVelX(int velX)
  {
    playerVelX = velX;
  }
  
  void setCanMoveRight(boolean movement)
  {
    canMoveRight = movement;
  }
  
  void setCanMoveLeft(boolean movement)
  {
    canMoveLeft = movement;
  }
  
  void setNumBullets(int numOfBullets)
  {
    numBullets = numOfBullets;
  }
  
  public int getNumBullets()
  {
    return numBullets;
  }
  
  public int[] getBulletX() {
    return bulletX;
  }
  public int[] getBulletY() {
    return bulletY;
  }
  
  public boolean[] getBulletIsMoving()
  {
    return bulletIsMoving;
  }
    
  public boolean playerIsFacingRight()
  {
    return isFacingRight;
  }
  
  public int getScore()
  {
    return score;
  }
  
  void setScore(int newScore)
  {
    score = newScore;
  }
}
