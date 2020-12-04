import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
      title: 'Weather app ',
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //main
  var temp;
  var pressure;
  var feelsLike;
  //coord
  var lon;
  var lat;

  //weather
  var description;
  var currently;
  //main
  var humidity;
  //wind
  var windSpeed;

  var name;

  Future getWeather() async {
    http.Response response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?q=Bishkek&units=metric&appid=5f8186c5a1acecc54e13919505864624');
    var result = jsonDecode(response.body);
    setState(() {
      this.temp = result['main']['temp'];
      this.pressure = result['main']['pressure'];
      this.lon = result['coord']['lon'];
      this.lat = result['coord']['lat'];

      this.description = result['weather'][0]['description'];
      this.currently = result['weather'][0]['main'];
      this.humidity = result['main']['humidity'];
      this.windSpeed = result['wind']['speed'];
      this.name = result['name'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                  name != 0 ? name.toString() : 'Loading',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  temp != 0 ? temp.toString() + '℃' : 'Loading',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : 'Loading',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    lon != null ? '$lon $lat' : 'Loading',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: [
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                  title: Text('Temperature'),
                  trailing:
                      Text(temp != 0 ? temp.toString() + '\u0000' : 'Loading'),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                  title: Text('feelsLike'),
                  trailing: Text(feelsLike != 0
                      ? feelsLike.toString() + '\u0000'
                      : 'Loading'),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                  title: Text('pressure'),
                  trailing:
                      Text(pressure != 0 ? pressure.toString() : 'Loading'),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.cloud),
                  title: Text('Weather'),
                  trailing: Text(
                      description != 0 ? description.toString() : 'Loading'),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.sun),
                  title: Text('Humidity'),
                  trailing:
                      Text(humidity != 0 ? humidity.toString() : 'Loading'),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.wind),
                  title: Text('Wind Speed'),
                  trailing:
                      Text(windSpeed != 0 ? windSpeed.toString() : 'Loading'),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
