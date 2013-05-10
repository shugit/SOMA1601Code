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
    rect(0, 2, width*0.02, width * 0.96, 300);
    rect(width*0.03, width*0.05, width * 0.96, height * 0.08);
    textSize(70);
    fill(white);  
    text("Stored tags", width*0.3, width * 0.05+20);
    // clear button    
    if ( (mouseX > (width*0.9-60)) && (mouseX < (width*0.9+60)) && 
        (mouseY > (width*0.1-30)) && (mouseY < (width*0.1+30)) ) { //mouse Over clear button
   // if ( (mouseX > (645)) && (mouseX < (900)) && 
     //   (mouseY > (50)) && (mouseY < (100)) ) {
      rectMode(RADIUS);
      colorMode(RGB, 255);
      fill(white);
      rect(width*0.9, width*0.1, 60, 30);
      fill(lightGreen);
      rect(width*0.9, width*0.1, 55, 25);
      fill(white);
      textSize(20);
      text("Clear", width *0.9, width*0.1);
    } 
    else {  
      rectMode(RADIUS);
      colorMode(RGB, 255);  
      fill(lightGreen);
      rect(width*0.9, width*0.1, 60, 30);
      fill(white);
      textSize(20);
      textAlign(CENTER, CENTER);
      text("Clear", width *0.9, width*0.1);
    }


    //tags
    for (int i = 0; i < stored.size(); i++) {
      Tag a = stored.get(i);
      fill(lightOrange);
      rectMode(CENTER);
      rect(width*0.5, height*0.1 + i * 50 +25, width*0.9, 45, 10);
      textFont(font, 25);
      fill(lightBlue);
      text(a.title, width*0.5, height*0.1+i * 50+15);
      textSize(14);
      text("by "+a.artist, width*0.55, height*0.1+i*50+35);
    }


    //button
    rectMode(CORNER);    
    for (int i = 0; i<=100 ; i++) {
      float r = map(i, 0, 100, 0, width);
      float c = map(i, 0, 100, width, height);
      colorMode(HSB, 100);
      fill(i, 100, 100);
      noStroke();
      rect(0, c, 750, r, width/2);
    }
    textAlign(CENTER, CENTER);
    textSize(100);
    colorMode(RGB, 255);
    fill(255);
    text("Read Color", width*0.5, width+0.5*(abs(width-height)));
  }
}

