import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/formfield.dart';
import '../../components/space_height_custom.dart';
import '../../core/app_assets_link.dart';
import '../../core/utils/helpers.dart';
import '../../old_doc/lib/widgets/app_textfield.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Helpers.getSvg(
                          AppAssetLink.logoSvg,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Gagne plus d’argent avec Tada  !',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const Text(
                        'Entre tes informations personnelles ',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Formfield(
                  label: 'Nom',
                  controller: _firstNameController,
                  ),
                SpaceHeightCustom(breakPoint: BreakPoint.sm,),
             Formfield(
                  label: 'Adresse mail',
                  controller: _emailController,
                  ),
                 SpaceHeightCustom(breakPoint: BreakPoint.sm,),
                 Formfield(
                  label: 'Mot de passe ',
                  controller: _passwordController,
                  isObscure: true,
                  ),
                   SpaceHeightCustom(breakPoint: BreakPoint.sm,),
                   Formfield(
                  label: 'Confirmez le mot de passe',
                  controller: _confirmPasswordController,
                  isObscure: true,
                  ),
                
              
              //   Center(
              //   child: ContinuingButton(
              //     width: 361,
              //     height: 48,
              //     text: 'Continuer',
              //     fontSize: 16,
              //     borderRadius: 8,
              //     onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => const SignInForm())
              //       );
              //     },
              //   ),
              // ),
                // GoogleButton(
                //   onPressed: () {
                //     // Action pour le bouton
                //   },
                //   textColor: const Color(0xff48505E),
                //   borderColor: const Color(0xffB9BDC7),
                //   borderWidth: 1,
                //   borderRadius: 8,
                // ),
        
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Vous avez déjà un compte Tada ?',
                      style: TextStyle(color: Colors.black),
                    ),
                    Spacer(), // Pour séparer les deux textes
                    Text(
                      'Connexion',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
