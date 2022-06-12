# BallonsTD
Group Name: Helium Defenders

Group Members: Maya Mori and William Guo

# Brief Project description:
A recreation of bloons tower defense with enemies and automatic towers. There will be different maps and a path where the enemies will traverse through during the game. The objective will be to prevent any enemy from passing the end of the path with the towers. On the map, it'll be up to the players to place the towers as they see fit as long as it’s not on the path. There will be currency to buy the units and hp points that decrease depending on the type of enemy that passes through to the end of the path. The basic features for each tower will be damage points and range while the enemies will have health points and speed. Other add-ons include but are not limited to upgrades for the towers in terms of damage and range, different types of units that have special abilities, power ups, a pause button etc.  

***Link to Documentation:***
https://docs.google.com/document/d/1Cq-gncs0aDlxvpy25vnXTOpVAJ0Y8o2pYRYcmNrsz4A/edit?usp=sharing

# Compile and Run Instructions:
To compile, open processing and run the program.
- #### Run Instructions:
  Similar to the real bloon tower defense, you can select the map you wish to play on and place towers anywhere on the map. The bloon will start appearing on the path once you click the start button. To pause the game, simply click start again. To place towers on map, click the tower icons in the sidebar (colored in orange) to select the tower. The selected button should turn a greyish color from black. Click anywhere on the map to place tower (with exceptions of the bloon path and special conditions). 

  Each tower has specific range so to see the range of each tower, hover mouse over the tower and a circle will appear indicating the tower's range of detection. If you didn't like your tower placement, hover mouse over the tower and hit delete button on the keyboard to remove tower from map. When tower button is selected, the upgrades menu will pop up with different upgrades for that tower type. Simply click the button to upgrade the atttributes for all towers of same type on the map. Towers can be deselected with another click, reverting the color of button back to black. 
  
  Other buttons like the skip button allowes players to skip the current level. The menu button (located on the top right, indicated by 3 white lines) brings players back to the map selection screen allowing players to change maps. Game ends through either popping all bloons or lossing all health points.  
  
- #### Tower Info with placement conditions:
    - Dart Monkey (cost $100): Can be placed anywhere on the map that not a body of water or bloon path. Hits the first target in range dealing one damage to bloons. Has attack delay of 30 frames.
    - Ninja Monkey (cost $350): Can be placed anywhere on the map that not a body of water or bloon path. Hits the first target in range dealing one damage to bloons. Has attack delay of 10 frames.
    - Sniper Monkey (cost $275): Can be placed anywhere on the map that not a body of water or bloon path. Hits the first target in range (range of whole map) dealing two damage to bloon. Has attack delay of 25 frames.
    - Monkey Sub: (cost $225): Can only be placed in bodies of water. Hits the frist target in range dealing one damage to bloon. Has attack delay of 15 frames.  

## Development Log

- ### 5/20
  - Maya Mori: I finished the Level class and worked on the Bloon class. Bloons move along a path and are destroyed once they reach the end.
- ### 5/21
  - William Guo: Started the Tower class and tested the range method for tower to detect bloons. Dispaly the range for towers and place with click.
- ### 5/22
  - William Guo: Added methods in Level to get Bloon and Level size(). Completed Tower class and tested attack to pop each bloon on path in range.
- ### 5/23
  - Maya Mori: Towers attack bloons in range after some delay. Basic sidebar created.
  - William Guo: Updated display so range only shows when pressed. Started Button class and reworking the highlights and selected text.
- ### 5/24
  - William Guo: Minor changes to Button and Level display. Experimented with 2 buttons to try to interchange between the two when selecting.
  - Maya Mori: Minor fixes to Tower such as restrictions to its placement.
- ### 5/25
  - Maya Mori: Start button created and towers show range when user hovers on it.
  - William Guo: Complete selecting button method in sidebar. Created delete tower using backspace and refunds money, number of towers
    that can be placed limited based on current money.
- ### 5/26
  - Maya Mori: Created Level1 class which uses an image for the map and it has an separate path function.
  - William Guo: Started inserting images for different bloons based on it's type, can be displayed on map, working of switching between images.
- ### 5/27
  - Maya Mori: Worked on improving Bloon constructor, its animation and difficulty of Level 1.
- ### 5/29
  - William Guo: Worked on displaying images for towers on map as well as buttons. Highlights which button is selected and changes text color to indicate whether           there's enough money to buy tower.
  - Maya Mori: Start button can pause the game and bloons are stored in order they appear in on map.
- ### 5/30
  - William Guo: Minor fixes for buttons and added more images for game display. Researching on image rotations and have towers face bloons when attacking.
- ### 5/31
  - William Guo: Started on tower upgrades by creating new class called Upgrades and having menu pop up only when tower icon selected.
  - Maya Mori: Made some minor fixes including changing parameters to a function, updating player's health and a placeholder function.
- ### 6/1
  - Maya Mori: Wrote a function to detect if a point is on  the path for Level1.
- ### 6/2
  - Maya Mori: Started displaying and the path for Level 2 and updating the onPath function to work on straight and curved paths.
  - William Guo: Minor fixes for upgrade and animation. Completed select upgrade and decrease money based on the upgrade path selected.
- ### 6/3
  - Maya Mori: Made the array of points look better and started working on storing which tower the user can upgrade.
- ### 6/4
  - Maya Mori: User can select towers to upgrade and update their range if necessary.
- ### 6/5
  - William Guo: Created both a start screen and end screen. So far, everything resets except tower stats when user plays again.
- ### 6/6
  - Maya Mori: Basic tower upgrades done and menu button created returns player to original start screen.
  - William Guo: Completed Start and end screen, minor adjustments to text display and bloon speed.
- ### 6/7
  - Maya Mori: Fixed some small bugs and added new features to upgrades.
  - William Guo: Started on tower rotation to face first bloon in tower range.
- ### 6/8
  - Maya Mori: Created a button to skip rounds and Level 3 map. Also, replaced Level with Level1 and made it easier to add new rounds.
- ### 6/9
  - William Guo: Minor fixes to bloon speed and game display. Competed tower rotation and added 2 new towers (sniper and submarine).
- ### 6/10
  - Maya Mori: Added more rounds using green bloons and tower cannot be placed in water. Also, fixed some small bugs.
  - William Guo: Win Screen created and worked on run and compile instructions.
- ### 6/11
  - Maya Mori: Improved visuals (changed font and colors) and fixed some bugs. Added a game over button that makes the player immediately lose.
- ### 6/12
  - William Guo: Updated win screen and created pop animation when bloon popped. Minor fixes to tower range and earn money after each round. 
