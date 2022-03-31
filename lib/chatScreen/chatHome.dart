import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/bottom_bar.dart';
import 'package:dyslexiaa/chatScreen/chat_scrren_.dart';
import 'package:dyslexiaa/chatScreen/psycho_screen.dart';
import 'package:dyslexiaa/profile/avatar.dart';
import 'package:dyslexiaa/profile/avatar2.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class chat_Home extends StatefulWidget {
  static const routeName = "/homescreen";

  @override
  State<chat_Home> createState() => _chat_HomeState();
}

class _chat_HomeState extends State<chat_Home> {
  @override
  Widget build(BuildContext context) {
    UserModel? user = locator.get<UserController>().currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('chat'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => psychologist_Screen())));
              },
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(child: BottomNavBarV2(), elevation: 0),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user')
            .doc(user?.id)
            .collection('messages')
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.docs.length < 1) {
              return Center(
                child: Text("No chats avaialable !"),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  var friendId = snapshot.data.docs[index].id;
                  var lastMsg = snapshot.data.docs[index]['last_msg'];
                  return FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('user')
                          .doc(friendId)
                          .get(),
                      builder: (context, AsyncSnapshot asyncSnapshot) {
                        if (asyncSnapshot.hasData) {
                          var friend = asyncSnapshot.data;
                          return ListTile(
                            leading: FittedBox(
                              child: CircleAvatar(
                                radius: 45.0,
                                backgroundImage:
                                    NetworkImage(friend['photoUrl']),
                              ),
                            ),
                            //Avatar(avatarUrl: friend['photoUrl'], onTap: () {  }, ),
                            title: Text(friend['userName']),
                            subtitle: Container(
                                child: Text(
                              "$lastMsg",
                              style: TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            )),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => chat_Screen(
                                          currentUser: user!,
                                          friendId: friend['id'],
                                          friendImage: friend['photoUrl'],
                                          friendName: friend['userName'])));
                            },
                          );
                        }
                        return LinearProgressIndicator();
                      });
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
