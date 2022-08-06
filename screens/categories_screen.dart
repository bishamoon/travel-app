import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
        maxCrossAxisExtent: 200,
      ),
      children: Categories_data.map((categoryData) => CategoryItem(
              categoryData.id!, categoryData.title!, categoryData.imageUrl!))
          .toList(),
    );
  }
}
