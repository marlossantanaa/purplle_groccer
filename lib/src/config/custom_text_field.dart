import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String Label;
final bool  autoCorrect;
  final bool isSecret;
final List<TextInputFormatter>? inputFormatters;
   CustomTextField({ Key? key, required this.icon, required this.Label,  this.isSecret=false, this.inputFormatters,   this.autoCorrect=false, }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure=false ;

  @override
  void initState() {

    super.initState();
    isObscure=widget.isSecret;

  }

  @override
  Widget build(BuildContext context) {

    return   Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(

autocorrect: widget.autoCorrect,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        decoration: InputDecoration(


          prefixIcon: Icon(widget.icon),
            suffixIcon:widget.isSecret ?    IconButton(onPressed: () {
              setState(() {
                isObscure =!isObscure;
              });
            }, icon: Icon(isObscure ?Iconsax.eye : Iconsax.eye_slash  ),

            ): null,
            labelText: widget.Label,
            isDense: true, border:
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),

        )
        ),
      ),
    );
  }
}
