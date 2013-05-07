class Chart {

  void run() {
    // the image
    image(hsbChart, 0, 0);
    //the button
    rectMode(CORNER);
    for(int i = 0; i<=100 ; i++){
      float r = map(i,0,100,0,width);
      float c = map(i,0,100,width,height);
      colorMode(HSB,100);
      fill(i,100,100);
      noStroke();
      rect(0,c,width,r);
    }
    textAlign(CENTER,CENTER);
    textSize(100);
    colorMode(RGB,255);
    fill(white);
    text("Tags",width*0.5,width+0.5*(abs(width-height)));
  }

  int getColor() {
    colorMode(HSB,360);
    color co = get(mouseX, mouseY);
    float hue = hue(co);
    String s = "";
    int c = 0;

    if (brightness(co) < 100) {
      s = "black";
      c = 15;
    } 
    else if (brightness(co) > 100 && brightness(co) < 175) {
      s = "grey";
      c = 14;
    }
    else {
      if (saturation(co)<50) {
        s = "white";
        c = 13;
      } 
      else {
        if (hue > 15 && hue <= 45) {
          s = "orange";
          c = 2;
        } 
        else if ( hue > 45 && hue <=75) {
          s = "yellow";
          c = 3;
        }
        else if ( hue > 75 && hue <=105) {
          s = "spring green";
          c = 4;
        }
        else if ( hue > 105 && hue <=135) {
          s = "green";
          c = 5;
        }
        else if ( hue > 135 && hue <=165) {
          s = "turquoise";
          c = 6;
        }
        else if ( hue > 165 && hue <=195) {
          s = "cyan";
          c = 7;
        }
        else if ( hue > 195 && hue <=225) {
          s = "ocean";
          c = 8;
        }
        else if ( hue > 225 && hue <=255) {
          s = "blue";
          c = 9;
        }
        else if ( hue > 255 && hue <=285) {
          s = "violet";
          c = 10;
        }
        else if ( hue > 285 && hue <=315) {
          s = "magenta";
          c = 11;
        }
        else if ( hue > 315 && hue <=345) {
          s = "respberry";
          c = 12;
        }
        else {
          s = "red";
          c = 1;
        }
      }
    }
    println(s+" hue = "+hue+" saturation="+saturation(co)+" bright="+brightness(co));
    return c;
  }

}

