import 'package:c_royal/models/configs.dart';
import 'package:c_royal/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesComponent extends StatelessWidget {
  final List<MarchandCategories> data;
  const CategoriesComponent({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        bottom: 10.0,
      ),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: data.map((e) {
          return CategoryCard(
            category: e,
          );
        }).toList(),
      ),
    );
  }
}
