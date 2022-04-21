int contadorT;
boolean activo =false;

class Tiempo {

  int time;
  int wait = 1000;
  int segundo =1;
  String cambio;

  Tiempo() {
    contadorT=0;
    time = millis();
      cambio="pasa algo";
        }

  void dibujar() {

     println(contadorT);
    if (millis() - time >= wait) {
      contadorT = contadorT + segundo;
      time = millis();//also update the stored time
    }

//Pasados 10 segundos puede pasar algo. 
    if (contadorT>=10) {
      textSize(80);
      fill(0,0, 0);
      text(cambio, width/2, height/2);
      println(cambio);
    }
      
  }
 
  
  
}
