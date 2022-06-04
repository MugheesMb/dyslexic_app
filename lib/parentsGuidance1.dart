// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expandable/expandable.dart';

class ParentsGuidance1 extends StatelessWidget {
  static const routeName = "/parent-guidance-2";
  const ParentsGuidance1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text("How to treat children",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
          backgroundColor: Color.fromRGBO(43, 95, 129, 1),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            height: 180,
            width: size.width,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: -100,
                    width: size.width,
                    child: SvgPicture.asset("pic/circles.svg")),
                Positioned(
                  top: size.height > 550 ? 70 : 40,
                  width: size.width,
                  child: Center(
                    child: Text(
                      "Parents Guidance",
                      style: TextStyle(
                        fontSize: size.height > 550 ? 23 : 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "A dyslexic child takes more time and parental attention than a child without any developmental prolems. Follow the following points to treat a child with dyslexia. These will help them grow confidence and increase their motivation to do better.",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: size.height > 550 ? 20 : 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Divider(thickness: 3),
            ExpandablePanel(
              header: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("1. Patience",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              collapsed: Text(
                "",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "We have to be patient with dyslexic child as they take longer time to understand.",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(thickness: 3),
            ExpandablePanel(
              header: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("2. Attention Of Parents",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              collapsed: Text(
                "",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Co parent the dyslexic child so that they can have attention of both the parents equally.",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(thickness: 3),
            ExpandablePanel(
              header: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("3. Stay Calm",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              collapsed: Text(
                "",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "We have to stay clam with dyslexic children. ",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(thickness: 3),
            ExpandablePanel(
              header: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("4. Healthy Relationship",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              collapsed: Text(
                "",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "We need to make a healthy relationship with dyslexic children so they can easily share their problems with you.",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(thickness: 3),
            ExpandablePanel(
              header: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("5. Don't Snub",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              collapsed: Text(
                "",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Don't Snub your child, motivate him/her in every aspects of life. ",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(thickness: 3),
            ExpandablePanel(
              header: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("6. Positive Enviorment",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              collapsed: Text(
                "",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Creat a positive and friendly enviorment in your home and overall surrounding of the children.",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(thickness: 3),
            ExpandablePanel(
              header: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("7. Extracurricular Activities",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              collapsed: Text(
                "",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Encourage your child to participate extracurricular activities and engage in social gatherings.",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(thickness: 3),
            ExpandablePanel(
              header: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("8. Don't judge",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              collapsed: Text(
                "",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Don't judge the child on his/her performance, Don't rush things for him/her, give him/her time to do stuff.",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(thickness: 3),
            ExpandablePanel(
              header: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("9. Listen",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              collapsed: Text(
                "",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Always listen to your child very carefully. ",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(thickness: 3),
            ExpandablePanel(
              header: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("10. Validate His Feelings",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              collapsed: Text(
                "",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "ALways validate his feelings and try understand his/her situation as he/she might be facing issues with normal stuff that we can't understand.",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Divider(thickness: 3),
            SizedBox(height: 30),
          ]),
        ]),
      ),
    );
  }
}