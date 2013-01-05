
class Hands {
    PImage rightHandImage, leftHandImage;
    float rXpos, rYpos, lXpos, lYpos;

    Hands() {
        rightHandImage = new PImage();
        rightHandImage = loadImage("images/rightHand.png");
        rightHandImage.resize(80, 0);
        leftHandImage = new PImage();
        leftHandImage = loadImage("images/leftHand.png");
        leftHandImage.resize(80, 0);

    }

    void update() {
/*       // kinect !!!
        IntVector userList = new IntVector();
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
                    rXpos = convertedRightHand.x - 25;
                    rYpos = convertedRightHand.y - 25;

                }
                PVector leftHandVec = new PVector();
                confidence = kinect.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_HAND, leftHandVec);
                if (confidence < 0.5) {
                    println("not good");
                }
                else{
                    PVector convertedLeftHand = new PVector();
                    kinect.convertRealWorldToProjective(leftHandVec, convertedLeftHand);
                    lXpos = convertedLeftHand.x - 25;
                    lYpos = convertedLeftHand.y - 25;

                }

            }
        }*/
        
        rXpos = mouseX - 25;
        rYpos = mouseY - 25;

        lXpos = rXpos - 300;
        lYpos = rYpos;
    }

    void display() {
        image(rightHandImage, rXpos, rYpos);
        image(leftHandImage, lXpos, lYpos);
    }

    float getRightX() {
        return rXpos;
    }

    float getRightY() {
        return rYpos;
    }

    float getLeftX() {
        return lXpos;
    }

    float getLeftY() {
        return lYpos;
    }
}