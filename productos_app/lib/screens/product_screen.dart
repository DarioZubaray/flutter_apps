import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:productos_app/providers/product_form_provider.dart';
import 'package:productos_app/services/product_service.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {

  static const String routeName  = 'product';
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct),
      child: const _ProductScreenBody()
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);
    final productService = Provider.of<ProductService>(context);
    final product = productService.selectedProduct;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(url: product.picture),

                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios_new, size: 40, color: Colors.white),
                  )
                ),

                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image = await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

                      if (image == null) {
                        return;
                      }

                      productService.updateSelectedProductImage(image.path);

                    },
                    icon: const Icon(Icons.photo, size: 40, color: Colors.white),
                  )
                ),

                Positioned(
                  top: 120,
                  right: 20,
                  child: IconButton(
                    onPressed: () async {

                      final ImagePicker picker = ImagePicker();
                      final XFile? image = await picker.pickImage(source: ImageSource.camera, imageQuality: 100);

                      if (image == null) {
                        return;
                      }

                      productService.updateSelectedProductImage(image.path);
                    },
                    icon: const Icon(Icons.camera_alt, size: 40, color: Colors.white)
                  )
                ),

              ],
            ),

            _ProductForm(),

            const SizedBox(height: 100)
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: productService.isSaving
        ? null
        : () async {
          if (!productForm.isValidForm()) return;

          final String? imageUrl = await productService.uploadImage();
          if (imageUrl != null) {
            productForm.product.picture = imageUrl;
          }

          await productService.saveOrCreateProduct(product);
        },
        child: productService.isSaving
          ? const CircularProgressIndicator(color: Colors.white)
          : const Icon(Icons.save_outlined),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
  
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: product.name,
                  onChanged: (value) => product.name = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El nombre es obligatorio';
                    }
                    return null;
                  },
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Nombre del producto',
                    labelText: 'Nombre:',
                    prefixIcon: Icons.abc
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: product.price.toString(),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  onChanged: (value) {
                    if ( double.tryParse(value) == null ) {
                      product.price = 0;
                    } else {
                      product.price = double.parse(value);
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '\$150',
                    labelText: 'Precio:',
                    prefixIcon: Icons.price_change_outlined
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SwitchListTile.adaptive(
                value: product.available,
                title: const Text('Disponible'),
                activeColor: Colors.indigo,
                onChanged: productForm.updateAvailability
              ),


              const SizedBox(height: 10),
            ],
          )
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: const Offset(0, 5),
          blurRadius: 5,
        )
      ]
    );
  }
}