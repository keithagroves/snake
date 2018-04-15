# snake

ArrayList<Location> tail = new ArrayList<Location>();
int x = 250;
int y = 250;
int size = 10;
int foodEaten = 5;

void setup() {
  size(500, 500);
  frameRate(20);
  //creates first position
  tail.add(new Location(x, y));
}


void draw() {
  //draws background
  background(0);
  
  //goes through location arrayList
  for (Location l : tail) {
    rect(l.x, l.y, size, size);
  }
  
  //if the size is greater than the food eaten then remove the end of the tail.
  if (tail.size()>foodEaten) {
    tail.remove(0);
  }
    //adds current snake position to tail
    tail.add(new Location(x, y));

  //moves snake
  
  move();
}



class Location {
  int x;
  int y;
  Location(int x, int y) {
    this.x = x;
    this.y = y;
  }
}





boolean up;
boolean down;
boolean left;
boolean right;

void keyPressed() {
  if (keyCode == RIGHT) {
    right = true;
  } else if (keyCode == LEFT) {
    left = true;
  }
  if (keyCode == UP) {
    up = true;
  } else if (keyCode == DOWN) {
    down = true;
  }
}
void keyReleased() {
  if (keyCode == RIGHT) {
    right = false;
  } 
  if (keyCode == LEFT) {
    left = false;
  }
  if (keyCode == UP) {
    up = false;
  } 
  if (keyCode == DOWN) {
    down = false;
  }
}

void move() {
  if (up) {
    y-=size;
  }
  if (down) {
    y+=size;
  }
  if (right) {
    x+=size;
  }
  if (left) {
    x-=size;
  }
}

