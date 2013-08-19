class Fiveframe
{
  Frame current, center, left, right, top, bottom;
  Fiveframe(String c, String l, String r, String t, String b)
  {
    center = new Frame(c, l, r, t, b);
    left = new Frame(l, r, c, t, b);
    right = new Frame(r, c, l, t, b);
    top = new Frame(t, l, r, b, c);
    bottom = new Frame(b, l, r, c, t);
    current = center;
  }
  
  Frame getCurrent()
  {
    return current;
  }
  
  void setDrag(boolean b)
  {
    center.setDrag(b);
    left.setDrag(b);
    right.setDrag(b);
    top.setDrag(b);
    bottom.setDrag(b);
  }
  
  void moveLeft(){
    if (current == center || current == top || current == bottom){
      current = left;
    } else if (current == right){
      current = center;
    } else if (current == left){
      current = right;
    }
  }
  
  void moveRight(){
    if (current == center || current == top || current == bottom){
      current = right;
    } else if (current == left){
      current = center;
    } else if (current == right){
      current = left;
    }
  }
  
  void moveUp(){
    if (current == center || current == left || current == right){
      current = top;
    } else if (current == bottom){
      current = center;
    } else if (current == top){
      current = bottom;
    }
  }
  
  void moveDown(){
    if (current == center || current == left || current == right){
      current = bottom;
    } else if (current == top){
      current = center;
    } else if (current == bottom){
      current = top;
    }
  }
  
  void display(){
    current.display();
//    if (drag) {
//      current.display();
//      if (current == center){
//        text(top.getTitle(), width / 2, threshold / 2);
//        text(bottom.getTitle(), width / 2, height - threshold / 2);
//        text(left.getTitle(), threshold / 2, height / 2);
//        text(right.getTitle(), width - threshold / 2, height / 2);
//        line(threshold, 0, threshold, height);
//        line(0, threshold, width, threshold);
//        line(0, height - threshold, width, height - threshold);
//        line(width - threshold, 0, width - threshold, height);
//      }
//    }
  }
  
  void mouseReleased(){
    setDrag(false);
    current.mouseReleased();
  }
}
