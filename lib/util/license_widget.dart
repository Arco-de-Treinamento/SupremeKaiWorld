import 'package:flutter/material.dart';
import 'package:supreme_kai_world/util/laucher_link.dart';
import 'package:supreme_kai_world/util/pixel_button.dart';

class LicenseWidget extends StatelessWidget {
  const LicenseWidget({
    super.key,
    required this.menssage,
    required this.licenseTagPath,
    required this.repoLink,
    required this.title,
  });

  final String title;
  final String menssage;
  final String licenseTagPath;
  final String repoLink;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'PixelifySans',
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  menssage,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontFamily: 'PixelifySans',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white70,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 24.0),
                height: 36,
                child: Image.asset(licenseTagPath),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PixelButton(
                text: 'Ir para a página',
                backgroundColor: Colors.black45,
                fontColor: Colors.white,
                fontSize: 14.0,
                context: context,
                withShadow: false,
                onTap: () => laucherLink(repoLink),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
