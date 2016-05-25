import processing.net.*;
Client c;

PImage overlay;
color drawColor;

String input;
String keyWord;
String data[];
String typedWord="";

int colorNum;
int drawMouseX;
int drawMouseY;
int isMousePressed;
int erase=0;

//---------Enter name here--------
String name="Sample_Name";//<----Enter your name here

void setup()
{
  //Frame and client setup
  size(800,590);
  frameRate(30);
  background(255,255,255);
  noStroke();
  overlay=loadImage("overlay.png");
  image(overlay,0,0);
  c = new Client(this, "10.9.30.55", 12345);//<------ Enter ip4v of server is over lan
}

void draw()
{  
  if(c.available() > 0)
  {
    //Takes in data and splits
    input=c.readString();
    data=split(input,' '); 
    
    //Assigns data to variables
    drawMouseX=parseInt(data[0]);
    drawMouseY=parseInt(data[1]);
    colorNum=parseInt(data[2]);
    erase=parseInt(data[3]);
    keyWord=data[4];
    isMousePressed=parseInt(data[5]);
  }  
  drawStuff();  
}