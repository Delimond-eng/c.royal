class UserHomeData {
  Content content;

  UserHomeData({content});

  UserHomeData.fromJson(Map<String, dynamic> json) {
    content =
        json['content'] != null ? Content.fromJson(json['content']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content.toJson();
    }
    return data;
  }
}

class Content {
  List<Recommandations> recommandations;
  List<Marchands> marchands;

  Content({recommandations, marchands});

  Content.fromJson(Map<String, dynamic> json) {
    if (json['recommandations'] != null) {
      recommandations = <Recommandations>[];
      json['recommandations'].forEach((v) {
        recommandations.add(Recommandations.fromJson(v));
      });
    }
    if (json['marchands'] != null) {
      marchands = <Marchands>[];
      json['marchands'].forEach((v) {
        marchands.add(Marchands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (recommandations != null) {
      data['recommandations'] = recommandations.map((v) => v.toJson()).toList();
    }
    if (marchands != null) {
      data['marchands'] = marchands.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recommandations {
  String marchandId;
  String nom;
  String logo;
  String categorie;
  String distance;
  List<Offres> offres;

  Recommandations({marchandId, nom, logo, categorie, distance, offres});

  Recommandations.fromJson(Map<String, dynamic> json) {
    marchandId = json['marchand_id'];
    nom = json['nom'];
    logo = json['logo'];
    categorie = json['categorie'];
    distance = json['distance'];
    if (json['offres'] != null) {
      offres = <Offres>[];
      json['offres'].forEach((v) {
        offres.add(Offres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['marchand_id'] = marchandId;
    data['nom'] = nom;
    data['logo'] = logo;
    data['categorie'] = categorie;
    data['distance'] = distance;
    if (offres != null) {
      data['offres'] = offres.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Marchands {
  String marchandId;
  String nom;
  String logo;
  String categorie;
  String distance;
  List<Offres> offres;

  Marchands({marchandId, nom, logo, categorie, distance, offres});

  Marchands.fromJson(Map<String, dynamic> json) {
    marchandId = json['marchand_id'];
    nom = json['nom'];
    logo = json['logo'];
    categorie = json['categorie'];
    distance = json['distance'];
    if (json['offres'] != null) {
      offres = <Offres>[];
      json['offres'].forEach((v) {
        offres.add(Offres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['marchand_id'] = marchandId;
    data['nom'] = nom;
    data['logo'] = logo;
    data['categorie'] = categorie;
    data['distance'] = distance;
    if (offres != null) {
      data['offres'] = offres.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offres {
  String offreId;
  String titre;
  String remise;
  List<PointDeVentes> pointDeVentes;

  Offres({offreId, titre, remise, pointDeVentes});

  Offres.fromJson(Map<String, dynamic> json) {
    offreId = json['offre_id'];
    titre = json['titre'];
    remise = json['remise'];
    if (json['point_de_ventes'] != null) {
      pointDeVentes = <PointDeVentes>[];
      json['point_de_ventes'].forEach((v) {
        pointDeVentes.add(PointDeVentes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offre_id'] = offreId;
    data['titre'] = titre;
    data['remise'] = remise;
    if (pointDeVentes != null) {
      data['point_de_ventes'] = pointDeVentes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PointDeVentes {
  String pointDeVenteId;
  String nom;
  String longitude;
  String latitude;
  String distance;

  PointDeVentes({pointDeVenteId, nom, longitude, latitude, distance});

  PointDeVentes.fromJson(Map<String, dynamic> json) {
    pointDeVenteId = json['point_de_vente_id'];
    nom = json['nom'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['point_de_vente_id'] = pointDeVenteId;
    data['nom'] = nom;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['distance'] = distance;
    return data;
  }
}
