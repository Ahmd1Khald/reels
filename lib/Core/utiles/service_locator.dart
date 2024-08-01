import 'package:get_it/get_it.dart';

import '../../Features/reels/data/repos/reels_repo_imp.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ReelsRepoImpl>(
    ReelsRepoImpl(),
  );
}
