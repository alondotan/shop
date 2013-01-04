class ButterflyNet {

    int NET_SIZE = 30;
    int HANDLE_D_X = 20;
    int HANDLE_D_Y = 150;

    float theta = 0.0;
    //Point startPoint = new Point(0.0,0.0);
    Point [] prevs = new Point[NET_SIZE];

    Point pos;
//    float xpos;
 //   float ypos;
    boolean isHolding;
    Hands holdingHands;
    PImage netImage;
    int netW = 70;
    int netH = 70;
    int handleW = 70;
    int handleH = 70;
//    int handlePosX = 170;
//   int handlePosY = 180;

    ButterflyNet() {
        pos = new Point(100,200);
        isHolding = false;
        holdingHands = null;
        for (int i = 0; i<NET_SIZE; i++){
            prevs[i] = new Point(pos.xp,pos.yp);
        }
    }

    void update() {
        if(holdingHands != null) {
            pos.xp = holdingHands.getRightX()-HANDLE_D_X+ 0.5*handleW;
            pos.yp = holdingHands.getRightY()-HANDLE_D_Y+ 0.5*handleH;
        }
    }

    void display() {
        if (holdingHands != null){
            for (int i = 0; i<NET_SIZE-1; i++){
                prevs[i].set(prevs[i+1]);
                prevs[i].yp += 1.5;
                noStroke();
                fill(200,200,250);
                ellipse(prevs[i].xp,prevs[i].yp,16+i,16+2*i);
            }
        }
        Point hPoint = new Point(pos.xp+HANDLE_D_X,pos.yp+HANDLE_D_Y);
        prevs[NET_SIZE-1].set(pos);

        for (int i = NET_SIZE-1; i>0; i--)
        {
            if (prevs[i].xp-prevs[i-1].xp > 5)
            {
             prevs[i-1].xp = prevs[i].xp - 5;
            }
            else if (prevs[i].xp-prevs[i-1].xp < -5 )
            {
             prevs[i-1].xp = prevs[i].xp + 5;
            }
            if (prevs[i].yp-prevs[i-1].yp > 5)
            {
             prevs[i-1].yp = prevs[i].yp - 5;
            }
            else if (prevs[i].yp-prevs[i-1].yp < -5 )
            {
             prevs[i-1].yp = prevs[i].yp + 5;
            }
        }    

        fill(150,150,250);
        stroke(255,100,100);
        strokeWeight(6);
        ellipse(prevs[NET_SIZE-1].xp,prevs[NET_SIZE-1].yp,46,56);
        line(hPoint.xp,hPoint.yp,prevs[NET_SIZE-1].xp,prevs[NET_SIZE-1].yp+26);

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