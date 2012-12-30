class ButterflyNet {

    float xpos;
    float ypos;
    boolean isHolding;
    Hands holdingHands;
    PImage netImage;
    int netW = 70;
    int netH = 70;
    int handleW = 70;
    int handleH = 70;
    int handlePosX = 170;
    int handlePosY = 180;

    ButterflyNet() {
        xpos = 10;
        ypos = 200;
        isHolding = false;
        holdingHands = null;
        netImage = loadImage("images/butterflyNet.png");
    }

    void update() {
        if(holdingHands != null) {
            xpos = holdingHands.getRightX() - handlePosX;
            ypos = holdingHands.getRightY() - handlePosY;
        }
    }

    void display() {

        image(netImage, xpos, ypos);
        //    rect(xpos+50,ypos+10,netW,netH);
        //   rect(xpos+handlePosX,ypos+handlePosY,handleW,handleH);
    }

    boolean checkHendleIntersect(float _x, float _y) {
        return(_x > xpos + handlePosX && _x < xpos + handlePosX + handleW && _y > ypos + handlePosY && _y < ypos + handlePosY + handleH);
    }

    boolean checkNetIntersect(float _x, float _y) {
        return(_x > xpos && _x < xpos + netW && _y > ypos && _y < ypos + netH);
    }

    void setHand(Hands h) {
        holdingHands = h;
    }

    boolean isInHand() {
        return(holdingHands != null);
    }
}