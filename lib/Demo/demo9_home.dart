import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class demo9 extends StatefulWidget {
  @override
  createState() => _demo9();
}

class _demo9 extends State<demo9> {
  final _events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        child: RefreshIndicator(
          onRefresh: () async {
            await _refresh();
          },
          child: ListView(
            children: _events.map<Widget>((event) {
              return Dismissible(
                confirmDismiss: (_) async {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                            title: Text("Are you sure?"),
                            content: Text("do you want to delete this item"));
                        actions:
                        [
                          FlatButton(
                            child: Text("Cancle"),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                          FlatButton(
                            child: Text("Delete"),
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ];
                      });
                  return false;
                },
                onDismissed: (_) {
                  setState(() {
                    _events.removeWhere((e) => e.id == event.id);
                  });
                },
                key: ValueKey(event.id),
                child: ListTile(
                  leading: Image.network(event.avatarUrl),
                  title: Text("${event.userName}"),
                  subtitle: Text("${event.repoName}"),
                ),
              );
            }).toList(),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _refresh() async {
    final res = await http.get("https://api.github.com/events");
    if (res.statusCode == 200) {
      final json = convert.jsonDecode(res.body);
      setState(() {
        _events.clear();
        _events.addAll(json.map((item) => GitEvent(item)));
      });
    }
  }
}

class GitEvent {
  late String id;
  late String userName;
  late String avatarUrl;
  late String repoName;

  GitEvent(json) {
    this.id = json["id"];
    this.userName = json["actor"]["login"];
    this.avatarUrl = json["actor"]["avatar_url"];
    this.repoName = json["repo"]["name"];
  }

  @override
  String toString() {
    return 'GitEvent{id: $id, userName: $userName, avatarUrl: $avatarUrl, repoName: $repoName}';
  }
}
