import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 300,
            width: 500,
            decoration: const BoxDecoration(
                color: Color(0xff56C4C5),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child:Icon(Icons.people_outline,size: 50,color: Colors.white,),
                        radius: 40,
                        backgroundColor: Colors.grey.shade400,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Muhammad Ariq',
                            style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            '@Ariq_01',
                            style: TextStyle(color: Colors.white),
                          ),
                          
                        ],
                      )
                    ],
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.only(left: 200),
                  child: ElevatedButton(onPressed: () => Get.back(), child: Text('Edit Profile'),style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 38,),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('KEEP IT',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('View All',style: TextStyle(color: Color(0xffB4ACAC)),)
                    ],
                  ),
                ),
                SizedBox(height: 25,),
               SizedBox(
                height: 200,
                 child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(left: 15),
                          
                          width: 197,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18),color: Color(0xffECB3B3),),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: 4,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(''),
              );
            }),
                          ),
                        );}),
               ),
               SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.only(left: 16,right: 16),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('Favourite Place',style: TextStyle(fontWeight: FontWeight.bold),),
                     Text('View All',style: TextStyle(color: Color(0xffB4ACAC)),)
                   ],
                 ),
               ),
               SizedBox(height: 20,),
               SizedBox(
                height: 118,
                 child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                   return Container(
                    margin: EdgeInsets.only(left: 15),
                    width: 182,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.amber,),
                    
                   );
                 },),
               )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
