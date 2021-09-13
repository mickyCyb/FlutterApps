import 'package:flutter/material.dart';
import 'package:wallet_app/data.dart';
import 'package:wallet_app/widgets/card_details.dart';

class CardSection extends StatelessWidget {
  const CardSection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Selected Card',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20, 
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: customShadow,
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: 120,
                      bottom: -180,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          shape: BoxShape.circle,
                          boxShadow: customShadow
                        ),
                      )
                    ),
                    Positioned.fill(
                      left: -300,
                      top: -100,
                      bottom: -100,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          shape: BoxShape.circle,
                          boxShadow: customShadow
                        ),
                      )
                    ),
                    CardDetails(),
                  ],
                ),
              );
            }
          ),
        ),
        
      ],
    );
  }
}