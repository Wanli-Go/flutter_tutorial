import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(

          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 213, 75, 16),
            title: const Text('Flutter is so satisfying!'),
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Center(
                child: SizedBox(               
                  height: 60,
                  width: 150,
                  child: Text("Inside body container"),
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.amber,
                      width: 123,
                      height: 123,
                    ),
                    const Center(
                      child: Icon(Icons.abc_outlined))
                  ],
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Text("Data"),
                ),
              ),
              const Icon(Icons.access_alarm),
              const Expanded(
                flex: 4,
                child: Icon(Icons.kayaking)
              )
            ],
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () => {},
            child: Icon(Icons.add),
            focusColor: Colors.blueGrey,
          ),

          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home_filled)
              ),
              BottomNavigationBarItem(
                label: "Building",
                icon: Icon(Icons.deblur)
              ),
              BottomNavigationBarItem(
                label: "My",
                icon: Icon(Icons.radar_rounded)
              )
            ],
          ),

          drawer: const Drawer(
            child: Text("WTF?"),
          ),

        ),

    );
  }
}