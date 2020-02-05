class Platform {
  int jx, jy;

  Platform(float x) {
    this.jx=(int)(width*x);
    this.jy=height/2;
  }

  void draw() {
    rect(jx, mouseY, 10, 70);
    jy=mouseY;
  }
}
