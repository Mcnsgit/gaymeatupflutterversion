import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nav_widget.dart' as nav;

class AppBarNotifier extends ChangeNotifier {
  String _title = 'Default Title';

  String get title => _title;

  void updateTitle(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }
}

class AppBarApp extends StatelessWidget {
  final List<IconButton>? actions;

  const AppBarApp({Key? key, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(Provider.of<AppBarNotifier>(context).title),
          endDrawer: const Drawer(),
        ),
        body: const SliverAppBar(),
      ),
    );
  }
}

class SliverAppBarNotifier extends ChangeNotifier {
  bool _pinned = false;
  double _expandedHeight = 160.0;
  FlexibleSpaceBar _flexibleSpace = const FlexibleSpaceBar(title: Text('Default'));

  bool get pinned => _pinned;
  double get expandedHeight => _expandedHeight;
  FlexibleSpaceBar get flexibleSpace => _flexibleSpace;

  void setPinned(bool value) {
    _pinned = value;
    notifyListeners();
  }

  void setExpandedHeight(double value) {
    _expandedHeight = value;
    notifyListeners();
  }

  void setFlexibleSpace(FlexibleSpaceBar value) {
    _flexibleSpace = value;
    notifyListeners();
  }
}

class SliverAppBar2 extends StatefulWidget {
  const SliverAppBar2({Key? key, required Text title}) : super(key: key);

  @override
  State<SliverAppBar2> createState() => _SliverAppBar2State();
}

class _SliverAppBar2State extends State<SliverAppBar2> {
  @override
  Widget build(BuildContext context) {
    final appBarNotifier = Provider.of<SliverAppBarNotifier>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: appBarNotifier.pinned,
            expandedHeight: appBarNotifier.expandedHeight,
            flexibleSpace: appBarNotifier.flexibleSpace,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text('Scroll to see the SliverAppBar in effect.'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const nav.Nav(),
    );
  }
}

