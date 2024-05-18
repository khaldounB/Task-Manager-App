// Package imports:
import 'package:url_launcher/url_launcher.dart';

class UrlServices {
  Future<bool> openLink(String uri) async {
    if (await canLaunchUrl(Uri.parse(uri))) {
      await launchUrl(Uri.parse(uri));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> makeCall(String phone) async {
    String uri = 'tel:$phone';

    if (await canLaunchUrl(Uri.parse(uri))) {
      await launchUrl(Uri.parse(uri));
      return true;
    } else {
      return false;
    }
  }

  Future<bool> sendEmail(String email, String subject, String body) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(
          <String, String>{'subject': subject, 'body': body}),
    );

    launchUrl(emailLaunchUri);
    return true;
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> openGoogleMaps(
      {required double latitude, required double longitude}) async {
    String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launchUrl(Uri.parse(googleMapsUrl));
    } else {
      throw 'Could not launch Google Maps';
    }
  }
}
