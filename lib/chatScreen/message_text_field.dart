import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageTextField extends StatefulWidget {
  final String currentId;
  final String friendId;

  const MessageTextField(this.currentId, this.friendId);

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
    bool submit = false;
  final TextEditingController _controller = TextEditingController();
  @override
void initState() {
  // TODO: implement initState
  super.initState();
  _controller.addListener(() {
    setState(() {
      submit = _controller.text.isNotEmpty;
    });
    
  });
}

  @override
  Widget build(BuildContext context) {
  
    
    return Container(
      color: Colors.white,
      padding: const EdgeInsetsDirectional.all(8),
      child: Row(children: [
        Expanded(
            child: TextField(
          controller: _controller,
          decoration: InputDecoration(
              labelText: "Type your Message",
              fillColor: Colors.grey[100],
              filled: true,
              border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0),
                  gapPadding: 10,
                  borderRadius: BorderRadius.circular(25))),
        )),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: submit ? () 
          async {
            String message = _controller.text;
            _controller.clear();
            await FirebaseFirestore.instance
                .collection('user')
                .doc(widget.currentId)
                .collection('messages')
                .doc(widget.friendId)
                .collection('chats')
                .add({
              "senderId": widget.currentId,
              "receieverId": widget.friendId,
              "message": message,
              "type": "text",
              "date": DateTime.now(),
            }).then((value) => {
                      FirebaseFirestore.instance
                          .collection('user')
                          .doc(widget.currentId)
                          .collection('messages')
                          .doc(widget.friendId)
                          .set({
                        'last_msg': message,
                      }),
                    });
            await FirebaseFirestore.instance
                .collection('user')
                .doc(widget.friendId)
                .collection('messages')
                .doc(widget.currentId)
                .collection('chats')
                .add({
              "senderId": widget.currentId,
              "receieverId": widget.friendId,
              "message": message,
              "type": "text",
              "date": DateTime.now(),
            }).then((value) => {
                      FirebaseFirestore.instance
                          .collection('user')
                          .doc(widget.friendId)
                          .collection('messages')
                          .doc(widget.currentId)
                          .set({
                        'last_msg': message,
                      }),
                    });
          } : null,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}
