class Sponge{
  //This is a naive implementation of a Menger sponge, 
  //where each substructure is represented by an array of
  //sponge components which can themselves be divided into 
  //components.
  float size;
  PVector center;
  ArrayList<Sponge> elements;
  boolean subdivided;
  
  Sponge(float size, PVector center){
    this.size = size;
    this.center = center;
    subdivided = false;
    elements = new ArrayList();
  }
  
  void divide(){
    if (!subdivided){
      subdivided = true;
      float newSize = size/3;
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
                   elements.add(new Sponge(newSize, 
                     new PVector(center.x+x*newSize,center.y+y*newSize,center.z+z*newSize)));
                 }
          }
        }
      }
    }else{
        for(Sponge e:elements){
          e.divide();
        }
      }
    }
  
  
  void draw(){
    if(subdivided){
      for(Sponge e:elements){
        e.draw();
      }
    }
    else{
      pushMatrix();
      noStroke();
      fill(64,85,133);
      translate(center.x, center.y, center.z);
      box(size);
      popMatrix();
    }
  }
}

