 PImage img;
void setup(){
size(800,400);
background(200);
img = loadImage("imagen1.jpeg");
}

void draw(){ 
  background(203, 203, 199);
  image( img, 0, 0, 400, 400);
  
  strokeWeight( 1 );
  rect(130+400, 120, 140, 170, 30);
    println("X: " + mouseX + " ~ Y: " + mouseY);
  
;
  strokeWeight( 1 );
  fill(170);
rect(159+400, 159, 80, 10, 2);


 fill(227,151,151);
 
 
circle(200+400, 265, 17);
line(width/2, 0, width/2, height); 
fill(227,151,151);
line(130+400, 158, 270+400, 158);



}
