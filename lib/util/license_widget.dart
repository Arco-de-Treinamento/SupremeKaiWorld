import 'package:flutter/material.dart';
import 'package:supreme_kai_world/util/laucher_link.dart';
import 'package:supreme_kai_world/themes/game_text_style.dart';
import 'package:supreme_kai_world/themes/game_palette.dart';
import 'package:supreme_kai_world/util/retrotext_button.dart';

/// A classe [LicenseInfoWidget] define o widget que comporta os creditos e licenças de assets usados no projeto.
class LicenseInfoWidget extends StatelessWidget {
  const LicenseInfoWidget(
    this.licenseTitle, {
    super.key,
    required this.licenseContent,
    required this.licenseTagPath,
    required this.repositoryLink,
  });

  final String licenseTitle;
  final String licenseContent;
  final String licenseTagPath;
  final String repositoryLink;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          licenseTitle,
          style: GameTextStyle.titleMedium.primary,
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                licenseContent,
                textAlign: TextAlign.justify,
                style: GameTextStyle.bodyTextMedium.primary,
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
            RetroTextButton(
              'Ir para a página',
              buttonColor: GamePalette.secondary,
              textStyle: GameTextStyle.buttonSmall.primary,
              withShadow: false,
              onPressed: () => launchWebLink(repositoryLink),
            ),
          ],
        ),
      ],
    );
  }
}
