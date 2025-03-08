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
    walls[i] = new PVector(
      (int)random(0 + width_wall,width - width_wall),
      (int)random(0 + height_wall,height - height_wall)
    ); // reservamos los elementos del vector
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
  colision = false; // rteset colision
  
  
  // Calcular límites del jugador
  float PJ_left = mouseX - width_wall/2;
  float PJ_right = mouseX + width_wall/2;
  float PJ_top = mouseY - height_wall/2;
  float PJ_bottom = mouseY + height_wall/2;
  
  for(int i = 0; i < num_wall; i++){
    // Calcular límites del muro
    float wall_left = walls[i].x - width_wall/2;
    float wall_right = walls[i].x + width_wall/2;
    float wall_top = walls[i].y - height_wall/2;
    float wall_bottom = walls[i].y + height_wall/2;
    
    // Detección AABB correcta
    if(PJ_right > wall_left && 
       PJ_left < wall_right && 
       PJ_bottom > wall_top && 
       PJ_top < wall_bottom) {
      colision = true;
      break; // Salir del bucle al detectar primera colisión
    }
  }
  
  
  // ERROR del profesor explicado:
    // colision de los muros estaba mal calculada
    // se suponia que la posicion de los muros era el punto minimo cuando la posicion de estos es igual al centro
    // ya que printamos estos muros desde el centro con el rectMode (mismo error que tenia el profe a la hora de printar el pj)
}
