import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_search/providers/search_provider.dart';
import 'package:flutter_github_search/widgets/list_search.dart';
import 'package:flutter_github_search/widgets/text_search.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'searchScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          MdiIcons.github,
          color: Colors.black,
        ),
        title: Text(
          'Github User Finder',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: TextSearch(
                      controller: provider.textsearch,
                      action: (value) => provider.Search(),
                    ),
                  ),
                  Consumer<SearchProvider>(builder: (context, provider, _) {
                    return ListSearch(
                      result: provider.result,
                    );
                  }),
                ],
              ),
              Consumer<SearchProvider>(builder: (context, provider, _) {
                return provider.loading
                    ? Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Container();
              })
            ],
          ),
        ),
      ),
    );
  }
}
