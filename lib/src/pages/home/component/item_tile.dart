import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purplle_groccer/src/models/item_model.dart';
import 'package:purplle_groccer/src/pages/product/product_screen.dart';

import '../../../services/utils.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;
  ItemTile({Key? key, required this.item}) : super(key: key);
  final UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: (){

            Navigator.of(context).push(MaterialPageRoute(builder: (c){
              return  ProductScreen(item: item,);
            }));
          },
          child: Card(
            elevation: 2,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: Hero(tag: item.imageUrl,
                  transitionOnUserGestures: true,
                  child: Image.asset(item.imageUrl))),
                  //image
                  //Nome
                  Text(
                    item.itemName,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  //preco-unidade
                  Row(
                    children: [
                      Text(
                  utilsServices.priceToCurrency(   item.price),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                      ),
                      Text(
                        ' /${item.unit},',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: (){},
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.purple,
                borderRadius:    BorderRadius.only(bottomLeft: Radius.circular(15,),topRight: Radius.circular(20))
              ),
              height: 40,
              width: 35,
              child: const Icon(Iconsax.shopping_cart,color: Colors.white,size: 19,) ,
            ),
          ),
        )
      ],
    );
  }
}
