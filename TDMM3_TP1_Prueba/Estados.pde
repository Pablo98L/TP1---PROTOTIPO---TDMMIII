Boolean adentro=false;

class Estados{
String estado;
Estados(){
 estado="inicio";
}

void dibujar(){

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
  adentro=false;
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




}
