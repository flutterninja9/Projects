import 'package:craftly/data/models/addressModel.dart';
import 'package:craftly/data/repository/fecthAddress.dart';

Future<List<AddressModel>> getAddress() async {
  List rawAddresses = await fetchAddress();
  List<AddressModel> parsedAddresses = [];
  rawAddresses
      .map((address) => parsedAddresses.add(AddressModel.fromJson(address)))
      .toList();
  return parsedAddresses;
}
