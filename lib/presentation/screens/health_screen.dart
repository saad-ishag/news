import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:know_news/presentation/components/app_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../logic/cubits/news_cubit.dart';
import '../../logic/cubits/theme_cubit.dart';
import '../../show_toast.dart';
import '../components/articles_list.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  fetchData(){
    BlocProvider.of<NewsCubit>(context).fetchHealth();
    // it very important when you need something from the cubit or bloc
    //to use BlocProvider.of(context) or context.watch
  }

  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  void _onRefresh() async{
    fetchData();
    await Future.delayed(const Duration(milliseconds: 2000));
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsCubit>(context).fetchHealth();
  }
  @override
  Widget build(BuildContext context) {
    final bool isDark = context.watch<ThemeCubit>().isDark;
    final health = BlocProvider.of<NewsCubit>(context).health;
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      enablePullDown: true,
      enablePullUp: true,
      header:  WaterDropMaterialHeader(
        backgroundColor: Theme.of(context).backgroundColor,
        color:context.read<ThemeCubit>().isDark?Colors.deepOrangeAccent:Colors.lightBlueAccent ,
      ),
      child: Scaffold(
        appBar: customAppBar(isDark: isDark, context: context, title: 'Health'),
        body: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {
            if (state is NewsNoInternetState) {
              showToast('No internet Connection', ToastGravity.BOTTOM, context);
            }
          },
          builder: (context, state) {
            return ArticlesList(cubitList: health, state: state,);
          },
        ),
      ),
    );
  }
}
