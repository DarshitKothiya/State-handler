import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/provider/FoodProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    QueryDocumentSnapshot? res = ModalRoute.of(context)!.settings.arguments as QueryDocumentSnapshot;
    Map data = res.data() as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      backgroundColor: Colors.green,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 150),
            height: 600,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(120, 70),
                  topRight: Radius.elliptical(120, 70),
                ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 130),
                Text('${data['name']}',style: GoogleFonts.habibi(fontWeight: FontWeight.w500,fontSize: 30,color: Colors.black),),
                const SizedBox(height: 10),
                Text('price:   ₹ ${data['price']}',style: GoogleFonts.balooBhai2(fontSize: 22,fontWeight: FontWeight.w500),),
                const SizedBox(height: 30),
                Text('It is a long established fact that a reader will be distracted by the content of a page when looking at its layout. The point of using Ipsum...',textAlign: TextAlign.center,style: GoogleFonts.balooBhai2(fontWeight: FontWeight.w200,fontSize: 17,color: Colors.black),),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.amber,size: 27,),
                    const SizedBox(width: 5),
                    Text('4.5',style: GoogleFonts.balooBhai2(fontSize: 20,fontWeight: FontWeight.w500),),
                    const Spacer(),
                    Icon(Icons.watch_later_outlined,color: Colors.black,size: 25,),
                    const SizedBox(width: 5),
                    Text('30 Min.',style: GoogleFonts.balooBhai2(fontSize: 20,fontWeight: FontWeight.w500),),
                    const Spacer(),
                    Icon(Icons.bloodtype,color: Colors.red,size: 25,),
                    const SizedBox(width: 5),
                    Text('750 Klc.',style: GoogleFonts.balooBhai2(fontSize: 20,fontWeight: FontWeight.w500),)
                  ],
                ),
                const SizedBox(height: 60),
                GestureDetector(
                  onTap: (){

                    Provider.of<FoodProvider>(context,listen: false).addToCart(data: data);
                    print(Provider.of<FoodProvider>(context,listen: false).cartProduct.length);
                  },
                  child: Container(
                    height: 55,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade200,
                      border: Border.all(color: Colors.black)
                    ),
                    alignment: Alignment.center,
                    child: Text('Add to cart',style: GoogleFonts.balooBhai2(fontSize: 18),),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 150,
            width: 150,
            margin: const EdgeInsets.only(top: 80),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(data['image']),
                scale: 5
              ),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(25),
              color: Colors.green.shade200,
            ),
          )
        ],
      ),
    );
  }
}
