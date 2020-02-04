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

int px, py, vx, vy, jx1, jy1, jx2, jy2;
Sound sound;

void setup(){
  size(500,500);
  fill(128);
  noStroke();
  //sound = new SoundFile("...");
  setBallParameters();
  setPlatformsParameters();
}

void setBallParameters(){
  px=width/2;
  py=height/2;
  vx=decideSide();
  vy=int(random(5));
}

void setPlatformsParameters(){
  jx1=(int)(width*0.1);
  jy1=height/2;
  
  jx2=(int)(width*0.9);
  jy2=height/2;
}

int decideSide(){
  if(int(random(2)) == 1){
    return (-1)*int(random(5)) - 1;
  }else{
    return int(random(5)) + 1;
  }
}

void draw(){
  background(0);
  ellipse(px,py,20,20);
  rect(width/2, 0, 1, height);
  rect(jx1,mouseY,10,70);
  rect(jx2,mouseY,10,70);
  jy1=mouseY;
  jy2=mouseY;
  updateBall();
}

void updateBall(){
  px=px+vx;
  py=py+vy;
  bounceBall();
}

void bounceBall(){
  if(px > width){
    println("Player 2 lost!");
    exit();
  }
  if(px < 0){
    println("Player 1 lost!");
    exit();
  }
  if(py > height || py < 0){
    vy=-vy;
  }
  if((px <= jx2+10 && px >= jx2 && py <= jy2+70 && py >= jy2) ||
    (px >= jx1-10 && px <= jx1 && py <= jy1+70 && py >= jy1)){
    vx=-vx;
    vy=-vy;
  }
}
