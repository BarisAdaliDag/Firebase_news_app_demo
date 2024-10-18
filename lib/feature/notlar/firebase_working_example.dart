import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_news_app/core/kartal/kartal_extension.dart';
import 'package:flutter/material.dart';

import 'package:firebase_news_app/product/utility/exception/custom_exception.dart';

import 'package:firebase_news_app/product/models/news.dart';

class FirebaseExampleView extends StatefulWidget {
  const FirebaseExampleView({super.key});

  @override
  State<FirebaseExampleView> createState() => _FirebaseExampleViewState();
}

class _FirebaseExampleViewState extends State<FirebaseExampleView> {
  String documentId = '3u99HH1vvBrm43aFtRAk';
  CollectionReference news = FirebaseFirestore.instance.collection('news');
  @override
  Widget build(BuildContext context) {
    final response = news.withConverter(
      //3. vid 50dk
      fromFirestore: (snapshot, options) {
        // final jsonBody = snapshot.data();
        // if (jsonBody != null) {
        //   return NewsModel().fromJson(jsonBody);
        // }
        // return null;
        return News().fromFirebase(snapshot);
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

  final Future<QuerySnapshot<News>> response;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: response,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<News?>> snapshot) {
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
                physics: const NeverScrollableScrollPhysics(),
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
