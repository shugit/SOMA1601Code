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
  setupTags();
}

/*
* run every frame
 */

void draw() {
  if (!inTag) { //not in tags window
    chartWindow.run();

    if (currentSong != null) {
      fill(lightOrange);
      rectMode(CENTER);
      rect(width*0.5, height*0.1+25, width*0.9, 45);
      textSize(25);
      fill(white);
      text(currentSong.title, width*0.5, height*0.1+15);
      textSize(14);
      text("by "+currentSong.artist, width*0.55, height*0.1+35);
    }
  } 

  else { //in tags window
    //println("running tagwindow");
    tagWindow.run();
  }
}


/**
 * called by setup()
 **/
void setupTags() {
  tags = new ArrayList<Tag>(); 
  for (int i = 1; i<=15;i++) {
    tags.add(new Tag(i+".mp3"));
  }
}

/*
* called when mouse released
 * it self will determine what to show
 */
void mouseReleased() { 
  if (!inTag) { 
    if (mouseY <= width) {
      int colorNum = chartWindow.getColor();
      playSound(colorNum);
    } 
    else {
      inTag = true;
      //println("IN TAG");
    }
  } 
  else {
    if (mouseY >= width) {
      inTag = false;
      //println("NOT IN TAG");
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

