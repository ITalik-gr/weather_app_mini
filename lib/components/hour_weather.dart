import 'package:flutter/material.dart';

class HourWeather extends StatelessWidget {
  final String time;
  final int temp;
  final String imagePath;

  const HourWeather({
    Key? key,
    required this.time,
    required this.temp,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0x1F001026).withOpacity(0.3),
      child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 12),
        child: Column(
          children: [
            Text("$temp°C",
                style: const TextStyle(
                  color: Colors.white, 
                  fontSize: 18, 
                  fontWeight: FontWeight.w400
                  ),
                ),

            const SizedBox(height: 30),

            Image.asset(imagePath),
        
            const SizedBox(height: 25),

            Text(time,
                  style: const TextStyle(
                    color: Colors.white, 
                    fontSize: 17, 
                    fontWeight: FontWeight.w400
                    ),
                  ), 
            
          ],
        ),
      ),
    );
  }
}
