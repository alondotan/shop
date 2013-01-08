class ButterflyNet {

    int NET_LENGTH = 30;
    int HANDLE_D_X = 0;
    int MAX_HANDLE_D_X = 50;
    int HANDLE_D_Y = 150;
    int NET_SIZE = 70;
    int HANDLE_SIZE = 70;

    float theta = 0.0;
    Point [] netPoints = new Point[NET_LENGTH];
    float prevHandle;

    Point pos;
    boolean isHolding;
    Hands holdingHands;
    PImage netImage;


    ButterflyNet() {
        pos = new Point(400,200);
        isHolding = false;
        holdingHands = null;
        for (int i = 0; i<NET_LENGTH; i++){
            netPoints[i] = new Point(pos.xp,pos.yp);
        }
        prevHandle = pos.xp;
    }

    void update() {
        if(holdingHands != null) {
            prevHandle = pos.xp;
            pos.xp = holdingHands.getRightX()-HANDLE_D_X+ 0.5*HANDLE_SIZE;
            pos.yp = holdingHands.getRightY()-HANDLE_D_Y+ 0.5*HANDLE_SIZE;
        }
    }

    void display() {
        if (holdingHands != null){
            for (int i = 0; i<NET_LENGTH-1; i++){
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

        Point hPoint = new Point(pos.xp+HANDLE_D_X,pos.yp+HANDLE_D_Y);
        netPoints[NET_LENGTH-1].set(pos);
        netPoints[NET_LENGTH-1].xp += delta;

        for (int i = NET_LENGTH-1; i>0; i--)
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
        ellipse(netPoints[NET_LENGTH-1].xp,netPoints[NET_LENGTH-1].yp,46,56);
        line(hPoint.xp,hPoint.yp,netPoints[NET_LENGTH-1].xp,netPoints[NET_LENGTH-1].yp+26);

//            rect(pos.xp-20,pos.yp-20,netW,netH);
        //rect(pos.xp+HANDLE_D_X-0.5*handleW,pos.yp+HANDLE_D_Y-0.5*handleH,handleW,handleH);
    }

    boolean checkHendleIntersect(float _x, float _y) {
        return(_x > pos.xp + HANDLE_D_X - 0.5*HANDLE_SIZE && _x < pos.xp + HANDLE_D_X + 0.5*HANDLE_SIZE 
            && _y > pos.yp + HANDLE_D_Y - 0.5*HANDLE_SIZE && _y < pos.yp + HANDLE_D_Y + 0.5*HANDLE_SIZE);
    }

    boolean checkNetIntersect(float _x, float _y) {
        _x += BUTTERFLY_IMAGE_SIZE/2;
        _y += BUTTERFLY_IMAGE_SIZE/2;
        // println("x: "+_x+ " y: "+_y+" posx: "+pos.xp+" posy: "+pos.yp);
        return(_x > pos.xp-20 && _x < pos.xp-20 + NET_SIZE 
            && _y > pos.yp-20 && _y < pos.yp-20 + NET_SIZE);
    }

    void setHand(Hands h) {
        holdingHands = h;
    }

    boolean isInHand() {
        return(holdingHands != null);
    }
}