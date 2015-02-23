String[] headers;
int[][] data;
void setup(){
  size (500,1000);
  String [] lines = loadStrings ("Cyclist_Count_by_Year_At_Selected_Commuter_Locations.csv"); //loading the dataset
  
  headers = split(lines[0], ","); //splitting the top line of names off into "headers" global array
  
  String[][] tempData = new String[lines.length-1][headers.length]; //create a temporary array removing headers(i think) making it 28x9
  
  for(int i = 1; i < lines.length; i++){ //looping thru lines after the header row
    tempData[i-1] = split(lines[i], ","); //assiging/splitting them into rows in the temp array
  }
    
  data = new int[tempData.length][tempData[0].length]; //making the global data array
  
  for(int i = 0; i < tempData.length; i++){ //looping to enter the rows
  for(int j = 0; j < tempData[i].length; j++){ //looping to enter collums
      
  String[] tempCellValue = split(tempData[i][j], "\""); //remove the quotes
  
  if(tempCellValue[1].equals("") || tempCellValue[1].equals("N/A")){ //replace blank cells with 0s
        data[i][j] = 0;
  }
     else {
        data[i][j] = Integer.parseInt(tempCellValue[1]); //else keep going
   println(data[9][2]); //testing to see values
   
   } 
   } 
  }
 }

 
void draw (){
  background(25);
  PFont h;
  h = createFont("Helvetica",16,true);
  textFont(h,36);
  textAlign(CENTER);
  fill(255);
  if (keyPressed == false) {
    text("b/w/q", 250, 50);
  }
}
void keyPressed () {
     PFont f;
    f = createFont("Helvetica",16,true);
  if (key == 'b') {
    textFont(f,36);
    textAlign(CENTER);
    fill(255);
      text("Brooklyn Bridge", 250, 70);
      text("2000-1993", 250, 40);
      //fill (0,0,255);    
    rect (330, 80, 50, data [9][2]/2); //1993
    //fill (0,,);
    rect (300, 80, 50, data [10][2]/2); //1994
      //fill (200);
    rect (270, 80, 50, data [11][2]/2); //1995
      //fill (185);
    rect (240, 80, 50, data [12][2]/2); //1996
    rect (210, 80, 50, data [13][2]/2); //1997
    rect (180, 80, 50, data [14][2]/2); //1998
    rect (150, 80, 50, data [15][2]/2); //1999
    rect (120, 80, 50, data [16][2]/2); //2000#wemadeit
  } else if (key == 'w') {
    textFont(f,36);
    textAlign(CENTER);
    fill(255);
      text("Williamsburg Bridge", 250, 70);
      text("2000-1993", 250, 40);   
    rect (330, 80, 50, data [9][4]/2); //1993
    //fill (0,,);
    rect (300, 80, 50, data [10][4]/2); //1994
      //fill (200);
    rect (270, 80, 50, data [11][4]/2); //1995
      //fill (185);
    rect (240, 80, 50, data [12][4]/2); //1996
    rect (210, 80, 50, data [13][4]/2); //1997
    rect (180, 80, 50, data [14][4]/2); //1998
    rect (150, 80, 50, data [15][4]/2); //1999
    rect (120, 80, 50, data [16][4]/2); //2000#wemadeit
  } else if (key == 'q') {
     textFont(f,36);
     textAlign(CENTER);
     fill(255);
      text("Queensboro Bridge", 250, 70);
      text("2000-1993", 250, 40);
      //fill (0,0,255);    
     rect (330, 80, 50, data [9][2]/2); //1993
    //fill (0,,);
     rect (300, 80, 50, data [10][2]/2); //1994
      //fill (200);
     rect (270, 80, 50, data [11][2]/2); //1995
      //fill (185);
     rect (240, 80, 50, data [12][2]/2); //1996
     rect (210, 80, 50, data [13][2]/2); //1997
     rect (180, 80, 50, data [14][2]/2); //1998
     rect (150, 80, 50, data [15][2]/2); //1999
     rect (120, 80, 50, data [16][2]/2); //2000#wemadeit
 }
}

  
  
 
 