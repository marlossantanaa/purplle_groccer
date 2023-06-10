import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purplle_groccer/src/pages/common_widgets/quantity_widget_material.dart';

class QuantityWidget extends StatelessWidget {
  final int  value;
  final String suffixText;
  final Function (int quantity)result;
  const QuantityWidget({Key? key, required this.value, required this.suffixText, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 2,
            )
          ]),
      child: Row(
        children: [
          QuantityWidgetMaterial(
            color: Colors.amber,
            icon: Icons.remove,
            onPressed: () {
              if(value ==1)return;
              int resultCount= value -1;
              result(resultCount);
            },
          ),
           Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6
            ),
            child: Text('$value$suffixText',style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
            ),
          ),
          QuantityWidgetMaterial(
            color: Colors.grey,
            icon: Iconsax.add,
            onPressed: () {
              //voltar e finalizar
              int resultCount=value +1;
              result(resultCount);
              print(resultCount);
            },
          ),

        ],
      ),
    );
  }
}
