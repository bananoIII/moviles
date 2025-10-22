import 'package:flutter/material.dart';
import 'package:progra_movil/components/songs_widget.dart';
import 'package:progra_movil/firebase/songs_database.dart';

class FirebaseListSongsScreen extends StatefulWidget {
  const FirebaseListSongsScreen({super.key});

  @override
  State<FirebaseListSongsScreen> createState() =>
      _FirebaseListSongsScreenState();
}

class _FirebaseListSongsScreenState extends State<FirebaseListSongsScreen> {
  SongsDatabase songsDatabase = SongsDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canciones'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/home/firebase/songs/add',
              ).then((onValue) => setState(() {}));
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: songsDatabase.read_song(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text('No Songs???'));
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error BABY!!!'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              //return Text(snapshot.data!.docs[index].get('title'));
              return SongsWidget(
                song: snapshot.data!.docs[index].data() as Map<String, dynamic>,
              );
            },
          );
        },
      ),
    );
  }
}
