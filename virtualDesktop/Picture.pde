 import java.util.*;
 
void Picture(){
ArrayList pics = new ArrayList<PImage>();
PImage img1, img2, img3, img4, img5;

img1 = loadImage("http://blog.askiitians.com/wp-content/uploads/2014/04/generic-computer-science.jpg");
img2 = loadImage("https://www.huntington.edu/uploads/media/1317/comp-sci-tracks.jpg");
img3 = loadImage("http://www.colorado.edu/cs/sites/default/files/styles/slider-image/public/globe2.jpg");
img4 = loadImage("http://compsci.wssu.edu/wordpress/wp-content/uploads/2015/01/cas-computer-science.jpg");
img5 = loadImage("http://www.aid-n.com/wp-content/uploads/2012/11/New-Technology-in-Computer-Science-Computer-Science.jpg");

pics.add(img1);
pics.add(img2);
pics.add(img3);
pics.add(img4);
pics.add(img5);

size(150, 150);
image(img1, 0, 0);
draw();
}

//void draw(){
//}


