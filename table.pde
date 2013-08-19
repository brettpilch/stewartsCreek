class TableWithColumns
{
  TableColumn[] columns;
  String location;
  int xloc;
  int yloc;
  int wide;
  int high;
  textLink[] links;
  
  TableWithColumns(TableColumn[] tc, String l, int x, int y, int w, int h)
  {
    columns = tc;
    location = l;
    xloc = x;
    yloc = y;
    wide = w;
    high = h;
    createLinks();
  }
  
  void createLinks()
  {
    links = new textLink[columns.length * columns[0].fields.length];
    int k = 0;
    for (int i = 0; i < columns.length; i++){
      for (int j = 0; j < columns[i].fields.length; j++){
        links[k] = new textLink(columns[i].fields[j], columns[i].urls[j],
        xloc - wide / 2 + (2 * (float) i + 1) / (columns.length * 2) * wide,
        yloc - high / 2 + (2 * (float) j + 1) / (columns[i].fields.length * 2) * high);
        k++;
      }
    }
  }
  
  void display()
  {
    int k = 0;
    line(xloc - wide / 2, yloc - high / 2, xloc - wide / 2, yloc + high / 2);
    line(xloc - wide / 2, yloc - high / 2, xloc + wide / 2, yloc - high / 2);
    for (int i = 0; i < columns.length; i++){
      line(xloc - wide / 2 + float(i + 1) / columns.length * wide, yloc - high / 2,
      xloc - wide / 2 + float(i + 1) / columns.length * wide, yloc + high / 2);
      for (int j = 0; j < columns[i].fields.length; j++){
        //links[k] = new textLink(columns[i].fields[j], xloc - wide / 2 + (2 * (float) i + 1) / (columns.length * 2) * wide,
        //                        yloc - high / 2 + (2 * (float) j + 1) / (columns[i].fields.length * 2) * high);
        //tl.display()
        //text(columns[i].fields[j], xloc - wide / 2 + (2 * (float) i + 1) / (columns.length * 2) * wide,
        //yloc - high / 2 + (2 * (float) j + 1) / (columns[i].fields.length * 2) * high);
        if (i == 0){
          line(xloc - wide / 2, yloc - high / 2 + float(j + 1) / columns[i].fields.length * high,
          xloc + wide / 2, yloc - high / 2 + float(j + 1) / columns[i].fields.length * high);
        }
      }
    }
    for (int i = 0; i < links.length; i++){
      links[i].display();
    }
  }
  
  void mouseReleased(){
    for (int i = 0; i < links.length; i++){
      links[i].mouseReleased();
    }
  }
  
  String getLocation()
  {
    return location;
  }
    
}

class TableColumn
{
  String[] fields;
  String[] urls;
  TableColumn(String[] f, String[] u)
  {
    fields = f;
    urls = u;
  }
}

