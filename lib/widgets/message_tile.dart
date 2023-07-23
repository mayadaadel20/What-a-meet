import 'dart:convert';
import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../API.dart';
import '../pages/videoPlayer.dart';

class MessageTile extends StatefulWidget {
  final String message;
  final String sender;
  final bool sentByMe;

  const MessageTile(
      {Key? key,
      required this.message,
      required this.sender,
      required this.sentByMe})
      : super(key: key);

  String get getMessage {
    return message;
  }

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  // Future<void> _sendTextToPython(String text) async {
  //   final url = Uri.parse('http://192.168.1.4:5000/api');
  //   final response = await http.post(url, body: {'text': text});
  //   if (response.statusCode == 200) {
  //     print('Text sent successfully!');
  //   } else {
  //     print('Failed to send text: ${response.statusCode}');
  //   }
  // }


  String url = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          widget.sentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
              top: 4,
              bottom: 4,
              left: widget.sentByMe ? 0 : 15,
              right: widget.sentByMe ? 15 : 0),
          alignment:
              widget.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: widget.sentByMe
                ? const EdgeInsets.only(left: 30)
                : const EdgeInsets.only(right: 15),
            padding:
                const EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: widget.sentByMe
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                color: widget.sentByMe
                    ? Theme.of(context).primaryColor
                    : Colors.grey[700]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.sender.toUpperCase(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: -0.5),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(widget.message,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 16, color: Colors.white))
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: widget.sentByMe
                ? Theme.of(context).primaryColor
                : Colors.grey[700],
            borderRadius: BorderRadius.circular(30),
          ),
          child: IconButton(
            onPressed: () {
              nextScreen(
                context,
                Messagetile(message: widget.message,
                sender: widget.sender,
                sentByMe: widget.sentByMe)
              );
            },
            icon: Icon(Icons.sign_language_rounded),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}



