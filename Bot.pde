
class Bot {
  boolean Cfirst;
  int count = 0;
  //win conditions
  int[][] winSpace = {
    {1, 1, 1, 4, 7, 2, 3, 3}, //0
    {2, 4, 5, 5, 8, 5, 6, 5}, //1
    {3, 7, 9, 6, 9, 8, 9, 7}  //2
    //0, 1, 2, 3, 4, 5, 6, 7
  };//winSpace[2][1] = 7

  int[] space1 = {1, 1, 1, 4, 7, 2, 3, 3};
  int[] space2 = {2, 4, 5, 5, 8, 5, 6, 5};
  int[] space3 = {3, 7, 9, 6, 9, 8, 9, 7};

  //-------------------------------------------------------------------------------
  Bot() {
  }
  //-------------------------------------------------------------------------------
  boolean tryWin() {
    return fillThree('O');
  }

  boolean blockX() {
    return fillThree('X');
  }

  boolean fillThree(char check) {
    char opposite = 'X';
    if(check == 'X'){
      opposite = 'O';
    }
    
    char var1, var2, var3;
    int countCheck;
    for (int i = 0; i < 8; i++) {
      countCheck = 0;
      var1 = grid[space1[i] - 1].content;
      var2 = grid[space2[i] - 1].content;
      var3 = grid[space3[i] - 1].content;
      
      if(var1 == check){
        countCheck++;
      }
      if(var2 == check){
        countCheck++;
      }
      if(var3 == check){
        countCheck++;
      }
      
      if(var1 != opposite && var2 != opposite && var3 != opposite){
        if( countCheck == 2){
          if(grid[space1[i] - 1].setChar('O')){
            return true;
          }
          else if(grid[space2[i] - 1].setChar('O')){
            return true;
          }else if(grid[space3[i] - 1].setChar('O')){
            return true;
          }
        }
      }
    }
    return false;
  }

  //-------------------------------------------------------------------------------

  boolean blockFork() {

    if (grid[1].content == 'X' && grid[3].content =='X' && grid[0].content ==' ') {
      return grid[0].setChar('O');
    }

    if (grid[1].content == 'X' && grid[5].content =='X' && grid[2].content ==' ') {
      return grid[2].setChar('O');
    }

    if (grid[7].content == 'X' && grid[5].content =='X' && grid[8].content ==' ') {
      return grid[8].setChar('O');
    }

    if (grid[7].content == 'X' && grid[3].content =='X' && grid[6].content ==' ') {
      return grid[6].setChar('O');
    }

    return false;
  }

  //-------------------------------------------------------------------------------

  void OPlay() {
    if (Cfirst) {
      if (grid[0].setChar('O')) {
      } else if (grid[8].setChar('O')) {
      } else if (grid[6].setChar('O')) {
      } else if (grid[3].setChar('O')) {
      } else if (grid[7].setChar('O')) {
      }
    } else {
      if (grid[4].setChar('O')) {
      } else if (grid[3].setChar('O')) {
      } else if (grid[5].setChar('O')) {
      } else if (grid[6].setChar('O')) {
      } else if (grid[8].setChar('O')) {
      } else {
        for (int i = 0; i < 8; i++) {
          if (grid[i].setChar('O')) {
            i = 10;
          }
        }
      }
    }
  }

  //-------------------------------------------------------------------------------

  void play() {
    
    if (count == 0) {
      if (grid[4].content =='X') {
        Cfirst = true;
      }
      count++;
    }

    //bot action
    if (tryWin()) {
      println("tryWin");
    } else if (blockFork()) {
      println("blockFork");
    } else if (blockX()) {
      println("blockX");
    } else {
      println("OPlay");
      OPlay();
    }
  }
}//end bot
