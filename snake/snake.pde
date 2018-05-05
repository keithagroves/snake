public static final int R = 0;
public static final int L = 1;
public static final int U = 2;
public static final int D = 3;
ArrayList<Snake>snake = new ArrayList<Snake>();
Snake head;
int food =8;
int foodX = (int)random(500);
int foodY = (int)random(500);
int dir = RIGHT;

void setup() {
  size(500, 500); 
  snake.add(new Snake(10, 10));
  frameRate(10);
}

void draw() {
  background(0);
  head = snake.get(snake.size()-1);
  drawFood();
  drawSnake();
  move();
  collision();
}

void drawFood() {
  rect(foodX, foodY, 10, 10 );
}

void drawSnake() {
  for (Snake s : snake) {
    rect(s.x, s.y, 10, 10);
  }
  if (snake.size()>food) {
    snake.remove(0);
  }
}

void collision() {
  for (Snake s : snake) {
    if (s.x+ 10 > foodX && s.x < foodX + 10 && s.y + 10 > foodY && s.y < foodY + 10) {
      food++;
      println("yum");
      foodX = (int)random(500);
      foodY = (int)random(500);
    }
  }
}

void move() {
  switch(dir) {
  case U:
    snake.add(new Snake(head.x, head.y-10));
    break;
  case D:
    snake.add(new Snake(head.x, head.y+10));
    break;
  case L:
    snake.add(new Snake(head.x-10, head.y));
    break;
  case R:
    snake.add(new Snake(head.x+10, head.y));
    break;
  default:
    snake.add(new Snake(head.x, head.y));
  }
}
void keyPressed() {
  if (keyCode == UP) {
    dir = U;
  } else if (keyCode == DOWN) {

    dir = D;
  }
  if (keyCode == LEFT) {
    dir = L;
  } else if (keyCode == RIGHT) {

    dir = R;
  }
}

class Snake {
  int x;
  int y;
  Snake(int x, int y) {
    this.x = x;
    this.y = y;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }
}