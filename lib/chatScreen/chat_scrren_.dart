import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/chatScreen/message_text_field.dart';
import 'package:dyslexiaa/chatScreen/single_message.dart';
import 'package:dyslexiaa/profile/avatar2.dart';
import 'package:flutter/material.dart';

class chat_Screen extends StatelessWidget {
  final UserModel? currentUser;
  final String friendId;
  final String friendName;
  final String friendImage;

  const chat_Screen({
    required this.currentUser,
    required this.friendId,
    required this.friendImage,
    required this.friendName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 2, 112, 255),
          title: Row(
            children: [
              // ClipRRect(
              //       borderRadius:BorderRadius.circular(80),
              //       child: Image.network(friendImage,height: 25,),

              // ),
              Avatar2(
                avatarUrl: friendImage,
                radius: 25,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                friendName,
                style: const TextStyle(fontSize: 20),
              )
            ],
          )),
      body: Column(children: [
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("user")
                .doc(currentUser!.id)
                .collection("messages")
                .doc(friendId)
                .collection('chats')
                .orderBy("date", descending: true)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.docs.length < 1) {
                  return const Center(
                    child: Text("say hi"),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    reverse: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      bool isMe = snapshot.data.docs[index]['senderId'] ==
                          currentUser!.id;
                      return SignleMesage(
                          message: snapshot.data.docs[index]['message'],
                          isMe: isMe);
                    });
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        )),
        MessageTextField(currentUser!.id, friendId),
      ]),
    );
  }
}
