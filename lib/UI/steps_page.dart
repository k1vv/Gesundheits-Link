import 'package:flutter/material.dart';

class StepsPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const StepsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Steps',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,

        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Text('graph'),
          const SizedBox(height: 350,),
          Column(
            children: [
              const Text('4881',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
              ),
              const Text('Total Kilocalories',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                height: 70,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('480',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                        Text('Calories',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('24:06',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text('Time',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('480',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text('Kilometers',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
