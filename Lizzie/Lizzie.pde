ArrayList<Fish> fishList = new ArrayList<Fish>();
 int speed=1;
void setup() {
  size(800, 700);


  for (int a = 0; a<16; a++) {
    fishList.add(new Fish("John"));
    text(fishList.get(0).getName(), 30, 50);
  }
}

void draw() {
 background(129, 218, 245);
 graphics();
 
 

  for (Fish f : fishList) {
    f.createFish();
    //f.x=f.x+speed;
    //if (f.getX()>800||f.getX()<0) {
      //speed=speed*-1;
    //}
   
    f.x++;
    if (f.getX()>800){
      f.x=-1;
      f.y=(int)random(400, 800);
    }
  }
}