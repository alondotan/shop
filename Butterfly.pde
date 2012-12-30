class Butterfly extends Object {
    int idleImageCount;
    int jumpImageCount;
    int petImageCount;
    int frame;
    float toX;
    float toY;
    int delayCounter = 0;
    int delayTime = 5;

    Butterfly(float xpos, float ypos) {
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
        if(delayCounter++ == delayTime) {
            frame = (frame + 1) % butterflyFlyImageCount;
            delayCounter = 0;
        }
        image(butterflyImages[frame], xpos, ypos);
    }

    int getWidth() {
        return butterflyImages[0].width;
    }
}