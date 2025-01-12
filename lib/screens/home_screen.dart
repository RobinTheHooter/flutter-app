import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/api_service.dart';
import '../widgets/movie_grid.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Movie>> _movies;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _movies = _apiService.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.black.withOpacity(0.7),
            title: Text(
              'Movie Explorer',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder<List<Movie>>(
              future: _movies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return MovieGrid(movies: snapshot.data!);
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                return Center(
                  child: CircularProgressIndicator(color: Colors.red),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
