class Butterfly extends Object {
    int idleImageCount;
    int jumpImageCount;
    int petImageCount;
    int frame;
    float toX;
    float toY;
    int delayCounter = 0;
    int delayTime = 5;
    int butterflyColor;

    Butterfly(float xp, float yp,int c) {
        super(xp, yp);
        int state = 1;
        char direction = 'r';
        idleImageCount = 6;
        butterflyColor = c;

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

        // walking§
        if(pos.xp < toX) pos.xp = pos.xp + (toX - pos.xp) * 0.05;
        else if(pos.xp > toX) pos.xp = pos.xp - (pos.xp - toX) * 0.05;

        if(pos.yp < toY) pos.yp = pos.yp + (toY - pos.yp) * 0.05;
        else if(pos.yp > toY) pos.yp = pos.yp - (pos.yp - toY) * 0.05;

        if(abs(pos.xp - toX) < 5 && abs(pos.yp - toY) < 5) {
            toX = random(SCREEN_W/2);
            toY = random(SCREEN_H*BUTTERFLY_DOMAIN_BOTTOM);
        }
    }


    void display() {
        if(delayCounter++ == delayTime) {
            frame = (frame + 1) % butterflyFlyImageCount;
            delayCounter = 0;
        }
        image(butterflyImages[butterflyColor][frame], pos.xp-BUTTERFLY_IMAGE_SIZE/2, pos.yp-BUTTERFLY_IMAGE_SIZE/2);
    }

    int getWidth() {
        return butterflyImages[butterflyColor][0].width;
    }
}