class Menu extends Object {

	Menu(float xpos, float ypos) {
		super(xpos, ypos);

	}

	void display() {
		rect(pos.xp, pos.yp, 50, 150);
	}

	int getWidth() {
		return 0;
	}
}