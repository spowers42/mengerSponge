class Sponge{
  //This is a naive implementation of a Menger sponge, using a collection of 
  //cubes to build up the geometry.  
  float size;
  PVector center;
  ArrayList<PVector> elements;
  int MAXLEVEL = 3;
  int level;
  
  Sponge(float size, PVector center){
    this.size = size;
    this.center = center;
    elements = new ArrayList();
    elements.add(center);
    level = 0;
  }
  
  void divide(){
    if (level<MAXLEVEL){
    level++;
    ArrayList<PVector> newElements = new ArrayList();
      float newSize = size/3;
      for(PVector e:elements){
      for(int x=-1; x<2; x++){
        for(int y=-1; y<2; y++){
          for(int z=-1; z<2; z++){
            if(!((x==0&&y==0&&z==0)||
                 (x==-1&&y==0&&z==0)||
                 (x==0&&y==0&&z==-1)||
                 (x==0&&y==0&&z==1)||
                 (x==0&&y==-1&&z==0)||
                 (x==0&&y==1&&z==0)||
                 (x==1&&y==0&&z==0))){
                   newElements.add( 
                     new PVector(e.x+x*newSize,e.y+y*newSize,e.z+z*newSize));
            }
          }
        }
      }
    }
    elements = newElements;
    size = newSize;
    }
  }
  
  
  void draw(){
    for(PVector e:elements){
      pushMatrix();
      noStroke();
      fill(64,85,133);
      translate(e.x, e.y, e.z);
      box(size);
      popMatrix();
    }
  }
}

