import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../screens/details_screen.dart';

class MovieGrid extends StatelessWidget {
  final List<Movie> movies;

  const MovieGrid({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieGridItem(movie: movies[index]);
      },
    );
  }
}

class MovieGridItem extends StatelessWidget {
  final Movie movie;

  const MovieGridItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(movie: movie),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[900],
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie.imageUrl != null)
              Expanded(
                child: Image.network(
                  movie.imageUrl!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (movie.rating != null)
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        Text(' ${movie.rating}'),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
