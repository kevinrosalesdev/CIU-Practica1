class Ball {

  float px, py, vx, vy, dx;

  Ball(float dx) {
    this.px=width/2;
    this.py=height/2;
    this.vx=random(1,2)*decideSide();
    this.vy=random(1,2)*decideSide();
    this.dx=dx;
  }

  int decideSide() {
    if (int(random(2)) == 1) return -2;
    else return 2;
  }
  
  void draw(){
    ellipse(px,py,20,20);
  }
}
