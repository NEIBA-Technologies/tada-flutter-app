import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Importation pour charger des images SVG

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
        preferredSize: const Size.fromHeight(250.0), // Hauteur personnalisée de l'AppBar
        child: AppBar(
          title: const Text('Portefeuille'),
          flexibleSpace: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.0), // Espace supplémentaire sous le titre
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
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    SvgPicture.asset(
                      'asset/images/heart_Icon.svg', 
                      width: 23,
                      height: 23,
                    ),
                    const SizedBox(width: 10.0),
                    const Text(
                      'XOF 15.000',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              const SizedBox(height: 20.0), // Espacement entre le container et la grille
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1.5, // Ratio hauteur/largeur des cellules
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 30.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  buildGridItem('asset/images/grid_Icon1.svg', 'Contactez le service client'),
                  buildGridItem('asset/images/grid_Icon2.svg', 'Item 2'),
                  buildGridItem('asset/images/grid_Icon3.svg', 'Item 3'),
                  buildGridItem('asset/images/grid_Icon4.svg', 'Item 4'),
                  buildGridItem('asset/images/grid_Icon5.svg', 'Item 5'),
                  buildGridItem('asset/images/grid_Icon6.svg', 'Item 6'),
                ],
              ),
              const SizedBox(height: 20.0), // Espacement avant le dernier bouton
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
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'asset/images/exit_Icon.svg', // Chemin de votre image SVG
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 10.0), // Espace entre l'image SVG et le texte
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
                        'asset/images/right_arrow_Icon.svg', // Chemin de votre image
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

  Widget buildGridItem(String iconPath, String text) {
    return Container(
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
    );
  }
}
