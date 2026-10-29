public class Verwaltung {
  // Attribute
  Pacman pac;
  ArrayList<Kreis> kListe;
  Spielerin spielerin;

  // Konstruktor
  public Verwaltung(Pacman pac0, ArrayList<Kreis> kListe0) {
    this.pac = pac0;
    this.kListe = kListe0;
  }

  // setter- und getter-Methoden
  public void setKListe(ArrayList<Kreis> kListe0) {
    this.kListe = kListe0;
  }

  public ArrayList<Kreis> getKListe() {
    return this.kListe;
  }
  
  public void setSpielerin(Spielerin s0){
    this.spielerin = s0;
  }
  
  public Spielerin getSpielerin(){
    return this.spielerin;
  }
}
