

class ButtonClass {
  float x;
  float y; 
  float w;
  float h;

  ButtonClass(float xpos, float ypos, float widthB, float heightB) {
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }

  void DrawStuff () {
    fill(82, 12, 232);
    stroke(233);
    rect(x, y, w, h );
  }
  boolean MouseIsOverB1() {
    if (mouseX > 10 && mouseX < 110 && mouseY > y && mouseY < 400) {
      cursor(HAND);
      return true;
    }
    cursor(ARROW);
    return false;
  }

  boolean MouseIsOverB2 () {

    if (mouseX > 170 && mouseX < 270 && mouseY > y && mouseY < 400) {
      cursor(HAND);
      return true;
    }
    cursor(ARROW);
    return false;
  }
  boolean MouseIsOverB3() {
    if (mouseX >470 && mouseX <570 && mouseY > y && mouseY <400) {
      cursor(HAND);
      return true;
    } 
    cursor(ARROW);
    return false;
  }
  boolean MouseIsOverB4() {
    if (mouseX > 620 && mouseX < 720 && mouseY > y && mouseY < 400) {
      return true;
    }
    return false;
  }
  boolean MouseIsOverRESET() {
    if (mouseX >10 && mouseX < 110 && mouseY >10 && mouseY <60) {
      return true;
    }
    return false;
  }
}