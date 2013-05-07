class TWindow {
  void run() {
    colorMode(RGB,255);
    textSize(32);
     //fetch storage
     //display tags
      fill(0,0,0);
     rect(0,0,750,750);
     fill(170);
     text("HELLlLLLOOO",100,200);
     for(Tag a : stored){
       text(a.title,300,300);
     }
     fill(123,123,123);
     rect(0,750,750,950);
     fill(0,0,0);
     text("Read Color",100,800);
     
    
  }
}

