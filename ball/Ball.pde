
class Ball {

  int bigX;
  int bigY;
  int speed=1;


  Ball(int x, int y) {
    bigX=x;
    bigY=y;
  }

  void display() {
    ellipse(bigX, bigY, 30, 30);
  }
}