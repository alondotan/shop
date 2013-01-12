
class Hands {
    Point pos;
//    float rXpos, rYpos, lXpos, lYpos;
    boolean hasCarrot;
    boolean hasNet; 
    Hands() {
        pos = new Point (0,0);
        hasCarrot = false;
        hasNet = false;
    }

    void update() {
       // kinect !!!
    /*    IntVector userList = new IntVector();
        kinect.getUsers(userList);

        if (userList.size() > 0) {
            int userId = userList.get(0);

            if ( kinect.isTrackingSkeleton(userId)) {
                float confidence;
                PVector rightHandVec = new PVector();
                confidence = kinect.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_HAND, rightHandVec);
                if (confidence < 0.5) {
                    println("not good");
                }
                else{
                    PVector convertedRightHand = new PVector();
                    kinect.convertRealWorldToProjective(rightHandVec, convertedRightHand);
                    pos.xp = convertedRightHand.x - 25;
                    pos.yp = convertedRightHand.y - 25;

                }
                PVector leftHandVec = new PVector();
                confidence = kinect.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_HAND, leftHandVec);
                if (confidence < 0.5) {
                    println("not good");
                }
                else{
                    PVector convertedLeftHand = new PVector();
                    kinect.convertRealWorldToProjective(leftHandVec, convertedLeftHand);
                    pos.xp = convertedLeftHand.x - 25;
                    pos.yp = convertedLeftHand.y - 25;

                }

            }
        }
      */  
        pos.xp = mouseX;
        pos.yp = mouseY;

    }

    void display() {
        image(rightHandImage, pos.xp-rightHandImage.width/2, pos.yp-rightHandImage.width/2);
        // image(leftHandImage, lXpos, lYpos);
        if (hasCarrot){
            image(carrotImg, pos.xp-carrotImg.width/2, pos.yp-carrotImg.width/2);
        }
    }

    float getRightX() {
        return pos.xp;
    }

    float getRightY() {
        return pos.yp;
    }

    void setHasNet(boolean val){
        hasNet = val;
    }

    boolean getHasNet(){
        return hasNet;
    }
        void setHasCarrot(boolean val){
        hasCarrot = val;
    }

    boolean getHasCarrot(){
        return hasCarrot;
    }
}