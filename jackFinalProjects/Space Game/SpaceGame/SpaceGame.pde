import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Images------------------------
PImage ship;
PImage flame;
PImage bird;
PImage Other;
PImage background;
PImage background2;
PImage astroide;
PImage alien1;
PImage alien2;
PImage laser;
//Keys-------------------------
boolean up;
boolean down;
boolean left;
boolean right;
boolean space;
//Game--------------------------
int shipX;
int shipY;
int model;
int timer;
int altTimer;
int rockX[];
int rockY[];
String rockRate[];
int numRocks;
int level=1;
int phase;
//Random-----------------------
int backgroundX;
int background2X=-200;
//Score------------------------
String scores[];
int newHighScore=0;
int newScoreAt=-1;
int runOnce;
//Music------------------------
Minim minim;
AudioPlayer music;
//Aliens-----------------------
int numAliens;
int alienX[];
int alienY[];
int alienModel;
int laserTimer=5;
int cooldown;
String spawnRate[];

void setup()
{
  size(1000, 600);
  frameRate(60);

  //Images--------------------
  /*
  ship=loadImage("SpaceShip.png");
  flame=loadImage("Flame.jpg");
  background=loadImage("Background.png");
  background2=loadImage("Backgroundv2.png");
  bird=loadImage("Bird.png");
  Other=loadImage("Other.png");
  astroide=loadImage("astroide.png");
  alien1=loadImage("alien1.png");
  alien2=loadImage("alien2.png");
  laser=loadImage("laser.png");
  */
  
  ship=loadImage("http://i.imgur.com/xIgahkY.png");
  flame=loadImage("http://i.imgur.com/ucevPLK.jpg");
  background=loadImage("http://i.imgur.com/XQKa1lq.png");
  background2=loadImage("http://i.imgur.com/fCBHTjv.png");
  bird=loadImage("http://i.imgur.com/IcbpfoI.png");
  Other=loadImage("http://i.imgur.com/S5nuhpy.png");
  astroide=loadImage("http://i.imgur.com/Vy4WafY.png");
  alien1=loadImage("http://i.imgur.com/R8TbkgT.png");
  alien2=loadImage("http://i.imgur.com/keBqHDe.png");
  laser=loadImage("http://i.imgur.com/s6PsY23.png");
  
  //Music--------------------
  minim=new Minim(this);
  music=minim.loadFile("music.mp3");
  music.play();

  scores=loadStrings("scores.txt");
  rockRate=loadStrings("RockSpeed.txt");
  spawnRate=loadStrings("alienSpawn.txt");
  rockX=new int [1000];
  rockY=new int [1000];
  alienX=new int [1000];
  alienY=new int [1000];
}

void draw()
{  
  if (phase==0)
  {
    fill(#FFFFFF);
    resetNums();
    background();
    textSize(70);
    text("Select Character", 225, 150);
    image(ship, 100, 300);
    image(bird, 400, 285);
    image(Other, 700, 270);
  }
  if (phase==1)
  {
    fill(#FFFFFF);
    altTimer++;
    timer++;
    background();
    fireLaser();
    shipStuff();
    rockStuff();
    testHit();
    aliens();
    alienHit();    
    level();
    bar();
    textSize(20);
    text("Score:"+timer, 25, 550);
    text("Level:"+level, 25, 520);
    text("Rate:"+rockRate[level], 25, 490);
  }
  if (phase==2)
  {
    fill(#FF4A0D);
    textSize(50);
    text("RESTART", 425, 500);
    gameOver();
    //rect(400,450,200,100);
  }
}

void mousePressed()
{
  if (phase==0)
  {
    if (mouseX>=100&&mouseX<=250&&mouseY>300&&mouseY<=375)
    {
      shipX=250;
      shipY=300+35;
      model=0;
      phase=1;
    }
    if (mouseX>=400&&mouseX<=550&&mouseY>300&&mouseY<=375)
    {
      shipX=250;
      shipY=300+35;
      model=1;
      phase=1;
    }
    if (mouseX>=700&&mouseX<=850&&mouseY>300&&mouseY<=375)
    {
      shipX=250;
      shipY=300+35;
      model=2;
      phase=1;
    }
  }
  if (phase==2)
  {
    if (mouseX>=400&&mouseX<=600&&mouseY>450&&mouseY<=550)
      phase=0;
  }
}

void keyPressed()
{    
  if (key=='w') up=true;
  if (key=='a') left=true;
  if (key=='s') down=true;
  if (key=='d') right=true;
  if (key=='j') space=true;
}

void keyReleased()
{
  if (key=='w') up=false;
  if (key=='a') left=false;
  if (key=='s') down=false;
  if (key=='d') right=false;
  if (key=='j') space=false;
}

//---------------------Phase 0------------------------------------------
void resetNums()
{
  rockX=new int [1000];
  rockY=new int [1000];
  alienX=new int [1000];
  alienY=new int [1000];
  timer=0;
  altTimer=0;
  level=1;
  numRocks=0;
  newHighScore=0;
  newScoreAt=-1;
  runOnce=0;
}

void background()
{
  backgroundX=backgroundX-4;
  image(background, backgroundX, 0);
  if (backgroundX<-6900)
  {
    backgroundX=0;
  }
  background2X=background2X-3;
  image(background2, background2X, 0);
  if (background2X<-6900)
  {
    background2X=0;
  }
}

//-------------------------------Phase 1---------------------------------------------------
void shipStuff()
{
  if (up==true&&shipY>30)
  {
    shipY=shipY-4;
  }
  if (down==true&&shipY<560)
  {
    shipY=shipY+4;
  }
  if (left==true&&shipX>125)
  {
    shipX=shipX-4;
  }
  if (right==true&&shipX<1000)
  {
    shipX=shipX+4;
  }
  if (model==0)
  {       
    if (timer%3==0)
    {
      flame.resize(45, 25);
      image(flame, shipX-170, shipY-15);
    }
    image(ship, shipX-150, shipY-35);
  }
  if (model==1)
  {
    image(bird, shipX-150, shipY-50);
  }
  if (model==2)
  {
    image(Other, shipX-200, shipY-60);
  }
}

void rockStuff()
{
  if (timer%Integer.parseInt(rockRate[level])==0)
  {       
    numRocks++;
    rockX[numRocks]=1100;
    rockY[numRocks]=(int)random(0, 475);
    rockY[numRocks]=(int)random(0, 475);
    rockY[numRocks]=(int)random(0, 475);
  }    
  for (int x=1; x<=numRocks; x++)
  {
    rockX[x]=rockX[x]-8;
    image(astroide, rockX[x], rockY[x]);
  }
}

void testHit()
{
  for (int x = 1; x<=numRocks; x++)
  {
    /*
    rect(shipX,shipY,10,10);
     rect(shipX-150,shipY-25,10,10);
     rect(shipX-150,shipY+05,10,10);
     rect(shipX-25,shipY-30,10,10);
     rect(shipX-25,shipY+15,10,10);
     rect(rockX[x]+20,rockY[x],10,10);
     rect(rockX[x]+20,rockY[x]+42,10,10);
     rect(rockX[x]+20,rockY[x]+80,10,10);
     rect(rockX[x]+20,rockY[x]+115,10,10);
     */

    if (rockX[x]+20>=shipX-150&&rockX[x]+20<=shipX-25)
    {
      if (rockY[x]>=shipY-30&&rockY[x]<=shipY+15)
      {
        phase=2;
      }
    }
    if (rockX[x]+20>=shipX-150&&rockX[x]+20<=shipX-25)
    {
      if (rockY[x]+42>=shipY-30&&rockY[x]+42<=shipY+15)
      {
        phase=2;
      }
    }
    if (rockX[x]+20>=shipX-150&&rockX[x]+20<=shipX-25)
    {
      if (rockY[x]+80>=shipY-30&&rockY[x]+80<=shipY+15)
      {
        phase=2;
      }
    }
    if (rockX[x]+20>=shipX-150&&rockX[x]+20<=shipX-25)
    {
      if (rockY[x]+115>=shipY-30&&rockY[x]+125<=shipY+15)
      {
        phase=2;
      }
    }
  }
}

void level()
{
  if (timer%1000==0)
  {
    level++;
    altTimer=0;
  }
  if (altTimer<180)
  {
    textSize(50);
    text("Level "+level, 400, 50);
  }
}

void aliens()
{
  if (level>1)
  {
    if (timer%Integer.parseInt(spawnRate[level])==0)
    {       
      numAliens++;
      alienX[numAliens]=1100;
      alienY[numAliens]=(int)random(0, 550);
      alienY[numAliens]=(int)random(0, 550);
      alienY[numAliens]=(int)random(0, 550);
    }    
    if (timer%30==0)
    {
      if (alienModel==0)
      {
        alienModel=1;
      } else
      {
        alienModel=0;
      }
    }
    for (int x=1; x<=numAliens; x++)
    {
      alienX[x]=alienX[x]-4;
      if (alienY[x]>shipY)
      {
        alienY[x]=alienY[x]-1;
      } else if (alienY[x]<shipY)
      {
        alienY[x]=alienY[x]+1;
      }
      if (alienModel==0)
      {
        image(alien1, alienX[x], alienY[x]-25);
      } else
      {
        image(alien2, alienX[x], alienY[x]-25);
      }
    }
  }
}

void alienHit()
{
  for (int x=1; x<=numAliens; x++)
  {    
    if (alienX[x]+5>=shipX-150&&alienX[x]+5<=shipX-25)
    {
      if (alienY[x]>=shipY-30&&alienY[x]<=shipY+15)
      {
        phase=2;
      }
    }
    if (alienX[x]+5>=shipX-150&&alienX[x]+5<=shipX-25)
    {
      if (alienY[x]-20>=shipY-30&&alienY[x]-20<=shipY+15)
      {
        phase=2;
      }
    }
    if (alienX[x]+5>=shipX-150&&alienX[x]+5<=shipX-25)
    {
      if (alienY[x]+20>=shipY-30&&alienY[x]+20<=shipY+15)
      {
        phase=2;
      }
    }
  }
}

void fireLaser()
{
  laserTimer++;
  cooldown--;
  if (space==true&&cooldown<0)
  {    
    cooldown=100;
    laserTimer=0;

    for (int x=1; x<=numAliens; x++)
    {
      if (alienX[x]>0)
      {
        if (shipY>=alienY[x]-25&&shipY<=alienY[x]+25)
        {
          alienX[x]=-50;
          alienY[x]=-50;
        }
      }
    }
  }  
  if (laserTimer<5)
  {
    image(laser, shipX-30, shipY);
  }
}

void bar()
{
  fill(#E7E810);
  rect(900, 475, 50, 110);
  fill(#000000);
  rect(905, 480, 40, 100);
  fill(#08FFE8);
  if (cooldown>0)
  {
    rect(905, 480, 40, cooldown);
  }
}

//---------------------------------Phase 2---------------------------------------
void gameOver()
{
  scores=loadStrings("scores.txt");
  newHighScore();
  textSize(50);
  text("High Scores", 400, 75);
  textSize(30);
  text(scores[0], 475, 150);
  text(scores[1], 475, 200);
  text(scores[2], 475, 250);
  text(scores[3], 475, 300);
  text(scores[4], 475, 350);
  saveStrings("scores.txt", scores);
}

void newHighScore()
{
  if (runOnce==0)
  {
    if (timer>Integer.parseInt(scores[0]))
    {
      newScoreAt=0;
    } else if (timer>Integer.parseInt(scores[1]))
    {
      newScoreAt=1;
    } else if (timer>Integer.parseInt(scores[2]))
    {
      newScoreAt=2;
    } else if (timer>Integer.parseInt(scores[3]))
    {
      newScoreAt=3;
    } else if (timer>Integer.parseInt(scores[4]))
    {
      newScoreAt=4;
    }  
    for (int x=4; x>newScoreAt; x--)
    {
      if (x-1>-1)
      {
        scores[x]=scores[x-1];
      }
    }
    if (newScoreAt>-1)
    {
      scores[newScoreAt]=Integer.toString(timer);
      newHighScore=1;
      runOnce=1;
    }
  }
}