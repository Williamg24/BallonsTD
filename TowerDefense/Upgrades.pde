public class Upgrades{
  ArrayList<Button> upgradePaths; 
  
  public Upgrades(Button b){
    upgradePaths = new ArrayList<Button>();
    switch(b.name){
      case "Basic":
      upgradePaths.add(new Button("Range", MAP_WIDTH, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 30));
      upgradePaths.add(new Button("ATK", MAP_WIDTH + (width - MAP_WIDTH)/2, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 50));
      case "Advanced":
      upgradePaths.add(new Button("Range", MAP_WIDTH, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 30));
      upgradePaths.add(new Button("ATK", MAP_WIDTH + (height - MAP_WIDTH)/2, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 50));
    }
  }
  
  void display(){
    for (Button b : upgradePaths){
      b.displayUpgrades();
    }
    
  }
}
