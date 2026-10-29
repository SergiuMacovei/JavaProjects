public class Pacman extends Kreis {
  // Attribute
  protected int mund;
  protected Verwaltung vw;

  // Konstruktor
  public Pacman(PVector m0, int r0, int mund0) {
    super(m0, r0);
    this.mund = mund0;
    setRichtung();
    this.vw = new Verwaltung(this, null);
  }


  // weitere Methoden

  public void kollidieren(Kreis k0) {
    if (k0 != null) {
      float abstand = mittelpunkt.dist(k0.mittelpunkt);
      if (abstand <= (k0.radius+radius)) {
        if (k0 instanceof Futter) {
          int i = vw.getKListe().indexOf(k0);
          vw.getKListe().set(i, null); // Verweis auf Futter wird in der ArrayList auf null gesetzt
          vw.getSpielerin().setPunkte(vw.getSpielerin().getPunkte()+1); // Type-Casting (Down-Casting)
          println("Punkte: "+vw.getSpielerin().getPunkte());
          //text("Punkte: "+vw.getSpielerin().getPunkte(), 10, 10);
        } else if (k0 instanceof Flauschi) {
          k0.getRichtung().x = -k0.getRichtung().x; // Flauschi ändert die Richtung
          k0.getRichtung().y = -k0.getRichtung().y;
          setMund( (mund +3) % 4); // Mund dreht drei weiter bzw. eins nach links
          vw.getSpielerin().setLeben(vw.getSpielerin().getLeben()+1);
          println("Leben: "+vw.getSpielerin().getLeben());
          //text("Punkte: "+vw.getSpielerin().getPunkte(), 10, 10);
        } else if (k0 instanceof Monster) {
          mittelpunkt.x = radius+1;
          mittelpunkt.y = radius+1;
          mund = 0;
          // Leben abziehen
          vw.getSpielerin().setLeben(vw.getSpielerin().getLeben()-1);
          println("Leben: "+vw.getSpielerin().getLeben());
     
          // Richtungsänderung für das Monster bei Treffer
          k0.getRichtung().x = -k0.getRichtung().x;
          k0.getRichtung().y = -k0.getRichtung().y;
        }
      }
    }
  }

  public void bewegen() {
    mittelpunkt.add(this.richtung); // Addition von Ortsvektor des Mittelpunktes und Richtungs-Vektor
    if ((mittelpunkt.x+radius)>=width-5) { // rechter Rand
      mittelpunkt.x--;
      setMund(3);
      setRichtung();
    } else if ((mittelpunkt.y+radius) >= height-5) { // unterer Rand
      mittelpunkt.y--;
      setMund(2);
      setRichtung();
    } else if ((mittelpunkt.x-radius) <= 5) { // linker Rand
      mittelpunkt.x++;
      setMund(1);
      setRichtung();
    } else if ((mittelpunkt.y - radius)<= 5) { // oberer Rand
      mittelpunkt.y++;
      setMund(0);
      setRichtung();
    }
  }

  public void zeichnen() {
    fill(#E0BB26);
    stroke(0);
    zeichneKoerper(mund);
    noStroke();
    zeichneAuge(mund);
  }

  private void zeichneKoerper(int m0) {
    if (m0 == 0) {
      arc(mittelpunkt.x, mittelpunkt.y, 2*radius, 2*radius, PI/8, 2*PI-PI/8, PIE);
    } else if (m0 == 1) {
      arc(mittelpunkt.x, mittelpunkt.y, 2*radius, 2*radius, PI+5*PI/8, 3*PI+3*PI/8, PIE);
    } else if (m0 == 2) {
      arc(mittelpunkt.x, mittelpunkt.y, 2*radius, 2*radius, PI+PI/8, 2*PI+7*PI/8, PIE);
    } else if (m0 == 3) {
      arc(mittelpunkt.x, mittelpunkt.y, 2*radius, 2*radius, PI/2+PI/8, 2*PI+3*PI/8, PIE);
    }
  }

  private void zeichneAuge(int m0) {
    fill(0);
    if (m0 == 0) {
      circle(mittelpunkt.x+radius/2, mittelpunkt.y-radius/2, radius/3);
    } else if (m0 == 3) {
      circle(mittelpunkt.x+radius/2, mittelpunkt.y+radius/2, radius/3);
    } else if (m0 == 2) {
      circle(mittelpunkt.x-radius/2, mittelpunkt.y+radius/2, radius/3);
    } else if (m0 == 1) {
      circle(mittelpunkt.x-radius/2, mittelpunkt.y-radius/2, radius/3);
    }
  }


  // setter- und getter-Methoden
  public void setMund(int m0) {
    this.mund = m0;
    setRichtung();
  }

  public int getMund() {
    return this.mund;
  }

  public void setRichtung() {
    if (mund == 0) {
      this.richtung = new PVector(2, 0);
    } else if (mund == 1) {
      this.richtung = new PVector(0, -2);
    } else if (mund == 2) {
      this.richtung = new PVector(-2, 0);
    } else {
      this.richtung = new PVector(0, 2);
    }
  }

  public Verwaltung getVerwaltung() {
    return vw;
  }
}
