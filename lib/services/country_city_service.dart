import 'dart:convert';

import 'package:http/http.dart' as http;

class CountryCityService {

   Future<List<String>> listCountries() async {
    var resposta = await http.get(
      Uri.parse(
        'https://countriesnow.space/api/v0.1/countries/flag/images',
      ),
    );

    if (resposta.statusCode == 200) {
      Iterable lista = json.decode(resposta.body)['data'];
      return lista.map((modelo) => modelo['name'].toString()).toList();
    } else {
      return [];
    }
  }

  Future<List<String>> listCities(String country) async {
    var resposta = await http.post(
      Uri.parse(
        'https://countriesnow.space/api/v0.1/countries/cities',
      ),
      body:
      {
        "country": country
      }
    );

    if (resposta.statusCode == 200) {
      Iterable lista = json.decode(resposta.body)['data'];
      print(lista);
      return lista.map((modelo) => modelo.toString()).toList();
    } else {
      return [];
    }
  }
}