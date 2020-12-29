import 'package:craftly/data/models/order_model.dart';
import 'package:craftly/data/repository/fetchOrders.dart';

Future<List<Order>> getOrders() async {
  List rawOrders = await fetchOrders();
  List<Order> orders = [];
  rawOrders.map((order) {
    orders.add(Order.fromJson(order));
  }).toList();
  return orders.reversed.toList();
}
