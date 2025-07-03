import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category,required this.onSelectCategory,});
  final Category category;
  final void Function () onSelectCategory;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      // ignore: deprecated_member_use
      splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16),

      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              // ignore: deprecated_member_use
              category.color.withOpacity(0.55),
              // ignore: deprecated_member_use
              category.color.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            // ignore: deprecated_member_use
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
