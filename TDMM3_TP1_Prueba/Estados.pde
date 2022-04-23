Boolean adentro=false;

class Estados {
  String estado;
  static final int FADE = 2500;
  Estados() {
    estado="inicio";
  }

  void dibujar() {


    if (estado.equals("inicio")) {

      background(255);
      fill(0, 0, 255);
      noStroke();
      rect(0, 0, width-667, height);
      fill(0, 255, 0);
      rect(width-667, 0, 667, height);
      fill(255, 0, 0);
      rect(667, 0, width, height);
      fill(0, 0, 0);
      rect(0, height/2-50, width, 100);


      tiempo.dibujar();
      //Si empieza por el lado azul. Izquierda. 
      if (mouseX>0 && mouseX<width-667) {
        estado="adentro";
      } 
      //Si empieza por el lado verde. Centro. 
      else if (mouseX>333&&mouseX<667) {
        estado="afuera";
      } 
      //Si empieza por el lado rojo. Derecha.
      else if (mouseX>667&&mouseX<width) {
        estado="quiosco";
      }
    } else if (estado.equals("adentro")) {


      fill(0, 0, 0);
      rect(0, height/2-50, width, 100);
      tiempo.dibujar();
      fill(0, 0, 0);
      adentro=false;
      //Suena lluvia de interior.
      lluvia01.play();
      lluvia02.rewind();


      if (mouseX>333&&mouseX<667) {
        estado="afuera";
      }
      if (mouseY>height/2+50) {
        lofi.play();
        //CONSTROLAMOS EL VOLUMEN DEL SONIDO. 
        lofi.setGain(-5);
      }
      if (mouseY<height/2-50) {
        netflix.play();
      }
    } else if (estado.equals("afuera")) {

      fill(0, 0, 0);
      rect(0, height/2-50, width, 100);
      lluvia01.pause();
      lluvia01.rewind();
      netflix.pause();
      netflix.rewind();
      lofi.pause();
      lofi.rewind();


      //Suena lluvia del exterior
      lluvia02.play();

      //Luego de 20 segundos aumenta la intensidad. Podria ser otro sonido o caer un rayo. 
      if (contadorT>10) {
        trueno01.play();
        trueno02.play();
        trueno01.setGain(+30);
        trueno02.setGain(+30);
        alarmaAuto.play();
        lluvia02.setGain(+10);
      }

      if (mouseY>height/2+50) {
        trafico.play();
        trafico.setGain(-10);
        //CONSTROLAMOS EL VOLUMEN DEL SONIDO.
      } else if (mouseY<height/2-100) {

        charco.play();
      }


      if (mouseX>667&&mouseX<width) {
        estado="quiosco";
      }
      //Afuera vuelve adentro. Verde a Azul. 
      else if (mouseX<333) {
        lluvia02.pause();
        estado="adentro";
      }
    } else if (estado.equals("quiosco")) {

      fill(0, 0, 0);
      rect(0, height/2-50, width, 100);
      lluvia02.pause();
      lluvia02.rewind();

      //Vuelve a sonar lluvia de interior.

      lluvia01.play();
      lluvia01.setGain(-10);

      if (mouseY>height/2+50) {
        campana.play();
        //CONSTROLAMOS EL VOLUMEN DEL SONIDO. 
        campana.setGain(-5);
      }
      if (mouseY<height/2-50) {
        netflix.play();
      }



      //Quiosco vuelve afuera. Rojo a Verde
      if (mouseX<667) {
        lluvia01.pause();
        campana.pause();
        lluvia01.rewind();
        campana.rewind();
        estado="afuera";
      }
    }
  }
}
