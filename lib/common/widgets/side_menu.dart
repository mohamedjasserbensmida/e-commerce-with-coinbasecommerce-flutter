import 'package:badges/badges.dart' as badge;
import 'package:financeLine/features/admin/screens/add_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:financeLine/constants/global_variables.dart';
import 'package:financeLine/features/account/screens/account_screen.dart';
import 'package:financeLine/features/cart/screens/cart_screen.dart';
import 'package:financeLine/features/cart/widgets/cart_product.dart';
import 'package:financeLine/features/home/screens/home_screen.dart';
import 'package:financeLine/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  static const String routeName = "/actual-home";
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int _page = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
    const AddProductScreen()
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
      Navigator.pop(context); // Ferme le menu
      if (_page == 3) {
        Navigator.pushNamed(context, AddProductScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon application'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: GlobalVariables.backgroundColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Accueil'),
              selected: _page == 0,
              onTap: () => updatePage(0),
            ),
            ListTile(
              leading: const Icon(Icons.person_outlined),
              title: const Text('Mon compte'),
              selected: _page == 1,
              onTap: () => updatePage(1),
            ),
            ListTile(
              leading: badge.Badge(
                elevation: 0,
                badgeContent: Text(userCartLen.toString()),
                badgeColor: Colors.white,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
              title: const Text('Mon panier'),
              selected: _page == 2,
              onTap: () => updatePage(2),
            ),
            ListTile(
              leading: const Icon(Icons.add_box_outlined),
              title: const Text('Ajouter un produit'),
              selected: _page == 3,
              onTap: () => updatePage(3),
            ),
          ],
        ),
      ),
      body: pages[_page],
    );
  }
}
