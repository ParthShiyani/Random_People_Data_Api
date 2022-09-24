import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_datas/helper/random_api_helper.dart';

import '../models/random.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Random People Data"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
        future: RandomAPIHelper.apiHelper.fetchRandomPepoleData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            Randomdata data = snapshot.data;

            return Container(
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 9,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 65,
                    alignment: const Alignment(0, 40.9),
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        widthBox(width: 20.0),
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage(
                            data!.image,
                          ),
                        ),
                        widthBox(width: 10.0),
                        Text(
                          "${data.title} ${data.fnm} ${data.lnm}",
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 35, left: 20, bottom: 20, right: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1,
                            spreadRadius: 0.1,
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                "About",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Divider(),
                            getTile(
                                icon: Icons.person_outline,
                                title: "Username: ${data.userName}",
                                subTitle: "Password: ***${data.passWord}*"),
                            const Divider(),
                            getTile(
                                icon: Icons.location_on_outlined,
                                title:
                                    "${data.addressnum} , ${data.addressnm} , ${data.city}.",
                                subTitle:
                                    "State: ${data.state} , Country: ${data.country}\nPostal code: ${data.postCode}"),
                            const Divider(),
                            getTile(
                                icon: Icons.phone_android,
                                title: "Phone: ${data.cel}",
                                subTitle: "(Optinal)\n Cell: ${data.cel}"),
                            const Divider(),
                            getTile(
                                icon: Icons.email_outlined,
                                title: "Email",
                                subTitle: "${data.email}"),
                            const Divider(),
                            getTile(
                              icon: (data.gender == "male")
                                  ? Icons.male
                                  : Icons.female,
                              title: "Gender: ",
                              subTitle: "${data.gender}",
                            ),
                            const Divider(),
                            getTile(
                              icon: Icons.info_outline,
                              title: "DOB: ${data.dob}",
                              subTitle: "Age: ${data.age}",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  heightBox({required height}) {
    return SizedBox(
      height: height,
    );
  }

  widthBox({required width}) {
    return SizedBox(
      width: width,
    );
  }

  getTile({required icon, required title, required subTitle}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
