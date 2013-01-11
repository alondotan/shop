class Point {
  float xp;
  float yp;
  Point (float xp,float yp){
    this.xp = xp;
    this.yp = yp;
  }

  void set(Point p){
  	this.xp = p.xp;
  	this.yp = p.yp;
  }

  float dist(Point p){
    return sqrt(pow(this.xp-p.xp,2)+pow(this.yp-p.yp,2));
  }

  float angle(Point p){
    float dX = this.xp-p.xp;
    float dY = this.yp-p.yp;
    return (atan2(dY,dX)+PI);
  }
}