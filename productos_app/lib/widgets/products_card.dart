import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [

            _BackgroundImage(url: product.picture ),

            _ProductDetails(title: product.name, id: product.id,),

            Positioned(
              top: 0,
              right: 0,
              child: _PriceTag(price: product.price)
            ),

            if (!product.available)
              const Positioned(
                top: 0,
                left: 0,
                child: _NotAvailable()
              ),

          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 7),
            blurRadius: 10
          )
        ]
      );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key, required this.url,
  }) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: (url == null
          ? const Image(
            image: AssetImage('assets/no-image.png'),
            fit: BoxFit.cover,
          )
          : FadeInImage(
            placeholder: const AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(url!),
            fit: BoxFit.cover,
          )
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    Key? key, required this.title, required this.id,
  }) : super(key: key);

  final String title;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          height: 70,
          decoration: _buildBoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              Text(
                'Id: $id',
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topRight: Radius.circular(25))
  );
}

class _PriceTag extends StatelessWidget {
  const _PriceTag({
    Key? key, required this.price,
  }) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomLeft: Radius.circular(25))
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$$price', style: const TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
    );
  }
}

class _NotAvailable extends StatelessWidget {
  const _NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25))
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'No disponible',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
