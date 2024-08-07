import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 113, 85, 161)),
          useMaterial3: true,
        ),
        home: const Homepage());
  }
}

bool isSecure = true;
Map<String, User> users = {
  'dede123@gmail.com': User(email: 'dede123@gmail.com', password: 'dede'),
  'rere1234@gmail.com': User(email: 'rere1234@gmail.com', password: '1234')
};

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController eamailcnt = TextEditingController();
  TextEditingController passcont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          "صفحة تسجيل الدخول",
          style: TextStyle(fontSize: 25, color: Colors.white70),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/log.jpg",
              width: 300,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  TextFormField(
                    controller: eamailcnt,
                    decoration: const InputDecoration(
                      label: Text("ادخل الايميل"),
                      prefixIcon: Icon(Icons.person, color: Colors.deepPurple),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: passcont,
                    obscureText: isSecure,
                    decoration: InputDecoration(
                      label: Text("ادخل كلمة المرور"),
                      prefixIcon: Icon(Icons.lock, color: Colors.deepPurple),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isSecure = !isSecure;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye),
                        color: Colors.deepPurple,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      User user = users[eamailcnt.text]!;

                      if (user.email == eamailcnt.text &&
                          user.password == passcont.text) {
                        print('الدخول');
                      } else {
                        print('الايميل او الرمز خاطئ');
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.deepPurple),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "دخول",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
