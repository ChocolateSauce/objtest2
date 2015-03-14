PShape s;

boolean isWireFrame = false;

void setup() {
size(320, 569, P3D);
  // The file "bot.obj" must be in the data folder
  // of the current sketch to load successfully
  s = loadShape("chair.obj");
  
  
  
}

void draw() {
  background(0);
  lights();
  if (isWireFrame){
    stroke(255, 255, 150);
    noFill();
  } 
  else {
    noStroke();
    fill(150, 195, 125);
  }
  translate(width/2, height);
  //rotateX(frameCount*PI/150);
  rotateZ(PI);
  
  //rotateY(frameCount*PI/170);
  
  scale(4);
  shape(s, 0, 0);
  beginCamera(); //add camera matrix to matrix stack
  camera();      //reinitialize camera
  rotateY(frameCount*PI/180);
  endCamera();
  //if(frameCount % 90 == 0) 
    //saveFrame("pic_####.png");
 
}

void keyPressed(){


  // wireframe
  if (key =='w'){
    if (isWireFrame){
      isWireFrame=false;
    } 
    else {
      isWireFrame=true;
    }
  }

}
