import 'package:flutter/material.dart';
import 'package:fl_components/themes/themes.dart';

class CustomCardType2 extends StatelessWidget {
  final String imageUrl;
  final String? subtitle;

  const CustomCardType2({super.key, required this.imageUrl, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      elevation: 10,
      shadowColor: AppTheme.primary.withOpacity(0.5),
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
            height: 250,
            fit: BoxFit.fitHeight,
            fadeInDuration: const Duration(milliseconds: 600),
          ),
          if (subtitle != null)
            Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                child: Text(subtitle!))
        ],
      ),
    );
  }
}
