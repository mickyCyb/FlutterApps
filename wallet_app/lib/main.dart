import 'package:flutter/material.dart';
import 'package:wallet_app/data.dart';
import 'package:wallet_app/widgets/wallet_header.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    // theme: ThemeData(fontFamily: ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Container(
            height: 120,
            child: WalletHeader(),
          ),
          Expanded(
            child: Container(
              
            )
          ),
          Expanded(
            child: Container(

            ),
          )
        ],
      ),
    );
  }
}