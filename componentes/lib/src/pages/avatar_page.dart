import 'package:flutter/material.dart';

class AvartPage extends StatelessWidget {
  const AvartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.all(5.0),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.blogs.es/85aa44/stan-lee/1366_2000.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              child: Text('GM'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: const Center(
          child: FadeInImage(
            image: NetworkImage(
                'https://i.blogs.es/85aa44/stan-lee/1366_2000.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.skip_previous),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
