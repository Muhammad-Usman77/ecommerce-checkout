import 'package:flutter/material.dart';
import 'package:scrview/model/category.dart';
import 'package:scrview/model/produ_car.dart';


import 'package:scrview/screen/Home/widgets/cutom_app_bar.dart';
import 'package:scrview/screen/Home/widgets/image_slider.dart';
import 'package:scrview/screen/Home/widgets/product_card.dart';
import 'package:scrview/screen/Home/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int currentSlider = 0;
  
  @override
  
  Widget build(BuildContext context) {
     List<List<Product>> selectcategories = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              // custom app bar widget
              const CustomeAppBar(),
              const SizedBox(
                height: 5,
              ),
              // home app bar
              const Search(),
              const SizedBox(
                height: 5,
              ),
              ImageSlider(
                  onChange: (value) {
                    setState(() {
                      currentSlider = value;
                    });
                  },
                  currentSlide: currentSlider),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
      height: 135,
      child: ListView.builder(
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selectedIndex == index ? Colors.blue[200]:Colors.transparent,
              ),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(categoriesList[index].image),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    categoriesList[index].title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          );
        },
      ),
    ),
              SizedBox(
                height: 5,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: selectcategories[selectedIndex].length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: selectcategories[selectedIndex][index]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
