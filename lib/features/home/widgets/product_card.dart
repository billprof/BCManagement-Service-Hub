import 'package:flutter/material.dart';
import 'package:test_project/core/utils.dart';
import 'package:test_project/features/home/models/products.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => Utils().comingSoonMsg(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  constraints: BoxConstraints(minHeight: 160),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Utils.randomColor(),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Image.network(
                    product.thumbnail,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        height: 160,
                        child: Center(child: Text("Image Error")),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      if (product.brand != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            product.brand ?? "",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Icon(Icons.favorite_border, size: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(product.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "GHS ${product.price}",
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text("${product.rating}", style: TextStyle(fontSize: 10)),
                SizedBox(width: 4),
                Icon(Icons.star_rounded, size: 14, color: Colors.amber),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
