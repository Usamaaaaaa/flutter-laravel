import 'package:fllutter_1/config/color.dart';
import 'package:flutter/material.dart';

class SearchedItem extends StatelessWidget {
  const SearchedItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: Row(
        children: [
          Expanded(child: Container(
            margin:const EdgeInsets.only(right: 8),
            height: 100,
            child: Center(child: Image.asset("images/Shirt.jpeg")),
            )),
          Expanded(child: SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("product Name",
                      style: TextStyle(color: textColor,
                      fontWeight:FontWeight.bold)
                      ),
                    
                    Text("product Name",
                    style: TextStyle(color: textColor,
                    fontWeight:FontWeight.bold)
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 15
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    children: [
                      const Expanded(child: Text("45",style: TextStyle(color: Colors.grey,
                      fontSize: 14),)),
                      Center(
                        child: Icon(Icons.arrow_drop_down,
                        color: primaryColor,),
                      )
                    ],
                  ),
                )
              ],
            ),
            )),
          Expanded(
            child: Container(
            height: 100,
          padding: const EdgeInsets.symmetric(horizontal:15,vertical: 30),
          child: Container(height: 25,width: 50,
           decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30)
                  ),
          child: Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add,
              color: Colors.grey,
              size:20),
              Text("ADD",style: TextStyle(color: primaryColor,
                      fontSize: 14),)
            ],
          )),
          ),

            )
            )
        ],
      ),
    );
  }
}
