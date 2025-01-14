
int Scale = 16; // size of each cell
int rows; // rows of board
int columns; // colums of board

Road[][] vejFelt; //Vejfelter
boolean[][] collision; //Collisiondetection

boolean[] pressed = new boolean[256];

int x, y;
ArrayList<cars> car;


void setup() {
  size(800, 800);

  rows = round(width/Scale);
  columns = round(width/Scale);

  vejFelt = new Road[rows][columns];
  collision = new boolean[rows][columns];

  car = new ArrayList<cars>();

  for (int i = 0; i < 10; i++) {
    car.add(new cars(round(random(0, columns)), round(random(0, rows))));
  }
  for (int r = 0; r < rows; r++) {
    for (int R = 0; R < columns; R++) {
      vejFelt[r][R] = new Road(r, R, 0, false);
    }
  }
}


void draw() {
  background(-1);
  drawGrid();

  for (int r = 0; r < rows; r++) {
    for (int R = 0; R < columns; R++) {
      vejFelt[r][R].display();
    }
  }

  for (cars c : car) {
    c.move();
    c.display();
  }
  text(frameRate, 20, 20);
}

void drawGrid() {
  stroke(200);
  // Begin loop for columns
  for (int i = 0; i < height; i+=Scale) {
    line(0, i, width, i);
  }
  // Begin loop for rows
  for (int i = 0; i < width; i+=Scale) {
    line(i, 0, i, height);
  }
}


void keyPressed() {
  pressed[keyCode] = true;
}

void keyReleased() {
  pressed[keyCode] = false;
}

void mouseDragged() {
  try {
    vejFelt[round(mouseY/Scale)][round(mouseX/Scale)] = new Road(round(mouseX/Scale), round(mouseY/Scale), 1, true);
    vejFelt[round(mouseY/Scale)][round(mouseX/Scale)+1] = new Road(round(mouseX/Scale)+1, round(mouseY/Scale), 1, true);
    vejFelt[round(mouseY/Scale)+1][round(mouseX/Scale)] = new Road(round(mouseX/Scale), round(mouseY/Scale)+1, 1, true);
    vejFelt[round(mouseY/Scale)+1][round(mouseX/Scale)+1] = new Road(round(mouseX/Scale)+1, round(mouseY/Scale)+1, 1, true);
  } 
  catch( Exception e) {
  }
}

void mouseClicked() {
  try {
    car.add(new cars(round(mouseX)/Scale, round(mouseY)/Scale));
  }
  catch( Exception e) {
  }
}
