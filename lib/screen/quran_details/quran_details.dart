import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/screen/quran_details/verse_widget.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = 'quran';

  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  @override
  Widget build(BuildContext context) {
    QuranDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as QuranDetailsArgs;
    loadFile(args.index);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.name),
        ),
        body: Card(
          child: lines.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => VerseWidget(
                          verse: lines[index],
                          verseNumber: index + 1,
                        ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: lines.length,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  List<String> lines = [];

  loadFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/text_quran/${index + 1}.txt',
    );
    lines = fileContent.split('\n');
    setState(() {});
  }
}

class QuranDetailsArgs {
  String name;
  int index;

  QuranDetailsArgs(this.index, this.name);
}
