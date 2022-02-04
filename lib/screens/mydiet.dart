import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:yo_sugars/screens/food_check.dart';

class MyDiet extends StatefulWidget {
  const MyDiet({Key? key}) : super(key: key);

  @override
  _MyDietState createState() => _MyDietState();
}

class _MyDietState extends State<MyDiet> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Allowed NOTIFICATIONS"),
            content: Text("Our app would like you to send you notifications"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Don\'t Allow"),
              ),
              TextButton(
                onPressed: () => AwesomeNotifications()
                    .requestPermissionToSendNotifications()
                    .then((_) => Navigator.pop(context)),
                child: Text("Allow"),
              ),
            ],
          ),
        );
      }
    });
  }

  notifyMe() async {
    String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: '${Emojis.person_child} Your Diet update',
          // ignore: unnecessary_brace_in_string_interps
          body: '',
          displayOnBackground: true,
        ),
        schedule: NotificationInterval(
          timeZone: timezom,
          allowWhileIdle: true,
          interval: 60,
          repeats: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: notifyMe(),
        builder: (BuildContext context, _) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.black38, BlendMode.darken),
                  fit: BoxFit.cover,
                  image: AssetImage("assets/food3.jpg"),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Did you check in today?" +
                        "\n" +
                        "Please go ahead and select your day...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        child: const Card(
                          child: ListTile(
                            title: Icon(Icons.calendar_today),
                            subtitle: Text("Monday"),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      FoodCheck()),
                              (route) => true);
                        },
                      )),
                      Expanded(
                          child: GestureDetector(
                        child: const Card(
                          child: ListTile(
                            title: Icon(Icons.calendar_today),
                            subtitle: Text("Tuesday"),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      FoodCheck()),
                              (route) => true);
                        },
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        child: const Card(
                          child: ListTile(
                            title: Icon(Icons.calendar_today),
                            subtitle: Text("Wednesday"),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      FoodCheck()),
                              (route) => true);
                        },
                      )),
                      Expanded(
                          child: GestureDetector(
                        child: const Card(
                          child: ListTile(
                            title: Icon(Icons.calendar_today),
                            subtitle: Text("Thursday"),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      FoodCheck()),
                              (route) => true);
                        },
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        child: const Card(
                          child: ListTile(
                            title: Icon(Icons.calendar_today),
                            subtitle: Text("Friday"),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      FoodCheck()),
                              (route) => true);
                        },
                      )),
                      Expanded(
                          child: GestureDetector(
                        child: const Card(
                          child: ListTile(
                            title: Icon(Icons.calendar_today),
                            subtitle: Text("Saturday"),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      FoodCheck()),
                              (route) => true);
                        },
                      )),
                    ],
                  ),
                  Center(
                    child: GestureDetector(
                      child: const Card(
                        child: ListTile(
                          title: Icon(Icons.calendar_today),
                          subtitle: Text("Sunday"),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (BuildContext context) => FoodCheck()),
                            (route) => true);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
