//TicTacToe
PImage Background;
PImage Ex;
PImage Oh;
PImage Reset;
PImage WinX;
PImage WinO;
PImage GameDraw;
PImage BotOn;
PImage BotOff;


Cell [] grid = new Cell [9];
int turn = 0;

Button reset = new Button(getXY(4), getXY(2));
Button toggleBot = new Button(getXY(5)+ 110, getXY(1));

Bot bot = new Bot();
boolean botPlay = false;

void setup() {
  size(1792, 896);

  Background = loadImage("BigBack.png");
  Ex = loadImage("Ex.png");
  Oh = loadImage("Oh.png");
  Reset = loadImage("Reset.png");
  WinX = loadImage("WinX.png");
  WinO = loadImage("WinO.png");
  GameDraw = loadImage("gameDraw.png");
  BotOff = loadImage("OBotOff.png");
  BotOn = loadImage("OBotOn.png");
  
  reset.setImage(Reset);
  toggleBot.setImage(BotOff);

  //initialize each cell
  int count = 0;
  for (int j = 0; j < 3; j++) {
    for (int i = 0; i < 3; i++) {
      grid[count] = new Cell(getXY(i), getXY(j));
      count++;
    }
  }
}

void draw() {
  refresh();
  if ( turn == 1 && botPlay) {
    bot.play();
    turn--;
  }

  if (gameWin()) {
    if (turn == 0) {
      image(WinO, getXY(4), getXY(1));
    } else if (turn == 1) {
      image(WinX, getXY(4), getXY(1));
    }
  } else if (full()) {
    image(GameDraw, getXY(4), getXY(1));
  }
  
}

void mousePressed() {
  for (int i = 0; i < grid.length; i++) {
    if (grid[i].mouseOver()) {
      if (turn == 0) {
        if ( grid[i].setChar('X')) {
          turn++;
        }
      } else if ( turn == 1 && !botPlay) {
        //*
        if ( grid[i].setChar('O')) {
          turn--;
        }
        //*/
      }
    }
  }

  if (reset.mouseOver()) {
    for (int i = 0; i < grid.length; i++) {
      grid[i].content = ' ';
    }
    bot = new Bot();
    turn = 0;
  }
  
  if (toggleBot.mouseOver() && empty()) {
    botPlay = toggle(botPlay);
    if(botPlay){
      toggleBot.setImage(BotOn);
    }
    else{
      toggleBot.setImage(BotOff);
    }
    turn = 0;
  }
}
