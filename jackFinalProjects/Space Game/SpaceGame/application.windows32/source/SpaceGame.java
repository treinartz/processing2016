import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*; 
import ddf.minim.signals.*; 
import ddf.minim.spi.*; 
import ddf.minim.ugens.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SpaceGame extends PApplet {








BufferedReader reader;

//Images------------------------
PImage ship;
PImage flame;
PImage bird;
PImage Other;
PImage background;
PImage background2;
PImage astroide;
//Keys-------------------------
boolean up;
boolean down;
boolean left;
boolean right;
//Game--------------------------
int shipX;
int shipY;
int model;
int timer;
int altTimer;
boolean changeModel;
int rockX[];
int rockY[];
int numRocks;
int phase;
//Random-----------------------
int backgroundX;
int background2X=-200;
//Music------------------------
Minim minim;
AudioPlayer music;

public void setup()
{
  
  frameRate(60);
  
  //Images--------------------
  ship=loadImage("SpaceShip.png");
  flame=loadImage("Flame.jpg");
  background=loadImage("Background.png");
  background2=loadImage("Backgroundv2.png");
  bird=loadImage("Bird.png");
  Other=loadImage("Other.png");
  astroide=loadImage("astroide.png");
  //Music--------------------
  minim=new Minim(this);
  music=minim.loadFile("music.mp3");
  //music.play();
  
  reader=createReader("scores");
  
  rockX=new int [1000];
  rockY=new int [1000];
}

public void draw()
{
  if(phase==0)
  {
    fill(0xffFFFFFF);
    resetNums();
    background();
    textSize(70);
    text("Select Character",225,150);
    image(ship,100,300);
    image(bird,400,285);
    image(Other,700,270);
  }
  if(phase==1)
  {
    fill(0xffFFFFFF);
    textSize(20);
    timer++;
    background();
    shipStuff();
    rockStuff();
    testHit();
    text("Score:"+timer,25,550);     
  }
  if(phase==2)
  {
    fill(0xffFF4A0D);
    textSize(50);
    text("RESTART",400,500);
    //rect(400,450,200,100);
  }     
}

public void mousePressed()
{
  if(phase==0)
  {
  if(mouseX>=100&&mouseX<=250&&mouseY>300&&mouseY<=375)
    {
      shipX=250;
      shipY=300+35;
      model=0;
      phase=1;
    }
    if(mouseX>=400&&mouseX<=550&&mouseY>300&&mouseY<=375)
    {
      shipX=250;
      shipY=300+35;
      model=1;
      phase=1;
    }
    if(mouseX>=700&&mouseX<=850&&mouseY>300&&mouseY<=375)
    {
      shipX=250;
      shipY=300+35;
      model=2;
      phase=1;
    }
  }
  if(phase==2)
  {
    if(mouseX>=400&&mouseX<=600&&mouseY>450&&mouseY<=550)
    phase=0;
  }
}

public void keyPressed()
{    
  if(key=='w') up=true;
  if(key=='a') left=true;
  if(key=='s') down=true;
  if(key=='d') right=true;
  if(key=='m') changeModel=true;
}

public void keyReleased()
{
  if(key=='w') up=false;
  if(key=='a') left=false;
  if(key=='s') down=false;
  if(key=='d') right=false;
  if(key=='m') changeModel=false;
}

public void shipStuff()
{
  if(up==true&&shipY>30)
  {
    shipY=shipY-4;
  }
  if(down==true&&shipY<560)
  {
    shipY=shipY+4;
  }
  if(left==true&&shipX>125)
  {
    shipX=shipX-4;
  }
  if(right==true&&shipX<1000)
  {
    shipX=shipX+4;
  }
  if(changeModel==true)
  {
    model=(int)random(0,3);
  }
  if(model==0)
  {       
    if(timer%3==0)
    {
      flame.resize(45,25);
      image(flame,shipX-170,shipY-15);
    }
    image(ship,shipX-150,shipY-35);
  }
  if(model==1)
  {
    image(bird,shipX-150,shipY-50);
  }
  if(model==2)
  {
    image(Other,shipX-200,shipY-60);
  }
}

public void rockStuff()
{
    if(timer%50==0||timer==100)
    {       
      numRocks++;
      rockX[numRocks]=1100;
      rockY[numRocks]=(int)random(0,475);
    }    
    for(int x=1;x<=numRocks;x++)
    {
      rockX[x]=rockX[x]-8;
      //rotate(random(10,20));
      image(astroide,rockX[x],rockY[x]);
    }    
}

public void testHit()
{
  for(int x = 1;x<=numRocks;x++)
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
    if(rockX[x]+20>=shipX-150&&rockX[x]+20<=shipX-25)
    {
      if(rockY[x]>=shipY-30&&rockY[x]<=shipY+15)
      {
        phase=2;
        gameOver();
      }
    }
    if(rockX[x]+20>=shipX-150&&rockX[x]+20<=shipX-25)
    {
      if(rockY[x]+42>=shipY-30&&rockY[x]+42<=shipY+15)
      {
        phase=2;
        gameOver();
      }
    }if(rockX[x]+20>=shipX-150&&rockX[x]+20<=shipX-25)
    {
      if(rockY[x]+80>=shipY-30&&rockY[x]+80<=shipY+15)
      {
        phase=2;
        gameOver();
      }
    }
     if(rockX[x]+20>=shipX-150&&rockX[x]+20<=shipX-25)
    {
      if(rockY[x]+115>=shipY-30&&rockY[x]+125<=shipY+15)
      {
        phase=2;
        gameOver();
      }
    }
  }  
}

public void resetNums()
{
  rockX=new int [1000];
  rockY=new int [1000];
  timer=0;
  numRocks=0;
}

public void gameOver()
{
  System.out.println("GAME OVER ----- Score: "+timer);
}

public void background()
{
   backgroundX=backgroundX-4;
   image(background,backgroundX,0);
   if(backgroundX<-6900)
   {
     backgroundX=0;
   }
   
   background2X=background2X-3;
   image(background2,background2X,-50);
   if(background2X<-6900)
    {
      background2X=0;
    }  
}
  public void settings() {  size(1000,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SpaceGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
