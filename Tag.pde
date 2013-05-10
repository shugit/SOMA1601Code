import ddf.minim.*;


/*
* just a fake OOP
 */

class Tag {
  public Tag(String aFilename) {
    println(aFilename);
    AudioPlayer audio = minim.loadFile(aFilename);
    AudioMetaData meta = audio.getMetaData();

    this.title = meta.title();
    this.artist = meta.author();
    this.filename = aFilename;
  }

  String title;
  String artist;
  String filename;
  PImage cover;
}


