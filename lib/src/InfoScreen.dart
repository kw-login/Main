import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:login_app_project/src/Map2Sreen.dart';
import 'package:login_app_project/src/MapScreen.dart';


class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Future<List<List<dynamic>>> loadCsvData() async {
    final csvData = await rootBundle.loadString(
        'assets/csv/login_20240217.csv');
    List<List<dynamic>> rowsAsListOfValues =
    const CsvToListConverter().convert(csvData);

    return rowsAsListOfValues;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme
        //       .of(context)
        //       .colorScheme
        //       .inversePrimary,
        //   title: Text(widget.title),
        // ),
        body: Stack(
          children: <Widget>[
            FutureBuilder<List<List<dynamic>>>(
              future: loadCsvData(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<List<dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                Map2Screen(snapshot
                                    .data?[index][4])),
                          );
                        },
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                              Border.all(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                                '취급 업종 : ${snapshot
                                    .data?[index][1]}\n업체명 : ${snapshot
                                    .data?[index][2]}\n전화번호 : ${snapshot
                                    .data?[index][3]}\n소재지 : ${snapshot
                                    .data?[index][4]}',
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            Positioned(
              bottom: 50.0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapScreen()),
                    );
                    // 여기에 지도 화면으로 이동하는 코드를 작성하세요.
                  },
                  child: Icon(Icons.map),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}