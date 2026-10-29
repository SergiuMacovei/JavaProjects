public abstract class Kreis {
  
  // Attribute
  protected PVector mittelpunkt;
  protected int radius;
  protected PVector richtung;

  // Konstruktor
  public Kreis(PVector m0, int r0) {
    this.mittelpunkt = m0;
    this.radius = r0;
  }

  // weitere Methoden
  public void bewegen_light() {
    mittelpunkt.add(richtung);
    if ((mittelpunkt.x-radius <=0) || (mittelpunkt.x+radius >= width)) {
      richtung.x = -richtung.x;
    }
    if ((mittelpunkt.y-radius <=0) || (mittelpunkt.y+radius >= height)) {
      richtung.y = -richtung.y;
    }
  }

  public abstract void zeichnen();
  
  public abstract void bewegen();
  
  public abstract void kollidieren(Kreis k0);

  // setter- und getter-Methoden
  public void setMittelpunkt(PVector m0) {
    this.mittelpunkt = m0;
  }

  public void setRichtung(PVector v0) {
    this.richtung = v0;
  }

  public PVector getMittelpunkt() {
    return this.mittelpunkt;
  }

  public int getRadius() {
    return this.radius;
  }

  public PVector getRichtung() {
    return this.richtung;
  }
}
