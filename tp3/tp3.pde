//https://www.youtube.com/watch?v=AQgBR76Uu7Q
 PImage Opart;
 int cantidad = 20;
 int tamaño;
 int diametroInical = 17; //tamaño de los circulos
 boolean agrandar = false; // variable paraq controlar el agrandar los cisculos
 boolean mostrarBoton = false; // variable para ver el boton Reiniciar
 void setup(){
   size(800, 400);
   Opart = loadImage("Opart.png");
   tamaño = width / cantidad;
  }
  
 void draw(){
   background(250);
   println("X: ", mouseX, "Y: ", mouseY);
   image(Opart, 0, 0);
dibujarGrilla(cantidad / 2, cantidad, cantidad);
  
  //dibujo de los circulos
for (int x = cantidad/2; x < cantidad; x++) {
  for (int y = 0; y < cantidad; y++) {
    if ((x + y) % 2 == 0){
      fill(255);
 } else {  
   fill(0);
 }
 
 //llamar a la función para calcular el diametro
 float diametro = 17;
 
 if (agrandar) { 
  diametro = calcularDiametro(x, y);
  }  
  
  ellipse(x * tamaño + tamaño / 2, y * tamaño + tamaño / 2, diametro, diametro);
   }
 }
 
 //Boton de reiniciar si mostrarBoton es true
 if (mostrarBoton) {
   fill(0);
   rect(width - 520, 0, 120, 40);
   fill(255);
   textAlign(CENTER, CENTER);
   text("Reiniciar", width - 460, 20);
   }
 }
 
 //calcular el diametro basado en la distancia del mouse
float calcularDiametro(int x, int y){
  float distancia = dist(mouseX, mouseY, x * tamaño + tamaño / 2, y * tamaño + tamaño / 2);
  float diametro = map(distancia, 0, width / 2, 17, 17 * 2);
  return diametro;
  }
void mousePressed(){
  
  if (mouseX >= width - 120 && mouseX <= width - 20 &&
      mouseY >= 20 && mouseY <= 60) {
        // restaurar el estado inicial
        agrandar = false;
        mostrarBoton = false;
  } else   {
    agrandar = !agrandar;
    mostrarBoton = true;  
    }
 }
 
 void dibujarGrilla(int desdeX, int columnas, int filas) {
  for (int x = desdeX; x < columnas; x++) {
    for (int y = 0; y < filas; y++) {
      if ((x + y) % 2 == 0) {
        fill(0);
      } else {
        fill(255);
      }
      rect(x * tamaño, y * tamaño, tamaño, tamaño);
    }
  }
}

 
