import ddf.minim.*;
 
Estados e;

// SONIDO
Minim minim;
AudioPlayer lluvia01, lluvia02, netflix, campana;
Tiempo tiempo;


void setup(){
size(1000,400);
 
    tiempo= new Tiempo();
    e= new Estados();
    minim = new Minim(this);
    lluvia01 = minim.loadFile( "Lluvia01.mp3");
    lluvia02 = minim.loadFile( "Lluvia02.mp3");
    netflix = minim.loadFile( "Intro_netflix.mp3");
    campana = minim.loadFile( "Campana_quiosco.mp3");
  }

void draw(){
    

tiempo.dibujar();
e.dibujar();
  
  
}

void mouseMoved() {
 
  //Luego de 20 segundos detecta movimiento solo en el estado de adentro (azul).
  //si se mueve el mouse: ellipse. 
   
  if (mouseX > 0 && mouseX<333 && sesenta>5 && !adentro ) {
   ellipse(mouseX,mouseY,50,50);
  }
}
