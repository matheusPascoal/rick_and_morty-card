import 'dart:math';

import 'package:chucknoris/model/chuckModel.dart';
import 'package:chucknoris/repository/chuckRepository.dart';
import 'package:chucknoris/widgets/widgetText%20copy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChuckPage extends StatefulWidget {
  const ChuckPage({Key? key}) : super(key: key);

  @override
  State<ChuckPage> createState() => _ChuckPageState();
}

class _ChuckPageState extends State<ChuckPage> {
  var chuckModel = ChuckModel();
  getUser() async {
    var result = await ChuckRepository().getUser();
    chuckModel = result;
    setState(() {});
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
              'https://cdn.discordapp.com/attachments/954812297736495135/958955902440972298/rickandmorty.png',
              fit: BoxFit.cover,
              width: 1000),
          Column(
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              WidgetText(
                chuck: chuckModel,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0XFF288840),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            children: <Widget>[
              TextButton(
                onPressed: getUser,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 115,
                    ),
                    Text(
                      'REFRESH         ',
                      style: GoogleFonts.creepster(
                          fontSize: 50, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
