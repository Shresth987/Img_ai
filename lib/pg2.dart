import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController inputtext = TextEditingController();
  String apikey = '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';
  String url = 'https://api.openai.com/v1/images/generations';
  String? image;

  void getImage() async {
    if (inputtext.text.isNotEmpty) {
      var data = {"prompt": inputtext.text, "n": 1, "size": "256x256"};

      var res = await http.post(Uri.parse(url),
          headers: {
            "Authorization": "Bearer ${apikey}",
            "Content-Type": "application/json"
          },
          body: jsonEncode(data));

      var jsonResponse = jsonDecode(res.body);

      image = jsonResponse['data'][0]['url'];

      setState(() {

      });
    } else {
      print("Enter the text");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/background.jpg"),
                        fit: BoxFit.cover,
                      )
                  ),
                )
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 130, 20, 0),
                  child: TextField(
                    controller: inputtext,
                    decoration: InputDecoration(
                        hintText: "Enter Text to generate image",
                        filled: true,
                        fillColor: Colors.blue.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    getImage();
                  },
                  child: Text("Search"),
                ),
                SizedBox(
                  height: 60,
                ),
                image != null ? Image.network(image!, width: 256, height: 265) : Container(child:Text("Enter text to generate image",style: TextStyle(color: Colors.white),)),

              ],
            ),
          ],

        ));
  }
}