class MarchandsGallery {
  Reponse reponse;

  MarchandsGallery({this.reponse});

  MarchandsGallery.fromJson(Map<String, dynamic> json) {
    reponse =
        json['reponse'] != null ? Reponse.fromJson(json['reponse']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (reponse != null) {
      data['reponse'] = reponse.toJson();
    }
    return data;
  }
}

class Reponse {
  List<Galleries> galleries;

  Reponse({this.galleries});

  Reponse.fromJson(Map<String, dynamic> json) {
    if (json['galleries'] != null) {
      galleries = <Galleries>[];
      json['galleries'].forEach((v) {
        galleries.add(Galleries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (galleries != null) {
      data['galleries'] = galleries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Galleries {
  String gallerieId;
  String titre;
  List<Medias> medias;

  Galleries({this.gallerieId, this.titre, this.medias});

  Galleries.fromJson(Map<String, dynamic> json) {
    gallerieId = json['gallerie_id'];
    titre = json['titre'];
    if (json['medias'] != null) {
      medias = <Medias>[];
      json['medias'].forEach((v) {
        medias.add(Medias.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['gallerie_id'] = gallerieId;
    data['titre'] = titre;
    if (medias != null) {
      data['medias'] = medias.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medias {
  String mediaId;
  String media;
  String type;

  Medias({this.mediaId, this.media, this.type});

  Medias.fromJson(Map<String, dynamic> json) {
    mediaId = json['media_id'];
    media = json['media'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['media_id'] = mediaId;
    data['media'] = media;
    data['type'] = type;
    return data;
  }
}
