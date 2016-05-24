float wx = 115;
float wy = 75;
float rx = 325;
float ry = 75;
float gx = 115;
float gy = 300;
float bx = 325;
float by = 300;
boolean overBox, overBox1, overBox2, overBox3 = false;
boolean locked, locked1, locked2, locked3 = false;
float xOffset, xOffset1, xOffset2, xOffset3 = 0.0;
float yOffset, yOffset1, yOffset2, yOffset3 = 0.0;

void setup(){
  size(600, 600);
  }

void draw(){
 background (0);
  fill(0);
  stroke(255);
  rect(115, 75, 150, 200);
  rect(325, 75, 150, 200);
  rect(115, 300, 150, 200);
  rect(325, 300, 150, 200);
  
  if(mouseX > wx && mouseX < wx+150 && mouseY > wy && mouseY < wy+200){
    overBox = true; 
  }else{
      overBox = false;
    }
    fill(255);
    rect(wx, wy, 150, 200);
    
    if(mouseX > rx && mouseX < rx+150 && mouseY > ry && mouseY < ry+200){
    overBox1 = true; 
  }else{
      overBox1 = false;
    }
    fill(255, 0, 0);
    rect(rx, ry, 150, 200);
    
    if(mouseX > gx && mouseX < gx+150 && mouseY > gy && mouseY < gy+200){
    overBox2 = true; 
  }else{
      overBox2 = false;
    }
    fill(0, 255, 0);
    rect(gx, gy, 150, 200);
    
    if(mouseX > bx && mouseX < bx+150 && mouseY > by && mouseY < by+200){
    overBox3 = true; 
  }else{
      overBox3 = false;
    }
    fill(0, 0, 255);
    rect(bx, by, 150, 200);
}

void mousePressed(){
 {if(overBox){
   locked = true;
 } else {
   locked = false;
 } 
 xOffset = mouseX-wx;
 yOffset = mouseY-wy;}
 
 {if(overBox1){
   locked1 = true;
 } else {
   locked1 = false;
 }
 xOffset1 = mouseX-rx;
 yOffset1 = mouseY-ry;}


 {if(overBox2){
   locked2 = true;
 } else {
   locked2 = false;
 }
 xOffset2 = mouseX-gx;
 yOffset2 = mouseY-gy;}


{if(overBox3){
   locked3 = true;
 } else {
   locked3 = false;
 }
 xOffset3 = mouseX-bx;
 yOffset3 = mouseY-by;}
}

void mouseDragged(){
  if(locked){
    wx = mouseX-xOffset;
    wy = mouseY-yOffset;
  }
  if(locked1){
    rx = mouseX-xOffset1;
    ry = mouseY-yOffset1;
  }
  if(locked2){
    gx = mouseX-xOffset2;
    gy = mouseY-yOffset2;
  }
  if(locked3){
    bx = mouseX-xOffset3;
    by = mouseY-yOffset3;
  }
}

void mouseReleased(){
  if(overBox){
  if(mouseX > 115 && mouseX < 265 && mouseY > 75 && mouseY < 275){
    wx=115;
    wy=75;}
  if(mouseX > 325 && mouseX < 475 && mouseY > 75 && mouseY < 275){
  wx=325;
  wy=75;}
  if(mouseX > 115 && mouseX < 265 && mouseY > 300 && mouseY < 500){
  wx=115;
  wy=300;}
  if(mouseX > 325 && mouseX < 475 && mouseY > 300 && mouseY < 500){
  wx=325;
  wy=300;
locked = false;}


  locked1 = false;}
  locked2 = false;
  locked3 = false;
}