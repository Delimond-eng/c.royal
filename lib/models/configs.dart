class Configs {
  Config config;

  Configs({config});

  Configs.fromJson(Map<String, dynamic> json) {
    config = json['config'] != null ? Config.fromJson(json['config']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (config != null) {
      data['config'] = config.toJson();
    }
    return data;
  }
}

class Config {
  List<MarchandCategories> marchandCategories;

  Config({marchandCategories});

  Config.fromJson(Map<String, dynamic> json) {
    if (json['marchand_categories'] != null) {
      marchandCategories = <MarchandCategories>[];
      json['marchand_categories'].forEach((v) {
        marchandCategories.add(MarchandCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (marchandCategories != null) {
      data['marchand_categories'] =
          marchandCategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MarchandCategories {
  String marchandCategorieId;
  String icon;
  String categorie;
  Abonnement abonnement;

  MarchandCategories({marchandCategorieId, icon, categorie, abonnement});

  MarchandCategories.fromJson(Map<String, dynamic> json) {
    marchandCategorieId = json['marchand_categorie_id'];
    icon = json['icon'];
    categorie = json['categorie'];
    abonnement = json['abonnement'] != null
        ? Abonnement.fromJson(json['abonnement'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['marchand_categorie_id'] = marchandCategorieId;
    data['icon'] = icon;
    data['categorie'] = categorie;
    if (abonnement != null) {
      data['abonnement'] = abonnement.toJson();
    }
    return data;
  }
}

class Abonnement {
  String abonnementTarifId;
  String montant;
  String devise;

  Abonnement({abonnementTarifId, montant, devise});

  Abonnement.fromJson(Map<String, dynamic> json) {
    abonnementTarifId = json['abonnement_tarif_id'];
    montant = json['montant'];
    devise = json['devise'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['abonnement_tarif_id'] = abonnementTarifId;
    data['montant'] = montant;
    data['devise'] = devise;
    return data;
  }
}
