// Detector de collisiones AABB
// Muros colisionables

// ventana
int _height = 1000;
int _width = 1000;

//walls
PVector[] walls; 
color color_walls;
static int num_wall = 10;
int height_wall, width_wall;
int max_wall_size = 30;
int min_wall_size = 10;

boolean colision = false;

void setup(){
  //ventana
  size(_height,_width);
  
  color_walls = color (random(0,255),random(0,255),random(0,255));
  
  height_wall = (int)random(min_wall_size, max_wall_size);
  width_wall = (int)random(min_wall_size, max_wall_size);
  
  walls = new PVector[num_wall]; // reservamo la longitud de la array
  
  for(int i = 0; i < num_wall; i++){
    walls[i] = new PVector((int)random(0 + width_wall,width - width_wall),(int)random(0 + height_wall,height - height_wall)); // reservamos los elementos del vector
  }
}

void draw(){
  background(0);
  
  for(int i = 0; i < num_wall; i++){
    rectMode(CENTER);  // pinta los muros a partir del punto central, el alto y el ancho
    fill(color_walls);  // Set fill to white
    rect(walls[i].x, walls[i].y, height_wall, width_wall); // Draw white rect using CORNER mode
    
    //text 
    PFont font;
    font = createFont("Roboto-VariableFont_wdth,wght.ttf", 28);
    if(colision){
       fill(255);
       textFont(font);
       text("CoLlIsioN  ʕノ•ᴥ•ʔノ ︵ ┻━┻", walls[i].x, walls[i].y);
    }
    else{
      fill(255);
      textFont(font);
      text("nO CoLlIsioN   (╥﹏╥)", walls[i].x, walls[i].y);
    }
    
  }
  
  //pj
  fill(0,255,0); // color pj
  rectMode(CENTER);
  rect(mouseX, mouseY, height_wall, width_wall);
}

void mouseMoved(){ // on mouse moved
  
  PVector max_wall_values = new PVector(0,0); // guardamos maxY y maxX
  // Xmin Ymin del pj son igual a mouseX - 2/height_wall, mouseY - 2/width_wall ya que printamos el muro desdel centro
  PVector PJ_min = new PVector( mouseY - 2/height_wall, mouseX - 2/width_wall);
  PVector PJ_max = new PVector( mouseY + 2/height_wall, mouseX + 2/width_wall);
  
  for(int i =0; i < num_wall; i++){
    max_wall_values.x = walls[i].x + width_wall; //walls min point
    max_wall_values.y = walls[i].y + height_wall;
    
    //suponemos k pj es el primero y que el wall es el 2
    if(((PJ_max.x > walls[i].x )||( max_wall_values.x > PJ_min.x)) && ((PJ_max.y > walls[i].y )||( max_wall_values.y > PJ_min.y))) {
      colision = true;
    } else {
      colision = false;
    }
  }
  
}
