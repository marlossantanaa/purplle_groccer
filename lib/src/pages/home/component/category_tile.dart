import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key, required this.category, required this.isSelected,required this.onPressed}) : super(key: key);
final String category;
final bool isSelected;
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: isSelected? Colors.purple :Colors.transparent,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Text(category ,style: TextStyle(color:
          isSelected ? Colors.white : Colors.black38,
fontSize: isSelected ? 17 :14
      ,fontWeight:isSelected ? FontWeight.bold :FontWeight.normal),),
        ),
      ),
    );
  }
}
