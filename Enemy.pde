//import processing.sound.*;
//import processing.sound.*;

class Enemy
{
  SoundFile explosionSound;
  int enemyX[] = new int[10];
  int enemyY[] = new int[10];
  int enemyVelX;
  int enemyVelY;
  int numBullets[] = new int[10]; // 2 is the number of enemies
  int enemyLife[] = new int[10];
  boolean enemyAlive[] = new boolean[10];
  int bulletX[] = new int[10];
  int bulletY[] = new int[10]; // 2 is the number of enemies and 50 is the number of bullets of each bullet
  int bulletVelX[] = new int[10];
  int bulletVelY[] = new int[10];
  boolean bulletIsMoving[] = new boolean[10];
  boolean bulletIsMovingLeft[] = new boolean[10];
  boolean bulletIsMovingRight[] = new boolean[10];
  
  int timer2[] = new int[10];
  int timer[] = new int[10];
  boolean isMovingRight[] = new boolean[10];
  boolean isMovingLeft[] = new boolean[10];
  boolean canMoveRight[] = new boolean[10];
  boolean canMoveLeft[] = new boolean[10];
  int level = 1;
  int gunX[] = new int[10];
  int gunY[] = new int[10];
  boolean gunFacingRight[] = new boolean[10];
  boolean gunFacingLeft[] = new boolean[10];
  boolean gunLastFacingRight[] = new boolean[10];
  boolean gunLastFacingLeft[] = new boolean[10];
  
  int explosionX[] = new int[10];
  int explosionY[] = new int[10];
  
  PImage enemy;
  PImage leftGun;
  PImage rightGun;
  PImage leftBullet;   
  PImage rightBullet;
  PImage explosion;
  
  int explosionTimer1[] = new int[10];
  int explosionTimer2[] = new int[10];

  void enemyInit()
  {
    if (level == 1)
    {
      enemyX[0] = 1300;
      enemyY[0] = 400;
      
      enemyX[1] = 1600; //too far right
      enemyY[1] = 250;
      
      enemyX[2] = 2100;
      enemyY[2] = 100;
      
      enemyX[3] = 1700;
      enemyY[3] = -1100;
      
      enemyX[4] = 1000; //too far left
      enemyY[4] = -900;
      
      enemyX[5] = 50;
      enemyY[5] = -750;
      
      enemyX[6] = 50;
      enemyY[6] = -1050;
      
      enemyX[7] = 100;
      enemyY[7] = -1900;
      
      enemyX[8] = 1900;
      enemyY[8] = -2400;
      
      enemyX[9] = 1900;
      enemyY[9] = -2200;
    }
    
    if (level == 2)
    {
      enemyX[0] = 100;
      enemyY[0] = 200;
      
      enemyX[1] = 500;
      enemyY[1] = 400;
      
      enemyX[2] = 700; //too far right
      enemyY[2] = 100;
      
      enemyX[3] = 1900;
      enemyY[3] = 400;
      
      enemyX[4] = 1500;
      enemyY[4] = 100;
      
      enemyX[5] = 2400; //where is this dude
      enemyY[5] = -100;
      
      enemyX[6] = 3000;
      enemyY[6] = -250;
      
      enemyX[7] = 3400; //where is this dude
      enemyY[7] = -100;
      
      enemyX[8] = 4200; //too far right
      enemyY[8] = -750;
      
      enemyX[9] = 4700;
      enemyY[9] = -900;
    }
    
    for (int i = 0; i < numBullets.length; i++)
    {
      numBullets[i] = 1;
    }
    
    for (int i = 0; i < enemyLife.length; i++)
    {
      enemyLife[i] = 3;
      enemyAlive[i] = true;
    }
    for (int i=0; i<bulletX.length; i++)
    {
      bulletX[i] = enemyX[i] - 10;
      bulletY[i] = enemyY[i] + 50;
      gunX[i] = enemyX[i] + 60;
      gunY[i] = enemyY[i] + 55;
      gunLastFacingLeft[i] = true;
      gunLastFacingRight[i] = false;
    }
    
    for (int i=0; i<bulletX.length; i++)
    {
      explosionX[i] = 0;
      explosionY[i] = 0;
    }
    
    explosion = loadImage("Explosion.png");
    explosion.resize(150,150);
    rightGun = loadImage("RightGun.png");
    leftGun = loadImage("LeftGun.png");
    enemy = loadImage("Enemy.png");
    leftBullet = loadImage("LeftBullet.png");
    rightBullet = loadImage("RightBullet.png");
    
    //explosionSound = new SoundFile(this, "explosion.mp3");
  }
  
  void drawEnemy()
  {
   
    enemy.resize(50,100);
    for(int i=0; i<enemyX.length; i++)
    {
      if (enemyAlive[i])
      {
        image(enemy,enemyX[i],enemyY[i]);
        //rect(enemyX[i],enemyY[i],50,100);
      }
    } 
  }
  
  void drawEnemyLifeBar ()
  {
    for (int i = 0; i < enemyX.length; i++)
    {
      if (enemyAlive[i])
      {
        float z = (float) enemyLife[i]/3;
        float b = (float) z*50;
        int remainingLife = (int) b;
        fill(0,255,0);
        rect(enemyX[i], enemyY[i] - 7, remainingLife, 5);
        fill(255,0,0);
        rect(enemyX[i]+remainingLife, enemyY[i] - 7, 50-remainingLife, 5);
      }
    }
  }
  
  void moveEnemies()
  {
    if(player.getPlayerX() >= 300 && keyPressed) //(keyCode == RIGHT || keyCode == UP))
    {
      for(int i=0; i<enemyX.length; i++)
      {
        enemyX[i] -= 6;
      }
    }
    if(player.getPlayerX() <= 100  && keyPressed ) //&& (keyCode == LEFT || keyCode == UP)
    {
      for(int i=0; i<enemyX.length; i++)
      {
        enemyX[i] += 6;
      }
    }  
    if(player.getPlayerY() <= 100)
    {
      for(int i=0; i< enemyX.length; i++)
      {
        enemyY[i] += 6;
      }
    }
    
    if(player.getPlayerY() >= 350)
    {
      for(int i=0; i<enemyX.length; i++)
      {
        enemyY[i] -= 6;
      }
    }
  }
  
  void stopEnemies()
  {
    for(int i=0; i<enemyX.length; i++)
    {
      for(int j=0; j<background.getPlatformX().length; j++)
      {
        if(enemyX[i] < background.getPlatformX()[j] && enemyX[i] > background.getPlatformX()[j] - 20 && enemyY[i] > background.getPlatformY()[j] - 120 && enemyY[i] + 100 < background.getPlatformY()[j] + 20)
        {
          enemyX[i] = background.getPlatformX()[j];
          canMoveLeft[i] = false;
        }
        else
        {
          canMoveLeft[i] = true;
        }
        if(enemyX[i] + 50 > background.getPlatformX()[j] + background.getPlatformWidth()[j] && enemyX[i] + 50 < background.getPlatformX()[j] + background.getPlatformWidth()[j] + 20 && enemyY[i] > background.getPlatformY()[j] - 120 && enemyY[i] + 100 < background.getPlatformY()[j] + 20) //May need to add another condition making sure not to far over because of platforms at same X value
        {
          enemyX[i] = background.getPlatformX()[j] + background.getPlatformWidth()[j] - 50;
          canMoveRight[i] = false;
        }
        else
        {
          canMoveLeft[i] = false;
        }
      }
    }
  }
  
  void hitEnemies()
  {
    for (int j = 0; j < enemyX.length; j++)
    {
      //if(bulletIsMoving[j])
      //{
      //}
      if (enemyAlive[j])
      {
        for (int i = 0; i < player.getBulletX().length; i++)
        {
          if (player.getBulletIsMoving()[i])
          {
            if ((player.getBulletX()[i] >= enemyX[j] && player.getBulletX()[i] <= enemyX[j]+50) && (player.getBulletY()[i] >= enemyY[j] && player.getBulletY()[i] <= enemyY[j] + 93 )  )
            {
              enemyLife[j]--;
            } 
          }
        }
      }
      if (enemyLife[j] == 0)
      {
        if(explosionX[j] == 0)
        {
          explosionTimer1[j] = millis();
          explosionX[j] = enemyX[j];
          explosionY[j] = enemyY[j];
          player.setScore(player.getScore()+100);
        }
        explosionTimer2[j] = millis();
        if(explosionTimer2[j] - explosionTimer1[j] <= 500)
        {
          playExplosionSound();
          image(explosion,explosionX[j],explosionY[j]);
        }
        enemyAlive[j] = false;   
        enemyX[j] = 10000;
        enemyY[j] = 10000;
        //print(player.getScore());
      }
    }
  }

 void toMovement()
 {
   for (int i = 0; i < enemyX.length; i++)
   {
     if (enemyAlive[i] && canMoveRight[i])
     {
     enemyX[i] += 1;
     }
   }
 }
     
 void froMovement()
 {
   for (int i = 0; i < enemyX.length; i++)
   {
     if (enemyAlive[i] && (!(enemyX[i] <= 0)) && canMoveLeft[i])
     {
       enemyX[i] -= 1;
     }
   }
 }
 
 void moveEnemy()
 {
   for (int i = 0; i < enemyX.length; i++)
   {
     if (enemyX[i] - (player.getPlayerX()+50) < 200 && enemyX[i] - (player.getPlayerX()+50) > 0 && enemyX[i] >= 0 && ((enemyX[i] + 50) <= width) && enemyY[i] >=0 && ((enemyY[i] + 50) <=height)  )
     {
       enemyX[i] -= 4;
       isMovingLeft[i] = true;
       isMovingRight[i] = false;
       gunFacingLeft[i] = true;
      // shootPlayer();
     }
     else if (player.getPlayerX() - (enemyX[i] +50) < 200 && player.getPlayerX() - (enemyX[i]+50) > 0 && enemyX[i] >= 0 && ((enemyX[i] + 50) <= width) && enemyY[i] >=0 && ((enemyY[i] + 50) <=height))
     {
       enemyX[i] += 4;
       isMovingRight[i] = true;
       isMovingLeft[i] = false;
       gunFacingRight[i] = true;
     //  shootPlayer();
     }
     else
     {
       isMovingRight[i] = false;
       isMovingLeft[i] = false;
     }
      if (isMovingLeft[i] && !bulletIsMoving[i]) {bulletIsMovingLeft[i] = true;}
     if (isMovingRight[i] && !bulletIsMoving[i]) {bulletIsMovingRight[i] = true;}
   }
 }
 
 void shootPlayer()
 {
   for (int i = 0; i < enemyX.length; i++)
   {
     timer2[i] = millis() - timer[i];
     if (bulletIsMoving[i])
     {
       if (bulletX[i] > width || bulletX[i] < 0)
       {
         bulletIsMoving[i] = false;
         bulletVelX[i] = 0;
         bulletIsMovingLeft[i] = false;
         bulletIsMovingRight[i] = false;
       }
       if (bulletX[i] <= player.getPlayerX()+50 && bulletX[i] >= player.getPlayerX() && (bulletY[i] >= player.getPlayerY() && bulletY[i] <= player.getPlayerY() + 100))
       {
         player.playerLife--;
         if (player.playerLife == 0 )
         {
           player.playerIsAlive = false;
         }
         bulletIsMoving[i] = false;
         //bulletX[i] = enemyX[i] - 10;
         //bulletY[i] = enemyY[i] + 50;
         bulletIsMovingLeft[i] = false;
         bulletIsMovingRight[i] = false;
       }
     }
     
     if (!bulletIsMoving[i] && timer2[i] >= 1000 && !bulletIsMoving[i] && enemyX[i] <= width && enemyX[i] >= 0 && enemyY[i] <= height && enemyY[i] >=0)
     {
       bulletIsMoving[i] = true;
       timer[i] = millis();
       bulletX[i] = gunX[i];
       bulletY[i] = gunY[i];
       if(enemyX[i] + 1 <= player.getPlayerX() && enemyX[i] + 50 >= player.getPlayerX())
       {
         gunLastFacingRight[i] = true;
         gunLastFacingLeft[i] = false;
         drawEnemyGun();
         if (bulletX[i] <= player.getPlayerX()+50 && bulletX[i] >= player.getPlayerX() && (bulletY[i] >= player.getPlayerY() && bulletY[i] <= player.getPlayerY() + 100))
         {
           player.playerLife--;
           if (player.playerLife == 0 )
           {
             player.playerIsAlive = false;
           }
           bulletIsMoving[i] = false;
           //bulletX[i] = enemyX[i] - 10;
           //bulletY[i] = enemyY[i] + 50;
           bulletIsMovingLeft[i] = false;
           bulletIsMovingRight[i] = false;
         }
       }
       else if(player.getPlayerX() + 1 <= enemyX[i] && player.getPlayerX() + 50 >= enemyX[i])
       {
         gunLastFacingLeft[i] = true;
         gunLastFacingRight[i] = false;
         drawEnemyGun();
         if (bulletX[i] <= player.getPlayerX()+50 && bulletX[i] >= player.getPlayerX() && (bulletY[i] >= player.getPlayerY() && bulletY[i] <= player.getPlayerY() + 100))
         {
           player.playerLife--;
           if (player.playerLife == 0 )
           {
             player.playerIsAlive = false;
           }
           bulletIsMoving[i] = false;
           //bulletX[i] = enemyX[i] - 10;
           //bulletY[i] = enemyY[i] + 50;
           bulletIsMovingLeft[i] = false;
           bulletIsMovingRight[i] = false;
         }
       }
     }
     
     if (bulletIsMoving[i] &&  bulletIsMovingLeft[i])
     {
       bulletX[i] -= 15;
       bulletVelX[i] = -15;
     }
     if (bulletIsMoving[i] && bulletIsMovingRight[i])
     {
       bulletX[i] += 15;
       bulletVelX[i] = 15;
     }
     
     bulletY[i] = enemyY[i] + 50;
     
     if(player.getPlayerX() >= 300 && keyPressed && (bulletIsMovingRight[i] || bulletIsMovingLeft[i])) //(keyCode == RIGHT || keyCode == UP))
     {
       bulletX[i] -= 6;
     }
     if(player.getPlayerX() <= 100  && keyPressed && (bulletIsMovingRight[i] || bulletIsMovingLeft[i])) //&& (keyCode == LEFT || keyCode == UP)
     {
       bulletX[i] += 6;
     }  
   }
 }
 
 void assignBulletPosition()
 {
   for (int i=0; i<bulletX.length; i++)
   {
     bulletX[i] = enemyX[i] - 10;
     bulletY[i] = enemyY[i] + 50;
   }
 }
 
 void displayBullet()
 {
   for (int i = 0; i < enemyX.length; i++) 
   {
     if (bulletIsMoving[i] && (bulletIsMovingRight[i] || bulletIsMovingLeft[i]))
     {
       
      
      if(bulletVelX[i] > 0)
      {
        image(leftBullet,bulletX[i],bulletY[i]);
      }
      else if (bulletVelX[i] < 0)
      {
        image(rightBullet,bulletX[i],bulletY[i]);
      }
       //rect(bulletX[i],bulletY[i],10,10);
     }
     else {bulletIsMoving[i] = false;
       bulletIsMovingRight[i] = false;
       bulletIsMovingLeft[i] = false;}
   }
 }
 
 void drawEnemyGun()
 {
   for (int i = 0; i < enemyX.length; i++)
   {
     if (enemyAlive[i])
     {
       if(gunFacingLeft[i] && isMovingLeft[i])
        {
          gunX[i] = enemyX[i] - 20;
          gunY[i] = enemyY[i] + 50;
         image(leftGun,gunX[i],gunY[i]);
         gunLastFacingLeft[i] = true;
         gunLastFacingRight[i] = false;
        }
        else if(gunFacingRight[i] && isMovingRight[i])
        {
          gunX[i] = enemyX[i] + 40;
         gunY[i] = enemyY[i] + 50;
          image(rightGun,gunX[i],gunY[i]);
          gunLastFacingLeft[i] = false;
         gunLastFacingRight[i] = true;
        }
        else if(gunLastFacingLeft[i])
        {
          gunX[i] = enemyX[i] - 20;
          gunY[i] = enemyY[i] + 50;
          image(leftGun,gunX[i],gunY[i]);
        }
        else if(gunLastFacingRight[i])
        {
          gunX[i] = enemyX[i] + 40;
          gunY[i] = enemyY[i] + 50;
          image(rightGun,gunX[i],gunY[i]);
        }
     }
   }
 }
 
 
 public int[] getEnemyX()
 {
   return enemyX;
 }
 
 public int[] getEnemyY()
 {
   return enemyY;
 }
}
