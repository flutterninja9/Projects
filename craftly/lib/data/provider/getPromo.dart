import 'package:craftly/data/models/promoModel.dart';
import 'package:craftly/data/repository/fetchPromo.dart';

Future<List<Promo>> getPromo() async {
  List rawPromo = await fetchPromo();
  List<Promo> promos = [];
  rawPromo.map((e) {
    promos.add(Promo.fromJson(e));
  }).toList();
  return promos;
}
