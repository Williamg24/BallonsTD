public class Upgrades{
  ArrayList<Button> upgradePaths; 
  
  public Upgrades(Button b){
    upgradePaths = new ArrayList<Button>();
    switch(b.name){
      default:
      upgradePaths.add(new Button("Range", MAP_WIDTH, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 30));
      upgradePaths.add(new Button("ATK", MAP_WIDTH + (height - MAP_WIDTH)/2, height - 80, (width - MAP_WIDTH)/2, height / 6, 0, 50));
    }
  }
  
  void display(){
    rect(MAP_WIDTH,height, width, height + 100);
    for (Button b : upgradePaths){
      b.displayUpgrades();
    }
    
  }
}
