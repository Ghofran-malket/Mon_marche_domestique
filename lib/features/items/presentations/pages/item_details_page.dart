import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mon_marche_domestique/common_widgets/custom_drawer.dart';
import 'package:mon_marche_domestique/core/style.dart';
import 'package:mon_marche_domestique/features/items/domain/entities/item.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custom_pimary_button.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/custome_appbar.dart';
import 'package:mon_marche_domestique/features/items/presentations/widgets/rich_text.dart';
import 'package:intl/intl.dart';

class ItemDetailsPage extends StatefulWidget {
  final Item item;
  ItemDetailsPage({super.key, required this.item});
  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {

  // final List<Widget> imageSliders = imgList
  //     .map(
  //       (item) => Container(
  //         margin: EdgeInsets.all(5.0),
  //         child: ClipRRect(
  //             borderRadius: BorderRadius.all(Radius.circular(5.0)),
  //             child: Stack(
  //               children: <Widget>[
  //                 Image.network(image, fit: BoxFit.cover, width: 1000.0),
  //                 Positioned(
  //                   bottom: 0.0,
  //                   left: 0.0,
  //                   right: 0.0,
  //                   child: Container(
  //                     decoration: BoxDecoration(
  //                       gradient: LinearGradient(
  //                         colors: [
  //                           Color.fromARGB(200, 0, 0, 0),
  //                           Color.fromARGB(0, 0, 0, 0)
  //                         ],
  //                         begin: Alignment.bottomCenter,
  //                         end: Alignment.topCenter,
  //                       ),
  //                     ),
  //                     padding: EdgeInsets.symmetric(
  //                         vertical: 10.0, horizontal: 20.0),
  //                     child: Text(
  //                       'No. ${imgList.indexOf(item)} image',
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 20.0,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             )),
  //       ),
  //     )
  //     .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: const CustomeAppBar(
        title: 'Details',
        icon: Icons.menu,
        color: Colors.white,
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: widget.item.images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(
                          children: <Widget>[
                            Image.network(image,
                                fit: BoxFit.cover, width: 1000.0),
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
                                  widget.item.name,
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
                  );
                },
              );
            }).toList(),
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
                    child: Text(widget.item.name, style: itemTitle),
                  ),
                  CustomRichText(
                    title: 'Mark',
                    details: widget.item.mark,
                  ),
                  CustomRichText(
                    title: 'Quantity',
                    details: widget.item.quantity,
                  ),
                  CustomRichText(
                    title: 'Date of adding',
                    details: DateFormat('MMM dd, yyyy')
                        .format(widget.item.createdAt)
                        .toString(),
                  ),
                  CustomRichText(
                      title: 'Date of expiration',
                      details: DateFormat('MMM dd, yyyy')
                          .format(widget.item.expirationDate)
                          .toString()),
                  CustomRichText(
                    title: 'Description',
                    details: widget.item.description,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomPrimaryButton(
              label: 'Edit',
              onPressed: ()=>{},
            ),
          )
        ],
      ),
    );
  }
}
