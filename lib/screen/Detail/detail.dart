import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:scrview/constants.dart';
import 'package:scrview/model/produ_car.dart';
import 'package:scrview/screen/Detail/widget/addto_cart.dart';
import 'package:scrview/screen/Detail/widget/description.dart';
import 'package:scrview/screen/Detail/widget/detail_app_bar.dart';
import 'package:scrview/screen/Detail/widget/image_slider.dart';
import 'package:scrview/screen/Detail/widget/item_detail.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      //for add to cart
      floatingActionButton: AddtoCart(
        product: widget.product,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            DetailAppBar(product: widget.product),
            MyImageSlider(
                onChange: (index) {
                  setState(() {
                    currentImage = index;
                  });
                },
                image: widget.product.image),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  5,
                  (index) => AnimatedContainer(
                        duration: const Duration(microseconds: 300),
                        width: currentImage == index ? 15 : 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentImage == index
                                ? Colors.black
                                : Colors.transparent,
                            border: Border.all(color: Colors.black)),
                      )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              padding: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 100),
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemDetail(
                    product: widget.product,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Color",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      children: List.generate(
                    widget.product.colors.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          currentColor = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: (const Duration(milliseconds: 300)),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentColor == index
                                ? Colors.white
                                : widget.product.colors[index],
                            border: currentColor == index
                                ? Border.all(
                                    color: widget.product.colors[index],
                                  )
                                : null),
                        padding: currentColor == index
                            ? const EdgeInsets.all(2)
                            : null,
                        margin: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              color: widget.product.colors[index],
                              shape: BoxShape.circle),
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  // for discription
                  Description(description: widget.product.description)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
