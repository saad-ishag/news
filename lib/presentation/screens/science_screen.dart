import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:know_news/presentation/components/app_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../logic/cubits/news_cubit.dart';
import '../../logic/cubits/theme_cubit.dart';
import '../../show_toast.dart';
import '../components/articles_list.dart';

class ScienceScreen extends StatefulWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  State<ScienceScreen> createState() => _ScienceScreenState();
}



class _ScienceScreenState extends State<ScienceScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsCubit>(context).fetchScience();
  }


  fetchData(){
    BlocProvider.of<NewsCubit>(context).fetchScience();
    // it very important when you need something from the cubit or bloc
    //to use BlocProvider.of(context) or context.watch or .read
  }

  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  void _onRefresh() async{
    fetchData();
    await Future.delayed(const Duration(milliseconds: 2000));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.watch<ThemeCubit>().isDark;
    final science = BlocProvider.of<NewsCubit>(context).science;
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      enablePullDown: true,
      header:  WaterDropMaterialHeader(
        backgroundColor: Theme.of(context).backgroundColor,
        color:context.read<ThemeCubit>().isDark?Colors.deepOrangeAccent:Colors.lightBlueAccent ,
      ),
      child: Scaffold(
        appBar: customAppBar(isDark: isDark, context: context, title: 'Science'),
        body: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {
            if (state is NewsNoInternetState) {
              showToast('No internet Connection', ToastGravity.BOTTOM, context);
            }
          },
          builder: (context, state) {
            return ArticlesList(cubitList: science, state: state,);
          },
        ),
      ),
    );
  }
}
