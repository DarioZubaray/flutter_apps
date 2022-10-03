import 'package:flutter/material.dart';
import 'package:productos_app/models/product.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/services/services.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'home';
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    if (productService.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        actions: [
          IconButton(
            onPressed: () {
              authService.logout();
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            icon: const Icon(Icons.login_outlined)
          ),
        ]
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return productService.refreshProducts();
        },
        color: Colors.indigo,
        child: ListView.builder(
          itemCount: productService.products.length,
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              productService.selectedProduct = productService.products[index].copy();
              Navigator.pushNamed(context, ProductScreen.routeName);
            },
            child: ProductsCard(product: productService.products[index])
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          productService.selectedProduct = Product(available: true, name: '', price: 0);
          Navigator.pushNamed(context, ProductScreen.routeName);
        }),
        child: const Icon(Icons.add),
      ),

    );
  }
}