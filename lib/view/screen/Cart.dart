import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/FoodProvider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 15,
            child: ListView.builder(
                itemCount: Provider.of<FoodProvider>(context, listen: false)
                    .cartProduct
                    .length,
                itemBuilder: (context, i) {
                  Map data = Provider.of<FoodProvider>(context, listen: true)
                      .cartProduct[i];
                  return SizedBox(
                    height: 120,
                    child: Card(
                      elevation: 3,
                      color: Colors.green.shade200,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 10),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(data['image']),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                data['name'],
                                style: GoogleFonts.habibi(fontSize: 20),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '₹ ${Provider.of<FoodProvider>(context, listen: true).foodPrice(data: data)}',
                                style: GoogleFonts.balooBhai2(fontSize: 17),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Provider.of<FoodProvider>(context, listen: false)
                                  .increseQuantity(data: data);
                            },
                            icon: Icon(Icons.add),
                          ),
                          Text(
                            '${data['quantity']}',
                            style: GoogleFonts.habibi(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
                              Provider.of<FoodProvider>(context, listen: false)
                                  .decreseQuantity(data: data);
                            },
                            icon: Icon(Icons.remove),
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            onPressed: () {
                              Provider.of<FoodProvider>(context,listen: false).removeFromCart(data: data);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green.shade400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      'Total Price: ${Provider.of<FoodProvider>(context, listen: true).getTotalPrice()}',
                      style: GoogleFonts.balooBhai2(fontSize: 18)),
                  Container(
                    height: 50,
                    width: 1,
                    color: Colors.black,
                  ),
                  Text(
                    'Total Quantity: ${Provider.of<FoodProvider>(context, listen: true).getTotalQuantity()}',
                    style: GoogleFonts.balooBhai2(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
