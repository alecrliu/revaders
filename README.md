# Revaders
A space invaders remake

## Instructions:
Select a difficulty on the main menu. WASD to move, mouse to aim, space to fire. Try to kill enemy ships before they reach the bottom of the screen or you will lose score. The game gets progressively harder until you get hit with an enemy bullet and die. You can save your score if you wish afterward. Good luck!

## Q and A:
1. Summaries of the functionality and implementation?
- A player ship can be moved with the WASD keys and its turret can be controlled with the mouse, clicking to fire bullets.
- Enemy ships spawn at random horizontal positions at the top of the screen and move downwards erratically.
- They will shoot downwards.
- A main menu shows the difficulty buttons and the name of the game.
- A display shows your score at the top left.
- A game over screen that allows you to save your score or just exit.

2. What role do your classes play and what do they do?
- The Ship class provides the base components of a ship.
- The subclasses of Ship, EnemyShip, and PlayerShip, extend this functionality. 
- PlayerShip allows the player to control the ship and turret to fire at enemies.
- EnemyShip allows for the creation of enemy ships that move randomly down and fire downward.
- Button is a class that creates interactive buttons.
- Bullet is a class that creates and moves bullets shot from ships.

3. Any unexpected challenges?
Lives, computer allied ships, multiple players, progressive difficulty, bosses, tracking missiles, lasers, enemy ship types, obstacles, dynamic background, upgrades, checkpoints, repairs, shields/hitpoints, weather, environmental effects, pause menu were on the list of possible additions.

I added a total of 1 extra thing. And the other parts of it are janky. I still need the enemy ships to move without shaking (lerp), improve the ship controls, and make a ship's bullets stay after the ship disappears.
Plus I realized there was a lot more to do: make the background better, fix the GUI, add more buttons, save more info, and display more ship statistics. All this would take time which I didn't have enough of because I decided to do this all in 10 hours (incredible planning ability, ik). See below for further ranting (I love complaining).
There were also a slew of issues faced:
- bullets and ArrayList errors
- PROCESSING, for some reason, decides to tell me there's an EOF error in file "Ship", so I look for the missing brace in "Ship" but everything is good, so I go ask chatGPT what is wrong, and it says its actually all correct so I look for an hour to see what is wrong and stumble across a stack overflow thing saying processing likes to say that even when it was in a whole other file that was missing a bracket, so I had to scour each file to find a missing brace (friendship with java ended, now python is my best friend)
- classes and refactoring code because they didn't fit well in the classes, or inheritance wouldn't work, or it wouldn't be able to access an object's info
- collisions made it so that a bullet 60 pixels away still blew up your ship
- enemies were bullet resistant for some reason
- the buttons weren't changing colors so I gave up

4. Contributions?
Alec worked on 89% of the project. The 11% credit goes to the blueberry lemonade that fueled Alec's coding.
