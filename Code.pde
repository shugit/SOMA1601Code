import ddf.minim.*;

/*******************
 * Author @ Shuwen Zhou (Sephy)
 * the loaded image could only be equal or smaller to 750*750 for correct display
 *
 ********************/



/*
* global variables
 */
int width = 750;
int height = 950;
PImage hsbChart;
ArrayList<Tag> tags;
AudioPlayer player;

/*
* useful global variables
 */
Minim minim = new Minim(this);
boolean inTag = false;
Chart chartWindow = new Chart();
TWindow tagWindow = new TWindow();
ArrayList<Tag> stored = new ArrayList<Tag>();
Tag currentSong = null;
PFont font;
PFont buttonFont;

/*
* useful colors
 */
color lightOrange = color(255, 147, 64);
color darkOrange = color(255, 111, 0);
color lightBlue = color(107, 143, 212);
color lightGreen = color(93, 206, 198);
color white = color(255, 255, 255);
color black = color(0, 0, 0);

/*
* only run at first
 */
void setup() {
  size(width, height);
  hsbChart = loadImage("wheel.jpg");
  font = loadFont("Tahoma-Bold-50.vlw");
  buttonFont = loadFont("Shruti-Bold-100.vlw");
  setupTags();

}

/*
* run every frame
 */
void draw() {
  if (!inTag) { //not in tags window
    chartWindow.run();
    fill(lightOrange);
      rectMode(CENTER);
      rect(width*0.5, height*0.1+25, width*0.9, 45,10);
      textFont(font,25);
      fill(white);
    if (currentSong != null) { //display song's name
      
      text(currentSong.title, width*0.5, height*0.1+15);
      textFont(font,14);
      text("by "+currentSong.artist, width*0.55, height*0.1+35);
    } else {
      text("click one this image to listen to corresponding audio", width*0.5, height*0.1+25);
    }
  } 

  else { //in tags window
    tagWindow.run();
  }
}


/**
 * called by setup()
 **/
void setupTags() {
  tags = new ArrayList<Tag>(); 
  for (int i = 1; i<=15 ; i++) {
    tags.add(new Tag(i+".mp3"));
  }
}

/*
* called when mouse released
 * it self will determine what to show based on inTag windows or not
 */
void mouseReleased() { 
  if (!inTag) { 
    if (mouseY <= width) {
      int colorNum = chartWindow.getColor();
      playSound(colorNum);
    } 
    else {
      inTag = true;
    }
  } 
  else { //inTag window
    if (mouseY >= width) {
      inTag = false;
    }
    if( mouseX > width*0.7 && mouseY > width*0.05 && mouseY < width*0.15){
      stored.clear();
    }
  }
}


/*
* called by mouseReleased()
 */
boolean isPlaying = false;
void playSound(int c) {
  c = c-1;
  if (currentSong != null) {
    player.pause();
    currentSong = null;
  } 
  else {
    player = minim.loadFile(tags.get(c).filename);
    println(tags.get(c).title);
    player.play();
    //isPlaying = true;
    stored.add(tags.get(c));
    currentSong = tags.get(c);
  }
}

