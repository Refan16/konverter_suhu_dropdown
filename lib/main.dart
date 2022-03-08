import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();

  String selectedDropdown = "Kelvin";
  List<String> listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  double hasilPerhitungan = 0;

  void onDropdownChanged(Object? value) {
    return setState(() {
      selectedDropdown = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                controller: etInput,
                decoration: InputDecoration(
                  labelText: 'Celcius',
                  hintText: 'Masukkan Suhu Dalam Celsius',
                ),
              ),
              SizedBox(height: 8),
              DropdownButton(
                  isExpanded: true,
                  value: selectedDropdown,
                  items: listSatuanSuhu.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    onDropdownChanged(value);
                  }),
              const SizedBox(height: 8),
              const Text(
                "Hasil",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 8),
              Text(
                "$hasilPerhitungan",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (etInput.text.isNotEmpty) {
                            switch (selectedDropdown) {
                              case "Kelvin":
                                hasilPerhitungan =
                                    int.parse(etInput.text) + 273;
                                break;
                              case "Reamur":
                                hasilPerhitungan =
                                    int.parse(etInput.text) * 4 / 5;
                                break;
                              case "Fahrenheit":
                                hasilPerhitungan =
                                    int.parse(etInput.text) * 9 / 5 + 32;
                                break;
                            }
                          }
                        });
                      },
                      child: Text("Konversi Suhu"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
