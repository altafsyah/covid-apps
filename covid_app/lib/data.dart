class Data {
  String? positif;
  String? sembuh;
  String? rawat;
  String? dead;
  

  Data({
    this.positif,
    this.sembuh,
    this.rawat,
    this.dead
  });

  Data.fromJson(json){
    positif = json['positif'];
    sembuh = json['sembuh'];
    rawat = json['dirawat'];
    dead = json['meninggal'];
  }
  
}