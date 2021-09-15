import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Uitils/Constants.dart';
import 'package:untitled1/Uitils/friends.dart';

class Categories extends StatefulWidget{
  @override
    _Categories createState() => _Categories();
}
class _Categories extends State<Categories>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:AppBar(
       elevation: 0.0,
       title: Text("Categories"),
        centerTitle: true,
     ),
     body: Padding(
       padding: EdgeInsets.all(5.0),
       child: GridView.count(
         crossAxisCount: 2,
         children: List.generate(
           categories.length,
               (index) {
             var cat = categories[index];
             return Container(
               padding: EdgeInsets.all(8.0),
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(8.0),
                 child: Stack(
                   children: <Widget>[
                     Image.asset(
                       cat["img"],
                       height: MediaQuery.of(context).size.height,
                       width: MediaQuery.of(context).size.height,
                       fit: BoxFit.cover,
                     ),
                     Container(
                       decoration: BoxDecoration(
                         gradient: LinearGradient(
                           begin: Alignment.topCenter,
                           end: Alignment.bottomCenter,
                           // Add one stop for each color. Stops should increase from 0 to 1
                           stops: [0.2, 0.7],
                           colors: [
                             cat['color1'],
                             cat['color2'],
                           ],
                         ),
                       ),
                       height: MediaQuery.of(context).size.height,
                       width: MediaQuery.of(context).size.height,
                     ),
                     Center(
                       child: Container(
                         height: MediaQuery.of(context).size.height,
                         width: MediaQuery.of(context).size.height,
                         padding: const EdgeInsets.all(1),
                         // ),
                         child: Center(
                           child: Text(
                             cat["name"],
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 20,
                               fontWeight: FontWeight.bold,
                             ),
                             textAlign: TextAlign.center,
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             );
           },
         ),
       ),
     ),
   );
  }


}
class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Trending Restaurants"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10.0,
        ),
        child: ListView(
          children: <Widget>[
            SearchCard(),
            SizedBox(height: 10.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: restaurants == null ? 0 : restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                Map restaurant = restaurants[index];

                return TrendingItem(
                  img: restaurant["img"],
                  title: restaurant["title"],
                  address: restaurant["address"],
                  rating: restaurant["rating"],
                );
              },
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
class TrendingItem extends StatefulWidget {
  final String img;
  final String title;
  final String address;
  final String rating;

  TrendingItem({
    Key? key,
    required this.img,
    required this.title,
    required this.address,
    required this.rating,
  }) : super(key: key);

  @override
  _TrendingItemState createState() => _TrendingItemState();
}

class _TrendingItemState extends State<TrendingItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        "${widget.img}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.0,
                    right: 6.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Constants.ratingBG,
                              size: 10.0,
                            ),
                            Text(
                              " ${widget.rating} ",
                              style: TextStyle(
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6.0,
                    left: 6.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          " OPEN ",
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "${widget.title}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "${widget.address}",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}