import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/a_propos_page.dart';
import 'package:tada/views/communaute.dart';
import 'package:tada/views/compte_modif_profile.dart';
import 'package:tada/views/compte_modif_psw.dart';
import 'package:tada/views/support_et_contacts1.dart';

class Profil extends StatelessWidget {
  final Color backgroundColor;
  final double width;
  final double height;
  final double borderRadius;

  const Profil({
    super.key,
    this.backgroundColor = const Color(0xffFFE2B0),
    this.width = 361,
    this.height = 55.0,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(250.0), 
        child: AppBar(
          title: const Text('Portefeuille'),
          flexibleSpace: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.0), 
              CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('asset/images/profil_picture.jpg'), // Remplacez par votre image
              ),
              SizedBox(height: 10.0),
              Text(
                'Nom de l\'utilisateur',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'Texte supplémentaire',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'asset/images/heart_Icon.svg',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 10.0),
                    const Text(
                      'XOF 15.000',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0), 
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1.5, // Ratio hauteur/largeur des cellules
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 30.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  buildGridItem(context, 'asset/images/grid_Icon1.svg', 'Contactez le service client', const ServiceClientPage()),
                  buildGridItem(context, 'asset/images/grid_Icon2.svg', 'Item 2', const CompteModifProfile()),
                  buildGridItem(context, 'asset/images/grid_Icon3.svg', 'Item 3', const SupportContacts1()),
                  buildGridItem(context, 'asset/images/grid_Icon4.svg', 'Item 4', const ModifPSW()),
                  buildGridItem(context, 'asset/images/grid_Icon5.svg', 'Item 5', const APropos()),
                  buildGridItem(context, 'asset/images/grid_Icon6.svg', 'Item 6', const Communaute()),
                ],
              ),
              const SizedBox(height: 20.0), 
              SizedBox(
                width: 361,
                height: 55,
                child: TextButton(
                  onPressed: () {
                    // Action du bouton
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(16.0),
                    backgroundColor: const Color(0xffFFCCC7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      //side: BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'asset/images/exit_Icon.svg', 
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 10.0), 
                      const Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Texte 1',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'asset/images/right_arrow_Icon.svg', 
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridItem(BuildContext context, String iconPath, String text, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              iconPath, // Chemin de l'icône SVG
              width: 24,
              height: 24,
            ),
            const SizedBox(height: 10.0), // Espace entre l'icône et le texte
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Exemple de classes de pages pour chaque élément de la grille
class ServiceClientPage extends StatelessWidget {
  const ServiceClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Client'),
      ),
      body: const Center(
        child: Text('Page Service Client'),
      ),
    );
  }
}

