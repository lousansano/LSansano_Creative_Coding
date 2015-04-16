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
  background(25); //create a black background
  PFont f; //font 1, for the titles
  PFont d; //font 2, for the selected data (an attempt to use a bold font, dont think it worked
  f = createFont("Helvetica",36,true);
  d = createFont("Helvetica Bold",36,true);
  textSize(36);
  text("b", 35,60); // the selectable data as a sidebar in the viz, the first letter of what it represents ie. B=Brooklyn Bridge
  text("w", 35,110);
  text("q", 35,160);
  text("s", 35,210);
  text("5", 35,260);
  text("Cyclists: 1993-2000", 85, 75);
  if (keyPressed) { //to view the data keypresses are used to select sets
  } else if (key == 'b'){ //the instructions for when the key is pressed
    background(0); //reset the background so that the title text as well as the text in the side bar clears
    textFont(d,50); // for the selected number I increased the font size so that it is clear what is selected
    text("b", 35,60);
    textFont(f,36); // the regular font for the side bar letters
    text("w", 35,110);
    text("q", 35,160);
    text("s", 35,210);
    text("5", 35,260);
    textAlign(CENTER); // centered title
    fill(255); //white text beacause of the black background
      text("Brooklyn Bridge", 250, 70);
      text("2000-1993", 250, 40);
      //fill (0,0,255); //color for the rects  
    rect (330, 80, 50, data [9][2]/2); //1993
    //fill (0,,); // was thinking about having ranges of colors, maybe in the future
    rect (300, 80, 50, data [10][2]/2); //1994 //there was probably a way to use a loop to retrive the data
    rect (240, 80, 50, data [12][2]/2); //1996 //but I couldn't figure out how to get that to work
    rect (270, 80, 50, data [11][2]/2); //1995 //just went and grabbed everything manually instead
    rect (210, 80, 50, data [13][2]/2); //1997
    rect (180, 80, 50, data [14][2]/2); //1998
    rect (150, 80, 50, data [15][2]/2); //1999
    rect (120, 80, 50, data [16][2]/2); //2000#wemadeit
   }  
 else if (key == 'w') {
   background(0);
   textFont(d,50);
   text("w", 35,110);
   textFont(f,36);
    text("b", 35,60);
    text("q", 35,160);
    text("s", 35,210);
    text("5", 35,260);
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
    background(0); 
    textFont(d,50);
    text("q", 35,160);
    textFont(f,36);
     textAlign(CENTER);
     fill(255);
     text("b", 35,60);
     text("w", 35,110);
     text("s", 35,210);
     text("5", 35,260);
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
 } else if (key == 's') {
     background(0);
     textFont(d,50);
     text("s", 35,210);
     textFont(f,36);
     text("b", 35,60);
     text("w", 35,110);
     text("q", 35,160);
     text("5", 35,260);
     textAlign(CENTER);
     fill(255);
      text("Staten Island Ferry", 250, 70);
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
  }else if (key == '5') {
     background(0); 
     textFont(d,50);
     text("5", 35,260);
     textFont(f,36);
     text("b", 35,60);
     text("w", 35,110);
     text("s", 35,210);
     text("q", 35,160);
     textAlign(CENTER);
     fill(255);
      text("West 50th St.", 250, 70);
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
