import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:img_ai/pg2.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Positioned(
          child: Container(
  decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/among-us-x-cyberpunk-5k-uj.jpg"),
            fit: BoxFit.cover
          )
  ),

          ),
        ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(10, 90, 0, 0),
          //   child: Positioned(child:
          //   Text("WELCOME",style: TextStyle(
          //   fontSize: 50,
          //   fontWeight: FontWeight.bold,
          //   fontStyle: FontStyle.italic,
          //   color: Colors.pink
          //   ),)
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(45, 760, 0, 0),
            child: Positioned(child:
            Container(
              height: 55,
              width: 300,

              child: ElevatedButton.icon(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Search()),
                );
              },
              icon: Icon(Icons.arrow_right),
                label: Text("Let's get started"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,

                ),
              ),
            )
            ),
          ),
    ]
      ),
    );
  }
}
