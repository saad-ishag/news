import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubits/theme_cubit.dart';
import '../screens/search_screen.dart';

AppBar customAppBar(
    {required bool isDark,
    required BuildContext context,
    required String title}) {
  return AppBar(
    title: Text(
      title + 'News',
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: DropdownButton(
            borderRadius: BorderRadius.circular(20),
            underline: const SizedBox(),
            elevation: 0,
            icon: Icon(Icons.brightness_2_outlined,
                size: 25,
                color:
                    isDark ? Colors.deepOrangeAccent : Colors.lightBlueAccent),
            style: Theme.of(context).textTheme.bodyText1,
            items: <String>[
              'Light',
              'Dark',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              if (newValue == 'Light') {
                BlocProvider.of<ThemeCubit>(context).changeTheme(false);
              } else {
                BlocProvider.of<ThemeCubit>(context).changeTheme(true);
              }
            }),
      ),
      const SizedBox(
        width: 5,
      ),
      IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchScreen()));
            // showSearch(delegate: NewsSearch(), context: context);
          },
          icon: const Icon(
            Icons.search,
            size: 30,
          )),
    ],
  );
}
