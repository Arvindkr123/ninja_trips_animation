import 'package:flutter/material.dart';

import 'package:ninja_trips/models/Trip.dart';
import 'package:ninja_trips/shared/heart.dart';

class Details extends StatelessWidget {
  final Trip trip;
  const Details({Key? key, required this.trip}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const loremIpsum =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
        "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.";
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'location-img-${trip.img}',
              child: Image.asset(
                'images/${trip.img}',
                height: 360,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              title: Text(
                trip.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[800],
                ),
              ),
              subtitle: Text(
                '${trip.nights} night stay for only \$${trip.price}',
              ),
              trailing: Heart(),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                loremIpsum,
                style: TextStyle(color: Colors.grey[600], height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
