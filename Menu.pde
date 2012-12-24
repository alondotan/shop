
class Menu extends Object{
  
  Menu(float xpos, float ypos) {
    super(xpos,ypos);
 
  }

  void display() {
    rect(xpos,ypos,50,150);
  }
  
  int getWidth() {
    return 0;
  }
}
