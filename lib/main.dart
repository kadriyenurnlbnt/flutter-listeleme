import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic>? data;

  get value => data;

  @override
  void initState() {
    super.initState();
    _loadData().then((value) {
      setState(() {
        data = value;
      });
      // print("birinci item ${value[0]["id"]}"); //çalışıp çalışılmadığını anlamak için koyuldu.
      //print("toplam eleman sayısı ${value.length}");
    });
  }

  Future<List<dynamic>> _loadData() async {
    List<dynamic> result = <dynamic>[];

    String jsonString = await rootBundle.loadString('assets/veri.json');
    return json.decode(jsonString).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey[100],
            title: Text('Sürü Takip Sistemi',
                style: TextStyle(color: Colors.black)),
          ),
          body: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [

                
                ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Card(
                            color: Colors.white,
                            elevation: 5,
                            shadowColor: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text('Kulak no:\t ${value[index]["kulakNo"]}',
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.indigo)),
                                      Divider(
                                        color: Colors.black,
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                ),
                                subtitle: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            Text('Hayvan Adı:\t',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontStyle: FontStyle.italic)),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                  '${value[index]["hayvanAdi"]}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            Text("Irk: \t",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontStyle: FontStyle.italic)),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                " ${value[index]["irk"]}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          children: [
                                            Text("Doğum Tarihi: \t",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontStyle: FontStyle.italic)),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                "${value[index]["dogumTarihi"]}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ].toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: value.length,
                ),
              TextButton(
                onPressed: () {  },
                child: Center(
              child: Stack(children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: <Color>[
                           const Color.fromARGB(1,247,95,95),
                           const Color(0xFF42A5F5),
                           const Color(0xFF42A5F5),
                        
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(14.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    //yazılacak
                  },
                  child: const Text('Numramı Değiştir'),
                ),
              ]),
            )),
          ]),
        ),
              

            ),
          
          
          
        

        );
  }
}
