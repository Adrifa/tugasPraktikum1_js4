import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: Scaffold(
            appBar: AppBar(title: const Text(_title)),
            body: MyStatefulWidget()));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<MyStatefulWidget> {
    final textFieldValueHolder = TextEditingController();
  final etInput = TextEditingController();
  //String dropdownValue = 'One';
  double _inputUser = 0;
  double _kelvin = 0;
  final inputController = TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;
  double reamur = 0;
  double fahrenheit = 0;
  double kelvin = 0;
  double celcius = 0;

  @override
  konvertHandler() {
    setState(() {
      celcius = double.parse(etInput.text);
      if(_newValue=="Kelvin")
      _result = celcius + 123;
      else
      _result = 4/5 * celcius;

    });
  }
  Widget build(BuildContext context) {

    return Container(
      child: Column(   
        mainAxisAlignment: MainAxisAlignment.start,
       children: <Widget>[
          Container(
            child: TextField(
              //controller: textFieldValueHolder,
              autocorrect: true,
              decoration:
                  InputDecoration(hintText: 'Masukkan Suhu Dalam Celcius'),
              //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: etInput,
              keyboardType: TextInputType.number,
            ),
          ),
        DropdownButton<String>(
          value: _newValue,
          icon: const Icon(Icons.arrow_downward),
          //elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              _newValue = newValue!;
            });
          },
          items: <String>['Kelvin', 'Reamur']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
          Container(
            margin: const EdgeInsets.only(top: 0.0),
            // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            width: double.infinity,
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 209, 209, 209)),
              onPressed: konvertHandler,
              child: Text(
                "Konversi Suhu  \n\n\n\n $_result",
              ),
            ),
          ),

        Container(     
            margin: const EdgeInsets.only(top: 0.0),
            // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            width: double.infinity,
            height: 50,
            child: 
            Text("Hasil : $_result")
          ),

      ],    
    ),

    );
  }
}
