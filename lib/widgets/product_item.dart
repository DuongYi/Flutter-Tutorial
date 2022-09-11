import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ProductItem({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: const Icon(Icons.favorite),
          color: Colors.red,
          onPressed: () {},
        ),
        title: Text(widget.title),
        trailing: IconButton(
          icon: const Icon(Icons.shopping_cart),
          color: Colors.red,
          onPressed: () {},
        ),
      ),
      child: Image.network(widget.imageUrl, fit: BoxFit.cover),
    );
  }
}
