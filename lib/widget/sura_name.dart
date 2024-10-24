import 'package:flutter/material.dart';
import 'package:islamic/screen/quran_details/quran_details.dart';

class SuraName extends StatelessWidget {
  String name;
  int number;
  int index;

  SuraName({
    super.key,
    required this.name,
    required this.number,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          QuranDetails.routeName,
          arguments: QuranDetailsArgs(
            index,
            name,
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              number.toString(),
              style: const TextStyle(
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: height * 0.05,
            child: const VerticalDivider(),
          ),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
