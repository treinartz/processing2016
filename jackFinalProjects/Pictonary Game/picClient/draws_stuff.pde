void drawStuff()
{  
  //Chooses color
  if(colorNum==0)
  {
    drawColor=color(0,0,0);
  }
  if(colorNum==1)
  {
    drawColor=color(255,0,0);
  }
  if(colorNum==2)
  {
    drawColor=color(0,0,255);
  }
  if(colorNum==3)
  {
    drawColor=color(0,255,0);
  }
  if(colorNum==4)
  {
    drawColor=color(255,255,0);
  }
  if(colorNum==5)
  {
    drawColor=color(242,12,220);
  }
  if(colorNum==6)
  {
    drawColor=color(242,143,12);
  }
  if(colorNum==7)
  {
    drawColor=color(255,255,255);
  }
  
  //Draws if moused is pressed
  if(isMousePressed==1)
  {
    fill(drawColor);
    ellipse(drawMouseX,drawMouseY,10,10);
  }
  
  //Draws player guess
  fill(255,255,255);
  rect(175,500,425,80);
  fill(0,0,0);
  textSize(50);
  if(typedWord.length()>=1);
    text(typedWord,370-(int)(typedWord.length()/2*25),555);
  
  //Eraser
  if(erase==1)
  {
    fill(255,255,255);
    rect(11,10,779,483);
  }
}