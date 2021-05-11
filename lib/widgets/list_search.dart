import 'package:flutter/material.dart';

class ListSearch extends StatelessWidget {
  final result;
  const ListSearch({Key key, this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 60,
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(
          title: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(result.items[index].avatarUrl),
            ),
            title: Text(
              result.items[index].login,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        childCount: result?.items?.length ?? 0,
      ),
    );
  }
}
