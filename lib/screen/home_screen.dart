import 'package:flutter/material.dart';
import 'package:islamic/screen/tab/ahadeth_tab.dart';
import 'package:islamic/screen/tab/quran_tab.dart';
import 'package:islamic/screen/tab/radio_tab.dart';
import 'package:islamic/screen/tab/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Islamic'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const ImageIcon(
                AssetImage('assets/images/icon_quran.png'),
              ),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const ImageIcon(
                AssetImage('assets/images/icon_hadeth.png'),
              ),
              label: 'A hadith',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const ImageIcon(
                AssetImage('assets/images/icon_sebha.png'),
              ),
              label: 'Tasbeeh',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const ImageIcon(
                AssetImage('assets/images/icon_radio.png'),
              ),
              label: 'Radio',
            ),
          ],
        ),
        body: tabs[selectedIndex],
      ),
    );
  }
}
