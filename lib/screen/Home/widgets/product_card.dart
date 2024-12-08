import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrview/constants.dart';
import 'package:scrview/model/produ_car.dart';
import 'package:scrview/provider/favorite_provider.dart';
import 'package:scrview/screen/Detail/detail.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      product: product,
                    )));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: kcontentColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    product.image,
                    width: 125,
                    height: 125,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '\$${product.price}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      children: List.generate(
                          product.colors.length,
                          (index) => Container(
                                height: 15,
                                width: 15,
                                margin: EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                    color: product.colors[index],
                                    shape: BoxShape.circle),
                              )),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
              child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(10))),
              child: GestureDetector(
                onTap: () {
                  provider.toggleFavorite(product);
                },
                child: Icon(
                  provider.isExist(product)?Icons.favorite:
                  Icons.favorite_border,
                  size: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
