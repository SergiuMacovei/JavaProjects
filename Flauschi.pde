public class Flauschi extends Kreis {
  // Attribute
  protected PImage bild;
  protected int energie;

  // Konstruktor
  public Flauschi(PVector m0, int r0) {
    super(m0, r0);
    this.bild = loadImage("flauschi.png");
    this.energie = int(random(10, 50));
    this.richtung = new PVector(2, 0);
    //this.richtung = new PVector(random(-2, 2), random(-2, 2));
  }

  // weitere Methoden
  public void zeichnen() {
    image(bild, mittelpunkt.x-radius, mittelpunkt.y-radius, 2*radius, 2*radius);
  }
  
  public void kollidieren(Kreis k0){}

  public void bewegen() {
    mittelpunkt.add(richtung);
    if ((mittelpunkt.x >200) && (richtung.x == 2)) {
      mittelpunkt.x -=2;
      richtung.x = 0;
      richtung.y = 2;
    } else if ((mittelpunkt.y > 200) && (richtung.x == 0)) {
      mittelpunkt.y -=2;
      richtung.y = 0;
      richtung.x = -2;
    } else if ((mittelpunkt.x < 100) && (richtung.x == -2)) {
      mittelpunkt.x +=2;
      richtung.x = 0;
      richtung.y = -2;
    } else if ((mittelpunkt.y < 100) && (richtung.x == 0 )){
      mittelpunkt.y +=2;
      richtung.y = 0;
      richtung.x = 2;
    }
  }

  // setter- und getter-Methoden
  public int getEnergie() {
    return this.energie;
  }
}
