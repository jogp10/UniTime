import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {

  final myController = TextEditingController();

  @override
  dispose(){
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: [
              IconButton(
                onPressed: () {
                  print('open main menu');
                },
                icon: const Icon(Icons.menu),
                color: Colors.black,
                iconSize: 20.0,
              ),
              const Text(
                'Engenharia de Software',
                style: TextStyle(
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),

            child: TextField(
              controller: myController,
              decoration: const InputDecoration(
                labelText: 'Fórmula',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)
                  ),
                  borderSide: BorderSide(
                      color: Colors.blue
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
        child: const Text('click!'),
        backgroundColor: Colors.blue[300],

      ),
    );
  }

}