import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
import 'package:study/services/db_service.dart';
import '../view_note.dart';
import 'create_note.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Notes> {
  CollectionReference dbCollection =
      FirebaseFirestore.instance.collection('Notes');
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas notas"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: dbCollection.doc(user!.uid).collection('MyNotes').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text("Nenhuma nota !"),
              );
            } else {
              return ListView(
                children: [
                  ...snapshot.data!.docs.map((data) {
                    String title = data.get('title');
                    final time = data.get('time');
                    String body = data.get('body');
                    String id = data.id;

                    return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ViewNote(
                                title: title,
                                body: body,
                                id : id,
                              ),
                            ),
                          );
                        },
                        title: Text(title),
                        subtitle: Text("$time"),
                        trailing: IconButton(
                            onPressed: () {
                              DbHelper().delete(id: id).then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(value)));
                              });
                            },
                            icon: const Icon(Icons.delete)),
                        );
                  }),
                  const SizedBox(
                    height: 80,
                  )
                ],
              );
            }
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CreateNotePage()),
            );
          },
          label: Row(
            children: const [Icon(Icons.add), Text("Nota")],
          )),
    );
  }
}