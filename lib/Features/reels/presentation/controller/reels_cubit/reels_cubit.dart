import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/reels_model.dart';
import '../../../data/repos/reels_repo.dart';

part 'reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  ReelsCubit(this.categoryRepo) : super(ReelsInitialState());

  static ReelsCubit get(context) => BlocProvider.of(context);
  final ReelsRepo categoryRepo;

  List<String> reelsVideos = [
    "d95PPykB2vE",
    "_Td7JjCTfyc",
    "X7jWB6NMB74",
    "kLGaoYbR7LA",
  ];

  // Future<void> fetchItems({String? status}) async {
  //   emit(LoadingItemsReelsState());
  //   var result = await categoryRepo.fetchCatalog(
  //     status: status,
  //   );
  //   result.fold((failure) {
  //     emit(ErrorItemsReelsState(failure.message));
  //   }, (value) {
  //     searchItems = value;
  //     emit(SuccessItemsReelsState(value));
  //   });
  // }
}
