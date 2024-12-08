import 'package:flutter/material.dart';
import 'package:scrview/constants.dart';
import 'package:scrview/model/produ_car.dart';
import 'package:scrview/provider/cart_provider.dart';

class AddtoCart extends StatefulWidget {
  final Product product;
  const AddtoCart({super.key, required this.product});

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white, width: 2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      if (currentIndex != 1) {
                        setState(() {
                          currentIndex--;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.remove,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    currentIndex.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        currentIndex++;
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  provider.toggleFavorite(widget.product);
                  const snackBar = SnackBar(
                    content: Text(
                      "Successfully added",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
