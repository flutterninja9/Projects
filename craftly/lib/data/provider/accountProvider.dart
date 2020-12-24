import 'package:craftly/data/models/userModel.dart';
import 'package:craftly/data/repository/fetchAccount.dart';

Future<User> getAccountDetails() async {
  try {
    List<dynamic> rawData = await accountDetails();
    User account = User.fromJson(rawData[0]);
    return account;
  } catch (e) {
    print(e);
  }
}
