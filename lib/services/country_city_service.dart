import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/city.dart';
import '../model/country.dart';

class CountryCityService {

   Future<List<Country>> listCountries() async {
    var resposta = await http.get(
      Uri.parse(
        'https://countriesnow.space/api/v0.1/countries/flag/images',
      ),
    );

    if (resposta.statusCode == 200) {
      Iterable lista = json.decode(resposta.body)['data'];
      return lista.map((modelo) => Country.fromJson(modelo)).toList();
    } else {
      return [];
    }
  }

  Future<List<City>> listCities() async {
    var resposta = await http.post(
      Uri.parse(
        'https://countriesnow.space/api/v0.1/countries/cities',
      ),
      body:
      {
        "country": "Brazil"
      }
    );

    if (resposta.statusCode == 200) {
      Iterable lista = json.decode(resposta.body)['data'];
      return lista.map((modelo) => City(modelo)).toList();
    } else {
      return [];
    }
  }
}