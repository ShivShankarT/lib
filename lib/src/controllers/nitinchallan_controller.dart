import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../models/cart.dart';
import '../models/coupon.dart';
import '../models/credit_card.dart';
import '../models/food_order.dart';
import '../models/order.dart';
import '../models/order_status.dart';
import '../models/payment.dart';
import '../models/food.dart';
import '../repository/food_repository.dart' as foodRepo;
import '../repository/order_repository.dart' as orderRepo;
import '../repository/settings_repository.dart' as settingRepo;
import '../repository/user_repository.dart' as userRepo;
import 'cart_controller.dart';

class NitinChallanController extends CartController {
  Payment payment;
  CreditCard creditCard = new CreditCard();
  bool loading = true;

  NitinChallanController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    //listenForCreditCard();//  nitin commmented on 20-10-18
    payment = new Payment("Pay on Pickup"); // for cash on delivery payments -- added by Nitin
  }

  void listenForCreditCard() async {
    creditCard = await userRepo.getCreditCard();
    setState(() {});
  }

  @override
  void onLoadingCartDone() {
    if (payment != null) addOrder(carts);
    super.onLoadingCartDone();
  }
  void nitinAddOrder() async {
    //Payment payment1 = new Payment(method)
    Order _order = new Order();
    _order.foodOrders = new List<FoodOrder>();
    _order.tax = 180; //carts[0].food.restaurant.defaultTax;
    _order.deliveryFee = 100;//payment.method == 'Pay on Pickup' ? 0 : carts[0].food.restaurant.deliveryFee;
    OrderStatus _orderStatus = new OrderStatus();
    _orderStatus.id = '1'; // TODO default order status Id
    _order.orderStatus = _orderStatus;
    _order.deliveryAddress = settingRepo.deliveryAddress.value;
    Food food1;// = new Food();
    /*food1.id = "9";
    food1.name = "Challan No Parking";
    food1.description = "Challan For No Parking";
    food1.price = 1000;
    food1.discountPrice = 0;
    food1.id = "9";
    food1.id = "9";
     */

    {
      food1 = await foodRepo.nitingetFood("9");
    }

    //carts.forEach((_cart) {
      FoodOrder _foodOrder = new FoodOrder();
      _foodOrder.quantity = 1;
      _foodOrder.price = 1000;
      _foodOrder.food = food1;
      _foodOrder.extras = food1.extras.where((element) => element.checked).toList();
      _order.foodOrders.add(_foodOrder);
    //});
    orderRepo.addOrder(_order, this.payment).then((value) async {
      settingRepo.coupon = new Coupon.fromJSON({});
      return value;
    }).then((value) {
      if (value is Order) {
        setState(() {
          loading = false;
        });
      }
    });
  }

  void addOrder(List<Cart> carts) async {
    Order _order = new Order();
    _order.foodOrders = new List<FoodOrder>();
    _order.tax = carts[0].food.restaurant.defaultTax;
    _order.deliveryFee = payment.method == 'Pay on Pickup' ? 0 : carts[0].food.restaurant.deliveryFee;
    OrderStatus _orderStatus = new OrderStatus();
    _orderStatus.id = '1'; // TODO default order status Id
    _order.orderStatus = _orderStatus;
    _order.deliveryAddress = settingRepo.deliveryAddress.value;
    carts.forEach((_cart) {
      FoodOrder _foodOrder = new FoodOrder();
      _foodOrder.quantity = _cart.quantity;
      _foodOrder.price = _cart.food.price;
      _foodOrder.food = _cart.food;
      _foodOrder.extras = _cart.extras;
      _order.foodOrders.add(_foodOrder);
    });
    orderRepo.addOrder(_order, this.payment).then((value) async {
      settingRepo.coupon = new Coupon.fromJSON({});
      return value;
    }).then((value) {
      if (value is Order) {
        setState(() {
          loading = false;
        });
      }
    });
  }

  void updateCreditCard(CreditCard creditCard) {
    userRepo.setCreditCard(creditCard).then((value) {
      setState(() {});
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text(S.of(context).payment_card_updated_successfully),
      ));
    });
  }
}
