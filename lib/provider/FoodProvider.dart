import 'package:flutter/material.dart';

class FoodProvider extends ChangeNotifier {
  List cartProduct = [];

  addToCart({required Map data}) {
    cartProduct.add(data);
    notifyListeners();
  }

  removeFromCart({required Map data}) {
    cartProduct.remove(data);
    notifyListeners();
  }

  increseQuantity({required Map data}){
    data['quantity']++;
    notifyListeners();
  }

  decreseQuantity({required Map data}){
    if(data['quantity']>=1){
      data['quantity']--;
    }
    notifyListeners();
  }

  foodPrice({required Map data}){

    data['total'] = data['price']*data['quantity'];

    return data['total'];

    notifyListeners();
  }

  getTotalPrice(){
    num totalPrice = 0;

    for(Map data in cartProduct){
      totalPrice = totalPrice+(data['price']*data['quantity']);
    }

    return totalPrice;
  }

  getTotalQuantity(){
    num totalQuantity = 0;

    for(Map data in cartProduct){
      totalQuantity = totalQuantity+data['quantity'];
    }

    return totalQuantity;
  }

}
