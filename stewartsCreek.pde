////TO DO: parse department web pages for teacher names and links to their webpages.

Fiveframe fiver;
int mousePressX, mousePressY;
int mouseReleaseX, mouseReleaseY, threshold;
Button cButton, lButton, rButton, tButton, bButton;
Button[] buttons = new Button[5];
boolean drag = false;
String data6thGrade = "http://www.scm.rcs.k12.tn.us/faculty/6a_b/6th_gr_department.htm";
String data7thGrade = "http://www.scm.rcs.k12.tn.us/faculty/7a_b/7th_gr_department.htm";
String data8thGrade = "http://www.scm.rcs.k12.tn.us/faculty/8a_b/8th_gr_department.htm";
//String[] title;
color bgcolor = #EA0000;
String[] categories6th = {"Mini School", "Math", "Science", "Social Studies", "Language Arts"};
String[] categories6url = {"None", "None", "None", "None", "None"};
TableColumn categories6thTC = new TableColumn(categories6th, categories6url);
String[] A6th = {"6A", "Amy Brawley\nShannon Donnelly", "April Clay", "Matthew Kovach", "Lori Scott\nDelana Baird"};
String[] A6url = {"None", "http://www.scm.rcs.k12.tn.us/TEACHERS/brawleya/brawleya.html", "http://www.scm.rcs.k12.tn.us/TEACHERS/claya/claya.htm",
                  "http://www.scm.rcs.k12.tn.us/TEACHERS/duncanan_kovachm/6thgradess.htm", "http://www.scm.rcs.k12.tn.us/TEACHERS/scottl/scottl.html"};
TableColumn A6thTC = new TableColumn(A6th, A6url);
String[] B6th = {"6B", "Lisa Darnall\nJessica Pollock", "Jennifer Scott", "Anna Duncan", "Stacie Whitlock\nJennifer Johnson"};
String[] B6url = {"None", "http://www.scm.rcs.k12.tn.us/TEACHERS/darnalll/darnalll_new.htm", "http://www.scm.rcs.k12.tn.us/TEACHERS/scottj/Mrs.ScottsScienceWebpage.htm",
                "http://www.scm.rcs.k12.tn.us/TEACHERS/duncanan_kovachm/6thgradess.htm", "http://www.scm.rcs.k12.tn.us/TEACHERS/whitlockst/whitlockst.html"};
TableColumn B6thTC = new TableColumn(B6th, B6url);
TableColumn[] columns6th = {categories6thTC, A6thTC, B6thTC};
TableWithColumns table6th;
//TableWithColumns[] tables;
PImage logo;

void getData(String source, Frame frame){
  String[] lines = loadStrings(source);
  String html_source = join(lines, "\n" );
  //println(html_source);
  String[] title = match(html_source, "<title>(.+?)</title>");
//  String[][] column1Labels = matchAll(html_source, "\"style17\">(.+?)<");
//  String[] column1fields = new String[5];
//  for (int i = 0; i < 5; i++){
//    column1fields[i] = column1Labels[i][1];
//  }
//  TableColumn column1 = new TableColumn(column1fields);
//  String[][] column2Labels = matchAll(html_source, "\"style[0-9][0-9]\"><a href=\".+?\">(.+?)</a>");
//  String[] column2fields = new String[5];
//  for (int i = 0; i < 5; i++){
//    column2fields[i] = column2Labels[i][1];
//  }
//  TableColumn column2 = new TableColumn(column2fields);
//  TableColumn[] columns6th = {column1, column2};
//  table6th = new TableWithColumns(columns6th, "6th", width / 2, height / 2, width - 100, height - 300);
//  tables[0] = table6th;
  //println(title[1]);
  frame.setTitle(title[1]);
}

void setup(){
  size(480, 800);
  smooth();
  textAlign(CENTER);
  imageMode(CENTER);
  textSize(14);
  threshold = 50;
  logo = loadImage("logo.png");
  table6th = new TableWithColumns(columns6th, "6th", width / 2, height / 2, width - 50, height - 150);
  //tables = new TableWithColumns[]{table6th};
  cButton = new Button("center button", "Home", 0, 0, width / 4, height / 4);
  lButton = new Button("left button", "6th", 0, 0, width / 4, height / 4);
  rButton = new Button("right button", "8th", 0, 0, width / 4, height / 4);
  tButton = new Button("top button", "Calendar", 0, 0, width / 4, height / 4);
  bButton = new Button("bottom button", "7th", 0, 0, width / 4, height / 4);
  buttons[0] = cButton;
  buttons[1] = lButton;
  buttons[2] = rButton;
  buttons[3] = tButton;
  buttons[4] = bButton;
  fiver = new Fiveframe("Stewarts Creek Middle School", "6th Grade", "8th Grade", "Calendar", "7th Grade");
  getData(data6thGrade, fiver.left);
  getData(data7thGrade, fiver.bottom);
  getData(data8thGrade, fiver.right);
  float scalar;
  if (width > height){
    scalar = height;
  } else {scalar = width;}
  FrameImage homeLogo = new FrameImage(logo, width / 2, height / 2, map(logo.width, 0, logo.width, 0, scalar), map(logo.height, 0, logo.height, 0, scalar));
  fiver.center.addImage(homeLogo);
  fiver.left.addTable(table6th);
}

void showButtons(){
  for (int i = 0; i < buttons.length; i++){
    if (buttons[i].getLocation().equals(fiver.getCurrent().getName())){
      buttons[i].display();
    }
  }
}

String greaterMove(){
  if (abs(mouseX - mousePressX) > 
  abs(mouseY - mousePressY)){
    return "horizontal";
  } else {
    return "vertical";
  }
}

void arrow(String orientation){
  pushStyle();
  fill(0, 100);
  noStroke();
  strokeWeight(0);
  if (orientation.equals("horizontal")){
    if (abs(mouseX - mousePressX) > threshold){
      fill(255, 100);
    }
    if (mouseX > mousePressX){
      rect((mouseX - mousePressX) / 3, height / 3, (mouseX - mousePressX) * 2 / 3, 10);
      triangle((mouseX - mousePressX) * 2 / 3, height / 3 - 10, (mouseX - mousePressX) * 2 / 3,
      height / 3 + 10, mouseX - mousePressX, height / 3);
      rect((mouseX - mousePressX) / 3, height * 2 / 3, (mouseX - mousePressX) * 2 / 3, 10);
      triangle((mouseX - mousePressX) * 2 / 3, height * 2 / 3 - 10, (mouseX - mousePressX) * 2 / 3,
      height * 2 / 3 + 10, mouseX - mousePressX, height * 2 / 3);
    } else {
      rect(width - (mousePressX - mouseX) / 3, height / 3, (mousePressX - mouseX) * 2 / 3, 10);
      triangle(width - (mousePressX - mouseX) * 2 / 3, height / 3 - 10, width - (mousePressX - mouseX) * 2 / 3,
      height / 3 + 10, width - mousePressX + mouseX, height / 3);
      rect(width - (mousePressX - mouseX) / 3, height * 2 / 3, (mousePressX - mouseX) * 2 / 3, 10);
      triangle(width - (mousePressX - mouseX) * 2 / 3, height * 2 / 3 - 10, width - (mousePressX - mouseX) * 2 / 3,
      height * 2 / 3 + 10, width - mousePressX + mouseX, height * 2 / 3);
    }
  } else {
    if (abs(mouseY - mousePressY) > threshold){
      fill(255, 100);
    }
    if (mouseY > mousePressY){
      rect(width / 3, (mouseY - mousePressY) / 3, 10, (mouseY - mousePressY) * 2 / 3);
      triangle(width / 3 - 10, (mouseY - mousePressY) * 2 / 3, width / 3 + 10, (mouseY - mousePressY) * 2 / 3,
      width / 3, mouseY - mousePressY);
      rect(width * 2 / 3, (mouseY - mousePressY) / 3, 10, (mouseY - mousePressY) * 2 / 3);
      triangle(width * 2 / 3 - 10, (mouseY - mousePressY) * 2 / 3, width * 2 / 3 + 10, (mouseY - mousePressY) * 2 / 3,
      width * 2 / 3, mouseY - mousePressY);
    } else {
      rect(width / 3, height - (mousePressY - mouseY) / 3, 10, (mousePressY - mouseY) * 2 / 3);
      triangle(width / 3 - 10, height - (mousePressY - mouseY) * 2 / 3, width / 3 + 10, height - (mousePressY - mouseY) * 2 / 3,
      width / 3, height - mousePressY + mouseY);
      rect(width * 2 / 3, height - (mousePressY - mouseY) / 3, 10, (mousePressY - mouseY) * 2 / 3);
      triangle(width * 2 / 3 - 10, height - (mousePressY - mouseY) * 2 / 3, width * 2 / 3 + 10, height - (mousePressY - mouseY) * 2 / 3,
      width * 2 / 3, height - mousePressY + mouseY);
    }
  }
  popStyle();
}
  

void draw(){
  background(bgcolor);
  //showButtons();
  fiver.display();
//  for (int i = 0; i < tables.length; i++){
//    if (tables[i].getLocation().equals(fiver.getCurrent().getName())){
//      tables[i].display();
//    }
//  }
  if (drag){
    pushStyle();
    rectMode(CENTER);
    fill(0, 90);
    stroke(255);
    if (greaterMove().equals("horizontal")){
      rect(mouseX - mousePressX + width / 2, height / 2, width, height);
      arrow("horizontal");
    } else {
      rect(width / 2, mouseY - mousePressY + height / 2, width, height);
      arrow("vertical");
    }
    popStyle();
  }
}

void mousePressed(){
  mousePressX = mouseX;
  mousePressY = mouseY;

  //link("http://processingjs.org"); 

}

void mouseReleased(){
  drag = false;
  //fiver.setDrag(false);
  mouseReleaseX = mouseX;
  mouseReleaseY = mouseY;
  int Xchange = mouseReleaseX - mousePressX;
  int Ychange = mouseReleaseY - mousePressY;
  if (abs(Xchange) > abs(Ychange) && abs(Xchange) > threshold){
    if (Xchange > 0){
      fiver.moveLeft();
    } else {
      fiver.moveRight();
    }
  } else if (abs(Ychange) > threshold){
    if (Ychange > 0){
      fiver.moveUp();
    } else {
      fiver.moveDown();
    }
  } else {
    fiver.mouseReleased();
  }
}

void mouseDragged(){
  drag = true;
  fiver.setDrag(true);
}
  
