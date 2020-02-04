import processing.sound.*;
//size(500, 500);
//stroke(255,0,0);

//line(0, 0, 0, 10);
//line(0, 10, 10, 10);
//line(10, 10, 10, 0);
//line(10, 0, 0, 0);

//stroke(0,255,0);
//square(0,15,10);

//strokeWeight(10);
//stroke(0,0,255);
//circle(5,35,10);

//stroke(255, 255, 255);
//background(0,0,0);
//for(int i = 0; i < 8; i++){
//  for(int j = 0; j < 8; j++){
//    square((width/8)*i, (height/8)*j, width/8);
//     if((i+j) % 2 != 0){
//       fill(255,255,255);
//     }
//  }
//}

int px, py;
int vx, vy;
int jx, jy;
//Soundfile sound;

void setup(){
  size(500,500);
  fill(128);
  noStroke();
  px=width/2;
  py=height/2;
  int leftOrRight = int(random(2));
  if(leftOrRight == 1){
    vx=(-1)*int(random(5)) + 1;
  }else{
    vx=int(random(5)) + 1;
  }
  vy=int(random(5));
  jx=(int)(width*0.9);
  jy=height/2;
  //sound = new SoundFile("...");
}

void draw(){
  background(0);
  ellipse(px,py,20,20);
  rect(jx,mouseY,20,40);
  jy=mouseY;
  px=px+vx;
  py=py+vy;
  if(px > width){
    println("Has perdido");
    exit();
  }
  if(px < 0){
    vx=-vx;
  }
  if(py > height || py < 0){
    vy=-vy;
  }
  if(px <= jx+20 && px >= jx && py <= jy+40 && py >= jy){
    vx=-vx;
    vy=-vy;
  }
}
