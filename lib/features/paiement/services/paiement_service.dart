import 'dart:convert';
import 'dart:html' as html; // import html library for web platform
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../providers/user_provider.dart';

Future<void> makePayment(BuildContext context) async {
  final url = Uri.parse('http://localhost:3000/api/cart-subtotal');
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  final response = await http.get(
    url,
    headers: {'x-auth-token': userProvider.user.token},
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final hostedUrl = data['hostedUrl'];

    if (html.window.navigator.userAgent.contains('Mobile')) {
      // mobile platform
      await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Payment')),
          body: WebView(
            initialUrl: hostedUrl,
          ),
        ),
      ));
    } else {
      // web platform
      html.window.open(hostedUrl, 'payment');
    }
    print(hostedUrl);
  } else {
    // Handle error
  }
}

Future<void> notifyServerPaymentSuccess(
    String paymentId, String chargeId) async {
  final url =
      'http://localhost:3000/success_payment'; // L'URL de votre endpoint pour la notification de paiement réussi
  final response = await http.post(Uri.parse(url), body: {
    'paymentId': paymentId,
    'chargeId': chargeId,
  });

  if (response.statusCode == 200) {
    print('Paiement notifié avec succès !');
  } else {
    print(
        'Erreur lors de la notification du paiement : ${response.statusCode}');
  }
}
