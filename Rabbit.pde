class Rabbit extends Object {

    int idleImageCount;

    int jumpImageCount;
    int petImageCount;
    int frame;
    float toX;
    float toY;

    Rabbit(float xpos, float ypos) {
        super(xpos, ypos);
        int state = 1;
        char direction = 'r';
        idleImageCount = 6;
        jumpImageCount = 6;
        petImageCount = 6;
        final int IDLE_STATE = 0;
        final int WALK_STATE = 1;
        final int JUMP_STATE = 2;
        final int PET_STATE = 3;

        toX = random(SCREEN_W);
        toY = random(SCREEN_H);


        switch(state) {
        case IDLE_STATE:
            break;
        case WALK_STATE:
            break;
        case JUMP_STATE:
            break;
        case PET_STATE:
            break;
        }

    }

    void update() {

        // walking
        if(xpos < toX) xpos = xpos + (toX - xpos) * 0.05;
        else if(xpos > toX) xpos = xpos - (xpos - toX) * 0.05;

        if(ypos < toY) ypos = ypos + (toY - ypos) * 0.05;
        else if(ypos > toY) ypos = ypos - (ypos - toY) * 0.05;

        if(abs(xpos - toX) < 5 && abs(ypos - toY) < 5) {
            toX = random(SCREEN_W);
            toY = random(SCREEN_H);
        }
    }


    void display() {
        frame = (frame + 1) % rabbitWalkImageCount;
        //    println(frame);
        image(rabbitWalkingImages[frame], xpos, ypos);
    }

    int getWidth() {
        return rabbitWalkingImages[0].width;
    }
}