class Rabbit extends Object {
    final int IDLE_STATE = 0;
    final int JUMP_STATE = 1;
    final int TURN_STATE = 2;
    final int GOTO_CARROT_STATE = 3;
    final int EAT_CARROT_STATE = 4;

    final int IDLE_STATE_TIME = 20;
    final int JUMMPING_DIST = 100;

    boolean runningAfterCarrot;
    int currStateCount;
    int idleImageCount;

    int jumpImageCount;
    int turnImageCount;
    int petImageCount;
    int frame;
    float toX;
    float toY;
    int state;
    boolean turnToFront = false;
    Hands afterHand;
//    int rabbitWalkImageCount;
    int idleStateCount;
    char direction;

    Rabbit(float xpos, float ypos) {
        super(xpos, ypos);
        state = IDLE_STATE;
        direction = 'l';
        currStateCount = 10;
        toX = random(SCREEN_W);
        toY = random(SCREEN_H*(RABBIT_DOMAIN_BOTTOM-RABBIT_DOMAIN_TOP))+SCREEN_H*RABBIT_DOMAIN_TOP;
        runningAfterCarrot = false;

    }

    void update() {
        float jumpDist;
//            println("state: "+state);
        switch(state) {
            case IDLE_STATE:
                currStateCount--;
                if (currStateCount <= 0)
                {
                    state = TURN_STATE;
                    turnToFront = false;
                    currStateCount = RABBIT_TURN_HEAD_IMGS_NUMBER;
                    //toY = random(SCREEN_H*(RABBIT_DOMAIN_BOTTOM-RABBIT_DOMAIN_TOP))+SCREEN_H*RABBIT_DOMAIN_TOP;
                    //println(rabbitWalkImageCount/RABBIT_JUMP_IMGS_NUMBER);
                    int val = (int) random(2);
                    println("val: "+val); 
                    if (val>0){
                        direction = 'r';
                    }
                    else {
                        direction = 'l';
                    }
                }
                break;
            case JUMP_STATE:
                currStateCount--;
                if (currStateCount <= 0)
                {
                    state = TURN_STATE;
                    currStateCount = RABBIT_TURN_HEAD_IMGS_NUMBER;
                    turnToFront = true;

                }
                else {
                    jumpDist = float(JUMMPING_DIST/RABBIT_JUMP_IMGS_NUMBER);//*rabbitWalkImageCount;
                    if (direction == 'r') 
                        pos.xp -= jumpDist;
                    else 
                        pos.xp += jumpDist;
                }
                break;
            case TURN_STATE:
                currStateCount--;
                if (currStateCount <= 0)
                {
                    if (turnToFront){
                        state = IDLE_STATE;
                        currStateCount = IDLE_STATE_TIME;
                    }
                    else {
                        state = JUMP_STATE;
                        currStateCount = RABBIT_JUMP_IMGS_NUMBER*int(random(6));
                    }
                }

                break;
            case GOTO_CARROT_STATE:
                jumpDist = float(JUMMPING_DIST/RABBIT_JUMP_IMGS_NUMBER);
                boolean isEating = false;
                Point handPoint = afterHand.getPos();
                if (handPoint.xp > pos.xp){
                    pos.xp += jumpDist;
                    isEating = (pos.xp >= handPoint.xp);
                }
                else if (pos.xp > handPoint.xp){
                    pos.xp -= jumpDist;
                    isEating = (pos.xp <= handPoint.xp);
                }
                else{
                    isEating = true;
                }
                if (isEating){
                    hands.setHasCarrot(false);
                    stopRunningAfter();
                    println("EAT!!!");
                    carrotInHand = false;
                    runningAfterCarrot = false;
                }
                break;
            }

    }


    void display() {
        switch(state) {
            case IDLE_STATE:
                image(rabbitTurningHeadImages[0], pos.xp - RABBIT_IMAGE_W * 0.5, pos.yp - RABBIT_IMAGE_H * 0.5);
                break;
            case JUMP_STATE:
            case GOTO_CARROT_STATE:
                frame = (frame + 1) % RABBIT_JUMP_IMGS_NUMBER;
                pushMatrix();
                if (direction=='l'){
                    scale(-1,1);
                    image(rabbitJumpingImages[frame], -(pos.xp + RABBIT_IMAGE_W * 0.5), pos.yp - RABBIT_IMAGE_H * 0.5);
                }
                else {
                    image(rabbitJumpingImages[frame], pos.xp - RABBIT_IMAGE_W * 0.5, pos.yp - RABBIT_IMAGE_H * 0.5);   
                }
                popMatrix();
                break;
            case TURN_STATE:
                frame = (frame + 1) % RABBIT_TURN_HEAD_IMGS_NUMBER;
            //    println(frame);
                image(rabbitTurningHeadImages[frame], pos.xp - RABBIT_IMAGE_W * 0.5, pos.yp - RABBIT_IMAGE_H * 0.5);
                break;
        }
        if (runningAfterCarrot){
            ellipse(pos.xp, pos.yp, 10, 10);
        }

    }

    int getWidth() {
        return rabbitJumpingImages[0].width;
    }

    void setRunningAfter(Hands afterHand){
        runningAfterCarrot = true;
        this.afterHand = afterHand;
        state = GOTO_CARROT_STATE;
        if (afterHand.getPos().xp > pos.xp)
            direction = 'l';
        else 
            direction = 'r';   
    }
 
    void stopRunningAfter(){
        runningAfterCarrot = false;   
        state = IDLE_STATE;
        afterHand = null; 
        currStateCount = IDLE_STATE_TIME;
    }
}