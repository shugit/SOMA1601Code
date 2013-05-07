int width = 750;
int height = 950;
PImage hsbChart;
Chart ct;
import ddf.minim.*;
Minim minim = new Minim(this);
ArrayList<Tag> tags;
boolean inTag = false;
Chart chartWindow = new Chart();
TWindow tagWindow = new TWindow();
AudioPlayer player;
ArrayList<Tag> stored = new ArrayList<Tag>();

void setup() {
  size(width, height);
  colorMode(HSB, 360);
  //test
  hsbChart = loadImage("wheel.jpg");
  frameRate(25);
  setupTags();
}

void draw() {
  if (!inTag) { //not in tags window
    chartWindow.run();
  } 

  else { //in tags window
    //println("running tagwindow");
    tagWindow.run();
  }
}

void setupTags() {
  tags = new ArrayList<Tag>(); 
  //tags.add(new Tag("1.m4a"));
  //tags.add(new Tag("2.m4a"));
  for (int i = 1; i<=15;i++) {
    tags.add(new Tag(i+".mp3"));
  }
}


void mouseReleased() { 
  if (!inTag) { 
    if (mouseY <= 750) {
      int colorNum = chartWindow.getColor();
      playSound(colorNum);
    } 
    else {
      inTag = true;
      println("IN TAG");
    }
  } 
  else {
    if (mouseY >= 750) {
      inTag = false;
      println("NOT IN TAG");
    }
  }
}


boolean isPlaying = false;

void playSound(int c) {
  if (isPlaying) {
    player.pause();
    isPlaying = false;
  } 
  else {
    player = minim.loadFile(tags.get(c).filename);
    player.play();
    isPlaying = true;
    stored.add(tags.get(c));
  }
}

