import processing.sound.*;
//import gifAnimation.*;

Ball ball;
Platform p1, p2;
Controller controller;
//GifMaker ficherogif;
//int frameCounter;
boolean menuMode = true;

void setup() {
  surface.setTitle("Pong");
  background(0);
  size(750, 500);
  SoundFile bounceEffectFile = new SoundFile(this, "ping-pong-ball-hit.wav");
  SoundFile ohEffectFile = new SoundFile(this, "8-bit-uh-oh-sound.wav");
  PFont font = loadFont("OCRAExtended-48.vlw");
  noLoop();
  p1 = new Platform(0.1, 10, 70);
  p2 = new Platform(0.9, 10, 70);
  ball = new Ball(1.05, 20, 20);
  controller = new Controller(ball, p1, p2, 0.4, 0.545, bounceEffectFile, ohEffectFile);
  drawMenu(font);
  
  //ficherogif = new GifMaker(this, "animation.gif");
  //ficherogif.setRepeat(0);
  //ficherogif.addFrame();
  //frameCounter = 0;
}

void drawMenu(PFont font){
  textAlign(CENTER);
  textLeading(50);
  
  noFill();
  stroke(255);
  rect(0.09*width, 0.55*height, 0.825*width, 0.3*height, 5);
  
  textFont(font, 30);
  fill(77,155,255);
  text("PONG", 0.5*width, 0.1*height);
  
  textFont(font, 15);
  fill(41,223,0);
  text("[Pulsa \'ENTER\' para comenzar la partida]", 0.5*width, 0.4*height);
  
  fill(128);
  textFont(font, 20);
  text("Controles de la Plataforma", 0.5*width, 0.625*height);
  
  textFont(font, 15);
  text("¡Bienvenido a Pong! Consigue rebotar la pelota con tu\nplataforma y evitar que el rival lo haga con la suya.", 0.5*width, 0.25*height);
  textAlign(LEFT);
  text("[Jugador 1]", 0.13*width, 0.7*height);
  text("W -> Mover Arriba\nS -> Mover Abajo", 0.12*width, 0.75*height);
  text("[Jugador 2]", 0.63*width, 0.7*height);
  text("Flecha Arriba -> Mover Arriba\nFlecha Abajo -> Mover Abajo", 0.53*width, 0.75*height);

  noStroke();
  textFont(font, 70);
}

void draw() {
  //frameCounter++;
  //if(frameCounter == 10){
  //  ficherogif.addFrame();
  //  frameCounter = 0;
  //}
  if (menuMode) return;
  background(0);
  drawMidline();
  ball.updateDraw();
  controller.updateScore();
  controller.updatePlatforms(0.02);
  if (!controller.updateBall()){
    ball = new Ball(1.05, 20, 20);
    controller.setBall(ball);
  }
}

void drawMidline(){
  for(int i=0; i < 40; i++){
    rect(width/2, i*14, 3, 8);
  }
}

void keyPressed(){
  //if(key == 'q'){
  //  ficherogif.finish();
  //}
  if(key == ENTER || key == RETURN){
    loop();
    menuMode = false;  
  }
  controller.updateKeyStatus(keyCode, true);
}

void keyReleased(){
  controller.updateKeyStatus(keyCode, false);
}
