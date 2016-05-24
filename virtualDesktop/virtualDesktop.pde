
PImage img;
void setup() {
  size(640, 480);
  img = loadImage("http://www.publicdomainpictures.net/pictures/30000/velka/cork-board.jpg");
  image(img, 0, 0);
 rect(500, 20, 120, 200, 7);
 fill(0);
 text("Reminders", 529, 40);
 ellipse(512, 62, 8, 12);
 ellipse(512, 92, 8, 12);
 ellipse(512, 122, 8, 12);
 ellipse(512, 152, 8, 12);
 ellipse(512, 182, 8, 12);
fill(255);
rect(30, 20, 200, 200);
rect(280, 110, 200, 200);
rect(60, 250, 200, 200);
fill(100);
triangle(15, 475, 35, 440, 55, 475);
}

void draw() {
}

void mouseClicked(){
  if(mouseX<55 && mouseX>15 && mouseY>440 && mouseY<475){
    switchPic();
  }
}

void switchPic(){
fill(0);
text("Hello", 300, 40);
}



