import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final DateTime date;

  const ContentScreen({
    super.key,
    required this.image,
    required this.title,
    required this.content,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    width: double.infinity,
                    height: size.height * 0.27,
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.03,
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      date.toIso8601String(),
                      style: TextStyle(color: Colors.green.shade700),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  content,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
