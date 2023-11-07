import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget DynamicData({required AsyncSnapshot snapshot, required Widget child}) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
  } else if (snapshot.hasError) {
    return Text('Error: ${snapshot.error}');
  } else {
    return child;
  }
}
