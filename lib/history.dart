import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

//import 'package:tugas_besar/detailHistory.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late String nama;
  late String deskripsi;
  late String favorit;
  late String gambar;
  var data;
  @override
  void initState() {
    nama = "Name Character";
    favorit = "rating";
    deskripsi = "";
    gambar = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 48, 144),
        title: Text("Gacha Character"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 45),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black87),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(gambar),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      nama,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      favorit,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var myresponse = await http.get(
                    Uri.parse("https://api.jikan.moe/v4/random/characters"));
                var data = json.decode(myresponse.body);
                if (myresponse.statusCode == 200) {
                  setState(() {
                    nama =
                        "Name Character : ${data['data']['name'].toString()}";
                    favorit =
                        "Favorites : ${data['data']['favorites'].toString()}";
                    gambar =
                        data['data']['images']['jpg']['image_url'].toString();
                    deskripsi = data['data']['about'].toString();
                  });
                } else {
                  print("ERROR ${myresponse.statusCode}");
                }
              },
              child: Text("Start Gacha"),
            ),
          ],
        ),
      ),
    );
  }
}
