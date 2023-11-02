import 'package:flutter/material.dart';

class BodyColumnWidget extends StatelessWidget {
  const BodyColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33),
            color: Colors.tealAccent.withOpacity(0.7)
          ),
          width: 200,
          height: 120,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(50),
          child: const Center(child: Text("Inside the Container!")),
        ),
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              Container(
                color: Colors.purple.withOpacity(0.6),
                width: 123,
                height: 123,
              ),
              const Center(
                child: Icon(
                  Icons.abc_outlined,
                  size: 85)
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: ElevatedButton(
            onPressed: (){
              print("Middle Button Pressed!");
            },
            child: const Text("Middle Button")
            ),
        ),
        Expanded(
          flex: 5,
          child: Image.asset(
            "assets/NEU.icon.jpeg",
            width: MediaQuery.of(context).size.width * 0.4)
        )
      ],
    );
  }
}

class SomeDataFormat { // A virtual data format
  late String description;
  SomeDataFormat(this.description);
}

List<String> rawdata = ["Resource Archie", "Resource Niggle", "Resource Loath", "原神", "崩坏：星穹铁道", "我是个啥比"];

class AlternateColumn extends StatelessWidget {
  const AlternateColumn({super.key});

  @override
  Widget build(BuildContext context) {

    List<SomeDataFormat> data = [];

    rawdata.forEach((element) {
      data.add(SomeDataFormat(element));
    });
    
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => 
              ListTile(
                  leading: const Icon(Icons.album),
                  title: Text(data[index].description),
                  subtitle: Text('The index of this data is $index'),
                  trailing: const Icon(Icons.play_arrow),
              ),
        itemCount: data.length,
        )
    );
  }
}

class AlternateColumn2 extends StatelessWidget {
  const AlternateColumn2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: Center(child: Text("234")));
  }
}