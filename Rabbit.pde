class Rabbit extends Object {
    final int IDLE_STATE = 0;
    final int WALK_STATE = 1;
    final int JUMP_STATE = 2;
    final int PET_STATE = 3;
    final int IDLE_STATE_TIME = 20;
    final int JUMMPING_DIST = 26;

    int idleImageCount;

    int jumpImageCount;
    int petImageCount;
    int frame;
    float toX;
    float toY;
    int state;
    int rabbitWalkImageCount;
    int idleStateCount;
    char direction;

    Rabbit(float xpos, float ypos) {
        super(xpos, ypos);
        state = IDLE_STATE;
        direction = 'r';
        idleImageCount = 6;
        jumpImageCount = 6;
        petImageCount = 6;
        rabbitWalkImageCount = RABBIT_JUMP_IMGS_NUMBER;
        idleStateCount = 10;
        toX = random(SCREEN_W);
        toY = random(SCREEN_H*(RABBIT_DOMAIN_BOTTOM-RABBIT_DOMAIN_TOP))+SCREEN_H*RABBIT_DOMAIN_TOP;


    }

    void update() {
        float junpDist;
//            println("state: "+state);
        switch(state) {
            case IDLE_STATE:
                idleStateCount--;
                if (idleStateCount <= 0)
                {
                    state = WALK_STATE;
                    toY = random(SCREEN_H*(RABBIT_DOMAIN_BOTTOM-RABBIT_DOMAIN_TOP))+SCREEN_H*RABBIT_DOMAIN_TOP;
                    rabbitWalkImageCount = RABBIT_JUMP_IMGS_NUMBER;
                }
                break;
            case WALK_STATE:
                rabbitWalkImageCount--;
                if (rabbitWalkImageCount <= 0)
                {
                    state = IDLE_STATE;
                    idleStateCount = IDLE_STATE_TIME;
                }
                else {
                  //  println("JUMMPING_DIST: "+JUMMPING_DIST);
                   // println("RABBIT_JUMP_IMGS_NUMBER: "+RABBIT_JUMP_IMGS_NUMBER);
                   // println("rabbitWalkImageCount: "+rabbitWalkImageCount);
                    junpDist = float(JUMMPING_DIST/RABBIT_JUMP_IMGS_NUMBER);//*rabbitWalkImageCount;
            //        println("junpDist: "+junpDist);
                    xpos -= junpDist; //
                }
                // walking aside
                /*
                if(xpos < toX) xpos = xpos + (toX - xpos) * 0.05;
                else if(xpos > toX) xpos = xpos - (xpos - toX) * 0.05;

                if(ypos < toY) ypos = ypos + (toY - ypos) * 0.05;
                else if(ypos > toY) ypos = ypos - (ypos - toY) * 0.05;

                */

/*                if(abs(xpos - toX) < 5 && abs(ypos - toY) < 5) {
                    //toX = random(SCREEN_W);
                    state = IDLE_STATE;
                    idleStateCount = IDLE_STATE_TIME;
    //                toY = random(SCREEN_H*(RABBIT_DOMAIN_BOTTOM-RABBIT_DOMAIN_TOP))+SCREEN_H*RABBIT_DOMAIN_TOP;
                }*/
                break;
            case JUMP_STATE:
                break;
            case PET_STATE:
                break;
            }

    }


    void display() {
        frame = (frame + 1) % RABBIT_JUMP_IMGS_NUMBER;
        //    println(frame);
        image(rabbitJumpingImages[frame], xpos - RABBIT_IMAGE_W * 0.5, ypos - RABBIT_IMAGE_H * 0.5);
    }

    int getWidth() {
        return rabbitJumpingImages[0].width;
    }
}