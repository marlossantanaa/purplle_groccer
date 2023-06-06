import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purplle_groccer/src/config/CustomColors.dart';



class HomeTab extends StatelessWidget {
   HomeTab({Key? key}) : super(key: key);
List<String>categories=[
'Convêniencia',
'Frutas',
'Verduras',
'Grãos',
'Carnes ',
'Cereias',
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        excludeHeaderSemantics: true,
        centerTitle: true,
        title: Text.rich(TextSpan(style: const TextStyle(fontSize: 30), children: [
          TextSpan(
              text: 'Purple',
              style: TextStyle(
                color: CustomColors.textColor2,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
              text: 'grocer', style: TextStyle(color: CustomColors.secondary))
        ])),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 17),
              child: Badge(
                backgroundColor: CustomColors.secondary,
                label: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.shopping_cart,
                    )),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: 'Pesquise aqui.',
                  hintStyle:
                      TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  prefixIcon: const Icon(Iconsax.search_normal),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none))),
            ),
          ),
        ],
      ),

      //campo de pesquisa

      //categorias

      //grid
    );
  }
}
