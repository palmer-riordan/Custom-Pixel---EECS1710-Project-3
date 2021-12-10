//Initializing values
PImage gogh;
boolean start = true;
PImage wave;
color c;
void setup() {
   size(800,600);
   gogh = loadImage("gogh.jpg");
   gogh.resize(800,600);
   wave = loadImage("wave.jpg");
   wave.resize(800,600);
   background(0);
   ellipseMode(CENTER);
}
void draw() {
  if(start == true){//Start screen before painting
    background(0);
    textSize(50);
    fill(255);
    text("Click To Begin Painting", width/6,height/2);
    textSize(25);
    
    text("Use Left Click for Van Gogh's Starry Night", width/5,height/4*3);
    text("Use Right Click for Hokusai's 'The Great Wave off Kanagawa'", 50,height/4*3 + 66);
    if(mousePressed) {
      start = false;
      background(0);
    }
  }
  else {
   
    if (mousePressed){//Shows user where paint brush will be
      strokeWeight(1);
     stroke(214,212,212);
     tint(255, 127);
     noFill();
     
     ellipse(mouseX, mouseY, 90, 90);
     
      for (int i = 0; i< 100; i++){
     
        //paints random pixels within the paint brush range
        float x = random(mouseX-45,mouseX+45);
        float y = random(mouseY-45,mouseY+45);
        if (mousePressed && (mouseButton == RIGHT)) {
          c = wave.get(int(x),int(y));//paints wave on right click
        }
        else if (mousePressed && (mouseButton == LEFT)) {
          c = gogh.get(int(x),int(y));//paints gogh on left click
        }
        
        fill(c, 150);//uses the selected painting as fill, alpha value used to blur image slightly 
        noStroke();
        ellipse(x,y,16,16);
    }
  }
  }
}
