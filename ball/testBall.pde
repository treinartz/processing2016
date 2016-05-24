int x=50;
int y=80;
int speed=2;
Ball [] ballArray=new Ball[4];
Ball ball;

void setup() {
  size(600, 400);
  for (int i=0; i<4; i++) {
    ballArray[i] =new Ball((int) (Math.random()*50)+70, (int) (Math.random()*5)+30);
  }
}
void draw() {
  background(0);
  for (int i=0; i<ballArray.length; i++) {
    ballArray[i].display();
  }
  ball=new Ball(x, y);
  ball.display();
  x=x+speed;
  y=y+speed;

// If the object reaches either edge, multiply speed by -1 to turn it around.
  if ((x > width-15) || (x < 0+15)||(y>height-15)||(y<0+15)) {
    speed = speed * -1;
  }
}