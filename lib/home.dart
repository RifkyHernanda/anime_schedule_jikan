// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  late Future<List<Top>> topMonday;
  late Future<List<Top>> topTuesday;
  late Future<List<Top>> topWednesday;
  late Future<List<Top>> topThursday;
  late Future<List<Top>> topFriday;
  late Future<List<Top>> topSaturday;
  late Future<List<Top>> topSunday;

  Future<List<Top>> fetchTopMonday() async {
    final response =
        await http.get(Uri.parse("https://api.jikan.moe/v4/schedules/monday"));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['data'] as List;
      return jsonResponse.map((top) => Top.fromJson(top)).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  Future<List<Top>> fetchTopTuesday() async {
    final response =
        await http.get(Uri.parse("https://api.jikan.moe/v4/schedules/tuesday"));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['data'] as List;
      return jsonResponse.map((top) => Top.fromJson(top)).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  Future<List<Top>> fetchTopWednesday() async {
    final response = await http
        .get(Uri.parse("https://api.jikan.moe/v4/schedules/wednesday"));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['data'] as List;
      return jsonResponse.map((top) => Top.fromJson(top)).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  Future<List<Top>> fetchTopThursday() async {
    final response = await http
        .get(Uri.parse("https://api.jikan.moe/v4/schedules/thursday"));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['data'] as List;
      return jsonResponse.map((top) => Top.fromJson(top)).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  Future<List<Top>> fetchTopFriday() async {
    final response =
        await http.get(Uri.parse("https://api.jikan.moe/v4/schedules/friday"));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['data'] as List;
      return jsonResponse.map((top) => Top.fromJson(top)).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  Future<List<Top>> fetchTopSaturday() async {
    final response = await http
        .get(Uri.parse("https://api.jikan.moe/v4/schedules/saturday"));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['data'] as List;
      return jsonResponse.map((top) => Top.fromJson(top)).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  Future<List<Top>> fetchTopSunday() async {
    final response =
        await http.get(Uri.parse("https://api.jikan.moe/v4/schedules/sunday"));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body)['data'] as List;
      return jsonResponse.map((top) => Top.fromJson(top)).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  @override
  void initState() {
    super.initState();
    topMonday = fetchTopMonday();
    topTuesday = fetchTopTuesday();
    topWednesday = fetchTopWednesday();
    topThursday = fetchTopThursday();
    topFriday = fetchTopFriday();
    topSaturday = fetchTopSaturday();
    topSunday = fetchTopSunday();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SizedBox(
          child: FutureBuilder<List<Top>>(
              future: topMonday,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                snapshot.data![index].images.jpg.image_url),
                          ),
                          title: Text(snapshot.data![index].title),
                          subtitle: Text(
                              'Jadwal tayang: ${snapshot.data![index].string}'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    item: snapshot.data![index].malId,
                                    title: snapshot.data![index].title),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong :('));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SizedBox(
          child: FutureBuilder<List<Top>>(
              future: topTuesday,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                snapshot.data![index].images.jpg.image_url),
                          ),
                          title: Text(snapshot.data![index].title),
                          subtitle: Text(
                              'Jadwal tayang: ${snapshot.data![index].string}'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    item: snapshot.data![index].malId,
                                    title: snapshot.data![index].title),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong :('));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SizedBox(
          child: FutureBuilder<List<Top>>(
              future: topWednesday,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                snapshot.data![index].images.jpg.image_url),
                          ),
                          title: Text(snapshot.data![index].title),
                          subtitle: Text(
                              'Jadwal tayang: ${snapshot.data![index].string}'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    item: snapshot.data![index].malId,
                                    title: snapshot.data![index].title),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong :('));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SizedBox(
          child: FutureBuilder<List<Top>>(
              future: topThursday,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                snapshot.data![index].images.jpg.image_url),
                          ),
                          title: Text(snapshot.data![index].title),
                          subtitle: Text(
                              'Jadwal tayang: ${snapshot.data![index].string}'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    item: snapshot.data![index].malId,
                                    title: snapshot.data![index].title),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong :('));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SizedBox(
          child: FutureBuilder<List<Top>>(
              future: topFriday,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                snapshot.data![index].images.jpg.image_url),
                          ),
                          title: Text(snapshot.data![index].title),
                          subtitle: Text(
                              'Jadwal tayang: ${snapshot.data![index].string}'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    item: snapshot.data![index].malId,
                                    title: snapshot.data![index].title),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong :('));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SizedBox(
          child: FutureBuilder<List<Top>>(
              future: topSaturday,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                snapshot.data![index].images.jpg.image_url),
                          ),
                          title: Text(snapshot.data![index].title),
                          subtitle: Text(
                              'Jadwal tayang: ${snapshot.data![index].string}'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    item: snapshot.data![index].malId,
                                    title: snapshot.data![index].title),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong :('));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SizedBox(
          child: FutureBuilder<List<Top>>(
              future: topSunday,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                snapshot.data![index].images.jpg.image_url),
                          ),
                          title: Text(snapshot.data![index].title),
                          subtitle: Text(
                              'Jadwal tayang: ${snapshot.data![index].string}'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    item: snapshot.data![index].malId,
                                    title: snapshot.data![index].title),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong :('));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 48, 144),
          title: const Text('Anime Schedule')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 20),
              child: Text(
                'Anime Schedule in : ',
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: SizedBox(
                width: 340,
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text(
                            "Monday",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text(
                            "Tuesday",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text(
                            "Wednesday",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 3;
                        });
                      },
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text(
                            "Thursday",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 4;
                        });
                      },
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text(
                            "Friday",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 5;
                        });
                      },
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text(
                            "Saturday",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 6;
                        });
                      },
                      child: Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text(
                            "Sunday",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
            widgets[index],
          ],
        ),
      ),
    );
  }
}

class Top {
  final int malId;
  final String title;
  Images images;
  final String string;

  Top({
    required this.malId,
    required this.title,
    required this.images,
    required this.string,
  });

  factory Top.fromJson(Map<String, dynamic> json) {
    return Top(
      malId: json['mal_id'],
      title: json['title'],
      images: Images.fromJson(json['images']),
      string: json['broadcast']['string'],
    );
  }

  Map<String, dynamic> toJson() => {
        'mal_id': malId,
        'title': title,
        'images': images,
        'string': string,
      };
}
