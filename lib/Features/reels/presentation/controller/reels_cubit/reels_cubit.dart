import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/reels_model.dart';
import '../../../data/repos/reels_repo.dart';

part 'reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  ReelsCubit(this.reelsRepo) : super(ReelsInitialState());

  static ReelsCubit get(context) => BlocProvider.of(context);
  final ReelsRepo reelsRepo;

  List<String> testReelsVideos = [
    "https://youtube.com/shorts/SpY6HQYkHuc?si=54d3iXpC-3vMoPJX",
    "https://youtube.com/shorts/SpY6HQYkHuc?si=54d3iXpC-3vMoPJX",
    "https://youtube.com/shorts/SpY6HQYkHuc?si=54d3iXpC-3vMoPJX",
    "https://youtube.com/shorts/SpY6HQYkHuc?si=54d3iXpC-3vMoPJX",
  ];

  List<ReelsModel> realReelsVideos = [];
  Future<void> fetchReels() async {
    emit(LoadingFetchReelsState());
    var result = await reelsRepo.fetchReels();
    result.fold((failure) {
      emit(ErrorFetchReelsState(failure.message));
    }, (value) {
      realReelsVideos = value;
      print("realReelsVideos++++++++++++++++");
      print(realReelsVideos);
      emit(SuccessFetchReelsState(value));
    });
  }
}
