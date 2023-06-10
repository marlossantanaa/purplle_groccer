import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purplle_groccer/src/config/CustomColors.dart';

import 'component/item_tile.dart';
import '../../config/app_data.dart' as app_data;
import 'component/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        excludeHeaderSemantics: true,
        centerTitle: true,
        title:
            Text.rich(TextSpan(style: const TextStyle(fontSize: 30), children: [
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
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    category: app_data.categories[index],
                    isSelected: app_data.categories[index] == selectedCategory,
                    onPressed: () {
                      setState(() {
                        selectedCategory = app_data.categories[index];
                      });
                    },
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: app_data.categories.length),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.builder(
              padding:EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                childAspectRatio: 9/11.5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
               itemCount: app_data.items.length,
                itemBuilder: (_,index){
                  return  ItemTile(item: app_data.items[index],

                  );
                }),
          )
        ],
      ),

      //categorias

      //grid
    );
  }
}
