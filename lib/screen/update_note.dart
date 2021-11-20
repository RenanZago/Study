import 'package:flutter/material.dart';
import 'package:study/services/db_service.dart';

// ignore: must_be_immutable
class UpdateNotePage extends StatefulWidget {
  UpdateNotePage({Key? key, this.id, this.title, this.body}) : super(key: key);

  String? id;
  String? title;
  String? body;

  @override
  _UpdateNotePageState createState() => _UpdateNotePageState();
}

class _UpdateNotePageState extends State<UpdateNotePage> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void initState() {
    super.initState();

    setState(() {
      title.text = widget.title!;
      body.text = widget.body!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar nota"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: key,
                child: Column(
                  children: [
                    ///Title note
                    TextFormField(
                      controller: title,
                      decoration: const InputDecoration(
                        label: Text('Título'),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Está faltando o título';
                        }
                      },
                    ),

                    const SizedBox(height: 30),

                    ///Description
                    ///
                    TextFormField(
                        controller: body,
                        maxLines: 8,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Nada foi adicionado';
                          }
                        },
                        decoration: const InputDecoration(
                            label: Text('Nota'),
                            border: OutlineInputBorder()))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (key.currentState!.validate()) {
              ///Save dat to firebase
              DbHelper()
                  .update(
                      id: widget.id,
                      title: title.text.trim(),
                      body: body.text.trim())
                  .then((value) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(value)));
              });
            }
          },
          label: Row(
            children: const [Icon(Icons.add), Text("Salvar nota")],
          )),
    );
  }
}