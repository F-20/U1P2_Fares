import processing.sound.*;
SoundFile file;
String fireflies = "Fireflies.mp3";
String fliesfire; 
PImage forest;

// These are all my data types

float x = 400;
float y=400;
// Here are my arrays
float Xs [] = new float [100];
float Ys [] = new float [100];
float Xspeed [] = new float [100];
float Yspeed [] = new float [100];

void setup() 
{
  // Here is my song, Fireflies is the name 
  fliesfire = sketchPath("Fireflies.mp3");
  file = new SoundFile(this, fliesfire);
  file.play();
  // Here is the size of the whole screen
  size(800, 800);
  noStroke();
  for (int i=0; i < 100; i++)
  {
    // Bellow I tell the yellow balls to go any RANDOM direction on any of the 2 axis (Y and X).
    // I also tell the balls to go at any speed between -4 and 5 
    Xs[i] = random(0, width);
    Ys[i] = random(0, height);
    Yspeed[i] = random(-4, 5);
    Xspeed[i] = random(-4, 5);
  }
  // This is my image in the background
  forest = loadImage ("Forest.jpg");
} 


void draw()
{
  // Here I resize the background image, the forest
  forest.resize(800, 800);
  image(forest, 0, 0);

  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  fill(251, 255, 28);
  ellipse(x, y, 10, 10);
  if (y > height) 
  {
    y=0;
    x = random(width);
  }
  y+=3;
  // Here is a for loop wich has circles in it and they come out from both X and Y axis 
  for (int i=0; i < 100; i++)
  {
    // Here are more arrays and the size of the balls are there (10)
    ellipse(Xs[i], Ys[i], 10, 10);
    ellipse(Ys[i], Xs[i], 10, 10);
    Ys[i] += Yspeed [i];
    Xs[i] += Xspeed [i];
    if (Xs[i] < 0)
    {
      // Here is the X axis for the width
      Xs[i] = width;
    }

    if (Ys[i] < 0)
    {
    //Here is the Y axis for the height and that the balls come in from the Y axis again after they've gone off the screen
      Ys[i] = height;
    }
    // Here is the Y axis for the height and that the balls come in from the Y axis again after they've gone off the screen
    if (Ys[i] > height)
    {
      Ys[i] = 0;
    }
    // Here again is the array for the X axis for the width and that the small yellow balls come in from the X axis again
    if (Xs[i]>width)
    {
      Xs[i]=0;
    }
  }
}
