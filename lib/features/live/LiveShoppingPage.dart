import 'package:financeLine/features/live/services/liveservices.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../../../constants/global_variables.dart';
import 'dart:js' as js;

class LiveShoppingPage extends StatefulWidget {
  static const String routeName = '/liveshopping';
  const LiveShoppingPage({Key? key}) : super(key: key);
  @override
  _LiveShoppingPageState createState() => _LiveShoppingPageState();
}

class _LiveShoppingPageState extends State<LiveShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(gradient: GlobalVariables.appBarGradient),
        ),
        title: Text('Live Shopping'),
        centerTitle: true, // Ajout de cette ligne pour centrer le titre
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Bienvenue sur la page Live Shopping!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Image.network(
            'https://i0.wp.com/dmb-shanghai.com/wp-content/uploads/2022/01/live-shopping-1.jpg?resize=1080%2C675&ssl=1',
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await Live(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Couleur de fond du bouton
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Bords arrondis
              ),
            ),
            child: Text(
              'Live Shopping',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Découvrez nos produits en direct et achetez-les!',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
