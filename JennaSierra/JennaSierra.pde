int WIDTH = 750;
int HEIGHT = 500;
float x = 20;
float y = 300;
boolean B1 = false;
boolean B2 = false;
boolean B3 = false;
boolean B4 = false;
int clk = 1;

ButtonClass test = new ButtonClass(10, 300, 100, 100);
void setup() {
background(100);
  size(600, 400);
  smooth();
  
}
void draw() {
  drawScreen();
  if(test.MouseIsOverB1()){
    
    fill(255, 0, 0);
    ellipse(30, 80, 30, 30);
  }else if(test.MouseIsOverB2()){

    fill(0, 0, 255);
    ellipse(30, 80, 30, 30);
  }
}




void ReactionOne(){
  
}