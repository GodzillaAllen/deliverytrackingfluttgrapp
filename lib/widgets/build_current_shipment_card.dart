import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildCurrentShipmentCard(String trackingNumber, String sourceCity,
    String destinationCity, String status) {
  List months = [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec'
  ];
  var now = DateTime.now();
  var currentMonth = now.month;

  return InkWell(
    onTap: () => {Get.toNamed("/current_shipment_detail")},
    child: Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              trackingNumber,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$status· ${now.day} ${months[currentMonth - 1]}",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.black),
                const SizedBox(width: 8.0),
                const Text(
                  "From",
                  style: TextStyle(color: Colors.black),
                ),
                const Spacer(),
                Text(
                  sourceCity,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.black),
                const SizedBox(width: 8.0),
                const Text(
                  "To",
                  style: TextStyle(color: Colors.black),
                ),
                const Spacer(),
                Text(
                  destinationCity,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor: Colors.grey[200],
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8.0),
                const Icon(Icons.arrow_forward, color: Colors.black),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
