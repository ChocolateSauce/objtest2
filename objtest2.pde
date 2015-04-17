PShape s;

PGraphics buffer;
//boolean isWireFrame = false;
int numOfSilces = 6;
PImage temp [] = new PImage[numOfSilces];
int OUR_WIDTH = 128;
int OUR_HEIGHT = 228;
float objScale = 15;
String objName = "VMask.obj";

void setup() {
buffer = createGraphics((numOfSilces+2)*OUR_WIDTH, OUR_HEIGHT, JAVA2D);
size(OUR_WIDTH, OUR_HEIGHT, P3D);
  // The file "bot.obj" must be in the data folder
  // of the current sketch to load successfully
  s = loadShape(objName);
  
  
  
  for(int i = 0; i < s.getChildCount(); i++){
 for(int j = 0; j < s.getChild(i).getVertexCount(); j ++){
 println(s.getChild(i).getVertex(j));
 }
 }
  
 
}

void draw() {
  background(0);
  lights();
//  if (isWireFrame){
//    stroke(255, 255, 150);
//    noFill();
//  } 
//  else {
    noStroke();
    fill(150, 195, 125);
//  }
  
  ;
  //rotateX(frameCount*PI/150);
  //translate(width/2,height/2);
  translate(width/2,height/2);
  rotateZ(PI);
   scale(objScale);
  rotateY((frameCount*PI/180)*(360/numOfSilces));
  //shapeMode(CENTER);
  


  shape(s, s.width, 0);

  //beginCamera(); //add camera matrix to matrix stack
  //camera();      //reinitialize camera

  //rotateY(frameCount*PI/180);
  //endCamera();
  //if(frameCount % 90 == 0) 
   // saveFrame("pic_####.png");
  temp[((int)frameCount )- 1] = get();
    
    if(frameCount >= numOfSilces){
      buffer.beginDraw();
      for(int i = 0; i < numOfSilces;i++){
      buffer.image(temp[i],i*OUR_WIDTH, 0);
      }
      //output.image(secondImage, 1920, 0);
      buffer.noStroke();
      buffer.fill(0,0,255);
      buffer.rect(numOfSilces*OUR_WIDTH,0,OUR_WIDTH,OUR_HEIGHT);
      buffer.fill(0,0,0);
      buffer.rect((numOfSilces*OUR_WIDTH)+OUR_WIDTH,0,OUR_WIDTH,OUR_HEIGHT);
      buffer.endDraw();
      buffer.save("sprite.png");
      image(buffer,0,0);
      //saveFrame("pic_####.png");
      exit();
    }
 
}

//
//void keyPressed(){
//
//
//  // wireframe
//  if (key =='w'){
//    if (isWireFrame){
//      isWireFrame=false;
//    } 
//    else {
//      isWireFrame=true;
//    }
//  }
//
//}
