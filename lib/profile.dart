import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget isiBox(String parameter) {
      return Text(
        parameter,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 48, 144),
          title: Text("Profile"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Center(
                child: Image.asset(
                  "assets/profile.jpg",
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 260,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.cyan,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isiBox("Nama: Rifky Hernanda"),
                    const SizedBox(height: 15),
                    isiBox("NIM: 21120120130082"),
                    const SizedBox(height: 15),
                    isiBox("Nomor Telepon: 085156816942"),
                    const SizedBox(height: 15),
                    isiBox("Asal: Pati"),
                    const SizedBox(height: 15),
                    isiBox("Email: rifkyhernanda33@gmail.com"),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
