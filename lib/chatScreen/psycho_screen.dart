import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dyslexiaa/LoginAndSignup/usermodel.dart';
import 'package:dyslexiaa/chatScreen/chat_scrren_.dart';
import 'package:dyslexiaa/provider/locator.dart';
import 'package:dyslexiaa/usercontroller/Usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class psychologist_Screen extends StatefulWidget {
  static const routeName = "/searchscreen";
  // UserModel? user;
  // Search_Screen(this.user);

  @override
  State<psychologist_Screen> createState() => _psychologist_ScreenState();
}

class _psychologist_ScreenState extends State<psychologist_Screen> {
  TextEditingController searchController = TextEditingController();
  // List<Map> searchResult = [];
  bool isLoading = false;

  // void onSearch() async {
  //   setState(() {
  //     searchResult = [];
  //     isLoading = true;
  //   });
  //   await FirebaseFirestore.instance
  //       .collection('user')
  //       //  .where("userName", isEqualTo: searchController.text)
  //       .get()
  //       .then((value) {
  //     if (value.docs.length < 1) {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text("No user Found")));
  //       setState(() {
  //         isLoading = false;
  //       });
  //       return;
  //     }
  //     value.docs.forEach((user) {
  //       if (user.data()['email'] != widget.user.email) {
  //         searchResult.add(user.data());
  //       }
  //     });
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }

  // List<Map> get items {
  //   return [...searchResult];
  // }

  @override
  Widget build(BuildContext context) {
    UserModel? user = locator.get<UserController>().currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('search'),
      ),
      // body: Column(
      //   children: [
      //     Row(
      //       children: [
      //         Expanded(
      //             child: Padding(
      //           padding: const EdgeInsets.all(15.0),
      //           child: TextField(
      //             controller: searchController,
      //             decoration: InputDecoration(
      //                 hintText: "type username",
      //                 border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(10))),
      //           ),
      //         )),
      //         IconButton(
      //             onPressed: () {

      //             },
      //             icon: Icon(Icons.search))
      //       ],
      //     ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('user').where('id',
            whereIn: [
              
              "KdE0pdl85AdUf4ppsy5B5ZlG3hh1"
            ]).snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.docs.length < 1) {
              return const Center(
                child: Text("No Psychologist avaialable currently in demo mode  :)"),
              );
            }
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "Psychologist !",
                    style: TextStyle(
                      fontSize: 35,
                      letterSpacing: 1.5,
                      color: Color.fromARGB(255, 109, 101, 88),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      DocumentSnapshot items = snapshot.data.docs[index];
                      return ListTile(
                        leading: FittedBox(
                          child: CircleAvatar(
                          //  radius: 55.0,
                           // backgroundImage:
                            
//                 child:  CachedNetworkImage(
//    imageUrl: items['photoURL'],
//    placeholder: (context, url) => CircularProgressIndicator(),
//    errorWidget: (context, url, error) =>   Image.asset('pic/u.png'),
// ),
                                        child: items['photoURL'] == null
                                                    ? Image.asset('pic/u.png')
                                                    
                                                    : Image.network(
                                                        items['photoURL'],
                                                      )
                                                      ),
                                              
                                    
                            
                              //  NetworkImage(items['photoURL'] ?? ''),
                            // : BoxFit.fill,
                          
                        ),
                        //     ClipRRect(
                        //   borderRadius: BorderRadius.circular(120),
                        //   child: CachedNetworkImage(
                        //     imageUrl: items['photoURL']??'',
                        //     fit: BoxFit.cover,
                        //     //  width: MediaQuery.of(context).size.width,
                        //     placeholder: (context, url) =>
                        //         CircularProgressIndicator(),
                        //     errorWidget: (context, url, error) => Icon(Icons.error),
                        //   ),

                        // ),
                        title: Text(items['displayName']),
                        subtitle: Text(items['email']),
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => chat_Screen(
                                            currentUser: user,
                                            friendId: items['id'],
                                            friendImage: items['photoURL'],
                                            friendName: items['displayName'],
                                          )));
                            },
                            icon: const Icon(Icons.message)),
                      );
                    }),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
