import 'package:flutter/material.dart';

class Mydesign extends StatelessWidget {
  String title;
  String price;
  String image;
  // double id;

  Mydesign({
    required this.title,
    required this.price,
    required this.image,
    // required this.id
  });

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow:[
                    BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(4, 9), //
                    )// Shadow position
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),


          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 200,top: 125),
                child: ElevatedButton(onPressed: (){}, child: Text("Add To Cart",style:   TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),)),),
              Container(
                margin: EdgeInsets.only(left: 200,top: 5),
                child: ElevatedButton(onPressed: (){}, child: Text("View Detail",style:   TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),)),),

            ],
          ),
          Positioned(
            left: 30,
            top: 20,
            child: Container(
              width: 140,
              height: 175,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(image)),
              ),
            ),
          ),
          // Text(title),
          Positioned(
            left: 185,
            top: 20,
            child: Container(
              child: Text("Title : "'${title}',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: Colors.black
              ),),
              width: 150,
              height: 60,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Positioned(
            left: 190,
            top: 80,
            child: Container(
              child: Text("Price :"'${price}',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                  fontSize: 25
              ),),
              width: 150,
              height: 30,
              // color: Colors.black,
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //      borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: ElevatedButton(onPressed: (){}, child: Text("Add To Cart")),
          //
          // )


        ],

    ),
      );
  }
}
