// kinect!!
//import SimpleOpenNI.*;
//SimpleOpenNI kinect;

// const
int SCREEN_W = 1200;
int SCREEN_H = 800;
float BUTTERFLY_DOMAIN_BOTTOM = 0.3;
float RABBIT_DOMAIN_TOP = 0.3;
float RABBIT_DOMAIN_BOTTOM = 0.7;
int BUTTERFLY_IMAGE_SIZE = 500;
int RABBIT_IMAGE_W = 500;
int RABBIT_IMAGE_H = 400;
int BUCKET_SIZE = 110;
boolean carrotInHand = false;

// all active objects
ArrayList objectsRabbit;
ArrayList objectsButterfly;
Menu mainMenu;
Hands hands;
ButterflyNet net;
Bucket bucket;


// animation arrays 
int RABBIT_JUMP_IMGS_NUMBER = 14;
PImage[] rabbitJumpingImages;
int RABBIT_TURN_HEAD_IMGS_NUMBER = 5;
PImage[] rabbitTurningHeadImages;

int butterflyFlyImageCount;
int butterflyColorCount;
PImage[][] butterflyImages;
int greenButterfly = 0;
int pinkButterfly = 1;
int purpleButterfly = 2;
int yellowButterfly = 3;

PImage backgroudImg;
PImage clothImg;
PImage bucketImg;
PImage carrotImg;
PImage rightHandImage, leftHandImage;

void setup() {

    size(SCREEN_W, SCREEN_H);
    background(255, 204, 0);
    frameRate(24);

// kinect!!
/*
    kinect = new SimpleOpenNI(this);
    kinect.enableDepth();
    kinect.enableRGB();
    kinect.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);
    kinect.setMirror(true);
*/
    mainMenu = new Menu(150, 10);
    hands = new Hands();
    net = new ButterflyNet();
    bucket = new Bucket();

    objectsRabbit = new ArrayList();
    objectsRabbit.add(new Rabbit(1000, 200));
    // objectsRabbit.add(new Rabbit(200, 200));
    // objectsRabbit.add(new Rabbit(300, 300));

    objectsButterfly = new ArrayList();
    objectsButterfly.add(new Butterfly(250, 200,greenButterfly));
    objectsButterfly.add(new Butterfly(200, 350,purpleButterfly));
    objectsButterfly.add(new Butterfly(200, 350,purpleButterfly));
    objectsButterfly.add(new Butterfly(200, 350,purpleButterfly));
    objectsButterfly.add(new Butterfly(200, 350,purpleButterfly));

    // loading animation pictures
    loadAnimation();

}

void draw() {
    // kinect!!
 //   kinect.update();
  
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
//        if(abs(o.getXpos() - hands.getLeftX()) < 30 && abs(o.getYpos() - hands.getLeftY()) < 30) println("left hand!!");
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
        hands.setHasNet(true);
    }

    if(bucket.checkHandIntersect(hands.getRightX(), hands.getRightY())) {
        if (!carrotInHand && !hands.getHasNet()){
            int choosenRabbit = int(random(objectsRabbit.size()));
            println("choosenRabbit: "+choosenRabbit);
            Rabbit o = (Rabbit) objectsRabbit.get(choosenRabbit);
            o.setRunningAfter(true);
            hands.setHasCarrot(true);
            carrotInHand = true;
        }
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
    bucket.display();

}

// kinect!!
/*
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
*/

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