
class Rabbit extends Object{
  PImage[] images;
  int idleImageCount;
  int walkImageCount;
  int jumpImageCount;
  int petImageCount;
  int frame;
  
  Rabbit(float xpos, float ypos) {
    super(xpos,ypos);
    int state = 1;
    char direction = 'r'; 
    idleImageCount = 6;
    walkImageCount = 4;
    jumpImageCount = 6;
    petImageCount = 6;
    final int IDLE_STATE = 0;
    final int WALK_STATE = 1;
    final int JUMP_STATE = 2;
    final int PET_STATE = 3;
    
    
    images = new PImage[walkImageCount];

  switch (state) {
     case IDLE_STATE:
           break;
     case WALK_STATE:
          for (int i = 0; i < walkImageCount; i++) {
              // Use nf() to number format 'i' into four digits
            String filename = "rabbitWalk" + nf(i, 4) + ".gif";
            images[i] = loadImage(filename);
          }     
           break;
     case JUMP_STATE:
           break;
     case PET_STATE:
           break;           
  }

  }

 
  void display() {
    frame = (frame+1) % walkImageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}
