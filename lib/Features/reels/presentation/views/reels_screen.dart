import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/Core/utiles/app_functions.dart';
import 'package:reels/Features/reels/presentation/views/widgets/reels_video.dart';

import '../../../../Core/utiles/service_locator.dart';
import '../../../home/presentation/views/home_screen.dart';
import '../../data/repos/reels_repo_imp.dart';
import '../controller/reels_cubit/reels_cubit.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  _ReelsScreenState createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReelsCubit(
        getIt.get<ReelsRepoImpl>(),
      )..fetchReels(),
      child: BlocConsumer<ReelsCubit, ReelsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (ReelsCubit.get(context).realReelsVideos.isEmpty) {
            return const HomeScreen();
          }
          if (ReelsCubit.get(context).realReelsVideos.isNotEmpty) {
            void onVideoEnd() {
              if (_currentPage <
                  (ReelsCubit.get(context).realReelsVideos.length - 1)) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else {
                // Navigate to home screen when all videos have been watched
                AppFunction.pushAndRemove(context, const HomeScreen());
              }
            }

            return Scaffold(
              body: SafeArea(
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (context, index) => ReelsVideoWidget(
                    videoID: ReelsCubit.get(context).realReelsVideos[index].url,
                    onVideoEnd: onVideoEnd, // Pass the callback
                    cubit: ReelsCubit.get(context),
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: ReelsCubit.get(context).realReelsVideos.length,
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                ),
              ),
            );
          }
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
