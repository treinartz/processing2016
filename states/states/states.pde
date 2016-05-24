PFont f;
int state=0;//intro
String typed="";

void setup() {
  size(1024, 768); 
  fill(0);
  f=createFont("FreeMono", 30);
  textFont(f);
  String[] fontList = PFont.list();
  printArray(fontList);
}
void draw() {
  background(255);
  if (state==0) {
    scene1();
  } else if (state==1) {
   scene2();
  } else if (state==2) {
    scene3();
  } else if (state==3) {
    scene4();
  }
  text(typed, 800, 650, width, 30);
}
void keyTyped() {
  if (key=='0') {
    state=0;
  } else if (key=='1') {
    state=1;
  } else if (key=='2') {
    state=2;
  } else if (key=='3') {
    state=3;
  } else if (key=='4') {
    typed="";
  } else if (typed.equals("one")) {
    state=1;
    typed="";
  } else if (typed.equals("two")) {
    state=2;
    typed="";
  } else if (typed.equals("three")) {
    state=3;
    typed="";
  } else if (typed.equals("four")) {
    state=4;
    typed="";
  }
   else {
    typed+=key;
  }
}
void keyPressed() {
  if (keyCode==BACKSPACE) {
    typed="";
  }
}