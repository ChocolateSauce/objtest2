PShape s;

boolean isWireFrame = false;

void setup() {
size(320, 569, P3D);
  // The file "bot.obj" must be in the data folder
  // of the current sketch to load successfully
  s = loadShape("chair.obj");
  
  
  
  for(int i = 0; i < s.getChildCount(); i++){
 for(int j = 0; j < s.getChild(i).getVertexCount(); j ++){
 println(s.getChild(i).getVertex(j));
 }
 }
  
 
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
  
  ;
  //rotateX(frameCount*PI/150);
  translate(width/2,height/2);
  rotateZ(PI);
   scale(4);
  
  shapeMode(CENTER);
  

  shape(s, s.width, 0);
  beginCamera();
  camera();
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
