ArrayList objects;
Menu mainMenu;
float drag = 30.0;

void setup() {
  size(640, 360);
  background(255, 204, 0);
  frameRate(24);
  mainMenu = new Menu(150,10);
  objects = new ArrayList();
  objects.add (new Rabbit(100,100));
  objects.add (new Rabbit(200,200));
   objects.add (new Butterfly(250,200));
   objects.add (new Butterfly(200,350));
}

void draw() { 
    updateAll();
    interactAll();
    displayAll();  
}

void updateAll(){
     float dx;
     float dy;
     float xpos;
     float ypos;
    for (int i = 0; i < objects.size(); i++ ) { 
        Object o = (Object) objects.get(i);
        dx = mouseX - o.getXpos();
        dy = mouseY - o.getYpos();
        xpos = o.getXpos() + dx/drag; 
        ypos = o.getYpos() + dy/drag;
//        o.update(xpos-o.getWidth()/2, ypos);
 o.update(xpos,ypos);
    }
}
void interactAll(){
}

void displayAll(){
     background(153, 153, 0);
  for (int i = 0; i < objects.size(); i++ ) { 
    Object o = (Object) objects.get(i);
    o.display();
  }
  mainMenu.display();
}

class Object{
  float xpos, ypos;
  Object (float xpos, float ypos) {
            this.xpos = xpos;
            this.ypos = ypos;
  }
  void update(float xpos, float ypos){
            this.xpos = xpos;
            this.ypos = ypos;
  }
   void display(){
   }
   int getWidth() {
      return 0;
  }
  float getXpos(){
    return xpos;
  }
  float getYpos(){
    return ypos;
  }
}
