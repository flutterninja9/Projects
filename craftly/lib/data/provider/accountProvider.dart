import 'package:craftly/data/models/userModel.dart';
import 'package:craftly/data/repository/fetchAccount.dart';

Future<User> getAccountDetails() async {
  try {
    Map<String, dynamic> rawData = await accountDetails();
    User account = User.fromJson(rawData);
    return account;
  } catch (e) {
    print(e);
  }
}
