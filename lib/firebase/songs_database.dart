import 'package:cloud_firestore/cloud_firestore.dart';

class SongsDatabase {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  CollectionReference? songs_colection;

  SongsDatabase() {
    songs_colection = firebaseFirestore.collection('songs');
  }

  Future<void> insert_song(Map<String, dynamic> song) async {
    songs_colection!.doc().set(song);
  }

  Stream<QuerySnapshot> read_song() {
    return songs_colection!.snapshots();
  }

  Future<void> update_song(Map<String, dynamic> song, String uid) async {
    songs_colection!.doc(uid).update(song);
  }

  Future<void> delete_song(String uid) async {
    songs_colection!.doc(uid).delete();
  }
}
