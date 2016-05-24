void b1(){
  if (mousePressed == true && test.MouseIsOverB1()){
    
   fill(45, 20, 251);
   rect(x+300, y+40, 80, 50);
}}
void mousePressed() {

  if (test.MouseIsOverB1()) {
    while(test.MouseIsOverB1())
    b1();
    
  } else if (test.MouseIsOverB2()) {

    print("THIS IS B2 ");
  } else if (test.MouseIsOverB3()) {

    print("THIS IS B3 ");
  } else if (test.MouseIsOverB4()) {
    print("THIS IS B4 ");
  } else if (test.MouseIsOverRESET()) {
    print("THIS IS RESET ");
  } else {
  }


  //clk++;
}