import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            PlantCard(
              imageUrl:
              'https://media.istockphoto.com/id/183300149/fr/photo/brocoli.webp?b=1&s=170667a&w=0&k=20&c=lKS166V-qwySqaFqqc6FTyN2Q1ZJKzTJDh8OTBMsi9k=',
              plantName: 'Brocoli',
            ),
            PlantCard(
              imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg',
              plantName: 'Tomato',
            ),
            PlantCard(
              imageUrl:
              'https://media.istockphoto.com/id/471197349/fr/photo/rouge-jaune-et-orange-poivrons.webp?b=1&s=170667a&w=0&k=20&c=AIE4MHZHH6tA1TQE6xHHYAPdnA9ijI7G5mpc3LPfzoM=',
              plantName: 'bell pepper',
            ),
          ],
        ),
      ),
    );
  }
}

class PlantCard extends StatelessWidget {
  final String imageUrl;
  final String plantName;

  const PlantCard({Key? key, required this.imageUrl, required this.plantName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              plantName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

