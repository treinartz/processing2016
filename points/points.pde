int s;
float x;
float y;
int i = -499; int j = 0;
float[]myArr = new float[1000];
void setup()
{
  size(1000,1000);
  background(255);
}
void Lines()
{
  while(j<1000)
  {
    
    y = .01*pow(i,2);
    y = 500-y;
    myArr[j]=y;
    System.out.println(j+" "+y);
    i++;
    j++;
    ellipse(j,y,1,1);
  }
    
}
void draw()
{
  fill(0);
  rect(0,499,1000,3);
  rect(499,0,3,1000);
  Lines(); 
}