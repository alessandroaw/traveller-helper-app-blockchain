import 'package:flutter/material.dart';

enum TH { helper, traveller }

class THBottomBar extends StatelessWidget {
  final TH page;

  THBottomBar(this.page);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'bottomBar',
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Helper',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            label: 'Traveller',
          ),
        ],
        currentIndex: page.index,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/helper');
              break;
            case 1:
              Navigator.pushNamed(context, '/traveller');
              break;
          }
        },
      ),
    );
  }
}
