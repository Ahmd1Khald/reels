import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../Core/utiles/api_const.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utiles/api_service.dart';
import '../models/reels_model.dart';
import 'reels_repo.dart';

class ReelsRepoImpl implements ReelsRepo {
  @override
  Future<Either<Failure, List<ReelsModel>>> fetchReels() async {
    try {
      Response response = await DioHelper.getData(
        url: "${ApiConst.baseUrl}reels",
      ); // Replace with your API endpoint

      print("+++++++++++++response++++++++++++++");
      print(response.data["reels"]);

      List<dynamic> reelsJson = response.data['reels'];

      List<ReelsModel> reelsList =
          reelsJson.map((json) => ReelsModel.fromJson(json)).toList();

      print("+++++++++++++reelsList++++++++++++++");
      print(reelsList);
      return right(reelsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
