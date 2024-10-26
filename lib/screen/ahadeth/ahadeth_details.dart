import 'package:flutter/material.dart';
import 'package:islamic/screen/ahadeth/hadeth.dart';

class AhadethDetails extends StatelessWidget {
  static const String routeName = 'ahadethDetails';

  const AhadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Hadeth args = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/default_bg.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: Card(
                child: SingleChildScrollView(
                  child: Text(
                    textAlign: TextAlign.center,
                    args.content,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
