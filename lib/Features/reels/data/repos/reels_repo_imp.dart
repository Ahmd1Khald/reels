import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../Core/utiles/api_const.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utiles/api_service.dart';
import '../models/reels_model.dart';
import '../models/watched_model.dart';
import 'reels_repo.dart';

class ReelsRepoImpl implements ReelsRepo {
  @override
  Future<Either<Failure, List<ReelsModel>>> fetchReels() async {
    try {
      // Response response = await DioHelper.getData(
      //   url: "${ApiConst.baseUrl}reels",
      // ); // Replace with your API endpoint

      var response = {
        "reels": [
          {
            "_id": "66ad52498692ff76fbe9a2db",
            "url": "https://youtube.com/shorts/SpY6HQYkHuc?si=54d3iXpC-3vMoPJX",
            "createdAt": "2024-08-02T21:40:25.771Z",
            "expiresAt": "2024-08-03T21:40:25.772Z",
            "__v": 0
          },
          {
            "_id": "66ad52498692ff76fbe9a2db",
            "url": "https://youtube.com/shorts/SpY6HQYkHuc?si=54d3iXpC-3vMoPJX",
            "createdAt": "2024-08-02T21:40:25.771Z",
            "expiresAt": "2024-08-03T21:40:25.772Z",
            "__v": 0
          },
          {
            "_id": "66ad52498692ff76fbe9a2db",
            "url": "https://youtube.com/shorts/SpY6HQYkHuc?si=54d3iXpC-3vMoPJX",
            "createdAt": "2024-08-02T21:40:25.771Z",
            "expiresAt": "2024-08-03T21:40:25.772Z",
            "__v": 0
          },
          {
            "_id": "66ad52498692ff76fbe9a2db",
            "url": "https://youtube.com/shorts/SpY6HQYkHuc?si=54d3iXpC-3vMoPJX",
            "createdAt": "2024-08-02T21:40:25.771Z",
            "expiresAt": "2024-08-03T21:40:25.772Z",
            "__v": 0
          },
        ]
      };

      print("+++++++++++++response++++++++++++++");
      //print(response.data["reels"]);
      print(response["reels"]?[1]);

      //List<dynamic> reelsJson = response.data['reels'];
      List<dynamic>? reelsJson = response['reels'];

      List<ReelsModel> reelsList =
          reelsJson!.map((json) => ReelsModel.fromJson(json)).toList();

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

  @override
  Future<Either<Failure, WatchedReelsModel>> removeReels(
      {required String videoId}) async {
    try {
      Response response = await DioHelper.getData(
        url: "${ApiConst.baseUrl}reels/$videoId",
      ); // Replace with your API endpoint

      WatchedReelsModel model =
          WatchedReelsModel.fromJson(response as Map<String, dynamic>);
      print(model.message); // Output: watched

      // Convert WatchedReelsModel instance back to JSON
      Map<String, dynamic> json = model.toJson();
      print(json); // Output: {message: watched}
      return right(model);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
