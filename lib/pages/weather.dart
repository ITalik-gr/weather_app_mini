// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/components/hour_weather.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  final int maxTemperature = 31;
  final int minTemperature = 25;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF08244F),
            Color(0xFF134CB5),
            Color(0xFF0B42AB),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.4738, 1.0],
          transform: GradientRotation(167 * (3.141592653589793 / 180)),
        ),
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 200,
        leading: Row(
           children: [
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Icon(
                Icons.location_pin,
                color: Colors.white,
                size: 27,
              ),
            ),
            SizedBox(width: 15),
            Text(
              "Fortaleza",
              style: TextStyle(
                color: Colors.white, 
                fontSize: 18, 
                fontWeight: FontWeight.w600
                ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 27,
            )
           ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Icon(
              Icons.notifications_rounded,
              size: 27,
              color: Colors.white
            ),
          )
        ],
      ),
      body: Container(    
        padding: EdgeInsets.fromLTRB(40, 34, 40, 40),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'lib/assets/image/cloud.png',
                width: 207,
                height: 200,
              ),
            ),
            Center(
              child: Text("28º", style: TextStyle(fontSize: 64, color: Colors.white, fontWeight: FontWeight.w600),)
            ),
            Center(
              child: Text(
                "Precipitations", 
                style: TextStyle(fontSize: 18, color: Colors.white, height: 1.2),)
            ),
            Center(
              child: Text(
                "Max.: $maxTemperatureº   Min.: $minTemperatureº", 
                style: TextStyle(fontSize: 18, color: Colors.white, height: 1.2),),
            ),
            SizedBox(height: 30),
            Container(
              child: Container(
                padding: EdgeInsets.only(top: 12, left: 35, right: 16.5, bottom: 11),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 3,
                      spreadRadius: 3,
                      offset: Offset(0, 0),
                    ),
                  ],
                  color: Color.fromARGB(77, 0, 16, 3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('lib/assets/image/rain.svg',),
                        SizedBox(width: 5),
                        Text("6%", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),)
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('lib/assets/image/humidity.svg',),
                        SizedBox(width: 5),
                        Text("90%", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),)
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('lib/assets/image/wind.svg',),
                        SizedBox(width: 5),
                        Text("19 km/h", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),)
                      ],
                    ),
                  ],  
                ),
              ),
            ),

            SizedBox(height: 20),

            // today hours
            Container(
              child: Container(
                padding: EdgeInsets.only(top: 12, left: 35, right: 16.5, bottom: 11),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 3,
                      spreadRadius: 3,
                      offset: Offset(0, 0),
                    ),
                  ],
                  color: Color.fromARGB(77, 0, 16, 3),
                ),
                //? Nav
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Today', 
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                        Text('Mar, 9', 
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                      ], 
                    ),

                    SizedBox(height: 13,),

                    //? Hour cards
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
                        // Генерація чотирьох карток
                        return HourWeather(
                          key: Key(index.toString()), // Ключ для кожної картки
                          time: '15.00', // Приклад значення часу
                          temp: 25, // Приклад значення температури
                          imagePath: 'lib/assets/image/cloud-1.png', // Приклад шляху до зображення
                        );
                      }),
                    ),
                  ],
                ),
                
              ),
            ),
          ],
        )

      ),
    ),
    );
  }
}