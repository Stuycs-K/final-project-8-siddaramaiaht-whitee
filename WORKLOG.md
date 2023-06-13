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

### 2023-05-29

I worked on preventing the ball from leaving the pinball area by calculating where the ball would be if it didn't pass the walls. I also merged the Display branch onto main.

### 2023-05-30

I worked on a better bounce mechanic but realized that different forms of bounce will be needed for other types of objects. I also added a score mechanic that keeps track of the score and displays it during the game.

### 2023-05-31

I added a game over screen, so when the ball leaves the area of the game, the game ends. I also thought about how I can use the PVectors to calculate the bounce.

### 2023-06-01

I worked on the bounce method with the PVectors in order to bounce the ball correctly. I made some progress using trigonometry, but the ball doesn't bounce quite right, yet. I also made the game look cleaner for a better playing experience.

### 2023-06-02 - 2023-06-04

I worked on the math for the bounce methods. I tried implementing the math, but there were some errors with the bouncing that caused the ball to roll instead of bounce.

### 2023-06-05

I worked on establishing the vertices needed for the bounce method. I also made the game over screen correctly restart the game when the player wants to quit the game.

### 2023-06-06

I worked on the bounce method, and I got the ball to bounce more correctly. I also worked on the math for the other stoppers.

### 2023-06-07

I continued working on the math for the bounce method by trying to find the angle of rotation of the velocity around the normal vectors. I worked on debugging my bounce method, but forgot to commit my work. I found that the ball bounced two times off of the bells.

### 2023-06-09

I worked on finding the proper distance from a point to a line to know when to correctly bounce the ball off the side.

### 2023-06-10

I found the correct formulas to bounce the ball off of the slanted side. I implemented the formulas into my code, and now the ball bounces correctly off the side. I also worked on the bounce for the flippers.

### 2023-06-11

I fixed the code to make the ball bounce off of bells properly. I also added a multiball mode where the balls can bounce off of the stoppers and can bounce off of other balls, using the correct formulas for elastic collisions.

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

### 2023-06-08

I changed how the PVectors work in the Stopper bounce method, but now the Ball vibrates even when I do not use these changes in Stopper.

### 2023-06-09

I started to integrate the Bell bounce method from Tejas's Bounce branch into Stopper and my hitbox branch's use of arrays for hitboxes.

### 2023-06-10

I made my bounce for slanted surfaces work for when the Ball needs to bounce towards the left.

### 2023-6-11

I worked on making sure that the Ball does not phase through objects when it is moving slowly. I also worked on trying to make it so that the Ball is not pushed downwards by the Flippers. I made it so that differently-colored Bells give you different amounts of score and made a high score. Added additional instructional text for when you quit a round. Made multi mode work better by looping through all the Balls in draw to make sure they all bounce and not just one.

Working Features:
- Ball with with position, velocity, and acceleration that has realistic physics.
- Ball that bounces off of obstacles at the correct angle based on the stoppers.
- Bells that add points to a global score if there is a collision with a ball.
- Flippers that can rotate and collide with the ball properly.
- Game screens that allow the player to start a new game or try a different mode once the game is over or is quit.
- Multiball mode where the ball bounces off of stoppers and other balls.
- Randomly generated levels with bells randomly placed in a designated area.

Broken Features/Bugs:
- When the ball is moving really fast, the ball might get stuck inside a stopper.
- When the ball is moving really slow and is in contact with a stopper, the ball may phase through the stopper.

Resources:
- https://en.wikipedia.org/wiki/Elastic_collision
- https://stackoverflow.com/questions/573084/how-to-calculate-bounce-angle
- http://paulbourke.net/geometry/pointlineplane/
