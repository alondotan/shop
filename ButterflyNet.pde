class ButterflyNet {

    int POINT_GAP = 5;
    int SMALL_END = 20;
    int NET_LENGTH = 40;
    int SIZE_FACTOR = 2;
    int BIG_END = 16 + NET_LENGTH* SIZE_FACTOR;
    int HANDLE_LEN = 200;
    int HANDLE_BACK_SPEED = 20;
    int HANDLE_SIZE = 50;
    float GRAVITY = 6;

    Point [] netPoints = new Point[NET_LENGTH];

    Point handlePos;
    boolean isHolding;
    Hands holdingHands;


    ButterflyNet() {
        isHolding = false;
        holdingHands = null;
        for (int i = 0; i<NET_LENGTH; i++){
            netPoints[i] = new Point(400,200+i*POINT_GAP);
        }
        handlePos = new Point (netPoints[0].xp,netPoints[0].yp+HANDLE_LEN);
    }

    void update() {
        if(holdingHands != null) {
            handlePos.xp = holdingHands.getRightX();
            handlePos.yp = holdingHands.getRightY();
            float handleDist = netPoints[0].dist(handlePos);

            netPoints[0].yp = handlePos.yp - (handlePos.yp - netPoints[0].yp)*HANDLE_LEN/handleDist;
            netPoints[0].yp -= HANDLE_BACK_SPEED;
            netPoints[0].xp = handlePos.xp - (handlePos.xp - netPoints[0].xp)*HANDLE_LEN/handleDist;
        }
    }

    void display() {
        for (int i = 0;i<NET_LENGTH-1; i++){
          netPoints[i+1].yp += GRAVITY;
          float tDist = netPoints[i+1].dist(netPoints[i]);
          float t = POINT_GAP/tDist;
          netPoints[i+1].xp = netPoints[i].xp - (netPoints[i].xp-netPoints[i+1].xp)*t;
          netPoints[i+1].yp = netPoints[i].yp - (netPoints[i].yp-netPoints[i+1].yp)*t;      
        }
        for (int i = NET_LENGTH-1;i>0 ;i--){

          float ellipseX = SMALL_END + (NET_LENGTH-i)*SIZE_FACTOR;//5*(NET_LENGTH-i);
          float ellipseY = SMALL_END + (NET_LENGTH-i)*SIZE_FACTOR;//5*(NET_LENGTH-i);
          float nextEllipseY = SMALL_END + (NET_LENGTH-i+1)*SIZE_FACTOR;//5*(NET_LENGTH-i+1);
          float nextEllipseX = SMALL_END + (NET_LENGTH-i+1)*SIZE_FACTOR;//5*(NET_LENGTH-i+1);
    //      line(netPoints[i-1].xp, netPoints[i-1].yp,netPoints[i].xp, netPoints[i].yp);
          stroke(0,0,0);
          strokeWeight(1);
          noStroke();
          fill(200,200,250,80);
          ellipse(netPoints[i].xp, netPoints[i].yp, ellipseX, ellipseY);


    //      line(netPoints[i].xp, netPoints[i].yp+ellipseY/2,netPoints[i].xp, netPoints[i].yp-ellipseY/2);
          // line(netPoints[i].xp, netPoints[i].yp+ellipseY/2,netPoints[i-1].xp, netPoints[i-1].yp+nextEllipseY/2);
          // line(netPoints[i].xp, netPoints[i].yp-ellipseY/2,netPoints[i-1].xp, netPoints[i-1].yp-nextEllipseY/2);
          // line(netPoints[i].xp+ellipseX/2, netPoints[i].yp,netPoints[i-1].xp+nextEllipseX/2, netPoints[i-1].yp);
          // line(netPoints[i].xp-ellipseX/2, netPoints[i].yp,netPoints[i-1].xp-nextEllipseX/2, netPoints[i-1].yp);
        }

        stroke(255,100,100);
        strokeWeight(5);
        fill(150,150,250,90);
        ellipse(netPoints[0].xp, netPoints[0].yp, BIG_END,BIG_END);//5*NET_LENGTH, 5*NET_LENGTH);

        float handleEndY = handlePos.yp - (handlePos.yp-netPoints[0].yp)*(HANDLE_LEN-(BIG_END/2)+5)/HANDLE_LEN;
        float handleEndX = handlePos.xp - (handlePos.xp-netPoints[0].xp)*(HANDLE_LEN-(BIG_END/2)+5)/HANDLE_LEN;
        line(handlePos.xp,handlePos.yp,handleEndX,handleEndY);
//            rect(pos.xp-20,pos.yp-20,netW,netH);
        //rect(pos.xp+HANDLE_D_X-0.5*handleW,pos.yp+HANDLE_D_Y-0.5*handleH,handleW,handleH);
    }

    boolean checkHendleIntersect(float _x, float _y) {
        return(_x > handlePos.xp - 0.5*HANDLE_SIZE && _x < handlePos.xp + 0.5*HANDLE_SIZE 
            && _y > handlePos.yp - 0.5*HANDLE_SIZE && _y < handlePos.yp  + 0.5*HANDLE_SIZE);
    }

    boolean checkNetIntersect(float _x, float _y) {
        Point butterflyPos = new Point(_x,_y);
        return(netPoints[0].dist(butterflyPos)<BIG_END/2);
    }

    void setHand(Hands h) {
        holdingHands = h;
    }

    boolean isInHand() {
        return(holdingHands != null);
    }
}