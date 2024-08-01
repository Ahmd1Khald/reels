import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../Core/utiles/api_const.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utiles/api_service.dart';
import '../models/reels_model.dart';
import 'reels_repo.dart';

class ReelsRepoImpl implements ReelsRepo {
  @override
  Future<Either<Failure, List<ReelsModel>>> fetchProduct() async {
    try {
      Response response = await DioHelper.getData(
        url: "${ApiConst.baseUrl}admin/product/list",
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTNmYzg1ZjdiY2UwOTJlYjViYjU2OTMiLCJuYW1lIjoiQWRtaW4iLCJlbWFpbCI6ImFkbWluNTBAZ21haWwuY29tIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNjk4Njc4OTA2LCJleHAiOjE3MDEyNzA5MDZ9.DUqsYcEQcTQCKQLIqebNCAB2hwimj1_ze0OjrurkOXc',
          },
        ),
      ); // Replace with your API endpoint

      print("+++++++++++++response++++++++++++++");
      print(response.data["products"]);

      List<dynamic> brandsJson = response.data['products'];

      List<ReelsModel> productsList =
          await brandsJson.map((json) => ReelsModel.fromJson(json)).toList();

      print("+++++++++++++productsList++++++++++++++");
      print(productsList[0].name);
      return right(productsList);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
