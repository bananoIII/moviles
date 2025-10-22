import 'package:flutter/material.dart';

class SongsWidget extends StatefulWidget {
  SongsWidget({super.key, required this.song});
  Map<String, dynamic> song;
  @override
  State<SongsWidget> createState() => _SongsWidgetState();
}

class _SongsWidgetState extends State<SongsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        color: Colors.grey[50],
      ),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: FadeInImage(
              placeholder: AssetImage('/assets/loading.gif'),
              image: NetworkImage(widget.song['image']),
            ),
          ),
          Column(
            children: [
              Text(widget.song['creator']),
              Text(widget.song['nombre']),
              Text(widget.song['duracion'].toString() ?? "Empty"),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
        ],
      ),
    );
  }
}
