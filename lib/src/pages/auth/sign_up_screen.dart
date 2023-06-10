

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:purplle_groccer/src/config/custom_text_field.dart';

import '../../config/CustomColors.dart';



class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);

  final CelularFormatter=MaskTextInputFormatter(
    mask: '(##)# ####-####',
    filter: {
      '#' :RegExp(r'[0-9]')
    }
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: CustomColors.primary,
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Column(children: [
                  Expanded(
                    child: Center(
                      child: Text.rich(TextSpan(
                          style: const TextStyle(
                            fontSize: 40,
                          ),
                          children: [
                            TextSpan(
                                text: 'Cad',
                                style: TextStyle(
                                    color: CustomColors.textColor2,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: 'astro',
                                style: TextStyle(color: CustomColors.secondary))
                          ])),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 40,
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(45))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextField(
                            icon: Iconsax.personalcard,
                            Label: 'Nome',
                          ),
                          // CustomTextField(
                          //   icon: Icons.file_copy,
                          //   Label: 'Cpf',
                          // ),
                          CustomTextField(
                            icon: Iconsax.login,
                            Label: 'Email',
                            autoCorrect: true,

                          ),
                          CustomTextField(
                            icon: Iconsax.password_check1,
                            Label: 'Senha',
                            isSecret: true,
                          ),

                          CustomTextField(
                            inputFormatters: [CelularFormatter],
                            icon: Icons.phone_android,
                            Label: 'Celular',
                            autoCorrect: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () {},
                                child: const Text(
                                  "Cadastrar usuário",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                          )
                        ],
                      ))
                ]),
                Positioned(
                  left: 10,
                  top: 10,
                  child: SafeArea(
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          }, icon: Icon(Icons.arrow_back_ios,color: CustomColors.textColor2,))),
                )
              ],
            ),
          ),
        ));
  }
}
