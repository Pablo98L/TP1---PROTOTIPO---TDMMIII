import ddf.minim.*;
String estado; 
int posX=mouseX, posY=mouseY;
// SONIDO
Minim minim;

AudioPlayer lluvia01, lluvia02, netflix, campana;

Tiempo tiempo;
void setup(){
size(1000,400);
  estado="inicio";


  tiempo= new Tiempo();

    minim = new Minim(this);
    lluvia01 = minim.loadFile( "Lluvia01.mp3");
    lluvia02 = minim.loadFile( "Lluvia02.mp3");
    netflix = minim.loadFile( "Intro_netflix.mp3");
    campana = minim.loadFile( "Campana_quiosco.mp3");
  }

void draw(){
    

tiempo.dibujar();
  
  if(estado.equals("inicio")){
  background(255);
tiempo.dibujar();
  //Si empieza por el lado azul. Izquierda. 
    if(mouseX>0 && mouseX<width-667){
   estado="adentro";
} 
//Si empieza por el lado verde. Centro. 
else if(mouseX>333&&mouseX<667){
estado="afuera";
} 
//Si empieza por el lado rojo. Derecha.
else if(mouseX>667&&mouseX<width){
estado="quiosco";
} 
  }


else if(estado.equals("adentro")){

  background(0,0,255);
  tiempo.dibujar();
  fill(0,0,0);
      ellipse(posX,posY,50,50);
  //Suena lluvia de interior.
  lluvia01.play();
  netflix.play();
  lluvia02.rewind();

    
  if(mouseX>333&&mouseX<667){
  estado="afuera";
  }
} else if(estado.equals("afuera")){
background(0,255,0);
  lluvia01.pause();
  lluvia01.rewind();
  netflix.pause();
  netflix.rewind();
  
  //Suena lluvia del exterior
  lluvia02.play();

if(mouseX>667&&mouseX<width){
estado="quiosco";
}
//Afuera vuelve adentro. Verde a Azul. 
else if(mouseX<333){
  lluvia02.pause();
estado="adentro";
}

} else if(estado.equals("quiosco")){
background(255,0,0);
lluvia02.pause();
lluvia02.rewind();

//Vuelve a sonar lluvia de interior.

lluvia01.play();
campana.play();

//Quiosco vuelve afuera. Rojo a Verde
if(mouseX<667){
    lluvia01.pause();
campana.pause();
lluvia01.rewind();
campana.rewind();
estado="afuera";
}

}
  
}

void mouseMoved() {
 
  //Luego de 20 segundos detecta movimiento. si se mueve el mouse: ellipse. 
   //Esto aun pasa en todos los estados. Aunque luego de 20 segundos si estas en el de afuera (verde) y
   //se mueve el mouse, se estan formando ellipses, aunque no se vean. Deberia luego condicionar para que suceda
  // en uno u otro estado. 
  if (mouseX > 0 && mouseX<333 && sesenta>20 ) {
   ellipse(mouseX,mouseY,50,50);
  }
}
