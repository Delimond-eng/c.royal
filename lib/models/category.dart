class Category {
  String icon;
  String title;
  Category({
    this.icon,
    this.title,
  });
}

List<Category> categories = [
  Category(
      icon: "assets/svg/restaurant-svgrepo-com.svg",
      title: "Restau. & lounges"),
  Category(
      icon: "assets/svg/airplane-svgrepo-com.svg", title: "Hôtels & voyages"),
  Category(
      icon: "assets/svg/hairdryer-beauty-svgrepo-com.svg",
      title: "Beauté & parfums"),
  Category(
    icon: "assets/svg/hotel-svgrepo-com.svg",
    title: "Sport & loisirs",
  ),
];
