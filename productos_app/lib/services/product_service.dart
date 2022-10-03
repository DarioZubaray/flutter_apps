import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:productos_app/models/product.dart';

class ProductService extends ChangeNotifier {

  final String _baseUrl = 'flutter-varios-c9d4f-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  late Product selectedProduct;
  File? newPicturefile;

  final storage = const FlutterSecureStorage();

  bool isLoading = true;
  bool isSaving = false;

  ProductService() {
    loadProducts();
  }

  Future loadProducts() async {
    products.clear();
    isLoading = true;
    notifyListeners();

    final token = await storage.read(key: 'idToken') ?? '';
    final query = { 'auth': token };

    final url = Uri.https(_baseUrl, 'products.json', query);
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode( resp.body );

     productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;

      products.add(tempProduct);
     });

    isLoading = false;
    notifyListeners();
     return products;
  }

  Future refreshProducts() async {
    await loadProducts();
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      await saveProduct(product);
    } else {
     await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> saveProduct(Product product) async {
    final token = await storage.read(key: 'idToken') ?? '';
    final query = { 'auth': token };

    final url = Uri.https(_baseUrl, 'products.json', query);
    final resp = await http.post(url, body: product.toJson());

    final decodedData = resp.body;
    product.id = jsonDecode(decodedData)['name'];
    products.add(product);

    return product.id!;
  }

  Future<String> updateProduct(Product product) async {
    final token = await storage.read(key: 'idToken') ?? '';
    final query = { 'auth': token };

    final url = Uri.https(_baseUrl, 'products/${product.id}.json', query);
    await http.put(url, body: product.toJson());

    final index = products.indexWhere((element) => element.id == product.id );
    products[index] = product;

    return product.id!;
  }

  void updateSelectedProductImage(String path) {
    selectedProduct.picture = path;
    newPicturefile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {

    if (newPicturefile == null) return null;

    isSaving = true;
    notifyListeners();

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dbv4lwto1/image/upload?upload_preset=flutter_varios');

    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', newPicturefile!.path);

    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final response = await http.Response.fromStream(streamResponse);

    if(response.statusCode != 200 && response.statusCode != 201) {
      print('Algo salio mal');
      print(response.body);
      return null;
    }

    newPicturefile = null;

    final decodedData = json.decode( response.body);
    return decodedData['secure_url'];
  }
}