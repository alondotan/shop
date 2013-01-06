// kinect!!
import SimpleOpenNI.*;
SimpleOpenNI kinect;

// const
int SCREEN_W = 1200;
int SCREEN_H = 800;


// all active objects
ArrayList objectsRabbit;
ArrayList objectsButterfly;
Menu mainMenu;
Hands hands;
ButterflyNet net;


float drag = 30.0;


// animation arrays 
int rabbitWalkImageCount;
PImage[] rabbitWalkingImages;

int butterflyFlyImageCount;
int butterflyColorCount;
PImage[][] butterflyImages;
int greenButterfly = 0;
int pinkButterfly = 1;
int purpleButterfly = 2;
int yellowButterfly = 3;

PImage backgroudImg;
PImage clothImg;
void setup() {

    size(SCREEN_W, SCREEN_H);
    background(255, 204, 0);
    frameRate(24);

// kinect!!

    kinect = new SimpleOpenNI(this);
    kinect.enableDepth();
    kinect.enableRGB();
    kinect.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);
    kinect.setMirror(true);

    mainMenu = new Menu(150, 10);
    hands = new Hands();
    net = new ButterflyNet();

    objectsRabbit = new ArrayList();
    objectsRabbit.add(new Rabbit(100, 100));
    objectsRabbit.add(new Rabbit(200, 200));
    
    objectsButterfly = new ArrayList();
    objectsButterfly.add(new Butterfly(250, 200,greenButterfly));
    objectsButterfly.add(new Butterfly(200, 350,purpleButterfly));
    objectsButterfly.add(new Butterfly(200, 350,purpleButterfly));
    objectsButterfly.add(new Butterfly(200, 350,purpleButterfly));
    objectsButterfly.add(new Butterfly(200, 350,purpleButterfly));

    // loading animation pictures
    rabbitWalkImageCount = 26;
    rabbitWalkingImages = new PImage[rabbitWalkImageCount];
    for(int i = 0; i < rabbitWalkImageCount; i++) {
        // Use nf() to number format 'i' into four digits
        String filename = "images/bunny/bunny" + nf(i, 4) + ".png";
        rabbitWalkingImages[i] = loadImage(filename);
        rabbitWalkingImages[i].resize(500, 400);
    }

    butterflyFlyImageCount = 2;
    butterflyColorCount = 4;
    butterflyImages = new PImage[butterflyColorCount][butterflyFlyImageCount];
    for(int i = 0; i < butterflyFlyImageCount; i++) {
        // Use nf() to number format 'i' into four digits
  //      String filename = ;
        butterflyImages[greenButterfly][i] = loadImage("images/butterfly/butterfly_green" + nf(i, 4) + ".png");
        butterflyImages[greenButterfly][i].resize(500,500);
  //      filename = ;
        butterflyImages[pinkButterfly][i] = loadImage("images/butterfly/butterfly_pink" + nf(i, 4) + ".png");
        butterflyImages[pinkButterfly][i].resize(500,500);
 //       filename = ;
        butterflyImages[purpleButterfly][i] = loadImage("images/butterfly/butterfly_purple" + nf(i, 4) + ".png");
        butterflyImages[purpleButterfly][i].resize(500,500);
//        String filename = ;
        butterflyImages[yellowButterfly][i] = loadImage("images/butterfly/butterfly_yellow" + nf(i, 4) + ".png");
        butterflyImages[yellowButterfly][i].resize(500,500);
    }

    backgroudImg = new PImage();
    backgroudImg = loadImage("images/backgrounds/background2_day.png");
    backgroudImg.resize(SCREEN_W,SCREEN_H);
    clothImg = new PImage();
    clothImg = loadImage("images/backgrounds/clothes_day.png");
    clothImg.resize(SCREEN_W,SCREEN_H);
 
}

void draw() {
    // kinect!!
    kinect.update();
    updateAll();
    interactAll();
    displayAll();
}

void updateAll() {
    for(int i = 0; i < objectsRabbit.size(); i++) {
        Object o = (Object) objectsRabbit.get(i);
        o.update();
    }
    for(int i = 0; i < objectsButterfly.size(); i++) {
        Object o = (Object) objectsButterfly.get(i);
        o.update();
    }
    hands.update();
    net.update();
}

void interactAll() {
//                    println (objectsButterfly.size());
    // check intersect
    for(int i = 0; i < objectsButterfly.size(); i++) {
        Object o = (Object) objectsButterfly.get(i);
        if(abs(o.getXpos() - hands.getLeftX()) < 30 && abs(o.getYpos() - hands.getLeftY()) < 30) println("left hand!!");
        if(net.isInHand()) {
            if(net.checkNetIntersect(o.getXpos(), o.getYpos())) {
                println("Butterfly in net right hand");
                objectsButterfly.remove(i);
                objectsButterfly.add(new Butterfly(200, 350,purpleButterfly));
            }
        }
    }

    if(net.checkHendleIntersect(hands.getRightX(), hands.getRightY())) {
        net.setHand(hands);
    }

}

void displayAll() {
    background(153, 153, 0);
    image(backgroudImg,0,0);
    image(clothImg,0,0);
    // kinect!!
  //image(kinect.depthImage(), 0, 0); //---&gt; to display as depth image

    for(int i = 0; i < objectsRabbit.size(); i++) {
        Object o = (Object) objectsRabbit.get(i);
        o.display();
    }
    for(int i = 0; i < objectsButterfly.size(); i++) {
        Object o = (Object) objectsButterfly.get(i);
        o.display();
    }

    // mainMenu.display();
    hands.display();
    net.display();

}

// kinect!!

void onNewUser(int userId) {
  println("start pose detection");
  kinect.startPoseDetection("Psi", userId);
}

void onEndCalibration(int userId, boolean successful) {
  if (successful) {
    println(" User calibrated !!!");
    kinect.startTrackingSkeleton(userId);
  }
  else {
    println(" Failed to calibrate user !!!");
    kinect.startPoseDetection("Psi", userId);
  }
}
void onStartPose(String pose, int userId) {
  println("Started pose for user");
  kinect.stopPoseDetection(userId);
  kinect.requestCalibrationSkeleton(userId, true);
}


class Object {
    float xpos, ypos;
    Object(float xpos, float ypos) {
        this.xpos = xpos;
        this.ypos = ypos;
    }
    void update() {}
    void display() {}
    int getWidth() {
        return 0;
    }
    float getXpos() {
        return xpos;
    }
    float getYpos() {
        return ypos;
    }
}