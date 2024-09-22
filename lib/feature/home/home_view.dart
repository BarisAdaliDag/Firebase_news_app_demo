import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_news_app/core/kartal/kartal_extension.dart';
import 'package:flutter/material.dart';

import 'package:firebase_news_app/product/models/newsModel.dart';

import 'package:firebase_news_app/product/utility/exception/custom_exception.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String documentId = '3u99HH1vvBrm43aFtRAk';
  CollectionReference news = FirebaseFirestore.instance.collection('news');
  @override
  Widget build(BuildContext context) {
    final response = news.withConverter(
      fromFirestore: (snapshot, options) {
        // final jsonBody = snapshot.data();
        // if (jsonBody != null) {
        //   return NewsModel().fromJson(jsonBody);
        // }
        // return null;
        return NewsModel().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();

    return Scaffold(
      appBar: AppBar(),
      body: _HomeListView(response: response),
    );
  }
}

class _HomeListView extends StatelessWidget {
  const _HomeListView({
    required this.response,
    super.key,
  });

  final Future<QuerySnapshot<NewsModel>> response;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: response,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<NewsModel?>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Placeholder();
          case ConnectionState.waiting:
          case ConnectionState.active:
            return const LinearProgressIndicator();
          case ConnectionState.done:
            if (snapshot.hasData) {
              final values = snapshot.data!.docs.map((e) => e.data()).toList();
              return ListView.builder(
                itemCount: values.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          values[index]?.backgroundImage ?? '',
                          height: context.dynamicHeight(.1),
                        ),
                        Text(
                          values[index]?.title ?? '',
                          style: context.textTheme.labelLarge,
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
        }
      },
    );
  }
}
