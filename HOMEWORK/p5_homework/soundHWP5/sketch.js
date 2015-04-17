var song1;
var song2;
var song3;
var samp1;
var samp2;
var samp3;
var samp4;
var fft;
var vol1;
var vol2;
var vol3;
var vol4;

function preload(){
	song1 = loadSound ('assets/song1.mp3');
	song2 = loadSound ('assets/song2.mp3');
	song3 = loadSound ('assets/song3.mp3');
	samp1 = loadSound ('assets/samp1.wav');
	samp2 = loadSound ('assets/samp2.wav');
	samp3 = loadSound ('assets/samp3.wav');
	samp4 = loadSound ('assets/samp4.mp3');
}

function setup() {
  fft = new p5.FFT();
  createCanvas(700,400);
  
  /* vol1 = new p5.Amplitude();
  	vol1.setInput(samp1);
  vol2 = new p5.Amplitude();
  	vol2.setInput(samp2);
  vol3 = new p5.Amplitude();
  	vol3.setInput(samp3);
  vol4 = new p5.Amplitude();
    vol4.setInput(samp4);
    */
}

function draw() {
	background (0);
	noStroke();

	var spectrum = fft.analyze();

	beginShape();
	vertex(0,height);
	for (i = 0; i<spectrum.length; i++){
	  vertex(i, map(spectrum[i], 0, 600, height, 0) );
	}
	vertex(width,height);
	endShape(CLOSE);

/*	var kickV = vol1.getLevel();
		fill(255);
		stroke(255);
	var snareV = vol2.getLevel();
		fill(255);
		stroke(255);
	var hatV = vol3.getLevel();
		fill(255);
		stroke(255);
	var hornV = vol4.getLevel();
		fill(255);
		stroke(255);

ellipse(width/2, height/2, 10+vol*200, 10+vol*200);
ellipse(width/2, height/2, 10+vol*200, 10+vol*200);
ellipse(width/2, height/2, 10+vol*200, 10+vol*200);
ellipse(width/2, height/2, 10+vol*200, 10+vol*200);	
*/
	fill (225);
textSize(28);
textFont("Helvetica");
   text("kick K", 55, 58);
   text("snare S", 55, 108);
   text("closed hat H", 55, 158);
   text("air horn A", 55, 208);
textSize(34);
textFont("Helvetica");
   text("Lit 1", 570, 58);
   text("Michael 2", 490, 108);
   text("Mario 3", 520, 158);
  }

function keyPressed(e) {
	if (e.keyCode == 75){
		 samp1.play();
	} 
	else if (e.keyCode == 83){
		samp2.play();
	} 
	else if (e.keyCode == 72){
		samp3.play();
	} 
	else if (e.keyCode == 65){
		samp4.play();
	}	
	else if (key === '1') {
		fft.setInput(song1);
		song1.play();
		song2.stop();
		song3.stop();
	} else if (key === '2') {
		fft.setInput(song2);
		song1.stop();
		song2.play();
		song3.stop();
	} else if (key === '3') {
		fft.setInput(song3);
		song1.stop();
		song2.stop();
		song3.play();
	}
}

