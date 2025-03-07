// Collision detector 
// Bounding boxes circulares 
// PJ se mueve con el raton 


// ventana
int _height = 1000;
int _width = 1000;

int[] cord_x;// cord PNJ 
int[] cord_y;
static int num_pnj = 10;
int radio_circles = 15; // tamaño radio coliciones

boolean colision = false;


void setup(){ // on start
  //ventana
  size(_height,_width);
  //inicializar arrays
  
  cord_x = new int[num_pnj]; 
  cord_y = new int[num_pnj];
  // set random position pnj
  
  for(int i = 0; i < num_pnj; i++){
   cord_x[i] = (int)random(height);
   cord_y[i] = (int)random(width);
  }
  
}


void draw(){
  background(0);
  
  fill(0,255,0); // color pj
  ellipse(mouseX,mouseY, radio_circles * 2, radio_circles * 2);
  
  // draw pnj
  fill(255,0,0); // color
  for(int i = 0; i < num_pnj; i++){
     ellipse(cord_x[i],cord_y[i],radio_circles * 2, radio_circles * 2); //Draw pnj
  }
  
  //priNt text
  PFont font;
  font = createFont("Roboto-VariableFont_wdth,wght.ttf", 128);
  if(colision){
     fill(0,255,0);
     textFont(font);
     text("CoLlIsioN  ʕノ•ᴥ•ʔノ ︵ ┻━┻", 50, 200);
  }
  else{
    fill(0,0,255);
    textFont(font);
    text("nO CoLlIsioN   (╥﹏╥)", 50, 200);
  }
  
}

void mouseMoved(){ // on mouse moved
  
  for(int i = 0; i < num_pnj; i++){
     //Collison
     // Collision = Distance <= radipj + radipnj
     float[] vector_distance = new float[2];
     vector_distance[0] = cord_x[i] - mouseX;
     vector_distance[1] = cord_y[i] - mouseY;
     float module_distance = sqrt(vector_distance[0] * vector_distance[0] + vector_distance[1] * vector_distance[1]);
     
     
       
     if(module_distance <= radio_circles * 2){
       colision = true;
       break;
     }
     else if(module_distance > radio_circles * 2){
       colision = false;
     }
  }
  
  
}
