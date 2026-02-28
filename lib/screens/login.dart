import 'package:flutter/material.dart';
import 'it.dart';
import 'home.dart';


class Login extends StatefulWidget {
  final bool animate;

  const Login({super.key, this.animate = false});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>
    with SingleTickerProviderStateMixin {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    if (widget.animate) {
      _controller.forward();
    } else {
      _controller.value = 1;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: const Color(0xFFE1D9BC),
                  backgroundImage: const AssetImage('assets/app.png'),
                ),
                const SizedBox(height: 7),
                const Text(
                  'ThreatVision  ',
                  style: TextStyle(
                    color: Color(0xFF0C2B4E),
                    fontSize: 25,
                    fontFamily: 'Silom',
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  '                       .AI',
                  style: TextStyle(
                    color: Color(0xFF0C2B4E),
                    fontSize: 25,
                    fontFamily: 'Silom',
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: SlideTransition(
              position: _slideAnimation,
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
                      children: [
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
                                      onPressed: () {},
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 14, horizontal: 30),
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
                                          MaterialPageRoute(
                                            builder: (context) =>
                                            const It(),
                                          ),
                                        );
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 14, horizontal: 30),
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
                        const SizedBox(height: 110),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Manager",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(8),
                                ),
                                hintText: "James Bond",
                              ),
                              style: const TextStyle(
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
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(8),
                                ),
                                hintText: "............",
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 14),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                alignment: Alignment.topLeft,
                              ),
                              child: const Text("Forget Password?"),
                            ),
                            const SizedBox(height: 7),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Home()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 16),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Color(0xFF131E3A),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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