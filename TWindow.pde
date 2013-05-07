class TWindow {
  void run() {
    textSize(28);
    colorMode(RGB, 255);
    //background
    fill(white);
    rectMode(CORNER);
    rect(0, 0, width, width);
    textAlign(CENTER, CENTER);
    fill(darkOrange);
    rect(width*0, 02, width*0.02, width * 0.96, height*0.88);
    rect(width*0.03, width*0.05, width * 0.96, height * 0.08);
    textSize(70);
    fill(white);

    text("Stored tags", width*0.3, width * 0.05+20);
    //fill(255);
    //println("stored size is "+stored.size());
    for (int i = 0; i < stored.size(); i++) {
      //println("i is " + count);
      Tag a = stored.get(i);
      fill(lightOrange);
      rectMode(CENTER);
      rect(width*0.5, height*0.1 + i * 50 +25, width*0.9, 45);
      textSize(25);
      fill(lightBlue);
      text(a.title, width*0.5, height*0.1+i * 50+15);
      textSize(14);
      text("by "+a.artist, width*0.55, height*0.1+i*50+35);
    }
    rectMode(CORNER);
    for (int i = 0; i<=100 ; i++) {
      float r = map(i, 0, 100, 0, width);
      float c = map(i, 0, 100, width, height);
      colorMode(HSB, 100);
      fill(i, 100, 100);
      noStroke();
      rect(0, c, 750, r);
    }
    textAlign(CENTER, CENTER);
    textSize(100);
    colorMode(RGB, 255);
    fill(255);
    text("Read Color", width*0.5, width+0.5*(abs(width-height)));
  }
}

