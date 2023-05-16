import 'package:financeLine/features/admin/screens/admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:financeLine/common/widgets/bottom_bar.dart';
import 'package:financeLine/common/widgets/side_menu.dart';
import 'package:financeLine/features/admin/screens/add_product_screen.dart';
import 'package:financeLine/features/auth/screens/auth_screen.dart';
import 'package:financeLine/features/home/screens/category_deals_screen.dart';
import 'package:financeLine/features/home/screens/home_screen.dart';
import 'package:financeLine/features/product_details/screens/product_details_screen.dart';
import 'package:financeLine/features/search/screens/search_screen.dart';
import 'package:financeLine/models/product.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(builder: (_) => const BottomBar());
    case AddProductScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductScreen());
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => CategoryDealsScreen(category: category));
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => SearchScreen(
                searchQuery: searchQuery,
              ));

    case ProductDetailsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(product: product));
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(child: Text("Screen not Exist")),
              ));
  }
}
