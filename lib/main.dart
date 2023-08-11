import 'package:flutter/material.dart';
import 'package:scrollable_bar/model/athlete_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Athletes Scrollable Bar'),
        ),
        body: const AthleteScrollableBar(),
      ),
    );
  }
}

class AthleteScrollableBar extends StatelessWidget {
  const AthleteScrollableBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // creating list of athlete class
    List<Athlete> athlete = [
      {"name": "Abhishek", "level": "Basic"},
      {"name": "Tarun", "level": "Intermediate"},
      {"name": "Mohan", "level": "Advanced"},
      {"name": "Mohan", "level": "Intermediate"},
      {"name": "Raja", "level": "Basic"}
    ].map((athlete) => Athlete.fromJson(athlete)).toList();

    //creating list of levels
    List<String> levels = ["Basic", "Intermediate", "Advanced"];

    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          List<Athlete> individualList = athlete
              .where(
                (athlete) => athlete.level == levels[index],
              )
              .toList();
          return SizedBox(
            // height: 300,
            child: Column(
              children: [
                Text(
                  levels[index],
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Divider(),
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  height: 400,
                  width: size.shortestSide - 40,
                  child: ListView.builder(
                    itemCount: individualList.length,
                    itemBuilder: (context, ind) {
                      return SizedBox(
                        width: size.width,
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text(
                            individualList[ind].name.toString(),
                          ),
                          subtitle: Text(
                            "Player ${individualList[ind].name}'s level is ${levels[index]}",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: levels.length,
      ),
    );
  }
}
