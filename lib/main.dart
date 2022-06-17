import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_with_provider/common/theme.dart';
import 'package:shopping_cart_with_provider/models/cart.dart';
import 'package:shopping_cart_with_provider/models/catalog.dart';
import 'package:shopping_cart_with_provider/screens/cart.dart';
import 'package:shopping_cart_with_provider/screens/catalog.dart';
import 'package:shopping_cart_with_provider/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CatalogueModel(),
        ),
        ChangeNotifierProxyProvider<CatalogueModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        )
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
          '/catalog': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
