import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mon_marche_domestique/common_widgets/custom_drawer.dart';
import 'package:mon_marche_domestique/core/style.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custome_appbar.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/rich_text.dart';

class ItemDetailsPage extends StatefulWidget {
  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}
final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

class _ItemDetailsPageState extends State<ItemDetailsPage> {

  final List<Widget> imageSliders = imgList.map((item) => 
       Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        )
    .toList();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: const CustomeAppBar(
        title: 'Details',
        icon: Icons.menu,
        color: Colors.indigo,
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imageSliders,
          ),

          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.indigo[100],
                boxShadow: [BoxShadow(blurRadius: 1.0, color: Colors.indigo)],
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Center(
                    child: Text(
                      'Item Name',
                      style: itemTitle,
                    ),
                  ),
                  
                  CustomRichText(title: 'Mark', details: 'Chetoura',),
                  CustomRichText(title: 'Quantity', details: '50',),
                  CustomRichText(title: 'Date of adding', details: '2020_10_05',),
                  CustomRichText(title: 'Date of expiration', details: '2020_10_05',),
                  CustomRichText(title: 'Description', details: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry'
                            'Lorem Ipsum has been the industry',),
                  
                ],
              ),
            ),
          ),


          
        ],
      ),
    );
  }
}