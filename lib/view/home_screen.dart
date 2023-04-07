// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:noviindus_machine_test/controller/category_provider.dart';
import 'package:noviindus_machine_test/controller/content_provider.dart';
import 'package:noviindus_machine_test/view/content_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<CategoryProvider>(context, listen: false)
          .categoryPreview();
      await Provider.of<ContentProvider>(context, listen: false).contentPreview(
        0.toString(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News and Blogs',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
            height: size.height * 0.04,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Consumer<CategoryProvider>(
                builder: (context, value, child) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: value.categoryList.isEmpty
                      ? 0
                      : value.categoryList[0].blogsCategory.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: InkWell(
                        onTap: () {
                          Provider.of<ContentProvider>(
                            context,
                            listen: false,
                          ).contentPreview(
                            value.categoryList[0].blogsCategory[index].id
                                .toString(),
                          );
                        },
                        child: Text(
                          value.categoryList[0].blogsCategory[index].name,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 270),
            child: Text(
              'Latest News',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            child: Consumer<ContentProvider>(
              builder: (context, value, child) => ListView.builder(
                itemCount: value.contentList.isEmpty
                    ? 0
                    : value.contentList[0].results.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ContentScreen(
                            date: value.contentList[0].results[index].createdAt,
                            content:
                                value.contentList[0].results[index].content,
                            image:
                                "https://d2qetcusef3plg.cloudfront.net${value.contentList[0].results[index].image}",
                            title: value.contentList[0].results[index].title,
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: size.height * 0.28,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                width: double.infinity,
                                height: size.height * 0.15,
                                child: Image(
                                  image: NetworkImage(
                                    "https://d2qetcusef3plg.cloudfront.net${value.contentList[0].results[index].image}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              value.contentList[0].results[index].title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.width * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: SizedBox(
                              height: size.height * 0.05,
                              child: Text(
                                value.contentList[0].results[index].content,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
