import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:know_news/logic/cubits/news_cubit.dart';
import 'package:know_news/show_toast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../logic/cubits/theme_cubit.dart';
import '../components/app_bar.dart';
import '../components/articles_list.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {

  fetchData(){
    BlocProvider.of<NewsCubit>(context).fetchBusiness();
    // it very important when you need something from the cubit or bloc
    //to use BlocProvider.of(context) or context.watch or context.read
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
    final businessProvider = BlocProvider.of<NewsCubit>(context).business;
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      header:  WaterDropMaterialHeader(
        backgroundColor: Theme.of(context).backgroundColor,
        color:context.read<ThemeCubit>().isDark?Colors.deepOrangeAccent:Colors.lightBlueAccent ,
      ),
      onRefresh: _onRefresh,
     // onLoading: _onLoading,


      child: Scaffold(
        appBar: customAppBar(context: context,title: 'Business',isDark: isDark),
        body: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {
            if (state is NewsNoInternetState) {
              showToast('No internet Connection', ToastGravity.BOTTOM,context);
            }
          },
          builder: (context, state) {
            return
              ArticlesList(cubitList: businessProvider, state: state,);
          },
        ),
      ),
    );
  }
}


