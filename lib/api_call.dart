import 'package:http/http.dart' as http;
import 'dart:convert';

class Comic {
  final String name;
  final String imageUrl;

  Comic({required this.name, required this.imageUrl});

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      name: json['name'] ?? 'No name',
      imageUrl: json['image']['original_url'],
    );
  }
}

Future<List<Comic>> getPopularComics() async {
  final response = await http.get(
    Uri.parse(
        'https://comicvine.gamespot.com/api/volumes/?api_key=16614ade8e59332962eae097ac6d90942aac97a8&format=json&limit=3'),
  );

  if (response.statusCode == 200) {
    List<dynamic> comicsList = json.decode(response.body)['results'];
    return comicsList.map((comic) => Comic.fromJson(comic)).toList();
  } else {
    throw Exception('Failed to load comics');
  }
}

Future<List<Comic>> getPopularSeries() async {
  final response = await http.get(
    Uri.parse(
        'https://comicvine.gamespot.com/api/series_list/?api_key=16614ade8e59332962eae097ac6d90942aac97a8&format=json&limit=3'),
  );

  if (response.statusCode == 200) {
    List<dynamic> comicsList = json.decode(response.body)['results'];
    return comicsList.map((comic) => Comic.fromJson(comic)).toList();
  } else {
    throw Exception('Failed to load comics');
  }
}

Future<List<Comic>> getPopularMovies() async {
  final response = await http.get(
    Uri.parse(
        'https://comicvine.gamespot.com/api/movies/?api_key=16614ade8e59332962eae097ac6d90942aac97a8&format=json&limit=3'),
  );

  if (response.statusCode == 200) {
    List<dynamic> comicsList = json.decode(response.body)['results'];
    return comicsList.map((comic) => Comic.fromJson(comic)).toList();
  } else {
    throw Exception('Failed to load comics');
  }
}
