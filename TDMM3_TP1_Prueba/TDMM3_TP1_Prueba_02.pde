//No eliminar. 
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import processing.serial.*;
// Estado. 
Estados e;

// Sonido.
Minim minim;
AudioPlayer lluvia01, lluvia02, netflix, campana, lofi, despertador, trueno01, trueno02;
AudioPlayer trafico, alarmaAuto, charco;
//Tiempo.
Tiempo tiempo;


void setup() {
  size(1000, 400);

  tiempo= new Tiempo();
  e= new Estados();
  minim = new Minim(this);

  // Sonidos.

  lluvia01 = minim.loadFile( "LluviaVentana.wav");
  lluvia02 = minim.loadFile( "Lluvia02.mp3");
  netflix = minim.loadFile( "Intro_netflix.mp3");
  campana = minim.loadFile( "Campana_quiosco.mp3");
  lofi = minim.loadFile( "MyFavoriteThings-RayCharles.mp3");
  despertador = minim.loadFile( "Despertador.mp3");
  despertador.loop();
  trueno01 = minim.loadFile( "Trueno01.wav");
  trueno02 = minim.loadFile( "Trueno02.wav");
  trafico = minim.loadFile( "Trafico.wav");
  alarmaAuto = minim.loadFile( "CarAlarm.wav");
  charco = minim.loadFile( "Charco.wav");
}

void draw() {


  tiempo.dibujar();
  e.dibujar();
}

void mouseMoved() {

  //Luego de 20 segundos detecta movimiento solo en el estado de adentro (azul).
  //si se mueve el mouse: ellipse. 
  despertador.pause();
  if (mouseX > 0 && mouseX<333 && !adentro ) {
    fill(255);
    ellipse(mouseX, mouseY, 50, 50);
  } else if (mouseX > 333 && mouseX<667  && !adentro ) {
    fill(255);
    ellipse(mouseX, mouseY, 50, 50);
  } else if (mouseX > 667 && !adentro ) {
    fill(255);
    ellipse(mouseX, mouseY, 50, 50);
  }
}
