// ignore_for_file: file_names, must_be_immutable,, non_constant_identifier_names, avoid_unnecessary_containers, use_build_context_synchronously
// non_constant_identifier_names, avoid_unnecessary_containers,
//unused_local_variable, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherappv2/pages/Homepagefolder/homepage.dart';
import 'package:weatherappv2/providers/provider.dart';

import '../../Services/SearvicesFolder/service.dart';
import '../../Services/ServiceModel/ModelofAPI.dart';

class Search extends StatelessWidget {
  Search({super.key,this.updateUi});

  String? CityName;
  VoidCallback? updateUi;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Search a City",
            style: TextStyle(color: Colors.black38),
          ),
          centerTitle: false,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Homepage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black45,
            ),
          ),
        ),
        body: Container(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onSubmitted: (data) async {
                CityName = data;
                serviceAPI service1 = serviceAPI();
                modelAPI weather =
                    await service1.getweather(CityName: CityName!);
                Provider.of<weatherprovider>(context, listen: false)
                    .weatherprovidersdata = weather;
                Provider.of<weatherprovider>(context, listen: false).CityName =
                    CityName;
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                label: Text("search"),
                hintText: "enter a city",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search, size: 30, color: Colors.black45),
              ),
            ),
          ),
        )));
  }
}
