/* if (json['marchand_categories'] != null) {
      marchandCategories = new List<MarchandCategories>();
      json['marchand_categories'].forEach((v) {
        marchandCategories.add(new MarchandCategories.fromJson(v));
      });
    }
 */
class MarchandCategories {
  String marchandCategorieId;
  String icon;
  String categorie;

  MarchandCategories({this.marchandCategorieId, this.icon, this.categorie});

  MarchandCategories.fromJson(Map<String, dynamic> json) {
    marchandCategorieId = json['marchand_categorie_id'];
    icon = json['icon'];
    categorie = json['categorie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['marchand_categorie_id'] = marchandCategorieId;
    data['icon'] = icon;
    data['categorie'] = categorie;
    return data;
  }
}
