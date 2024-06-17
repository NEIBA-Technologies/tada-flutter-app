import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/bloc/row_animation/row_animation_bloc.dart';
import 'package:tada/bloc/row_animation/row_animation_event.dart';
import 'package:tada/bloc/row_animation/row_animation_state.dart';
import 'package:tada/views/portefeuil/portefeuil_retrait2.dart';
import 'package:tada/widgets/app_button.dart';


class PortefeuilRetrai1 extends StatelessWidget {
  const PortefeuilRetrai1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RowBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Page'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'asset/images/smart_phone_Icon.svg',
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Solde XOF 1500,0',
                    style: TextStyle(fontSize: 24, fontFamily: "SoraSB"),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 5,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.red, Colors.grey],
                        stops: [0.5, 0.5],
                      ),
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Retrait minimum de 3000 FCFA',
                    style: TextStyle(fontSize: 12, fontFamily: "SoraR"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sélectionner un compte',
                    style: TextStyle(fontSize: 16, fontFamily: "SoraSB"),
                  ),
                  SizedBox(height: 10),
                  RowItem(index: 0, title: 'Orange money', subtitle: '0702030456'),
                  SizedBox(height: 10),
                  RowItem(index: 1, title: 'MoMo', subtitle: '0502030456'),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ContinuingButton(
                  width: 321,
                  height: 48,
                  text: 'Envoyer',
                  fontSize: 16,
                  borderRadius: 8,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PortefeuilRetrait2()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;

  const RowItem({required this.index, required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RowBloc, RowState>(
      builder: (context, state) {
        bool isActive = (state is RowActive && state.index == index);
        return GestureDetector(
          onTap: () {
            context.read<RowBloc>().add(ToggleRow(index: index));
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              border: Border.all(
                color: isActive ? Colors.red : Colors.transparent,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 2), 
                ),
              ],
            ),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  'asset/images/basket_Icon.svg',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: "SoraSB",
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xff282828),
                          fontFamily: "Gilroy",
                        ),
                      ),
                    ],
                  ),
                ),
                if (isActive)
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: SvgPicture.asset(
                      'asset/images/red_check_Icon.svg',
                      width: 10,
                      height: 10,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}