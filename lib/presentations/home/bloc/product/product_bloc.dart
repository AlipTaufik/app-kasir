// Generated by Dart Safe Data Class Generator. * Change this header on extension settings *
// ignore_for_file: type=lint
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_kasir/data/datasource/product_remote_datasource.dart';
import 'package:flutter_kasir/data/models/response/product_response_model.dart';

part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRemoteDatasource _productRemoteDatasource;
  ProductBloc(
    this._productRemoteDatasource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      final response = await _productRemoteDatasource.getProducts();
      response.fold(
      (l) => emit(ProductState.error(l)), 
      (r) => emit(ProductState.success(r.data)),
      );
    });
  }
}
