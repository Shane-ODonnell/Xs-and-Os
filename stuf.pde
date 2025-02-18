
int getXY(int i) {
  return 84 + (223+29)*(i);
}

boolean toggle(boolean temp){
  if(temp){
    return false;
  }
  return true;
}

boolean full() {
  for (int i = 0; i < grid.length; i++) {
    if (grid[i].content == ' ') {
      return false;
    }
  }
  return true;
}
boolean empty(){
  for(int i = 0; i < grid.length; i++){
     if (grid[i].content != ' ') {
      return false;
    }
  }
  return true;
}

void refresh() {
  image(Background, 0, 0);
  reset.show();
  toggleBot.show();

  for (int i = 0; i < grid.length; i++) {
    grid[i].show();
  }

  if (gameWin()) {
    if (turn == 1) {
      image(Ex, getXY(4), getXY(0));
    } else if (turn == 0) {
      image(Oh, getXY(4), getXY(0));
    }
  } else {
    if (turn == 0) {
      image(Ex, getXY(4), getXY(0));
    } else if (turn == 1) {
      image(Oh, getXY(4), getXY(0));
    }
  }
}

boolean gameWin() {
  int[] space1 = {1, 1, 1, 4, 7, 2, 3, 3};
  int[] space2 = {2, 4, 5, 5, 8, 5, 6, 5};
  int[] space3 = {3, 7, 9, 6, 9, 8, 9, 7};

  for (int i = 0; i < 8; i++) {
    char var1, var2, var3;
    var1 = grid[space1[i] - 1].content;
    var2 = grid[space2[i] - 1].content;
    var3 = grid[space3[i] - 1].content;

    if (var1 == var2 && var2 == var3 && var1 != ' ') {
      return true;
    }
  }
  return false;
}

/*/
char [] Var = new char[3]; // whats inside the cells under investigation is stored here
    int countX;
    println(winSpace[2][1]);
    
    for (int i = 0; i < 8; i++) { // 8 win combos

      countX = 0;

      for (int j = 0; j < Var.length; j++) {
        Var[j] = grid[winSpace[j][i]-1].content;
        if (Var[j] == check) {
          countX++;
        }
      }

      if (Var[1] != check && Var[2] != check && Var[0] != check) {
        if (countX == 2) {
          for (int k = 0; k < Var.length; k++) {
            if (grid[winSpace[i][k]].setChar('O')) {
              return true;
            }
          }
        }
      }
    }
//*/
