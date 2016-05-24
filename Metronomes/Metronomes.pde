import processing.sound.*;
import java.util.*;
SoundFile file;
float x;
float y;
float xy;
float yx;
float xSpeed;
float circleSize;
float bpm = 60;
float bps=bpm/60;
int size = 800;
float q = 60;
int counts = 0;
MovingCircle myCircle = new MovingCircle(300,100,q);

void setup()
{
  size(600, 600);
  background(50,5,50);
  frameRate(60);
  file = new SoundFile(this, "Metronome.wav");
}
void draw()
{
  background(255,248,220);
  text("Beats Per Minute: "+bpm,150,500,70,80);
  text("Beats Per Second: "+bps,250,500,70,80);
  text("FPS: "+frameRate,350,500,70,80);
  myCircle.update();
  myCircle.checkCollisions();
  myCircle.drawCircle();
  fill(160,82,45);
  quad(200,450,400,450,350,150,250,150);
  fill(0);
  quad(294,350,306,350,x,y,x,y);
 
  
}
void keyPressed() {
  
    if (keyCode == UP) {
      bpm += 1;
    } else if (keyCode == DOWN&&bpm>=1) {
      bpm-=1;
    }
    else if(keyCode == RIGHT)
    {
      bpm+=10;
    }
    else if(keyCode == LEFT&&bpm>=10)
    {
      bpm-=10;
    }
}
class MovingCircle{
MovingCircle(float xpos, float ypos, float csize) {
    x = xpos;
    y = ypos;
    circleSize = csize;
    xSpeed = ((400-circleSize)*bps)/60;
}
  void update() {
    bps = bpm/60;
    if(xSpeed<0)
      xSpeed = -((400-circleSize)*bps)/60;
      else
      xSpeed = ((400-circleSize)*bps)/60;
    x += xSpeed;
  
   }
  void checkCollisions() {
     
    float r = circleSize/2;
     
    if ( (x<r+100) || (x>500-r)){
      xSpeed = -xSpeed;
        file.play();  
    }
    if(x+(circleSize/2)==300||x-(circleSize/2)==300)
    {
      file.play();
    }
    
    
  }
   
  void drawCircle() { 
    fill(255,255,255);
    ellipse(x, y, circleSize, q);  
  }
}



  