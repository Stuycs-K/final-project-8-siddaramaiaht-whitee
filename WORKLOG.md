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

### 2023-05-28

I worked on the bounce method, and I removed removing the collide method to improve the viability of coding the hitboxes. I made the proper interaction for the ball and the stoppers, wall and bell, such that the ball bounces appropriately.

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
