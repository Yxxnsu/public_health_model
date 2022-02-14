import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:public_health_model/public_health_model.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
          title: const Text('숨겨진 연수의 테스트 공간'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: ElevatedButton(
                  onPressed: ()=> Get.to(()=> const ModelTestingScreen()),
                  child: const Text('모델 테스팅'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModelTestingScreen extends StatefulWidget {
  const ModelTestingScreen({ Key? key }) : super(key: key);

  @override
  State<ModelTestingScreen> createState() => _ModelTestingScreenState();
}

class _ModelTestingScreenState extends State<ModelTestingScreen> {

  Future<InspectionModel>? inspectionModel;
  Future<DrugModel>? drugModel;
  bool isGetHealth = false;
  bool isGetDrug = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapping Testing'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    isGetHealth = true;
                    isGetDrug = true;
                    inspectionModel = getDummyInspections();
                    drugModel = getDummyDrug();
                  });
                },
                child: Text('API CALL'),
              ),
              ElevatedButton(
                onPressed: ()=> getTest(),
                child: Text('TEST'),
              ),
              SizedBox(
                height: 10,
              ),
              isGetHealth 
                ? FutureBuilder<InspectionModel>(
                    future: inspectionModel,
                    builder: (context, snapshot){
                      return snapshot.hasData 
                        ? Text('DATA ON', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).primaryColor),) 
                        : CircularProgressIndicator();
                    }
                  )
                : const Text('Health model is empty'),
              isGetDrug 
                ? FutureBuilder<DrugModel>(
                    future: drugModel,
                    builder: (context, snapshot){
                      return snapshot.hasData 
                        ? Text(
                          snapshot.data!.resultList![0].retrieveTreatmentInjectionInformationPersonDetailList![1].jinRyoChoBangIlja,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).primaryColor
                            ),
                          ) 
                        : CircularProgressIndicator();
                    }
                  )
                : const Text('Drug Model is empty'),
            ],
          ),
        ),
      )
    );
  }

  void getTest() async {
    // final String url = 'https://my.api.mockaroo.com/capstone_inspections.json?key=cdedf730';
    final String url = 'https://my.api.mockaroo.com/capstone_my_drug.json?key=cdedf730';
    final logger = Logger();
    final response = await http.get(Uri.parse(url));
    // final response = await http.get(Uri.parse(drugUrl));
    Map<String,dynamic> body = json.decode(response.body);
    logger.d(body);
    // print(response.body);
  }

  Future<InspectionModel> getDummyInspections() async {
    final String url = 'https://my.api.mockaroo.com/capstone_inspections.json?key=cdedf730';
    final logger = Logger();
    
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      Map<String,dynamic> body = json.decode(response.body);
      logger.d(body);
      return InspectionModel.fromJson(body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<DrugModel> getDummyDrug() async {
    final String url = 'https://my.api.mockaroo.com/capstone_my_drug.json?key=cdedf730';
    final logger = Logger();
    
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      Map<String,dynamic> body = json.decode(response.body);
      logger.d(body);
      return DrugModel.fromJson(body);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
