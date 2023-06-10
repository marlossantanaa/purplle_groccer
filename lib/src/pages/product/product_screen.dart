import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purplle_groccer/src/pages/common_widgets/quantity_widget.dart';
import 'package:purplle_groccer/src/services/utils.dart';

import '../../models/item_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.item}) : super(key: key);

  final ItemModel item;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices util = UtilsServices();

  int cartItem = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(),
      backgroundColor: Colors.white.withAlpha(230),
      //conteudo
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Hero(
                      tag: widget.item.imageUrl,
                      transitionOnUserGestures: true,
                      child: Image.asset(widget.item.imageUrl))),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(0, 2),
                        spreadRadius: 3)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.item.itemName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          ),
                        ),
                        QuantityWidget(
                          value: cartItem,
                          suffixText: widget.item.unit,
                          result: ( quantity) {
                            setState(() {
                              cartItem = quantity;
                            });
                          },
                        ),
                      ],
                    ),
                    Text(
                      util.priceToCurrency(widget.item.price),
                      style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SingleChildScrollView(
                          child: Text(
                            widget.item.description,
                            style: const TextStyle(height: 1.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {},
                        label: const Text(
                          'adicionar ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        icon: const Icon(Iconsax.shopping_cart),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
          Positioned(
              left: 10,
              top: 5,
              child: SafeArea(
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      )))),
        ],
      ),
    );
  }
}
