class Fish {
  int x, y;
  int xDir=2;
  String name;
  PVector fish;

  Fish(String n) {
    fish=new PVector();
    x = (int)random(0, 700);
    y = (int)random(400, 700);
    name=n;
  }
  int getX() {
    return x;
  }
  void setX(int a) {
    x = a;
  }
  String getName(){
   return name; 
  }
  void createFish() {
    //int n;
    noStroke();
    fill(250);
    //n = (int)(Math.random()*400);
    ellipse(x, y, 50, 30); 
    
  }
  
 }