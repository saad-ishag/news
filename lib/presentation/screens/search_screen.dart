import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:know_news/logic/blocs/searching_bloc.dart';
import 'package:know_news/logic/blocs/searching_state.dart';
import 'package:know_news/show_toast.dart';

import '../../logic/blocs/searching_event.dart';
import '../../logic/cubits/theme_cubit.dart';
import '../components/Shimmer_effect.dart';
import '../components/article_item.dart';
import '../components/divider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, bottom: 10),
        child: BlocConsumer<SearchingBloc, SearchingState>(
          listener: (context, state) {
            if (state is SearchingErrorState) {
              showToast('check your internet and try again later',
                  ToastGravity.CENTER, context);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                buildTextFieldPadding(context, _controller),
                Expanded(
                  child: (state is! NoNewsArticle)
                      ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0.w, vertical: 28.h),
                    child: buildSearchListView(state),
                  )
                      : const Center(
                      child: Text(
                        'No related article ',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      )),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  ListView buildSearchListView(SearchingState state) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context,index) =>searchState(context: context, state: state, index: index),
      separatorBuilder: (context, index) =>
      const CustomDivider(),
      itemCount: (state is SearchLoadingState)
          ? 9
          : (state is SearchCompleteState)
          ? state.searchResult.length
          : 1,
      // i make it 1 so that i can see the error icon when
      // the SearchErrorState emitted
    );
  }

  Padding buildTextFieldPadding(BuildContext context,
      TextEditingController _controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        cursorColor: context
            .read<ThemeCubit>()
            .isDark
            ? Colors.deepOrangeAccent
            : Colors.lightBlueAccent,
        controller: _controller,
        decoration: buildInputDecoration(context, _controller),
        showCursor: true,
        cursorHeight: 25,
        autofocus: true,
        onChanged: (value) {
          context
              .read<SearchingBloc>()
              .add(GetSearchingEvent(queryChanged: value.trim()));
        },
        onSubmitted: (value) {
          context
              .read<SearchingBloc>()
              .add(GetSearchingEvent(queryChanged: value.trim()));
        },
      ),
    );
  }

  InputDecoration buildInputDecoration(BuildContext context,
      TextEditingController _controller) {
    return InputDecoration(
        filled: true,
        fillColor:
        context
            .read<ThemeCubit>()
            .isDark ? Colors.white24 : Colors.black12,
        hintText: 'search for News',
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close, color: Colors.grey),
          onPressed: () {
            _controller.value.text
                .trim()
                .isNotEmpty
                ? _controller.clear()
                : Navigator.pop(context);
          },
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide.none,
        ));
  }

  Widget searchState({required BuildContext context, required SearchingState state, required int index}) {
    if (state is SearchLoadingState) {
      return const Shimmer();
    }
    else if (state is SearchCompleteState) {
      return ArticleItem(
        title:
        state.searchResult[index].title,
        dateTime: state
            .searchResult[index].publishedAt,
        image: state
            .searchResult[index].urlToImage,
        url: state.searchResult[index].url,
      );
    }
    else if (state is SearchingErrorState) {
      return SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width:
        MediaQuery
            .of(context)
            .size
            .width,
        child: Padding(
          padding:  EdgeInsets.only(bottom: 400.0.h),
          child: const Icon(Icons.error,
              color: Colors.red,size: 70,),
        ),
      );
    }
    else {
      return Container();
    }
  }

}
