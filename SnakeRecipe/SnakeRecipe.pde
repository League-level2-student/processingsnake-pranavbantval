
// 1. Follow the recipe instructions inside the Segment class.

// The Segment class will be used to represent each part of the moving snake.

class Segment {
int x;
int y;
  //2. Create x and y member variables to hold the location of each segment.

  // 3. Add a constructor with parameters to initialize each variable.

Segment(int x, int y){
  setX(x);
 setY(y);
}

  // 4. Add getter and setter methods for both the x and y member variables.
 int getX(){
    return x;
  }
   int getY(){
    return y;
  }
  void setX(int x){
    this.x=x;
  }
    void setY(int y){
     this.y=y;
  }
}


// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
Segment s;


// 6. Create and initialize a String to hold the direction of your snake e.g. "up"
String wae="";


// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
// give it a value of 1 to start.
int noms = 1;


// 8. Create and initialize foodX and foodY variables to hold the location of the food.

// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)

int foodX = ((int)random(50)*10);

int foodY = ((int)random(50)*10);


void setup() {

  // 9. Set the size of your sketch (500 by 500).

  size(500, 500);


  // 10. initialize your head to a new segment.
s = new Segment(250,250);

  // 11. Use the frameRate(int rate) method to set the rate to 20.
 frameRate(20);
}


void draw() {

  background(0);


  //12. Call the manageTail, drawFood, drawSnake, move, and collision methods.
  manageTail();
  drawFood();
  drawSnake();
  move();
  collision();
}


// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).

void drawFood() {
  rect(foodX,foodY,10,10);
}


//14. Draw the snake head (use a 10 by 10 rectangle)

void drawSnake() {
rect(s.x,s.y,10,10);

  //test your code
}


// 15. Complete the move method below.

void move() {

  // 16. Using a switch statement, make your snake head move by 10 pixels in the correct direction.
  //This is an incomplete switch statement:
  
  switch(wae) {
  case "up":
    // move head up here 
    s.y=s.y-10;
    break;
  case "down":
    // move head down here 
    s.y=s.y+10;
    break;
  case "left":
   // figure it out 
   s.x=s.x-10;
    break;
  case "right":
    // mystery code goes here 
    s.x=s.x+10;
    break;
  }
  


  // 17. Call the checkBoundaries method to make sure the snake head doesn't go off the screen.
  checkBoundaries();
}


// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.

void keyPressed() {
if(key == CODED){
            if(keyCode == UP&&!wae.equals("down"))
            {
                 
                  wae="up";
            }
            else if(keyCode == DOWN&&!wae.equals("up"))
            {
             
                  wae="down";
            }
            else if(keyCode == RIGHT&&!wae.equals("left"))
            {
               
                 wae="right";
            }
            else if(keyCode == LEFT&&!wae.equals("right"))
            {
             wae="left";
                  
            }
      }
}



// 19. check if your head is out of bounds (teleport your snake head to the other side).

void checkBoundaries() {
  if(s.y<=0){
   
    s.y=500;
    
   
  }
  else if(s.x>=500){
     s.x=0;
  }
   else if(s.y>=500){
     s.y=0;
  } else if(s.x<=0){
     s.x=500;
  }



//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)


}
// 21. Complete the missing parts of the collision method below.

void collision() {

  // If the segment is colliding with a piece of food...
     // Increase the amount of food eaten and set foodX and foodY to new random locations.
     if(s.x==foodX&&s.y==foodY){
        foodX = ((int)random(50)*10);

foodY = ((int)random(50)*10);
     }
     noms++;
}



/**
 
 ** Part 2: making the tail (the rest of the snake)
 
 **/

//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)
ArrayList <Segment> tails = new ArrayList<Segment>();

// 2. Complete the missing parts of the manageTail method below and call it in the draw method.

void manageTail() {

  //Call the drawTail and checkTailCollision methods.
drawTail();
checkTailCollision();
  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
tails.add(new Segment(s.x,s.y));
  // To keep your tail the right length:
  // while the tail size is greater than the number of food pieces eaten, remove the first Segment in your tail.
while(tails.size()>noms){
  tails.remove(0);
}
}

void drawTail() {
  int sn= 10;
    // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
    for(int i = 0; i<tails.size(); i++){
      /*if(wae.equals("up")){
        
      rect(s.x,s.y+sn,10,10);
      sn=sn+10;
      }
      else if(wae.equals("down")){
        
        rect(s.x,s.y-sn,10,10);
      sn=sn+10; 
      }
      else if(wae.equals("left")){
        
        rect(s.x+sn,s.y,10,10);
      sn=sn+10; 
      }
      else if(wae.equals("right")){
       
        rect(s.x-sn,s.y,10,10);
      sn=sn+10; 
      }*/
      rect(tails.get(i).x,tails.get(i).y,10,10);
    }
}


// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {

  // If your head has the same location as one of your segments...
if(s.x==s.x+10&&s.y==s.y){
  noms=1;
}
  // reset your food variable

  //Call this method at the beginning of your manageTail method.
}