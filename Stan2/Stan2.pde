import java.util.*;
PImage party, drive, study, workout;
PFont helv, helv2;
PImage c111, c112, c113, c114, c115, c116, c117, c118, c119, c1110, c121, c122, c123, c124, c125, c126, c127, c128, c129, c1210, c131, c132, c133, c134, c135, c136, c137, c138, c139, c1310, c141, c142, c143, c144, c145, c146, c147, c148, c149, c1410;
PImage c211, c212, c213, c214, c215, c216, c217, c218, c219, c2110, c221, c222, c223, c224, c225, c226, c227, c228, c229, c2210, c231, c232, c233, c234, c235, c236, c237, c238, c239, c2310, c241, c242, c243, c244, c245, c246, c247, c248, c249, c2410;
PImage cover1, cover2, cover3, cover4, cover5, cover6, cover7, cover8, cover9, cover10;
ArrayList <Artist> myList= new ArrayList<Artist>();
String[] list1, title, artist;

void setup() {
  size(1000, 1000);
  preload();
  println(dataPath(""));
  printArray(PFont.list());
  
  helv=createFont("Georgia", 12);
  textFont(helv, 30);
  
  String l[]=new String[2];
  Scanner scan;
  try {
    scan=new Scanner(new File("/home/thomas/Desktop/Processing/proc/Stan/data.txt"));
    while (scan.hasNext()) {
      String lines=scan.nextLine();
      l =lines.split("-");
      myList.add(new Artist(l[0], l[1]));
    }
  }
  catch (Exception e) {
    println("Not found " + e);
  }
  for (int i = 0; i < myList.size(); i++) {
    println(myList.get(i).getTitle());
  }
  fill(255, 0, 0);
   text(myList.get(3).getTitle(), 0, 325);
   text(myList.get(3).getArtist(), 0, 350);
}

void draw() {
  //background(50);
}

void preload() {
  party= loadImage("http://cdn.shopify.com/s/files/1/0165/4414/files/great-gatsby-party_1024x1024.jpg?12729");
  drive = loadImage("http://s3-us-west-2.amazonaws.com/hypebeast-wordpress/image/2015/08/the-stig-top-gear-test-track-360-tour-0.jpg");
  study= loadImage("http://cultspark.com/wp-content/uploads/2013/05/Iron-Man-3-Tony.jpg");
  workout= loadImage("http://www.trainbodyandmind.com/wp-content/uploads/2011/01/Ivan-Drago-07.jpg");

  drive.resize(300, 300);
  image(drive, 0, 0);

  study.resize(300, 300);
  image(study, 301, 0);
  
  workout.resize(300, 300);
  image(workout, 601, 0);
}