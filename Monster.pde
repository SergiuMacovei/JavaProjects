public class Monster extends Kreis {
  // Attribute
  protected PImage bild;
  protected int art;
  protected Pacman pac;

  // Konstruktor
  public Monster(PVector m0, int r0) {
    super(m0, r0);
    this.bild = loadImage("monster.png");
    this.art = 2;
    this.richtung = new PVector(2, -2);
  }

  // weitere Methoden
  public void zeichnen() {
    image(bild, mittelpunkt.x-radius, mittelpunkt.y-radius, 2*radius, 2*radius);
  }

  public void kollidieren(Kreis k0) {
  }


  public void bewegen() {
    mittelpunkt.add(richtung);
    if (art == 1) { // Dreiecksbewegung
      if ((mittelpunkt.x >450) && (richtung.y == -1)) {
        mittelpunkt.x -=1;
        richtung.y = 1;
        richtung.y = 1;
      } else if ((mittelpunkt.x > 520) && (richtung.y == 1)) {
        mittelpunkt.y -=1;
        richtung.y = 0;
        richtung.x = -1;
      } else if ((mittelpunkt.x < 150) && (richtung.x == -1)) {
        mittelpunkt.x +=1;
        richtung.x = 1;
        richtung.y = -1;
      }
    } else if (art == 2) {
      if ((mittelpunkt.x - radius <= 0) || (mittelpunkt.x + radius >= width)) { // Verhindern, dass Monster durch die Wände wandern
        richtung.x = -richtung.x;
      }
      if ((mittelpunkt.y - radius <= 0) || (mittelpunkt.y + radius >= height)) {
        richtung.y = -richtung.y;
      }
    } else if (art == 3 && pac != null) { // auf Pacman zu
      PVector ziel = PVector.sub(pac.mittelpunkt, this.mittelpunkt); // Vektor, der direkt auf Pacman zeigt
      ziel.normalize(); // Monster läuft gleich schnell, egal wie weit Pacman ist
      // Geschwindigkeit
      this.richtung = ziel;
    } else {
      richtung.set(1, 0);
    }
  }




  // setter- und getter-Methoden
  public int getArt() {
    return this.art;
  }

  public void setPacman(Pacman pac0) {
    this.pac = pac0;
  }
}
