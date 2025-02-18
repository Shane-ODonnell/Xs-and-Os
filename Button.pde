
class Button {
  int x, y;
  int w = 223;
  PImage display = Reset;

  Button(int X, int Y) {
    x = X;
    y = Y;
  }

  void show() {
    image(display, x, y);
  }

  boolean mouseOver() {
    if (x <= mouseX && mouseX <= x + w) {
      if (y <= mouseY && mouseY <= y + w) {
        return true;
      }
    }
    return false;
  }
  
  void setImage(PImage temp){
    display = temp;
  }
}
