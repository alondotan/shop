class Bucket {


	Point pos = new Point(100,450);
	Bucket(){

	}

	void display(){
		image(bucketImg,pos.xp,pos.yp);
	}

    boolean checkHandIntersect(float _x, float _y) {
        return(_x > pos.xp - 0.5*BUCKET_SIZE && _x < pos.xp + 0.5*BUCKET_SIZE 
            && _y > pos.yp - 0.5*BUCKET_SIZE && _y < pos.yp  + 0.5*BUCKET_SIZE);
    }

}