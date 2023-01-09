import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/helper/FirestoreHelper.dart';
import 'package:google_fonts/google_fonts.dart';

class Vegetable extends StatefulWidget {
  const Vegetable({Key? key}) : super(key: key);

  @override
  State<Vegetable> createState() => _VegetableState();
}

class _VegetableState extends State<Vegetable> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FireStoreHelper.fireStoreHelper.fetchVegetableData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {

          QuerySnapshot? res = snapshot.data;
          List data = res!.docs;

          return GridView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              mainAxisExtent: 220,
            ),
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, 'detail', arguments: data[i]);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade200,
                      border: Border.all(color: Colors.black)
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(data[i]['image']),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      const Divider(color: Colors.black,height: 2,),
                      Text('${data[i]['name']}',style: GoogleFonts.balooBhai2(fontSize: 20,fontWeight: FontWeight.w500),),
                      Text('price:   ₹ ${data[i]['price']}',style: GoogleFonts.balooBhai2(fontSize: 17,fontWeight: FontWeight.w200),),
                      const Divider(color: Colors.black,height: 2,),

                    ],
                  ),
                ),
              );
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
