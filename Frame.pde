class Frame
{
  String name;
  String title;
  boolean drag = false;
  String left, right, top, bottom;
  FrameImage[] images = new FrameImage[0];
  TableWithColumns table;
  
  Frame(String nm, String l, String r, String t, String b)
  {
    name = nm;
    title = nm;
    left = l;
    right = r;
    top = t;
    bottom = b;
  }
  
  String getName()
  {
    return name;
  }
  
  void setTitle(String t)
  {
    title = t;
  }
  
  String getTitle()
  {
    return title;
  }
  
  void addImage(FrameImage im)
  {
    images = (FrameImage[]) expand(images, images.length + 1);
    images[images.length - 1] = im;
  }
  
  void setDrag(boolean d)
  {
    drag = d;
  }
  
  void addTable(TableWithColumns twc)
  {
    table = twc;
  }
  
  void display()
  {
    //text(name, width / 2, height / 2);
    if (table != null){
      table.display();
    }
    pushStyle();
    textSize(25);
    text(title, width / 2, 40);
    popStyle();
    for (int i = 0; i < images.length; i++){
      images[i].display();
    }
    if (drag){
      pushStyle();
      stroke(155);
      //line(threshold, 0, threshold, height);
      //line(0, threshold, width, threshold);
      //line(width - threshold, 0, width - threshold, height);
      //line(0, height - threshold, width, height - threshold);
      popStyle();
      pushStyle();
      textSize(12);
//      if (!left.equals("none")){
//        text(left, threshold / 2, height / 2);
//      }
//      if (!top.equals("none")){
//        text(top, width / 2, threshold / 2);
//      }
//      if (!right.equals("none")){
//        text(right, width - threshold / 2, height / 2);
//      }
//      if (!bottom.equals("none")){
//        text(bottom, width / 2, height - threshold / 2);
//      }
      popStyle();
    }
  }
  
//  void mousePressed(){
//    pass
//  }
  
  void mouseReleased(){
    if (table != null){
      table.mouseReleased();
    }
  }
}

class FrameImage
{
  PImage image;
  int xloc, yloc;
  float wide, high;
  FrameImage(PImage im, int x, int y, float w, float h)
  {
    image = im;
    xloc = x;
    yloc = y;
    wide = w;
    high = h;
  }
  
  void display()
  {
    image(image, xloc, yloc, wide, high);
  }
}
