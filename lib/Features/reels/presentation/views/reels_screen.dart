import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reels/Features/reels/presentation/views/widgets/reels_video.dart';

import '../../../../Core/utiles/service_locator.dart';
import '../../data/repos/reels_repo_imp.dart';
import '../controller/reels_cubit/reels_cubit.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double iconAppbar = 28;
    return BlocProvider(
      create: (context) => ReelsCubit(
        getIt.get<ReelsRepoImpl>(),
      )..fetchReels(),
      child: BlocConsumer<ReelsCubit, ReelsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemBuilder: (context, index) => ReelsVideoWidget(
                        videoID: ReelsCubit.get(context).testReelsVideos[index],
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
