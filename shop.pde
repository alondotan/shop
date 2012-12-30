int SCREEN_W = 1200;
int SCREEN_H = 800;

ArrayList objects;
Menu mainMenu;
Hands hands;
ButterflyNet net;
float drag = 30.0;
int walkImageCount;
PImage[] images;
PImage[]  butterflyImages;
int flyImageCount;  

void setup() {
  size(SCREEN_W, SCREEN_H);
  background(255, 204, 0);
  frameRate(24);
  mainMenu = new Menu(150,10);
  hands = new Hands();
  net = new ButterflyNet();
  objects = new ArrayList();
  objects.add (new Rabbit(100,100));
  objects.add (new Rabbit(200,200));
  objects.add (new Butterfly(250,200));
  objects.add (new Butterfly(200,350));

    walkImageCount = 15;
    images = new PImage[walkImageCount];
         for (int i = 0; i < walkImageCount; i++) {
              // Use nf() to number format 'i' into four digits
            String filename = "bunnyWalk" + nf(i, 4) + ".png";
            images[i] = loadImage(filename);
            images[i].resize(100, 100);
          }     
          
    flyImageCount = 2;    
    butterflyImages = new PImage[flyImageCount];
         for (int i = 0; i < flyImageCount; i++) {
              // Use nf() to number format 'i' into four digits
            String filename = "butterfly" + nf(i, 4) + ".png";
            butterflyImages[i] = loadImage(filename);
          }     
}

void draw() { 
    updateAll();
    interactAll();
    displayAll();  
}

void updateAll(){
    for (int i = 0; i < objects.size(); i++ ) { 
        Object o = (Object) objects.get(i);
       o.update();
    }
    hands.update();
    net.update();
}
void interactAll(){
    // check intersect
      for (int i = 0; i < objects.size(); i++ ) { 
        Object o = (Object) objects.get(i);
        if (abs(o.getXpos()-hands.getLeftX())<30&&
              abs(o.getYpos()-hands.getLeftY())<30)
              println("left hand!!");
         if (net.isInHand()){
            if (net.checkNetIntersect(o.getXpos(),o.getYpos()))
           {
               println("in net");
           } 
        }             
      }
      if (net.checkHendleIntersect(hands.getRightX(),hands.getRightY()))
      {
          net.setHand(hands);
      }

}

void displayAll(){
     background(153, 153, 0);
     for (int i = 0; i < objects.size(); i++ ) { 
       Object o = (Object) objects.get(i);
       o.display();
    }
    mainMenu.display();
    hands.display();
    net.display();
}

class Object{
  float xpos, ypos;
  Object (float xpos, float ypos) {
            this.xpos = xpos;
            this.ypos = ypos;
  }
  void update(){
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
