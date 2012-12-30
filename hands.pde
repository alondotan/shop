class Hands {
   PImage rightHandImage,leftHandImage;
   float rXpos,rYpos,lXpos,lYpos;

  Hands (){
       rightHandImage = new PImage();
       rightHandImage = loadImage("rightHand.png");
       rightHandImage.resize(80,0);
       leftHandImage = new PImage();
       leftHandImage = loadImage("leftHand.png");
       leftHandImage.resize(80,0);
  }
  
   void update(){
     rXpos = mouseX-25;
     rYpos = mouseY-25;
     
     lXpos = rXpos - 300;
     lYpos = rYpos;
  }
  
  void display(){
     image(rightHandImage,rXpos,rYpos);
     image(leftHandImage,lXpos,lYpos);
  }
  
  float getRightX(){
    return rXpos;
  }
  
    float getRightY(){
    return rYpos;
  }
  
    float getLeftX(){
    return lXpos;
  }
  
    float getLeftY(){
    return lYpos;
  }
}

