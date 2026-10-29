// Variablen Deklarationen //<>//
protected Futter f1;
protected Pacman p1;
protected Monster m1;
protected Flauschi fl1;
protected Spielerin s1;

protected ArrayList<Kreis> kreisliste; // Deklaration einer ArrayList vom Typ Kreis

// setup- und Ereignis-Methoden
void setup() {
  size(600, 400);
  background(220);
  surface.setTitle("Pacman!");
  surface.setResizable(true);
  surface.setLocation(100, 100);
  textSize(18);
  kreisliste = new ArrayList<Kreis>(); // Erzeugen der ArrayList kreisliste

  // Testfutter erzeugen
  PVector pos_f1 = new PVector(100, 200);
  f1 = new Futter(pos_f1, 10, #123456);
  //f1.zeichnen();
  kreisliste.add(f1);

  // Futter erzeugen
  PVector pos_f = new PVector(random(width), random(height));
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
  for (int i=0; i<20; i++) {
    Futter f = new Futter(pos_f, 10, color(r, g, b));
    kreisliste.add(f);
    pos_f = new PVector(random(width), random(height));
    r = int(random(255));
    g = int(random(255));
    b = int(random(255));
  }

  // Pacman erzeugen
  PVector pos_pm = new PVector(100, 300);
  p1 = new Pacman(pos_pm, 15, 0);
  //p1.zeichnen();
  kreisliste.add(p1);
  p1.getVerwaltung().setKListe(kreisliste);

  // Spielerin erzeugen
  s1 = new Spielerin("zockerin007");
  p1.getVerwaltung().setSpielerin(s1);

  // Testmonster erzeugen
  PVector pos_m1 = new PVector(300, 200);
  for ( int i = 0; i<3; i++) {
    m1 = new Monster(pos_m1, 15);
    m1.setPacman(p1);
    kreisliste.add(m1);


    pos_m1 = new PVector(random(width), random(height));
  }


  // Testflauschi erzeugen
  PVector pos_fl1 = new PVector(100, 100);
  fl1 = new Flauschi(pos_fl1, 15);
  fl1.zeichnen();
  kreisliste.add(fl1);
}

void draw() {
  background(220);
  text("Punkte: "+p1.getVerwaltung().getSpielerin().getPunkte(), 10, 20);
  text("Leben :" +p1.getVerwaltung().getSpielerin().getLeben(), 10, 40);
  // Prüfen, ob noch Leben übrig sind
  if (p1.getVerwaltung().getSpielerin().getLeben()<= 0) {
    // GameOver Bildschirm
    fill(200, 0, 0);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, height/2);
    noLoop(); // Stoppt die Spielschleife
    return;
  }

  boolean futterDa = false;
  for (Kreis k : kreisliste) {
    if (k instanceof Futter) {
      futterDa = true;
      break;
    }
  }

  if (!futterDa) {
    fill(0, 200, 0);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("YOU WIN!", width / 2, height / 2);
    noLoop();
    return;
  }

  // Normale Spielschleife
  for (Kreis k : kreisliste) {
    if (k!=null) {
      k.zeichnen();
      //k.bewegen_light();
      k.bewegen();
      for (Kreis j : kreisliste) {
        if ((j!=null)&&(!j.equals(k))) {
          k.kollidieren(j);
        }
      }
    }
  }
}


void keyPressed() {

  if (keyCode == RIGHT) {
    p1.setMund(0);
  } else if (keyCode == LEFT) {
    p1.setMund(2);
  } else if (keyCode == UP) {
    p1.setMund(1);
  } else if (keyCode == DOWN) {
    p1.setMund(3);
  }
  p1.setRichtung();
}


// weitere Methoden
