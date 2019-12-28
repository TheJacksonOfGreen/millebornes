import java.util.*;

Card mile25, mile50, mile75, mile100, mile200, accident, outOfGas, flatTire, stop, repairs, gasoline, spareTire, go, drivingAce, extraTank, punctureProof, rightOfWay;
PImage bg, mile25IMG, mile50IMG, mile75IMG, mile100IMG, mile200IMG, accidentIMG, outOfGasIMG, flatTireIMG, stopIMG, repairsIMG, gasolineIMG, spareTireIMG, goIMG, drivingAceIMG;
PImage extraTankIMG, punctureProofIMG, rightOfWayIMG, goStatusIMG, stopStatusIMG, flatStatusIMG, fuelStatusIMG, crashStatusIMG, discardIMG, win, lose;
Player human, computer;

String winner = "Nobody";

ArrayList<Card> deck = new ArrayList<Card>();
ArrayList<Card> discardPile = new ArrayList<Card>();

void setup() {
  size(640, 480);
  
  bg = loadImage("racetrack.jpg");
  win = loadImage("trophy.png");
  lose = loadImage("ohno.gif");
  mile25IMG = loadImage("25Miles.jpg");
  mile50IMG = loadImage("50Miles.jpg");
  mile75IMG = loadImage("75Miles.jpg");
  mile100IMG = loadImage("100Miles.jpg");
  mile200IMG = loadImage("200Miles.jpg");
  accidentIMG = loadImage("Accident.jpg");
  drivingAceIMG = loadImage("DrivingAce.jpg");
  extraTankIMG = loadImage("ExtraTank.jpg");
  flatTireIMG = loadImage("FlatTire.jpg");
  gasolineIMG = loadImage("Gasoline.jpg");
  outOfGasIMG = loadImage("OutOfGas.jpg");
  punctureProofIMG = loadImage("PunctureProof.jpg");
  stopIMG = loadImage("Stop.jpg");
  goIMG = loadImage("Go.jpg");
  repairsIMG = loadImage("Repairs.jpg");
  spareTireIMG = loadImage("SpareTire.jpg");
  rightOfWayIMG = loadImage("RightOfWay.jpg");
  goStatusIMG = loadImage("statusGo.jpg");
  stopStatusIMG = loadImage("statusStop.jpg");
  fuelStatusIMG = loadImage("statusFuel.jpg");
  flatStatusIMG = loadImage("statusFlat.jpg");
  crashStatusIMG = loadImage("statusCrash.jpg");
  discardIMG = loadImage("discard.png");
  
  mile25 = new Card(mile25IMG, 25, "Go", true, "Go");
  mile50 = new Card(mile50IMG, 50, "Go", true, "Go");
  mile75 = new Card(mile75IMG, 75, "Go", true, "Go");
  mile100 = new Card(mile100IMG, 100, "Go", true, "Go");
  mile200 = new Card(mile200IMG, 200, "Go", true, "Go");
  accident = new Card(accidentIMG, 0, "--", false, "Crash");
  flatTire = new Card(flatTireIMG, 0, "--", false, "Flat");
  outOfGas = new Card(outOfGasIMG, 0, "--", false, "Fuel");
  stop = new Card(stopIMG, 0, "--", false, "Stop");
  repairs = new Card(repairsIMG, 0, "Crash", true, "Stop");
  spareTire = new Card(spareTireIMG, 0, "Flat", true, "Stop");
  gasoline = new Card(gasolineIMG, 0, "Fuel", true, "Stop");
  go = new Card(goIMG, 0, "Stop", true, "Go");
  
  human = new Player(true);
  computer = new Player(false);
  
  for (int i = 1; i <= 14; i++) {
    deck.add(go);
    if (i <= 3) {
      deck.add(accident);
      deck.add(outOfGas);
      deck.add(flatTire);
    }
    if (i <= 4) {
      deck.add(mile200);
    }
    if (i <= 5) {
      deck.add(stop);
    }
    if (i <= 6) {
      deck.add(repairs);
      deck.add(spareTire);
      deck.add(gasoline);
    }
    if (i <= 10) {
      deck.add(mile25);
      deck.add(mile50);
      deck.add(mile75);
    }
    if (i <= 12) {
      deck.add(mile100);
    }
  }
  
  human.drawCard(deck, discardPile);
  computer.drawCard(deck, discardPile);
  human.drawCard(deck, discardPile);
  computer.drawCard(deck, discardPile);
  human.drawCard(deck, discardPile);
  computer.drawCard(deck, discardPile);
  human.drawCard(deck, discardPile);
  computer.drawCard(deck, discardPile);
  human.drawCard(deck, discardPile);
  computer.drawCard(deck, discardPile);
  human.drawCard(deck, discardPile);
  computer.drawCard(deck, discardPile);
}
 
void draw() {
  if (winner == "Human") {
    image(win, 0, 0);
  } else if (winner == "Computer") {
    image(lose, 0, 0);
  } else {
    image(bg, 0, 0);
    image(human.getHand().get(0).imageName, 13, 330);
    image(human.getHand().get(1).imageName, 118, 330);
    image(human.getHand().get(2).imageName, 223, 330);
    image(human.getHand().get(3).imageName, 328, 330);
    image(human.getHand().get(4).imageName, 433, 330);
    image(human.getHand().get(5).imageName, 538, 330);
    image(discardIMG, 13, 275);
    image(discardIMG, 118, 275);
    image(discardIMG, 223, 275);
    image(discardIMG, 328, 275);
    image(discardIMG, 433, 275);
    image(discardIMG, 538, 275);
    if (human.status == "Go") {
      image(goStatusIMG, 9, 196);
    } else if (human.status == "Crash") {
      image(crashStatusIMG, 9, 196);
    } else if (human.status == "Fuel") {
      image(fuelStatusIMG, 9, 196);
    } else if (human.status == "Flat") {
      image(flatStatusIMG, 9, 196);
    } else {
      image(stopStatusIMG, 9, 196);
    }
    if (computer.status == "Go") {
      image(goStatusIMG, 595, 196);
    } else if (computer.status == "Crash") {
      image(crashStatusIMG, 595, 196);
    } else if (computer.status == "Fuel") {
      image(fuelStatusIMG, 595, 196);
    } else if (computer.status == "Flat") {
      image(flatStatusIMG, 595, 196);
    } else {
      image(stopStatusIMG, 595, 196);
    }
    ellipseMode(CENTER);
    noStroke();
    fill(255, 0, 0);
    ellipse(((human.getMileage() / 1000.0) * 640), 60, 50, 50);
    ellipseMode(CENTER);
    noStroke();
    fill(191);
    ellipse(((computer.getMileage() / 1000.0) * 640), 140, 50, 50);
  }
}

boolean checkMouseArea(int coordX, int coordY, int width, int height) {
  if (mouseX > coordX && mouseX < (coordX + width) && mouseY > coordY && mouseY < (coordY + height)) {
    return true;
  } else {
    return false;
  }
}

void mouseClicked() {
  Random randomGenerator;
  String didItWork;
  boolean playersTurn = true;
  if (checkMouseArea(13, 275, 50, 50)) {
    playersTurn = false;
    human.disCard(0, discardPile);
    human.drawCard(deck, discardPile);
  }
  if (checkMouseArea(118, 275, 50, 50)) {
    playersTurn = false;
    human.disCard(1, discardPile);
    human.drawCard(deck, discardPile);
  }
  if (checkMouseArea(223, 275, 50, 50)) {
    playersTurn = false;
    human.disCard(2, discardPile);
    human.drawCard(deck, discardPile);
  }
  if (checkMouseArea(328, 275, 50, 50)) {
    playersTurn = false;
    human.disCard(3, discardPile);
    human.drawCard(deck, discardPile);
  }
  if (checkMouseArea(433, 275, 50, 50)) {
    playersTurn = false;
    human.disCard(4, discardPile);
    human.drawCard(deck, discardPile);
  }
  if (checkMouseArea(538, 275, 50, 50)) {
    playersTurn = false;
    human.disCard(5, discardPile);
    human.drawCard(deck, discardPile);
  }
  if (checkMouseArea(13, 330, 90, 148)) {
    didItWork = human.getHand().get(0).useCard(human, computer);
    if (didItWork != "Success") {
      textSize(16);
      text(didItWork, 0, 0);
    } else {
      playersTurn = false;
      human.disCard(0, discardPile);
 
      human.drawCard(deck, discardPile);
    }
  } else if (checkMouseArea(118, 330, 90, 148)) {
    didItWork = human.getHand().get(1).useCard(human, computer);
    if (didItWork != "Success") {
      textSize(16);
      text(didItWork, 0, 0);
    } else {
      playersTurn = false;
      human.disCard(1, discardPile);
 
      human.drawCard(deck, discardPile);
    }
  } else if (checkMouseArea(223, 330, 90, 148)) {
    didItWork = human.getHand().get(2).useCard(human, computer);
    if (didItWork != "Success") {
      textSize(16);
      text(didItWork, 0, 0);
    } else {
      playersTurn = false;
      human.disCard(2, discardPile);
 
      human.drawCard(deck, discardPile);
    }
  } else if (checkMouseArea(328, 330, 90, 148)) {
    didItWork = human.getHand().get(3).useCard(human, computer);
    if (didItWork != "Success") {
      textSize(16);
      text(didItWork, 0, 0);
    } else {
      playersTurn = false;
      human.disCard(3, discardPile);
 
      human.drawCard(deck, discardPile);
    }
  } else if (checkMouseArea(433, 330, 90, 148)) {
    didItWork = human.getHand().get(4).useCard(human, computer);
    if (didItWork != "Success") {
      textSize(16);
      text(didItWork, 0, 0);
    } else {
      playersTurn = false;
      human.disCard(4, discardPile);
      human.drawCard(deck, discardPile);
    }
  } else if (checkMouseArea(538, 330, 90, 148)) {
    didItWork = human.getHand().get(5).useCard(human, computer);
    if (didItWork != "Success") {
      textSize(16);
      text(didItWork, 0, 0);
    } else {
      playersTurn = false;
      human.disCard(5, discardPile);
      human.drawCard(deck, discardPile);
    }
  }
  if (playersTurn == false) {
    int failures = 0;
    randomGenerator = new Random();
    boolean comThinking = true;
    while (comThinking) {
      int index = randomGenerator.nextInt(computer.hand.size() - 1);
      didItWork = human.getHand().get(index).useCard(computer, human);
      if (didItWork == "Success") {
        comThinking = false;
        computer.disCard(index, discardPile);
   
        computer.drawCard(deck, discardPile);
      } else {
        failures += 1;
        if (failures > 17) {
        comThinking = false;
        computer.disCard(index, discardPile);
        computer.drawCard(deck, discardPile);
        }
      }
    }
  }
  if (human.getMileage() >= 1000) {
    winner = "Human";
  } else if (computer.getMileage() >= 1000) {
    winner = "Computer";
  }
  draw();
}
 
class Player {
  private Random randomGenerator;
  private ArrayList<Card> hand = new ArrayList<Card>();
  private int mileNum = 0;
  private String status = "Stop";
  private boolean playable = false;
  
  public Player(boolean humanPlayer) {
    this.playable = humanPlayer;
  }
  
  public boolean drive(int driveThisMuch) {
    if (this.mileNum + driveThisMuch > 1000) {
      return false;
    } else {
      this.mileNum += driveThisMuch;
      return true;
    }
  }
  
  public int getMileage() {
    return this.mileNum;
  }
  
  public String getStatus() {
    return status;
  }
  
  public void setStatus(String setTo) {
    this.status = setTo;
  }
  
  public void drawCard(ArrayList<Card> deck, ArrayList<Card> discardPile) {
    randomGenerator = new Random();
    if (deck.size() <= 0) {
      int discardSize = discardPile.size();
      for (int i = 0; i > discardSize; i++) {
        deck.add(discardPile.get(i));
        discardPile.remove(discardPile.get(i));
      }
    }
    int index;
    if (deck.size() == 1) {
      index = 0;
    } else {
      try {
        index = randomGenerator.nextInt(deck.size() - 1);
      } catch (Exception e) {
        for (int i = 1; i <= 14; i++) {
          deck.add(go);
          if (i <= 3) {
            deck.add(accident);
            deck.add(outOfGas);
            deck.add(flatTire);
          }
          if (i <= 4) {
            deck.add(mile200);
          }
          if (i <= 5) {
            deck.add(stop);
          }
          if (i <= 6) {
            deck.add(repairs);
            deck.add(spareTire);
            deck.add(gasoline);
          }
          if (i <= 10) {
            deck.add(mile25);
            deck.add(mile50);
            deck.add(mile75);
          }
          if (i <= 12) {
            deck.add(mile100);
          }
        }
        index = randomGenerator.nextInt(deck.size() - 1);
      }
    }
    this.hand.add(deck.get(index));
    deck.remove(index);
  }
  
  public ArrayList<Card> getHand() {
    return this.hand;
  }
  
  public void disCard(int index, ArrayList<Card> discardPile) {
    discardPile.add(this.hand.get(index));
    this.hand.remove(index);
  }
}

class Card {
  private int mileNum = 0;
  private String statusForUse = "";
  private String causeStatus = "";
  private boolean playOnSelf = false;
  PImage imageName;
  
  public Card(PImage imageName, int mileNum, String statusForUse, boolean playOnSelf, String causeStatus) {
    this.mileNum = mileNum;
    this.statusForUse = statusForUse;
    this.imageName = imageName;
    this.playOnSelf = playOnSelf;
    this.causeStatus = causeStatus;
  }
  
  public boolean canPlayOnSelf() {
    return this.playOnSelf;
  }
  
  public String useCard(Player target, Player other) {
    if (this.statusForUse.equals(target.getStatus()) || this.statusForUse.equals("--")) {
      boolean mileSuccess = target.drive(this.mileNum);
      if (mileSuccess == false) {
        return "You may not drive this far right now!";
      }
      if (this.playOnSelf == true) {
        target.setStatus(this.causeStatus);
      }
      if (this.playOnSelf == false) {
        other.setStatus(this.causeStatus);
      }
      return "Success";
    } else {
      return "You can't play this card right now!";
    }
  }
}
