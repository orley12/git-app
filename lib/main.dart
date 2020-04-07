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

  @override
  Widget build(BuildContext context) {

    print('building main page');
    return ScopedModel<RepoModel>(
      model: _model,
      child: MaterialApp(
        home: RepoListPage(_model),
      ),
    );
  }
}
