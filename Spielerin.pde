public class Spielerin {
  // Attribute
  protected String nickname;
  protected int punkte;
  protected int leben;

  // Konstruktor
  public Spielerin (String nn0) {
    this.nickname = nn0;
    this.punkte = 0;
    this.leben = 3;
  }

  // setter- und getter-Methoden
  public void setPunkte(int p0) {
    this.punkte = p0;
  }

  public int getPunkte() {
    return this.punkte;
  }
  
  public void setLeben(int l0){
    this.leben = l0;
  }
  
  public int getLeben(){
    return this.leben;
  }
}
