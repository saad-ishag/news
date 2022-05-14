import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:know_news/data/network/dio_provider.dart';
import 'package:know_news/logic/bloc_observer.dart';
import 'package:know_news/logic/cubits/news_cubit.dart';
import 'package:know_news/presentation/theme/theme-data.dart';

import 'data/local_storage/cache_preference.dart';
import 'data/network/repository.dart';
import 'logic/blocs/searching_bloc.dart';
import 'logic/cubits/theme_cubit.dart';
import 'presentation/screens/splash-screen.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheProvider.init();
  BlocOverrides.runZoned(
        () => runApp( MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
   final SearchingRepo repo =SearchingRepo();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
            create: (context) => NewsCubit()
              ..fetchBusiness()
              // ..fetchScience()
              //..fetchSports(),
              // ..fetchHealth()
          // if i define them here the shimmer effect in the business screen will not
        // work , why ?
        // because when i was emitting businessLoadingState for all of them (already there shimmer effect has been emitted)
        ),
        BlocProvider(create: (context)=>SearchingBloc(repo: repo)),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(720, 1600),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'UK News',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: BlocProvider.of<ThemeCubit>(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
