part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class Loading extends ProductState {}

class Loaded extends ProductState {
  List<Product> products;
  Loaded({@required this.products});

  @override
  List<Object> get props => [products];
}

class LoadingFailed extends ProductState {}

class AccountDetail extends ProductState {
  User userAccount;
  AccountDetail({@required this.userAccount});
  @override
  List<Object> get props => [userAccount];
}

class SearchLoaded extends ProductState {
  List<Product> products;
  SearchLoaded({@required this.products});
  @override
  List<Object> get props => [products];
}

class WishListPage extends ProductState {
  List<Product> products;
  WishListPage({@required this.products});
  @override
  List<Object> get props => [products];
}

class AddressLoaded extends ProductState {
  List<AddressModel> addresses;
  AddressLoaded({@required this.addresses});
  @override
  List<Object> get props => [addresses];
}
