import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/bottom_bar.dart';
import 'package:dyslexiaa/chatScreen/chat_scrren_.dart';
import 'package:dyslexiaa/chatScreen/psycho_screen.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
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
        title: const Text('chat'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => psychologist_Screen())));
              },
              child: const Icon(
                Icons.search,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(child: BottomNavBarV2(2), elevation: 0),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user')
            .doc(user?.id)
            .collection('messages')
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.docs.length < 1) {
              return const Padding(
                padding: EdgeInsets.all(35),
                child: Center(
                  child: Text(
                      "No chats avaialable! , click on search Icon to find psychologist"),
                ),
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
                               
                               child: friend['photoURL'] ==
                                                        null
                                                    ? Image.asset('pic/u.png')
                                                    : Image.network(
                                                        friend['photoURL'],
                                                      )
                                                      
                              ),
                            ),
                            //Avatar(avatarUrl: friend['photoUrl'], onTap: () {  }, ),
                            title: Text(friend['displayName']),
                            subtitle: Container(
                                child: Text(
                              "$lastMsg",
                              style: const TextStyle(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            )),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => chat_Screen(
                                          currentUser: user!,
                                          friendId: friend['id'],
                                          friendImage: friend['photoURL'],
                                          friendName: friend['displayName'])));
                            },
                          );
                        }
                        return const LinearProgressIndicator();
                      });
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
