import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather{
  var temp;
  var pressure;
  var feelsLike;
  var lon;
  var lat;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var name;

  Weather({
      this.temp;
      this.pressure;
      this.feelsLike;
      this.lon;
      this.lat;
      this.description;
      this.currently;
      this.humidity;
      this.windSpeed;
      this.name;});

  UserDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rating = json['rating'];
    played = json['played'];
    won = json['won'];
    winningPercentage = json['winning_percentage'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['played'] = this.played;
    data['won'] = this.won;
    data['winning_percentage'] = this.winningPercentage;
    data['image'] = this.image;
    return data;
  }

}