public class Futter extends Kreis {
  // Attribute
  protected color fuellfarbe;
  protected int futterpunkte;

  // Konstruktor
  public Futter(PVector m0, int r0, color c0) {
    super(m0, r0);
    this.fuellfarbe = c0;
    this.futterpunkte = int(random(1, 5));
    this.richtung = new PVector(random(-2, 2), random(-2, 2));
  }

  // weitere Methoden
  public void zeichnen() {
    noStroke(); // keine Umrandung
    fill(fuellfarbe); // Füllfarbe
    circle(mittelpunkt.x, mittelpunkt.y, 2*radius);
  }

  public void kollidieren(Kreis k0) {
    if (k0 != null) {
      float abstand = mittelpunkt.dist(k0.mittelpunkt);
      if (abstand <= (k0.radius+radius)) {
        if (k0 instanceof Futter) {
          richtung.x = -richtung.x;
          richtung.y = -richtung.y;
          k0.setRichtung(new PVector(-k0.getRichtung().x, -k0.getRichtung().y));
        }
      }
    }
  }

  public void bewegen() {
    mittelpunkt.add(richtung); // Addition von Ortsvektor des Mittelpunktes und Speed-Vektor
    if ((mittelpunkt.x-radius <=0) || (mittelpunkt.x+radius >= width)) {
      richtung.x = -richtung.x;
    }
    if ((mittelpunkt.y-radius <=0) || (mittelpunkt.y+radius >= height)) {
      richtung.y = -richtung.y;
    }
  }
  
  // getter- und setter-Methoden
  public int getFutterpunkte(){
    return this.futterpunkte;
  }
}
