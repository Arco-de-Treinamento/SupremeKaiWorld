import 'package:url_launcher/url_launcher.dart';

Future<void> laucherLink(String link) async {
  if (!await launchUrl(Uri.parse(link))) {
    throw Exception('Could not launch $link');
  }
}