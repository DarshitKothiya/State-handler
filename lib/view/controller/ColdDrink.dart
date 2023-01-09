import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/helper/FirestoreHelper.dart';
import 'package:google_fonts/google_fonts.dart';

class ColdDrink extends StatefulWidget {
  const ColdDrink({Key? key}) : super(key: key);

  @override
  State<ColdDrink> createState() => _ColdDrinkState();
}

class _ColdDrinkState extends State<ColdDrink> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FireStoreHelper.fireStoreHelper.fetchColdDrinkData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {

          QuerySnapshot? res = snapshot.data;
          List data = res!.docs;

          return GridView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              mainAxisExtent: 180,
            ),
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, 'detail', arguments: data[i]);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade200
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                      Text('${data[i]['name']}',style: GoogleFonts.balooBhai2(fontSize: 20,fontWeight: FontWeight.w500),),
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
