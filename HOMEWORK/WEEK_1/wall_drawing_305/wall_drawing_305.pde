void setup(){
  size(200,200);
}


void draw (){
  noFill();
    point(100,200); //point 1
    point(100,100); //point 7
    point(25,175); //point 8 (I think...)
    arc(100, 100, 200, 200, 0, PI); //the arc
    line(200, 0, 0, 200); //a line from the upper right corner...
    line(100, 0, 100, 200); //the middle line connecting 1 and 7
  }
