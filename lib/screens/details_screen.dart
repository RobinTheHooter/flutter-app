import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: movie.imageUrl != null
                  ? Image.network(
                      movie.imageUrl!,
                      fit: BoxFit.cover,
                    )
                  : Container(color: Colors.grey[900]),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 8),
                  if (movie.rating != null)
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text(' ${movie.rating}'),
                      ],
                    ),
                  if (movie.genres != null) ...[
                    SizedBox(height: 8),
                    Text(
                      movie.genres!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                  if (movie.premiered != null) ...[
                    SizedBox(height: 8),
                    Text(
                      'Premiered: ${movie.premiered}',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                  SizedBox(height: 16),
                  if (movie.summary != null)
                    Html(
                      data: movie.summary!,
                      style: {
                        "body": Style(
                          color: Colors.white,
                          fontSize: FontSize(16),
                        ),
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
