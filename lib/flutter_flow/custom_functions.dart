import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? funcionorder() {
  String generateOrderID(int orderCount) {
    int nextOrderNumber = orderCount + 1;
    String orderID = "ORD" + nextOrderNumber.toString().padLeft(3, '0');
    return orderID;
  }
}

String? funcionuser() {
  String generateFreelancerID(int count) {
    return 'FL-${count.toString().padLeft(4, '0')}';
  }
}

String? funcionfreelance() {
  String generateFreelancerID(int count) {
    return 'FL-${count.toString().padLeft(4, '0')}';
  }
}

String? countofworkfre() {
  String incrementStringNumber(String numberString) {
    try {
      int number = int.parse(numberString); // Convertir a entero
      number += 1; // Sumar 1
      return number.toString(); // Devolver como string
    } catch (e) {
      return numberString; // Si hay error, devolver el mismo valor
    }
  }
}

String? ratingfre() {
  double updateAverageRating(
      double currentRating, int totalVotes, double newRating) {
    if (totalVotes <= 0) {
      return newRating; // Si no hay votos previos, el nuevo rating es el primero.
    }

    double updatedRating =
        ((currentRating * totalVotes) + newRating) / (totalVotes + 1);
    return double.parse(
        updatedRating.toStringAsFixed(2)); // Redondeamos a 2 decimales.
  }
}
