import 'package:firebase_project/constraints/sty6les.dart';
import 'package:flutter/material.dart';

class Scrolable extends StatefulWidget {
  const Scrolable({Key? key}) : super(key: key);
  
  @override
  ScrolableState createState() => ScrolableState();
}
  
class ScrolableState extends State<Scrolable> {
  List<String> animalNames = ['Mohsin', 'Saim', 'Riaz'];
  List<String> animalFamily = ['Rajpoot', 'Sheikh', 'Dhuddi'];
  List<String> animalLifeSpan = ['10-80', '10-90', '10-100'];
  List<String> animalWeight = ['60-70', '60-68', '80-100'];
  int selectedTile = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scrolable Sheet',style: Loginstyle(),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Stack(
          children: [
            animalsList(),
            bottomDetailsSheet(),
          ],
        ),
      ),
    );
  }
  
  Widget animalsList() {
    return ListView(
      children: [
        animalListTile(0, animalNames[0]),
        animalListTile(1, animalNames[1]),
        animalListTile(2, animalNames[2]),
      ],
    );
  }
  
  Widget animalListTile(int index, String animalName) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          setState(() {
            selectedTile = index;
          });
        },
        title: Text(
          animalName,
          style: TextStyle(
            color: Colors.brown,
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        tileColor: Colors.lightGreen[300],
        selected: index == selectedTile,
        selectedTileColor: Colors.lightGreen[600],
      ),
    );
  }
  
  Widget bottomDetailsSheet() {
    return DraggableScrollableSheet(
      initialChildSize: .2,
      minChildSize: .1,
      maxChildSize: .6,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.lightGreen[100],
          child: ListView(
            controller: scrollController,
            children: [
              ListTile(
                title: Text(
                  "NAME",
                ),
                subtitle: Text(
                  animalNames[selectedTile],
                ),
              ),
              ListTile(
                title: Text(
                  "FAMILY",
                ),
                subtitle: Text(
                  animalFamily[selectedTile],
                ),
              ),
              ListTile(
                title: Text(
                  "LIFESPAN",
                ),
                subtitle: Text(
                  animalLifeSpan[selectedTile],
                ),
              ),
              ListTile(
                title: Text(
                  "WEIGHT",
                ),
                subtitle: Text(
                  animalWeight[selectedTile],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}