//import processing.sound.*;

class Background
{
  // We create four arrays that stores the value of the x, y coordinates, width and height of our platforms
  int platformX[] = new int[60]; 
  int platformY[] = new int[60];
  int platformWidth[] = new int[60];
  int platformHeight[] = new int[60];
  int level = 1;

// These are the images that we will use
  PImage p1;
    PImage p2;
    PImage p3;
    PImage p4;
    PImage p5;
    PImage p6;
    PImage p7;
    PImage p8;
    PImage p9;
    PImage p10;
    PImage p11;
    PImage p12;
    PImage p13;
    PImage p14;
    PImage p15;
    PImage p16;
    PImage p17;
    PImage p18;
    
    PImage e1;
    PImage e2;
    PImage e3;
    PImage e4;
    PImage e5;
    
    PImage rocket;

// Here, we initialize the platforms by setting their x,y coordinates, their heights and widths
  void platformInit()
  {
    fill(0);
    
    if (level == 1)
    {
      //floor
      platformX[0] = -50;
      platformY[0] = 500;
      platformWidth[0] = 2600;
      platformHeight[0] = 50;
      
      //ceiling
      platformX[1] = -50;
      platformY[1] = -2550;
      platformWidth[1] = 2600;
      platformHeight[1] = 50;
      
      //left wall
      platformX[2] = -50;
      platformY[2] = -2500;
      platformWidth[2] = 50;
      platformHeight[2] = 3000;
      
      //right wall
      platformX[3] = 2500;
      platformY[3] = -2500;
      platformWidth[3] = 50;
      platformHeight[3] = 3000;
      
      //third floor
      platformX[4] = 500;
      platformY[4] = -2000;
      platformWidth[4] = 2000;
      platformHeight[4] = 50;
      
      platformX[5] = 500;
      platformY[5] = -1550;
      platformWidth[5] = 2000;
      platformHeight[5] = 50;
      
      platformX[6] = 500;
      platformY[6] = -1950;
      platformWidth[6] = 50;
      platformHeight[6] = 400;
      
      platformX[7] = 950;
      platformY[7] = -1950;
      platformWidth[7] = 50;
      platformHeight[7] = 400;
      
      platformX[8] = 500;
      platformY[8] = -1500;
      platformWidth[8] = 500;
      platformHeight[8] = 50;
      
      platformX[9] = 500;
      platformY[9] = -1050;
      platformWidth[9] = 500;
      platformHeight[9] = 50;
      
      platformX[10] = 500;
      platformY[10] = -1450;
      platformWidth[10] = 50;
      platformHeight[10] = 400;
      
      platformX[11] = 950;
      platformY[11] = -1450;
      platformWidth[11] = 50;
      platformHeight[11] = 400;
      
      //second floor
      platformX[12] = 0;
      platformY[12] = -500;
      platformWidth[12] = 2000;
      platformHeight[12] = 50;
      
      platformX[13] = 0;
      platformY[13] = -50;
      platformWidth[13] = 2000;
      platformHeight[13] = 50;
      
      platformX[14] = 0;
      platformY[14] = -450;
      platformWidth[14] = 50;
      platformHeight[14] = 400;
      
      platformX[15] = 1950;
      platformY[15] = -450;
      platformWidth[15] = 50;
      platformHeight[15] = 400;
      
      platformX[16] = 1500;
      platformY[16] = -1000;
      platformWidth[16] = 500;
      platformHeight[16] = 50;
      
      platformX[17] = 1500;
      platformY[17] = -550;
      platformWidth[17] = 500;
      platformHeight[17] = 50;
      
      platformX[18] = 1500;
      platformY[18] = -950;
      platformWidth[18] = 50;
      platformHeight[18] = 400;
      
      platformX[19] = 1950;
      platformY[19] = -950;
      platformWidth[19] = 50;
      platformHeight[19] = 400;
      
      //horizontal section 1
      platformX[20] = 400;
      platformY[20] = 350;
      platformWidth[20] = 200;
      platformHeight[20] = 50;
      
      platformX[21] = 700;
      platformY[21] = 250;
      platformWidth[21] = 200;
      platformHeight[21] = 50;
      
      platformX[22] = 1500;
      platformY[22] = 350;
      platformWidth[22] = 200;
      platformHeight[22] = 50;
      
      //vertical section 1
      platformX[23] = 2300;
      platformY[23] = 350;
      platformWidth[23] = 200;
      platformHeight[23] = 50;
      
      platformX[24] = 2000;
      platformY[24] = 200;
      platformWidth[24] = 200;
      platformHeight[24] = 50;
      
      platformX[25] = 2300;
      platformY[25] = 50;
      platformWidth[25] = 200;
      platformHeight[25] = 50;
      
      platformX[26] = 2000;
      platformY[26] = -100;
      platformWidth[26] = 200;
      platformHeight[26] = 50;
      
      platformX[27] = 2000;
      platformY[27] = -250;
      platformWidth[27] = 100;
      platformHeight[27] = 50;
      
      platformX[28] = 2200;
      platformY[28] = -400;
      platformWidth[28] = 100;
      platformHeight[28] = 50;
      
      platformX[29] = 2400;
      platformY[29] = -550;
      platformWidth[29] = 100;
      platformHeight[29] = 50;
      
      platformX[30] = 2200;
      platformY[30] = -700;
      platformWidth[30] = 100;
      platformHeight[30] = 50;
      
      platformX[31] = 2000;
      platformY[31] = -850;
      platformWidth[31] = 100;
      platformHeight[31] = 50;
      
      //horizontal section 2
      platformX[32] = 1300;
      platformY[32] = -650;
      platformWidth[32] = 200;
      platformHeight[32] = 50;
      
      platformX[33] = 1000;
      platformY[33] = -800;
      platformWidth[33] = 200;
      platformHeight[33] = 50;
      
      platformX[34] = 700;
      platformY[34] = -650;
      platformWidth[34] = 200;
      platformHeight[34] = 50;
      
      //vertical section 2 (elevator)
      platformX[35] = 0;
      platformY[35] = -650;
      platformWidth[35] = 400;
      platformHeight[35] = 50;
      
      platformX[36] = 0;
      platformY[36] = -800;
      platformWidth[36] = 300;
      platformHeight[36] = 50;
      
      platformX[37] = 0;
      platformY[37] = -950;
      platformWidth[37] = 200;
      platformHeight[37] = 50;
      
      platformX[38] = 0;
      platformY[38] = -1100;
      platformWidth[38] = 100;
      platformHeight[38] = 50;
      
      platformX[39] = 300;
      platformY[39] = -1100;
      platformWidth[39] = 200;
      platformHeight[39] = 50;
      
      platformX[40] = 0;
      platformY[40] = -1250;
      platformWidth[40] = 200;
      platformHeight[40] = 50;
      
      platformX[41] = 400;
      platformY[41] = -1250;
      platformWidth[41] = 100;
      platformHeight[41] = 50;
      
      platformX[42] = 0;
      platformY[42] = -1400;
      platformWidth[42] = 300;
      platformHeight[42] = 50;
      
      platformX[43] = 0;
      platformY[43] = -1450;
      platformWidth[43] = 100;
      platformHeight[43] = 50;
      
      platformX[44] = 200;
      platformY[44] = -1600;
      platformWidth[44] = 300;
      platformHeight[44] = 50;
      
      platformX[45] = 400;
      platformY[45] = -1650;
      platformWidth[45] = 100;
      platformHeight[45] = 50;
      
      platformX[46] = 100;
      platformY[46] = -1800;
      platformWidth[46] = 200;
      platformHeight[46] = 50;
      
      platformX[47] = 400;
      platformY[47] = -1950;
      platformWidth[47] = 100;
      platformHeight[47] = 50;
      
      //horizontal section 3
      platformX[48] = 500;
      platformY[48] = -2100;
      platformWidth[48] = 200;
      platformHeight[48] = 50;
      
      platformX[49] = 900;
      platformY[49] = -2100;
      platformWidth[49] = 200;
      platformHeight[49] = 50;
      
      platformX[50] = 1300;
      platformY[50] = -2200;
      platformWidth[50] = 200;
      platformHeight[50] = 50;
      
      platformX[51] = 1700;
      platformY[51] = -2100;
      platformWidth[51] = 300;
      platformHeight[51] = 50;
      
      platformX[52] = 1800;
      platformY[52] = -2300;
      platformWidth[52] = 200;
      platformHeight[52] = 50;
      
      //more walls
      platformX[53] = 400;
      platformY[53] = 400;
      platformWidth[53] = 50;
      platformHeight[53] = 100;
      
      platformX[54] = 550;
      platformY[54] = 400;
      platformWidth[54] = 50;
      platformHeight[54] = 100;
      
      platformX[55] = 700;
      platformY[55] = 300;
      platformWidth[55] = 50;
      platformHeight[55] = 200;
      
      platformX[56] = 850;
      platformY[56] = 300;
      platformWidth[56] = 50;
      platformHeight[56] = 200;
      
      //end
      platformX[57] = 2300;
      platformY[57] = -2100;
      platformWidth[57] = 50;
      platformHeight[57] = 100;
      
      //elec
      platformX[58] = 525;
      platformY[58] = -2025;
      platformWidth[58] = 1450;
      platformHeight[58] = 50;
    }
    
    if (level == 2)
    {
      //floors
      platformX[0] = -50;
      platformY[0] = 500;
      platformWidth[0] = 2100;
      platformHeight[0] = 50;
      
      platformX[1] = 2000;
      platformY[1] = 0;
      platformWidth[1] = 1550;
      platformHeight[1] = 50;
      
      platformX[2] = 3500;
      platformY[2] = -500;
      platformWidth[2] = 1550;
      platformHeight[2] = 50;
      
      platformX[3] = 5000;
      platformY[3] = -1000;
      platformWidth[3] = 1550;
      platformHeight[3] = 50;
      
      //ceilings
      platformX[4] = -50;
      platformY[4] = -50;
      platformWidth[4] = 1550;
      platformHeight[4] = 50;
      
      platformX[5] = 1450;
      platformY[5] = -550;
      platformWidth[5] = 1550;
      platformHeight[5] = 50;
      
      platformX[6] = 2950;
      platformY[6] = -1050;
      platformWidth[6] = 1550;
      platformHeight[6] = 50;
      
      platformX[7] = 4450;
      platformY[7] = -1550;
      platformWidth[7] = 2100;
      platformHeight[7] = 50;
      
      //walls
      platformX[8] = -50;
      platformY[8] = 0;
      platformWidth[8] = 50;
      platformHeight[8] = 500;
      
      platformX[9] = 2000;
      platformY[9] = 50;
      platformWidth[9] = 50;
      platformHeight[9] = 450;
      
      platformX[10] = 1450;
      platformY[10] = -500;
      platformWidth[10] = 50;
      platformHeight[10] = 450;
      
      platformX[11] = 3500;
      platformY[11] = -450;
      platformWidth[11] = 50;
      platformHeight[11] = 450;
      
      platformX[12] = 2950;
      platformY[12] = -950;
      platformWidth[12] = 50;
      platformHeight[12] = 450;
      
      platformX[13] = 5000;
      platformY[13] = -950;
      platformWidth[13] = 50;
      platformHeight[13] = 450;
      
      platformX[14] = 4450;
      platformY[14] = -1500;
      platformWidth[14] = 50;
      platformHeight[14] = 450;
      
      platformX[15] = 6500;
      platformY[15] = -1500;
      platformWidth[15] = 50;
      platformHeight[15] = 500;
      
      //section 1
      platformX[16] = 0;
      platformY[16] = 300;
      platformWidth[16] = 200;
      platformHeight[16] = 50;
      
      platformX[17] = 500;
      platformY[17] = 350;
      platformWidth[17] = 400;
      platformHeight[17] = 50;
      
      platformX[18] = 600;
      platformY[18] = 200;
      platformWidth[18] = 200;
      platformHeight[18] = 50;
      
      platformX[19] = 1100;
      platformY[19] = 350;
      platformWidth[19] = 200;
      platformHeight[19] = 50;
      
      platformX[20] = 1400;
      platformY[20] = 200;
      platformWidth[20] = 200;
      platformHeight[20] = 50;
      
      platformX[21] = 1700;
      platformY[21] = 50;
      platformWidth[21] = 200;
      platformHeight[21] = 50;
      
      //section 2
      platformX[22] = 2400;
      platformY[22] = -150;
      platformWidth[22] = 200;
      platformHeight[22] = 50;
      
      platformX[23] = 2800;
      platformY[23] = -150;
      platformWidth[23] = 300;
      platformHeight[23] = 50;
      
      platformX[24] = 3200;
      platformY[24] = -325;
      platformWidth[24] = 100;
      platformHeight[24] = 50;
      
      platformX[25] = 3000;
      platformY[25] = -550;
      platformWidth[25] = 150;
      platformHeight[25] = 50;
      
      platformX[26] = 3400;
      platformY[26] = -500;
      platformWidth[26] = 100;
      platformHeight[26] = 50;
      
      //section 3
      platformX[27] = 3600;
      platformY[27] = -650;
      platformWidth[27] = 200;
      platformHeight[27] = 50;
      
      platformX[28] = 3800;
      platformY[28] = -800;
      platformWidth[28] = 200;
      platformHeight[28] = 50;
      
      platformX[29] = 4150;
      platformY[29] = -650;
      platformWidth[29] = 200;
      platformHeight[29] = 50;
      
      platformX[30] = 4550;
      platformY[30] = -650;
      platformWidth[30] = 400;
      platformHeight[30] = 50;
      
      platformX[31] = 4650;
      platformY[31] = -800;
      platformWidth[31] = 200;
      platformHeight[31] = 50;
      
      platformX[32] = 4900;
      platformY[32] = -1000;
      platformWidth[32] = 100;
      platformHeight[32] = 50;
      
      //section 4
      platformX[33] = 5100;
      platformY[33] = -1150;
      platformWidth[33] = 100;
      platformHeight[33] = 50;
      
      platformX[34] = 5400;
      platformY[34] = -1150;
      platformWidth[34] = 100;
      platformHeight[34] = 50;
      
      platformX[35] = 5700;
      platformY[35] = -1150;
      platformWidth[35] = 100;
      platformHeight[35] = 50;
      
      platformX[36] = 6000;
      platformY[36] = -1300;
      platformWidth[36] = 50;
      platformHeight[36] = 50;
      
      //end
      platformX[37] = 6300;
      platformY[37] = -1100;
      platformWidth[37] = 50;
      platformHeight[37] = 100;
      
      //elec
      platformX[38] = 2525;
      platformY[38] = -25;
      platformWidth[38] = 450;
      platformHeight[38] = 50;
      
      platformX[39] = 3525;
      platformY[39] = -525;
      platformWidth[39] = 1500;
      platformHeight[39] = 50;
      
      platformX[40] = 4975;
      platformY[40] = -950;
      platformWidth[40] = 50;
      platformHeight[40] = 450;
      
      platformX[41] = 5025;
      platformY[41] = -1025;
      platformWidth[41] = 950;
      platformHeight[41] = 50;
    }
  // We load the images of the platforms that we declared previously
    p1 = loadImage("P1.png");
    p2 = loadImage("P2.png");
    p3 = loadImage("P3.png");
    p4 = loadImage("P4.png");
    p5 = loadImage("P5.png");
    p6 = loadImage("P6.png");
    p7 = loadImage("P7.png");
    p8 = loadImage("P8.png");
    p9 = loadImage("P9.png");
    p10 = loadImage("P10.png");
    p11 = loadImage("P11.png");
    p12 = loadImage("P12.png");
    p13 = loadImage("P13.png");
    p14 = loadImage("P14.png");
    p15 = loadImage("P15.png");
    p16 = loadImage("P16.png");
    p17 = loadImage("P17.png");
    p18 = loadImage("door.png");
    
    e1 = loadImage("E1.png");
    e2 = loadImage("E2.png");
    e3 = loadImage("E3.png");
    e4 = loadImage("E4.png");
    e5 = loadImage("E5.png");
    
    rocket = loadImage("Rocket.png");
  }
  
  void drawPlatforms()
  {
    for(int i=0; i<platformX.length; i++)
    { 
      if(level == 1)
      {
        if(i == 0 || i == 1)
        {
          image(p1,platformX[i],platformY[i]);
        }
        else if(i == 2 || i == 3)
        {
          image(p2,platformX[i],platformY[i]);
        }
        else if(i == 4 || i == 5 || i == 12 || i == 13)
        {
          image(p3,platformX[i],platformY[i]);
        }
        else if(i == 6 || i == 7 || i == 10 || i == 11 || i == 14 || i == 15 || i == 18 || i == 19)
        {
          image(p4,platformX[i],platformY[i]);
        }
        else if(i == 8 || i == 9 || i == 16 || i == 17)
        {
          image(p5,platformX[i],platformY[i]);
        }
        else if((i>=20 && i<=26) || (i>=32 && i<=34) || i == 37 || i == 39 || i == 40 || i == 46 || (i>=48 && i<=50) || i == 52)
        {
          image(p6,platformX[i],platformY[i]);
        }
        else if((i>=27 && i<=31) || i == 38 || i == 41 || i == 43 || i == 45 ||i == 47)
        {
          image(p7,platformX[i],platformY[i]);
        }
        else if(i == 35)
        {
          image(p8,platformX[i],platformY[i]);
        }
        else if(i == 36 || i == 42 || i == 44 || i == 51)
        {
          image(p9,platformX[i],platformY[i]);
        }
        else if(i == 53 || i == 54)
        {
          image(p10,platformX[i],platformY[i]);
        }
        else if(i == 55 || i == 56)
        {
          image(p11,platformX[i],platformY[i]);
        }
        else if(i == 57)
        {
          //fill(95,42,6);
          //rect(platformX[i],platformY[i],platformWidth[i],platformHeight[i]);
          image(p18,platformX[i],platformY[i]);
        }
        else if(i == 58)
        {
          image(e1,platformX[i],platformY[i]);
        }
      }
      else if(level == 2)
      {
        if(i == 16 || (i>=18 && i<=22) || (i>=27 && i<=29) || i == 31)
        {
          image(p6,platformX[i],platformY[i]);
        }
        else if(i == 24 || i == 26 || (i>=32 && i<=35))
        {
          image(p7,platformX[i],platformY[i]);
        }
        else if(i == 17 || i == 30)
        {
          image(p8,platformX[i],platformY[i]);
        }
        else if(i == 23)
        {
          image(p9,platformX[i],platformY[i]);
        }
        else if(i == 0 || i == 7)
        {
          image(p12,platformX[i],platformY[i]);
        }
        else if((i>=1 && i<=6))
        {
          image(p13,platformX[i],platformY[i]);
        }
        else if(i == 8 || i == 15)
        {
          image(p14,platformX[i],platformY[i]);
        }
        else if(i>=9 && i<=14)
        {
          image(p15,platformX[i],platformY[i]);
        }
        else if(i == 25)
        {
          image(p16,platformX[i],platformY[i]);
        }
        else if(i == 36)
        {
          image(p17,platformX[i],platformY[i]);
        }
        else if(i == 37)
        {
          image(rocket,platformX[i],platformY[i]);
        }
        else if(i == 38)
        {
          image(e2,platformX[i],platformY[i]);
        }
        else if(i == 39)
        {
          image(e3,platformX[i],platformY[i]);
        }
        else if(i == 40)
        {
          image(e4,platformX[i],platformY[i]);
        }
        else if(i == 41)
        {
          image(e5,platformX[i],platformY[i]);
        }
      }
    }
  }


// When the players move left and right, to create the effect that the player is moving, we move the platforms

  void movePlatforms()
  {
    if(player.getPlayerX() >= 300 && keyPressed) //(keyCode == RIGHT || keyCode == UP))
    {
      for(int i=0; i<platformX.length; i++)
      {
        platformX[i] -= 6;
        player.setPlayerVelX(0);
        player.setCanMoveRight(false);
      }
    }
    if(player.getPlayerX() <= 100  && keyPressed ) //&& (keyCode == LEFT || keyCode == UP)
    {
      for(int i=0; i<platformX.length; i++)
      {
        platformX[i] += 6;
         player.setPlayerVelX(0);
        player.setCanMoveLeft(false);
      }
    }
    if(player.getPlayerY() <= 100)
    {
      for(int i=0; i<platformX.length; i++)
      {
        platformY[i] += 6;
      }
    }
    
    if(player.getPlayerY() >= 350)
    {
      for(int i=0; i<platformX.length; i++)
      {
        platformY[i] -= 6;
      }
    }
  }
  
  public int[] getPlatformX() {
    return platformX;
  }
  
  public int[] getPlatformY() {
    return platformY;
  }
  
  public int[] getPlatformWidth() {
    return platformWidth;
  }
  
  public int[] getPlatformHeight()
  {
    return platformHeight;
  }

// This function makes the player move to the left-most wall
  void moveToLeftWall() {
    if (player.getPlayerX() > platformX[2] ) {
    player.movePlayer();}
  
  }
}
