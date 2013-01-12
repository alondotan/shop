class Rabbit extends Object {
    final int IDLE_STATE = 0;
    final int JUMP_STATE = 1;
    final int TURN_STATE = 2;
    final int PET_STATE = 3;
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
                        println("RRRR");
                    }
                    else {
                        println("LLLLL");
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
                    xpos -= jumpDist; //
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
            case PET_STATE:
                break;
            }

    }


    void display() {
        switch(state) {
            case IDLE_STATE:
                break;
            case JUMP_STATE:
                frame = (frame + 1) % RABBIT_JUMP_IMGS_NUMBER;
            //    println(frame);
                image(rabbitJumpingImages[frame], xpos - RABBIT_IMAGE_W * 0.5, ypos - RABBIT_IMAGE_H * 0.5);
                break;
            case TURN_STATE:
                frame = (frame + 1) % RABBIT_TURN_HEAD_IMGS_NUMBER;
            //    println(frame);
                image(rabbitTurningHeadImages[frame], xpos - RABBIT_IMAGE_W * 0.5, ypos - RABBIT_IMAGE_H * 0.5);
                break;
        }
        if (runningAfterCarrot){
            ellipse(xpos, ypos, 10, 10);
        }

    }

    int getWidth() {
        return rabbitJumpingImages[0].width;
    }

    void setRunningAfter(boolean val){
        runningAfterCarrot = val;
    }
}