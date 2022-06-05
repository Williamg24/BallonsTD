# BallonsTD
Group Name: Helium Defenders

Group Members: Maya Mori and William Guo

# Brief Project description:
A recreation of bloons tower defense with enemies and automatic towers. There will be a map and a path where the enemies will traverse through during the game. The objective will be to prevent any enemy from passing the end of the path with the towers / units. On the map, it'll be up to the players to place the towers as they see fit as long as it’s not on the path. There will be currency to buy the units and hp points that decrease depending on the type of enemy that passes through to the end of the path. The basic features for each tower/unit will be damage points and range while the enemies will have health points and speed. Other add-ons include but are not limited to upgrades for the towers in terms of damage and range, different types of units that have special abilities, power ups, a pause button etc.  

***Link to Documentation:***
https://docs.google.com/document/d/1Cq-gncs0aDlxvpy25vnXTOpVAJ0Y8o2pYRYcmNrsz4A/edit?usp=sharing

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
  
<!---
05/20
Maya Mori: I finished the Level class and worked on the Bloon class. Bloons move along a path and are destroyed once they reach the end.

5/21
William Guo: Started the Tower class and tested the range method for tower to detect bloons. Dispaly the range for towers and place with click.

5/22
William Guo: Added methods in Level to get Bloon and Level size(). Completed Tower class and tested attack to pop each bloon on path in range.

5/23
Maya Mori: Towers attack bloons in range after some delay. Basic sidebar created.

5/23
William Guo: Updated display so range only shows when pressed. Started Button class and reworking the highlights and selected text.

5/24
William Guo: Minor changes to Button and Level display. Experimented with 2 buttons to try to interchange between the two when selecting.

5/24
Maya Mori: Minor fixes to Tower such as restrictions to its placement.

5/25
Maya Mori: Start button created and towers show range when user hovers on it.

5/25
William Guo: Complete selecting button method in sidebar. Created delete tower using backspace and refunds money, number of towers
that can be placed limited based on current money.

5/26
Maya Mori: Created Level1 class which uses an image for the map and it has an separate path function.

5/26
William Guo: Started inserting images for different bloons based on it's type, can be displayed on map, working of switching between images.

5/29
William Guo: Worked on displaying images for towers on map as well as buttons. Highlights which button is selected and changes text color to indicate whether there's enough money to buy tower.

-->
