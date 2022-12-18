// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherappv2/pages/Searchpage/Search.dart';
import 'package:weatherappv2/Services/ServiceModel/ModelofAPI.dart';

import '../../providers/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // byanat al habni feha al ui model
  modelAPI? weatherdata;

  void updateui() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    weatherdata = Provider.of<weatherprovider>(context, listen: true)
        .weatherprovidersdata;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(color: Colors.black38),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Search(
                     updateUi: updateui,
                  );
                }));
              },
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.black45,
              ))
        ],
      ),
      body: weatherdata == null
          ? Container(
              child: const Center(
                  child: Text("there is no weather Start Searching now ")))
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [weatherdata!.getthemecolor(), //[500]
                weatherdata!.getthemecolor()[300]!,
                weatherdata!.getthemecolor()[200]!,
                weatherdata!.getthemecolor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 3,
                      ),
                      Text(
                        Provider.of<weatherprovider>(context).CityName!,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Updated date :${weatherdata!.date.toString()}"),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(weatherdata!.getimg()),
                          Text(
                            weatherdata!.temp.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            children: [
                              Text('maxtemp ${weatherdata!.maxtemp.toInt()}'),
                              Text('mintemp : ${weatherdata!.mintemp.toInt()}'),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Text(
                        weatherdata?.weatherStateName ?? 'it is null',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                    ]),
              ),
            ),
    );
  }
}
