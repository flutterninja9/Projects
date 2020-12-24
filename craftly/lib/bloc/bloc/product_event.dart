part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProducts extends ProductEvent {}

class GetAccount extends ProductEvent {}

class SearchProducts extends ProductEvent {
  String query;
  SearchProducts({@required this.query});
  @override
  List<Object> get props => [query];
}

class GotoWishList extends ProductEvent {}

class GetAddress extends ProductEvent {}
