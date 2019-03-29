void setup() {
  size(400, 400);
  noLoop();
}


/**************************
* Takes length of side, returns height of
* equilateral triangle as float value
**************************/
float calcEquiTriangleHeight(float sideLength) {
  return (sideLength / 2) * sqrt(3);
}


/**************************
* Draws an equilateral triangle with sides of given length.
* The provided (x, y) coordinate is the starting point. 
* The triangle is drawn with three lines, the point facing up.
**************************/
void drawEquilateralTriangle(float x, float y, float sideLength) {
  float x2 = x + (sideLength / 2);
  double y2 = y - int(calcEquiTriangleHeight(sideLength));
  float x3 = x + sideLength;
  
  line(x, y, x2, (float)y2);
  line(x2, (float)y2, x3, y);
  line(x3, y, x, y);
}



/**************************
* buildPyramid
* Creates a pyramid of equilateral triangles.
*
* Parameters: int baseSize     - number of triangles at base of pyramid
*             float sideLength - length of triangle side
* Returns:    void 
**************************/
void buildPyramid(int baseSize, float sideLength) {
  int pyramidWidth = int(baseSize * sideLength); // width of the pyramid
  
  /****************************
  * the pyramid is generated starting at the bottom left vertex. With a
  *    starting location of (startingX, startingY), the pyramid will be 
  *     centered on the canvas.
  *
  * "width" and "height" are Processing system variables that store the
  *    width and height of the canvas
  *****************/
  int startingX = (width / 2) - (pyramidWidth / 2);
  int startingY = int((height / 2) + ((baseSize * calcEquiTriangleHeight(sideLength)) / 2)); 
  
  pushMatrix();
  translate(startingX, startingY);

  for (int i = baseSize; i > 0; i--) {
    for (int j = 0; j < i; j++) {
      drawEquilateralTriangle(0, 0, sideLength);
      translate(sideLength, 0);
    }
    // translates the grid so that the origin is at the top vertex of the top left triangle
    translate(-1 * (sideLength * i - (sideLength / 2)), -1 * (calcEquiTriangleHeight(sideLength)));
  }
  popMatrix();
}

void draw() {
  strokeWeight(2);

  buildPyramid(6, 50);
  
  /*
  pushMatrix();
  translate(400, 400);
  drawEquilateralTriangle(0, 0, 50);

  for (int i = 0; i < 6; i++) {
    println(i);
    rotate(radians(60));
    drawEquilateralTriangle(0, 0, 50);
  }

  popMatrix();

  pushMatrix();
  translate(300, 400 - (50 / 2) * sqrt(3));
  drawEquilateralTriangle(0, 0, 50);
  translate(-300, 2 * ((50 / 2) * sqrt(3)));
  */
}
