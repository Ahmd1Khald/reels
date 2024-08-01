part of 'reels_cubit.dart';

@immutable
abstract class ReelsState {}

class ReelsInitialState extends ReelsState {}

class LoadingMyItemsReelsState extends ReelsState {}

class ErrorMyItemsReelsState extends ReelsState {
  final String error;

  ErrorMyItemsReelsState(this.error);
}

class SuccessMyItemsReelsState extends ReelsState {
  final List<ReelsModel> value;

  SuccessMyItemsReelsState(this.value);
}
