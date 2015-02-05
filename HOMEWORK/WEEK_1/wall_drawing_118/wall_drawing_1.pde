void setup(){
  size(30,30);
  smooth(); 
  noLoop();
}


void draw (){
  for (int i = 0; i < 25; i = i+5) {
  for (int j = 0; j < 25; j = j+5) {
    point(i, j);
    }
  }
 
beginShape(LINES);
vertex(1,0);
vertex(20,0);
vertex(1,5);
vertex(20,5);
vertex(1,10);
vertex(20,10);
vertex(1,15);
vertex(20,15);
vertex(1,20);
vertex(20,20);
vertex(0,1);
vertex(0,20);
endShape();
  
}


