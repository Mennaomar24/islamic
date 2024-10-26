import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/screen/ahadeth/ahadeth_details.dart';
import 'package:islamic/screen/ahadeth/hadeth.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  @override
  Widget build(BuildContext context) {
    return ahadethList.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Expanded(
                child: Image.asset('assets/images/hadeth_logo.png'),
              ),
              const Divider(),
              const Text(
                'Ahadeth',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
              const Divider(),
              Expanded(
                flex: 2,
                child: ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AhadethDetails.routeName,
                        arguments: ahadethList[index],
                      );
                    },
                    child: Text(
                      textAlign: TextAlign.center,
                      ahadethList[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: ahadethList.length,
                ),
              ),
            ],
          );
  }

  List<Hadeth> ahadethList = [];

  readAhadethFile() async {
    String fileContent = await rootBundle.loadString(
      'assets/text_quran/ahadeth.txt',
    );
    List<String> ahadethFileData = fileContent.split('#');
    for (int i = 0; i < ahadethFileData.length; i++) {
      List<String> ahadethLines = ahadethFileData[i].trim().split('\n');
      String hadethTitle = ahadethLines[0];
      ahadethLines.removeAt(0);
      String hadethContent = ahadethLines.join(' ');
      ahadethList.add(
        Hadeth(content: hadethContent, title: hadethTitle),
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readAhadethFile();
  }
}
