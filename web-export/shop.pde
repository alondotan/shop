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

class Butterfly extends Object{
  PImage[] images;
  int idleImageCount;
  int walkImageCount;
  int jumpImageCount;
  int petImageCount;
  int frame;
  
  Butterfly(float xpos, float ypos) {
    super(xpos,ypos);
    int state = 1;
    char direction = 'r'; 
    idleImageCount = 6;
    walkImageCount = 4;
    jumpImageCount = 6;
    petImageCount = 6;
    final int IDLE_STATE = 0;
    final int WALK_STATE = 1;
    final int JUMP_STATE = 2;
    final int PET_STATE = 3;
    
    
    images = new PImage[walkImageCount];

  switch (state) {
     case IDLE_STATE:
           break;
     case WALK_STATE:
          for (int i = 0; i < walkImageCount; i++) {
              // Use nf() to number format 'i' into four digits
            String filename = "rabbitWalk" + nf(i, 4) + ".gif";
            images[i] = loadImage(filename);
          }     
           break;
     case JUMP_STATE:
           break;
     case PET_STATE:
           break;           
  }

  }

 
  void display() {
    frame = (frame+1) % walkImageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}

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

class Rabbit extends Object{
  PImage[] images;
  int idleImageCount;
  int walkImageCount;
  int jumpImageCount;
  int petImageCount;
  int frame;
  
  Rabbit(float xpos, float ypos) {
    super(xpos,ypos);
    int state = 1;
    char direction = 'r'; 
    idleImageCount = 6;
    walkImageCount = 4;
    jumpImageCount = 6;
    petImageCount = 6;
    final int IDLE_STATE = 0;
    final int WALK_STATE = 1;
    final int JUMP_STATE = 2;
    final int PET_STATE = 3;
    
    
    images = new PImage[walkImageCount];

  switch (state) {
     case IDLE_STATE:
           break;
     case WALK_STATE:
          for (int i = 0; i < walkImageCount; i++) {
              // Use nf() to number format 'i' into four digits
            String filename = "rabbitWalk" + nf(i, 4) + ".gif";
            images[i] = loadImage(filename);
          }     
           break;
     case JUMP_STATE:
           break;
     case PET_STATE:
           break;           
  }

  }

 
  void display() {
    frame = (frame+1) % walkImageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}

