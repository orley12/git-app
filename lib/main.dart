import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import 'main_scoped_model.dart';
import 'repo_list.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final RepoModel _model = RepoModel();

  // @override
  // void initState() {
  //   _model.autoAuthenticate();
  //   _model.userSubject.listen((bool isAuthenticated) {
  //     setState(() {
  //       _isAuthenticated = isAuthenticated;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
      // final RepoModel _model = RepoModel();

    print('building main page');
    return ScopedModel<RepoModel>(
      model: _model,
      child: MaterialApp(
        // debugShowMaterialGrid: true,
        // theme: ThemeData(
        //     brightness: Brightness.light,
        //     primarySwatch: Colors.deepOrange,
        //     accentColor: Colors.deepPurple,
        //     buttonColor: Colors.deepPurple),
        home: RepoListPage(_model),
      ),
    );
  }
}
