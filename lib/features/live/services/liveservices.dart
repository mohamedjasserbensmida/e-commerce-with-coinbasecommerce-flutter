import 'dart:convert';
import 'dart:html' as html; // import html library for web platform
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../providers/user_provider.dart';

Future<void> Live(BuildContext context) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  final String user = userProvider.user.name;
  final hostedUrl = "http://127.0.0.1:3000/meet?name=$user";

  if (html.window.navigator.userAgent.contains('Mobile')) {
    // mobile platform
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Scaffold(
        body: WebView(
          initialUrl: hostedUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    ));
  } else {
    // web platform
    html.window.open(hostedUrl, 'live');
  }
}
