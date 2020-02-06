class Ball {

  float px, py, vx, vy, dx;
  int bwidth, bheight;

  Ball(float dx, int bwidth, int bheight) {
    this.px=width/2;
    this.py=height/2;
    this.vx=random(1,1.5)*decideSide();
    this.vy=random(1,1.5)*decideSide();
    this.dx=dx;
    this.bwidth=bwidth;
    this.bheight=bheight;
  }

  int decideSide() {
    if (int(random(2)) == 1) return -2;
    else return 2;
  }
  
  void draw(){
    ellipse(px,py,bwidth,bheight);
  }
}
