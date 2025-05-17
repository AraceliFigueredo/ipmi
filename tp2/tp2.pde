 int opacidad = 0;
int opacidadTexto = 0;
int escena = -1; // Escena -1: pantalla de inicio
int tiempoInicio = 0;


PImage pantalla1, pantalla2, pantalla3, pantalla4;
PFont fuenteNueva;

// textos
String texto1 = "Hola! Me llamo es Araceli, el juego que quiero presentar es el TEG. Este juego se puede jugar a partir de 2 a 6 personas";
String texto2 = "El juego T.E.G es un juego de mesa de estrategia en el que se simula una guerra por la conquista del mundo.";
String texto3 = "Todos los participantes tienen un objetivo secreto a cumplir como ocupar un país, atacar a otro, realizar pactos,etc";
String texto4 = "El primero logre cumplir su objetivo secreto o el objetivo común (ocupar 30 paises), será el ganador del juego.";

float img = 460;
float fondo;
boolean moviendo = true;

float yTexto2 = -100;
float yTexto3 = -100;
float yTexto4 = -100;

void setup() {
  frameRate(60);
  size(640, 480);
  background(0);

  // Cargar imágenes
  pantalla1 = loadImage("teg.jpg");
  pantalla2 = loadImage("teg2 (2).jpg");
  pantalla3 = loadImage("teg3.jpg");
  pantalla4 = loadImage("teg4.jpg");

  pantalla1.resize(640, 480);
  pantalla2.resize(640, 480);
  pantalla3.resize(640, 480);
  pantalla4.resize(640, 480);

  fuenteNueva = createFont("Arial", 12);
  textFont(fuenteNueva);
  textAlign(CENTER, TOP);
}

void draw() {
  noTint();

  // ESCENA -1: Pantalla de inicio
  if (escena == -1) {
    background(0);
    tint(255, opacidad);
    image(pantalla1, 0, 0);
    noTint();
    
    fill(250,159,159);
    textFont(fuenteNueva);
    textAlign(CENTER, TOP);
    text(texto1, width / 2, 40);
    

    // Botón de "Iniciar"
    fill(101, 232, 229); 
    rect(275, 400, 90, 40);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Iniciar", 320, 420); 

    if (opacidad < 255) opacidad += 3;
  }

  // ESCENA 0: Pantalla 2 (texto 2)
  else if (escena == 0) {
    background(0);
    image(pantalla2, img, 0);
    if (img > 0) img -= 3;

    fill(178, 65, 240);
    textFont(fuenteNueva);
    textAlign(CENTER, TOP);
    text(texto2, width / 2, yTexto2);

    
    if (yTexto2 < 40) yTexto2 += 2;
    
  }

  // ESCENA 1: Pantalla 3 (texto 3)
  else if (escena == 1) {
    background(0);
    tint(255, opacidad);
    image(pantalla3, 0, 0);
    noTint();

    fill(175, 69, 69, opacidadTexto); 
    textFont(fuenteNueva);
    textAlign(CENTER, TOP);
    text(texto3, width / 2, yTexto3);

    if (opacidad < 255) opacidad += 2;
    if (opacidadTexto < 255) opacidadTexto += 3;
    if (yTexto3 < 40) yTexto3 += 2;
  }

  // ESCENA 2: Pantalla 4 (texto 4 y botón reiniciar)
  else if (escena == 2) {
    background(255, 250, 0); 
    image(pantalla4, 0, fondo);
    if (fondo > 0) fondo -= 6;

    fill(255, 26, 244, opacidadTexto);
    textFont(fuenteNueva);
    textAlign(CENTER, TOP);
    text(texto4, width / 2, yTexto4);
    if (opacidadTexto < 255) opacidadTexto += 3;
    if (yTexto4 < 40) yTexto4 += 2;

    // Botón "Reiniciar"
    fill(160, 196, 166);
    rect(440, 420, 160, 40); 
    fill(0, 0, 0); // 
    textAlign(CENTER, CENTER);
    text("Reiniciar", 520, 440); 
  }

  // Cambio automático de escenas
  if (escena >= 0 && escena < 2) {
    int duracion = 400;
    if (escena == 0) duracion = 600;

    if (frameCount - tiempoInicio > duracion) {
      escena++;
      tiempoInicio = frameCount;
      resetearVariables();
    }
  }
}


void resetearVariables() {
  opacidad = 0;
  img = 460;
  fondo = height;
  moviendo = true;
  opacidadTexto = 0;
  
   yTexto2 = -100;
  yTexto3 = -100;
  yTexto4 = -100;
 
}

void mouseClicked() {
  // Botón "Iniciar"
  if (escena == -1) {
    if (mouseX > 275 && mouseX < 365 && mouseY > 400 && mouseY < 440) {
      escena = 0;
      tiempoInicio = frameCount;
      resetearVariables();
    }
  }

  // Botón "Reiniciar"
  if (escena == 2) {
    if (mouseX > 440 && mouseX < 600 && mouseY > 420 && mouseY < 460) {
      escena = -1;
      tiempoInicio = frameCount;
      resetearVariables();
    }
  }
   }
   
