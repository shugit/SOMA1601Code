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
Tag currentSong = null;

color lightOrange = color(255,147,64);
color darkOrange = color(255,111,0);
color lightBlue = color(107,143,212);
color lightGreen = color(93,206,198);
color white = color(255,255,255);
color black = color(0,0,0);

void setup() {
  size(width, height);
  colorMode(HSB, 360);
  hsbChart = loadImage("wheel.jpg");
  //frameRate(25);
  setupTags();
  //colorMode(RGB,255);

}

void draw() {
  if (!inTag) { //not in tags window
    chartWindow.run();
    if(currentSong != null){
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

void setupTags() {
  tags = new ArrayList<Tag>(); 
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
      //println("IN TAG");
    }
  } 
  else {
    if (mouseY >= 750) {
      inTag = false;
      //println("NOT IN TAG");
    }
  }
}


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

