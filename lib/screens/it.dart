import 'package:flutter/material.dart';
import 'login.dart';

class It extends StatefulWidget {
  const It({super.key});

  @override
  State<It> createState() => _ItState();
}

class _ItState extends State<It> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1D9BC),
      body: Column(
        children: [
          Container(
            height: 200,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 16, top: 30),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFFE1D9BC),
                    backgroundImage:AssetImage('assets/app.png'),
                  ),
                  SizedBox(height:7),
                  Text(
                    'ThreatVision  ',
                    style: TextStyle(
                      color: Color(0xFF0C2B4E),
                      fontSize: 25,
                      fontFamily:'Silom',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '                       .AI',
                    style: TextStyle(
                      color: Color(0xFF0C2B4E),
                      fontSize: 25,
                      fontFamily:'Silom',
                    ),
                  )
                ]
            ),
          ),

          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF0C2B4E),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      children:[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey[300],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const Login()),
                                        );
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                                        child: Text(
                                          "Owner",
                                          style: TextStyle(
                                            color: Color(0xFF131E3A),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE1D9BC),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const It()),
                                        );
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                                        child: Text(
                                          "IT",
                                          style: TextStyle(
                                            color: Color(0xFF131E3A),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 110),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Engineer ID",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                hintText: "123456789",
                              ),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),),
                                hintText: "............",
                              ),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 14),
                            TextButton(onPressed: (){},
                                style: TextButton.styleFrom(
                                  alignment: Alignment.topLeft,
                                ),
                                child:Text(
                                    "Forget Password?"
                                )
                            ),
                            const SizedBox(height: 7),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                ),
                                child:Text(
                                  "Login",
                                  style: TextStyle(color: Color(0xFF131E3A),fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}