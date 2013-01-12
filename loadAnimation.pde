void loadAnimation(){
	rabbitJumpingImages = new PImage[RABBIT_JUMP_IMGS_NUMBER];
    for(int i = 0; i < RABBIT_JUMP_IMGS_NUMBER; i++) {
        // Use nf() to number format 'i' into four digits
        String filename = "images/bunny/bunnyJump" + nf(i, 4) + ".png";
        rabbitJumpingImages[i] = loadImage(filename);
        rabbitJumpingImages[i].resize(RABBIT_IMAGE_W, RABBIT_IMAGE_H);
    }
    rabbitTurningHeadImages = new PImage[RABBIT_TURN_HEAD_IMGS_NUMBER];
    for(int i = 0; i < RABBIT_TURN_HEAD_IMGS_NUMBER; i++) {
        // Use nf() to number format 'i' into four digits
        String filename = "images/bunny/bunnyTurnHead" + nf(i, 4) + ".png";
        rabbitTurningHeadImages[i] = loadImage(filename);
        rabbitTurningHeadImages[i].resize(RABBIT_IMAGE_W, RABBIT_IMAGE_H);
    }

    butterflyFlyImageCount = 2;
    butterflyColorCount = 4;
    butterflyImages = new PImage[butterflyColorCount][butterflyFlyImageCount];
    for(int i = 0; i < butterflyFlyImageCount; i++) {
        // Use nf() to number format 'i' into four digits
        butterflyImages[greenButterfly][i] = loadImage("images/butterfly/butterfly_green" + nf(i, 4) + ".png");
        butterflyImages[greenButterfly][i].resize(BUTTERFLY_IMAGE_SIZE,BUTTERFLY_IMAGE_SIZE);

        butterflyImages[pinkButterfly][i] = loadImage("images/butterfly/butterfly_pink" + nf(i, 4) + ".png");
        butterflyImages[pinkButterfly][i].resize(BUTTERFLY_IMAGE_SIZE,BUTTERFLY_IMAGE_SIZE);

        butterflyImages[purpleButterfly][i] = loadImage("images/butterfly/butterfly_purple" + nf(i, 4) + ".png");
        butterflyImages[purpleButterfly][i].resize(BUTTERFLY_IMAGE_SIZE,BUTTERFLY_IMAGE_SIZE);

        butterflyImages[yellowButterfly][i] = loadImage("images/butterfly/butterfly_yellow" + nf(i, 4) + ".png");
        butterflyImages[yellowButterfly][i].resize(BUTTERFLY_IMAGE_SIZE,BUTTERFLY_IMAGE_SIZE);
    }

    backgroudImg = new PImage();
    backgroudImg = loadImage("images/backgrounds/background2_day.png");
    backgroudImg.resize(SCREEN_W,SCREEN_H);
    clothImg = new PImage();
    clothImg = loadImage("images/backgrounds/clothes_day.png");
    clothImg.resize(SCREEN_W,SCREEN_H);

	bucketImg = new PImage();
	bucketImg = loadImage("images/carrot/bucketstitch.png");
	bucketImg.resize(BUCKET_SIZE,BUCKET_SIZE);

	carrotImg = new PImage();
	carrotImg = loadImage("images/carrot/carrotstitch.png");
    carrotImg.resize(100,0);

    rightHandImage = new PImage();
    rightHandImage = loadImage("images/orb.png");
    rightHandImage.resize(80, 0);
    leftHandImage = new PImage();
    leftHandImage = loadImage("images/orb.png");
    leftHandImage.resize(80, 0);
}