
class Cell {
  int x, y;
  int w = 223;
  char content = ' ';

  //-------------------------------------------------------------------------------

  Cell(int X, int Y) {
    x = X;
    y = Y;
  }

  //-------------------------------------------------------------------------------
  void show() {
    if ( content == 'X') {
      image(Ex, x, y);
    } else if (content == 'O') {
      image(Oh, x, y);
    }
  }
  
  boolean mouseOver() {
    if (x <= mouseX && mouseX <= x + w) {
      if (y <= mouseY && mouseY <= y + w) {
        return true;
      }
    }
    return false;
  }

  //-------------------------------------------------------------------------------

  boolean setChar(char temp) {
    if (content == ' ' && !gameWin()) {
      content = temp;
      return true;
    }
    return false;
  }
}
