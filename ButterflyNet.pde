class ButterflyNet {

    int NET_SIZE = 30;
    int HANDLE_D_X = 0;
    int MAX_HANDLE_D_X = 50;
    int HANDLE_D_Y = 150;

    float theta = 0.0;
    Point [] netPoints = new Point[NET_SIZE];
    float prevHandle;

    Point pos;
    boolean isHolding;
    Hands holdingHands;
    PImage netImage;
    int netW = 70;
    int netH = 70;
    int handleW = 70;
    int handleH = 70;

    ButterflyNet() {
        pos = new Point(100,200);
        isHolding = false;
        holdingHands = null;
        for (int i = 0; i<NET_SIZE; i++){
            netPoints[i] = new Point(pos.xp,pos.yp);
        }
        prevHandle = pos.xp;
    }

    void update() {
        if(holdingHands != null) {
            prevHandle = pos.xp;
            pos.xp = holdingHands.getRightX()-HANDLE_D_X+ 0.5*handleW;
            pos.yp = holdingHands.getRightY()-HANDLE_D_Y+ 0.5*handleH;
        }
    }

    void display() {
        if (holdingHands != null){
            for (int i = 0; i<NET_SIZE-1; i++){
                netPoints[i].set(netPoints[i+1]);
                netPoints[i].yp += 1.5;
                noStroke();
                fill(200,200,250);
                ellipse(netPoints[i].xp,netPoints[i].yp,16+i,16+2*i);
            }
        }
        float delta = 0;
        delta = prevHandle - pos.xp;
        if (delta < -MAX_HANDLE_D_X) delta = -MAX_HANDLE_D_X;
        if (delta > MAX_HANDLE_D_X) delta = MAX_HANDLE_D_X;
  //      if (prevHandle < pos.xp) delta = -MAX_HANDLE_D_X;
  //      if (prevHandle > pos.xp) delta = MAX_HANDLE_D_X;

        Point hPoint = new Point(pos.xp+HANDLE_D_X,pos.yp+HANDLE_D_Y);
        netPoints[NET_SIZE-1].set(pos);
        netPoints[NET_SIZE-1].xp += delta;

        for (int i = NET_SIZE-1; i>0; i--)
        {
            if (netPoints[i].xp-netPoints[i-1].xp > 5)
            {
             netPoints[i-1].xp = netPoints[i].xp - 5;
            }
            else if (netPoints[i].xp-netPoints[i-1].xp < -5 )
            {
             netPoints[i-1].xp = netPoints[i].xp + 5;
            }
            if (netPoints[i].yp-netPoints[i-1].yp > 5)
            {
             netPoints[i-1].yp = netPoints[i].yp - 5;
            }
            else if (netPoints[i].yp-netPoints[i-1].yp < -5 )
            {
             netPoints[i-1].yp = netPoints[i].yp + 5;
            }
        }    

        fill(150,150,250);
        stroke(255,100,100);
        strokeWeight(6);
        ellipse(netPoints[NET_SIZE-1].xp,netPoints[NET_SIZE-1].yp,46,56);
        line(hPoint.xp,hPoint.yp,netPoints[NET_SIZE-1].xp,netPoints[NET_SIZE-1].yp+26);

        //    rect(xpos+50,ypos+10,netW,netH);
        //rect(pos.xp+HANDLE_D_X-0.5*handleW,pos.yp+HANDLE_D_Y-0.5*handleH,handleW,handleH);
    }

    boolean checkHendleIntersect(float _x, float _y) {
        return(_x > pos.xp + HANDLE_D_X-0.5*handleW && _x < pos.xp + HANDLE_D_X +0.5*handleW && _y > pos.yp + HANDLE_D_Y - 0.5*handleH && _y < pos.yp + HANDLE_D_Y + 0.5*handleH);
    }

    boolean checkNetIntersect(float _x, float _y) {
        return(_x > pos.xp && _x < pos.xp + netW && _y > pos.yp && _y < pos.yp + netH);
    }

    void setHand(Hands h) {
        holdingHands = h;
    }

    boolean isInHand() {
        return(holdingHands != null);
    }
}