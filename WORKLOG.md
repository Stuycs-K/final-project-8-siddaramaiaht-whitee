# Work Log

## Tejas Siddaramaiah

### 2023-05-22

I worked on setting up Stopper superclass, with the necessary methods. I also set up the subclasses of Bell, Bumper, Flipper, and Wall.

### 2023-05-23

I worked on the constructors for the subclasses of Stopper. I merged my changes into the main. We worked on merging our changes in order to prevent errors from occurring in future iterations.

### 2023-05-24

I set up the display methods for all the objects, besides the flipper and the ball. I set up a basic format to display the game, which has walls with an opening for the flippers and randomly placed bells within the walls.

### 2023-05-25

I worked on making a collision method for the stoppers. I worked on the code, though the collisions don't return as intended. I also worked on the bounce method to make the ball bounce properly.

### 2023-05-26

I continued working on making the collision method work properly. I came up with the idea of using distance between ball and stopper to create hitboxes rather than an array. Though, I just worked on implementation for rectangular hitboxes for now.

### 2023-05-27 - 2023-05-29

I worked on the bounce method, and I removed removing the collide method to improve the viability of coding the hitboxes. I made the proper interaction for the ball and the stoppers, wall and bell, such that the ball bounces appropriately. I worked on preventing the ball from leaving the pinball area by calculating where the ball would be if it didn't pass the walls. I also merged the Display branch onto main.

### 2023-05-30

I worked on a better bounce mechanic but realized that different forms of bounce will be needed for other types of objects. I also added a score mechanic that keeps track of the score and displays it during the game.

### 2023-05-31

I added a game over screen, so when the ball leaves the area of the game, the game ends. I also thought about how I can use the PVectors to calculate the bounce.

### 2023-06-01

I worked on the bounce method with the PVectors in order to bounce the ball correctly. I made some progress using trigonometry, but the ball doesn't bounce quite right, yet. I also made the game look cleaner for a better playing experience.

### 2023-06-02 - 2023-06-04

I worked on the math for the bounce methods. I tried implementing the math, but there were some errors with the bouncing that caused the ball to roll instead of bounce.

### 2023-06-05

I worked on establishing the vertices needed for the bounce method. I also made the game over screen correcty restart the game when the player wants to quit the game.

### 2023-06-05

I worked on the bounce method, and I got the ball to bounce more correctly. I also worked on the math for the other stoppers.

## Eli White

### 2023-05-22

I started to work on the Ball class by making its instance variables, the constructor, and the beginning of the applyForce method.

### 2023-05-23

I finished the first version of the Ball, and made Machine the main class instead of Ball. I also added bounciness to Stopper's constructor and the methods that will be used whenever a ball collides with a Stopper object. I started to incorporate hitboxes into the Stopper constructors.

### 2023-05-24

I started working on the Flipper class more in-depth by adding instance variables methods that will be used when the flipper is swung. Came up with idea to use 2d int arrays (sets of coordinates) as hitboxes for Stoppers.

### 2023-05-25

I incorporated gravity into ball's movement, which will not be used yet. I added a swingSpeed and mass to Flipper (still need to add acceleration). I tried to display Flippers based on what angle they are at, but as of now it does not work with the built-in rotate and translate methods with a rect. I added new constructors to Stopper so that the subclasses can be more flexible.

### 2023-05-26

I continued to try to rotate a flipper around its center, but I was only able to rotate it around the origin.

### 2023-05-27 - 2023-05-29

I fixed the transformations so that the Flippers are placed and rotated correctly, and I modified the Flipper constructors so that they use less parameters. I made the swing method properly change the rotation of the Flippers and tested it in draw.

### 2023-05-30

I added a Controller class (as on the website), and modified it so that pressing the space bar swings both Flippers. I made it so that pressing the space bar once for any amount of time results in the Flippers doing a full swing by determining each frame if the Flippers are passed their initial angle.

### 2023-05-31

I made it so that Flippers swing all the way no matter the swingSpeed and changed the swing method so that they came back to resting position after swinging upwards. I then modified Flipper so that (inward) angles below the horizontal are negative and the angles above positive. I also added acceleration to the Flippers to make their swings look more realistic.

### 2023-06-01

I made the up and down arrow keys change the strength of the Flippers' swing, which is displayed by a bar on the side. I then added a hitbox for the Flippers using the top two points of the Flippers to make them be able to hit the Ball, which works sometimes because sometimes they pass through the Ball without hitting it. I also made the Flippers display as triangles.

### 2023-06-02 - 2023-06-04

I removed unused Stopper constructors and made new ones for different types of hitboxes (like those that are slanted or circular) that take the form of 1d/2d float arrays. I also started to add to the bounce method to work with these types of hitboxes.

### 2023-06-05

I started to adapt the Stopper subclasses to the constructors that use new types of hitboxes. I added a slanted/triangle Wall constructor and worked on the "tri" bounce for slanted surfaces. As of now, this part of bounce works for some cases but not for others (I think depending on the sign of the slope of the surface).

### 2023-06-06

I started to use switch over to PVectors from the slopes of lines for the "tri" bounce because it makes it simpler with the built-in methods and eliminates having to convert the slope into a PVector at the end. So far I have used the angleBetween and rotate methods, but it is not working.
