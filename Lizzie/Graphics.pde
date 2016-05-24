

void graphics(){
  PFont f;
 
  f=createFont("Georgia", 16);
  textFont(f, 30);
  fill(1, 169, 219);
  rect(0, 400, 1000, 800);
  
  
  noStroke();

  fill(250, 204, 46);
  ellipse(56, 56, 100, 100);
  fill(0);
  
  
  text("Fish", 20, 400);
  arc(0, 800, 70, 2, 0, 800);
  
}