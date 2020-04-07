import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import 'main_scoped_model.dart';

class RepoListPage extends StatefulWidget {
  final RepoModel model;

  RepoListPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _RepoListPageState();
  }
}

class _RepoListPageState extends State<RepoListPage> {
  @override
  initState() {
    widget.model.fetchRepos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Git App'),
      ),
      
      body: ScopedModelDescendant<RepoModel>(
      builder: (BuildContext context, Widget child, RepoModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              key: Key(model.allRepos[index].id),
              children: <Widget>[
                ListTile(
                  title: Text(model.allRepos[index].name),
                  subtitle: Text(model.allRepos[index].login),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            );
          },
          itemCount: model.allRepos.length,
        );
      },
    ),
    );
  }
}
