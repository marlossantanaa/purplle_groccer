import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:purplle_groccer/src/config/custom_text_field.dart';
import 'package:purplle_groccer/src/config/CustomColors.dart';
import 'package:purplle_groccer/src/pages/auth/sign_up_screen.dart';

import '../base/base_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text.rich(TextSpan(
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          TextSpan(
                              text: 'Purple',
                              style: TextStyle(
                                  color: CustomColors.textColor2,
                                  fontWeight: FontWeight.bold)),
                           TextSpan(
                              text: 'grocer', style: TextStyle(color: CustomColors.secondary))
                        ])),
                    //categorias

                    //Text('Seu Mercado em casa'),
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: TextStyle(color: CustomColors.textColor2, fontSize: 20),
                        child: AnimatedTextKit(
                          displayFullTextOnTap: true,

                            totalRepeatCount: 3,
                            pause: Duration.zero,
                            repeatForever: false,//modificar
                            animatedTexts: [
                              FadeAnimatedText('Frutas'),
                              FadeAnimatedText('Verduras'),
                              FadeAnimatedText('Legumes'),
                              FadeAnimatedText('Carnes'),
                              FadeAnimatedText('Cereais'),
                              FadeAnimatedText('Convêniencia'),
                              FadeAnimatedText('Tudo em um só lugar '),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        icon: Iconsax.login,
                        Label: "Login",
                        isSecret: false,
                        autoCorrect: true,

                      ),
                      CustomTextField(
                        icon: (Iconsax.lock),
                        Label: "Senha",
                        isSecret: true,

                      ),
         SizedBox(
           height: 30,
         ),

                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: CustomColors.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c){return BaseScreen();
                              }
                              )
                              );
                            },

                            child:  Text(
                              'Entrar',
                              style: TextStyle(fontSize: 18, color: CustomColors.textColor2),
                            )),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child:  Text(
                            'Esqueceu a senha?',
                            style: TextStyle(color: CustomColors.primary, fontSize: 13),
                          ),
                        ),
                      ),

                      SizedBox(
                          height: 100,
                          child: Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shadowColor: Colors.purple,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (c){
                                 return SignUpScreen();
                                }));
                              },
                              child: const Text.rich(
                                TextSpan(
                                    style: TextStyle(
                                      fontSize: 40,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: 'Ainda não é um Purple? ',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 14)),
                                      TextSpan(
                                          text: 'Clique aqui',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.amber,
                                          ))
                                    ]),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
