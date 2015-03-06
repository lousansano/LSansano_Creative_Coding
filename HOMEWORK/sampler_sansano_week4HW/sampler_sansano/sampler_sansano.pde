import ddf.minim.*; //loading minim
import ddf.minim.ugens.*; // was going to mess around with effects stuff, maybe in the future

Minim minim;
AudioSample kick; //declairing my samples and songs to be played
AudioSample snare;
AudioSample chat;
AudioSample ohat;
AudioSample tom1;
AudioSample tom2;
AudioSample rim;
AudioSample crash;
AudioSample air;
AudioPlayer lit;
AudioPlayer smb;
AudioPlayer mj;



void setup() {
  size(700, 600);

  minim = new Minim(this);


  lit = minim.loadFile("LITbruh.mp3", 1024); //loading the 3 songs I plan on using, with a higher bit rate
  smb = minim.loadFile("SMB.mp3", 1024); //since they dont need to be called repeatedly id rather have them at a=
  mj = minim.loadFile("ANOTHERMIDIOFME.mp3", 1024);//higher resolution

  kick = minim.loadSample("Kick.wav", 128); //loading up the samples at a lower bit rate for faster rendering/calling
  snare = minim.loadSample("Snare.wav", 128);
  crash = minim.loadSample("Cymb.wav", 128);
  chat = minim.loadSample("CHat.wav", 128);
  ohat = minim.loadSample("OHat.wav", 128);
  tom1 = minim.loadSample("Tom1.wav", 128);
  tom2 = minim.loadSample("Tom2.wav", 128);
  rim = minim.loadSample("Rim.wav", 128);
  air = minim.loadSample("Air.mp3", 128);
  
}


void draw()
{
  background(0);
  stroke(255); 
  PFont d;// setting font for the text
  d = createFont("Helvetica Bold", 36, true);
  textSize(28); //a slightly smaller size for the description/instructional text
  text("kick K", 55, 48);
  text("snare S", 55, 98);
  text("crash C", 55, 152);
  text("closed hat H", 55, 198);
  text("open hat O", 55, 248);
  text("tom 1 T", 55, 298);
  text("tom 2 Y", 55, 348);
  text("rimshot R", 55, 398);
  text("air horn A", 55, 448);
  textSize(34);
  text("Lit 1", 150, 550);
  text("Michael 2", 250, 550);
  text("Mario 3", 430, 550);

  for (int i = 0; i < kick.bufferSize () - 1; i++)
  {
    float x1 = map(i, 0, kick.bufferSize(), 0, 300);
    float x2 = map(i+1, 0, kick.bufferSize(), 0, 400);
    //float x3 = map(i+2, 0, smb.bufferSize(), 0, 500);
    rect(x1, 50 - kick.mix.get(i)*50, x2, 15 - kick.mix.get(i+1)*25);
    rect(x1, 100 - snare.mix.get(i)*50, x2, 15 - snare.mix.get(i+1)*25);
    rect(x1, 150 - crash.mix.get(i)*50, x2, 15 - crash.mix.get(i+1)*25);
    rect(x1, 200 - chat.mix.get(i)*50, x2, 15 - chat.mix.get(i+1)*25);
    rect(x1, 250 - ohat.mix.get(i)*50, x2, 15 - ohat.mix.get(i+1)*25);
    rect(x1, 300 - tom1.mix.get(i)*50, x2, 15 - tom1.mix.get(i+1)*25);
    rect(x1, 350 - tom2.mix.get(i)*50, x2, 15 - tom2.mix.get(i+1)*25);
    rect(x1, 400 - rim.mix.get(i)*50, x2, 15 - rim.mix.get(i+1)*25);
    rect(x1, 450 - air.mix.get(i)*50, x2, 15 - air.mix.get(i+1)*25);
    //rect(x1, 500 - smb.mix.get(i)*50, x2, 15 - smb.mix.get(i+1)*25);
}
}

void keyPressed() {
  if ( key == 's' ) snare.trigger(); 
 else if ( key == 'k' ) kick.trigger();
 else if ( key == 'c' ) crash.trigger();
 else if ( key == 'h' ) chat.trigger();
 else if ( key == 'o' ) ohat.trigger();
 else if ( key == 't' ) tom1.trigger();
 else if ( key == 'y' ) tom2.trigger();
 else if ( key == 'r' ) rim.trigger();
 else if ( key == 'a' ) air.trigger();
 else if ( key == '1' ){
      lit.play();
       mj.pause();
      smb.pause();
 }
 else if ( key == '2' ) {
   mj.play();
   lit.pause();
   smb.pause();
  } 
  else if ( key == '3' ) {
   smb.play();
   mj.pause();
   lit.pause();
  }
 }
