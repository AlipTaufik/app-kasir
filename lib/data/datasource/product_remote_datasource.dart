import 'package:dartz/dartz.dart';
import 'package:flutter_kasir/core/constants/variables.dart';
import 'package:flutter_kasir/data/datasource/auth_local_datasource.dart';
import 'package:flutter_kasir/data/models/response/product_response_model.dart';
import 'package:http/http.dart' as http;
class ProductRemoteDatasource {
  Future<Either<String, ProductResponseModel>> getProducts()  async {
    final authdata = await AuthLocalDatasource().getAuthData();
    final response = await http.get(Uri.parse('${Variables.baseUrl}/api/product'),
    headers: {
      'Authorization': 'Bearer ${authdata.token}',
    }, 
    );

  if(response.statusCode == 200) {
    return right(ProductResponseModel.fromRawJson(response.body));
  } else {
    return left(response.body);
  }

  }
}
