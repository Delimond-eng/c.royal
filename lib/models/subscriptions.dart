class Subscriptions {
  Abonnement abonnement;

  Subscriptions({this.abonnement});

  Subscriptions.fromJson(Map<String, dynamic> json) {
    abonnement = json['abonnement'] != null
        ? Abonnement.fromJson(json['abonnement'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (abonnement != null) {
      data['abonnement'] = abonnement.toJson();
    }
    return data;
  }
}

class Abonnement {
  String abonnementId;
  String expiration;
  List<Souscriptions> souscriptions;

  Abonnement({this.abonnementId, this.expiration, this.souscriptions});

  Abonnement.fromJson(Map<String, dynamic> json) {
    abonnementId = json['abonnement_id'];
    expiration = json['expiration'];
    if (json['souscriptions'] != null) {
      souscriptions = <Souscriptions>[];
      json['souscriptions'].forEach((v) {
        souscriptions.add(Souscriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['abonnement_id'] = abonnementId;
    data['expiration'] = expiration;
    if (souscriptions != null) {
      data['souscriptions'] = souscriptions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Souscriptions {
  String montant;
  String devise;
  String categorie;
  int usage;

  Souscriptions({this.montant, this.devise, this.categorie, this.usage});

  Souscriptions.fromJson(Map<String, dynamic> json) {
    montant = json['montant'];
    devise = json['devise'];
    categorie = json['categorie'];
    usage = json['usage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['montant'] = montant;
    data['devise'] = devise;
    data['categorie'] = categorie;
    data['usage'] = usage;
    return data;
  }
}
