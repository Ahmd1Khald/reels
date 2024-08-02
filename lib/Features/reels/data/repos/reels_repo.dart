import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/reels_model.dart';

abstract class ReelsRepo {
  Future<Either<Failure, List<ReelsModel>>> fetchReels();
}
