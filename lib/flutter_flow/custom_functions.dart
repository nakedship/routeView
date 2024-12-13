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
import '/backend/supabase/supabase.dart';

LatLng? jsonToLatLng(dynamic supabaseField) {
  // I have a supabase field in the following json format {   "latitude": 37.7749,   "longitude": -122.4194 } and I want to convert it to latlng and return latlng

  double latitude = supabaseField['latitude'];
  double longitude = supabaseField['longitude'];

  return LatLng(latitude, longitude);
}
