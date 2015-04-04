#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
	ofBackground(221,187,221);
	ofSetVerticalSync(true);
	frameByframe = false;

	// Uncomment this to show movies with alpha channels
	// kramerMovie.setPixelFormat(OF_PIXELS_RGBA);

	kramerMovie.loadMovie("movies/kramer.mov");
	kramerMovie.play();
}

//--------------------------------------------------------------
void ofApp::update(){
    kramerMovie.update();
}

//--------------------------------------------------------------
void ofApp::draw(){

	ofSetHexColor(0xFFFFFF);

    kramerMovie.draw(60,40);
    ofSetHexColor(0x99CCFF);
    unsigned char * pixels = kramerMovie.getPixels();
    
    int nChannels = kramerMovie.getPixelsRef().getNumChannels();
    
    // let's move through the "RGB(A)" char array
    // using the red pixel to control the size of a circle.
    for (int i = 4; i < 480; i+=8){
        for (int j = 4; j < 360; j+=8){
            unsigned char r = pixels[(j * 480 + i)*nChannels];
            float val = 1 - ((float)r / 255.0f);
            //ofCircle(700 + i,40+j,10*val);
        }
    }


    ofSetHexColor(0x000000);
	ofDrawBitmapString("press f to change",20,440);
     if(frameByframe) ofSetHexColor(0xCCCCCC);
    ofDrawBitmapString("mouse speed position",20,470);
     if(!frameByframe) ofSetHexColor(0xCCCCCC); else ofSetHexColor(0x000000);
    ofDrawBitmapString("keys <- -> frame by frame " ,20,520);
    ofSetHexColor(0x000000);

    ofDrawBitmapString("frame: " + ofToString(kramerMovie.getCurrentFrame()) + "/"+ofToString(kramerMovie.getTotalNumFrames()),20,640);
    ofDrawBitmapString("duration: " + ofToString(kramerMovie.getPosition()*kramerMovie.getDuration(),2) + "/"+ofToString(kramerMovie.getDuration(),2),20,425);
    ofDrawBitmapString("speed: " + ofToString(kramerMovie.getSpeed(),5),20,680);

    if(kramerMovie.getIsMovieDone()){
        ofSetHexColor(0xFF0000);
        ofDrawBitmapString("end of movie",20,750);
    }
}

//--------------------------------------------------------------
void ofApp::keyPressed  (int key){
    switch(key){
        case 'f':
            frameByframe=!frameByframe;
            kramerMovie.setPaused(frameByframe);
        break;
        case OF_KEY_LEFT:
            kramerMovie.previousFrame();
        break;
        case OF_KEY_RIGHT:
            kramerMovie.nextFrame();
        break;
        case '0':
            kramerMovie.firstFrame();
        break;
	//	case 'r':
			//kramerMovie.lastFrame();
    }
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){
	if(!frameByframe){
        int width = ofGetWidth();
        float pct = (float)x / (float)width;
        float speed = (2 * pct - 1) * 5.0f;
        kramerMovie.setSpeed(speed);
	}
}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){
	if(!frameByframe){
        int width = ofGetWidth();
        float pct = (float)x / (float)width;
        kramerMovie.setPosition(pct);
	}
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){
	if(!frameByframe){
        kramerMovie.setPaused(true);
	}
}


//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){
	if(!frameByframe){
        kramerMovie.setPaused(false);
	}
}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
