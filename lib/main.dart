// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

//Page Template
/*
class BlankScreen extends StatelessWidget {
  const BlankScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // You can change this color if needed
      ),
    );
  }
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Clear all stored helmet data on app start
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('helmets');
  
  runApp (const AllPages());
}

//Will be changed to adapt thingsboard
class AllPages extends StatelessWidget {
  const AllPages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Vancouver',
      ),
      home: const StartScreen(),

    );
  }
}
//Defines all Pages and Provides the Home Screen as the default page upon opening
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isContentVisible = constraints.maxHeight > 370;

            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 0), // Smooth transition
              child: isContentVisible
                  ? Center(
                      key: const ValueKey('content'),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height * 0.7,
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.1,
                            ),
                            child: const Image(
                              image: AssetImage('images/written.png'),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SignUpPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(220, 60, 60, 1), // Background color
                              fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.5, // Width
                                MediaQuery.of(context).size.height * 0.08, // Height
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Optional: Curved edges
                              ),
                              shadowColor: Colors.red,
                            ),
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Vancouver',
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.height * 0.04,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height * 0.08,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // Background color
                              fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.5, // Width
                                MediaQuery.of(context).size.height * 0.08, // Height
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Optional: Curved edges
                              ),
                            ),
                            child: Text(
                              'Log In',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Vancouver',
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.height * 0.04,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container( // Blank screen
                      key: const ValueKey('blank'),
                      color: Colors.white,
                    ),
            );
          },
        ),
      ),
    );
  }
}
// Main Home Page ^^ This generates the basic scaffold and app structure 
// It sets the top 70% to be the logo and header leaving the bottom 30% for the login/signup buttons

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isContentVisible = constraints.maxHeight > 370;

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 0), // Smooth transition
            child: isContentVisible
                ? Center(
                    key: const ValueKey('content'),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height * 0.3,
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.1,
                          ),
                          child: const Image(
                            image: AssetImage('images/written.png'),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'First Name',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Last Name',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password',
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.5,
                              MediaQuery.of(context).size.height * 0.08,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Vancouver',
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height * 0.04,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height * 0.1,
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.1,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const StartScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.08,
                              MediaQuery.of(context).size.height * 0.08,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide.none,
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container( // Blank screen
                    key: const ValueKey('blank'),
                    color: Colors.white,
                  ),
          );
        },
      ),
    );
  }
}

// After clicking sign up on main page this page provides an ability to sign up with google or create an account


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isContentVisible = constraints.maxHeight > 370;

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 0), // Smooth transition
            child: isContentVisible
                ? Center(
                    key: const ValueKey('content'),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height * 0.3,
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.1,
                          ),
                          child: const Image(
                            image: AssetImage('images/written.png'),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.5,
                              MediaQuery.of(context).size.height * 0.08,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Log In',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Vancouver',
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height * 0.04,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height * 0.1,
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.1,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const StartScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.08,
                              MediaQuery.of(context).size.height * 0.08,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide.none,
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container( // Blank screen
                    key: const ValueKey('blank'),
                    color: Colors.white,
                  ),
          );
        },
      ),
    );
  }
}

// After clicking Log in on main page this page provides an ability to log in with google or standard
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.helmetName = ''});
  final String helmetName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Helmet> helmets = [];

  @override
  void initState() {
    super.initState();
    _loadHelmets();
  }

  Future<void> _loadHelmets() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? helmetsJson = prefs.getStringList('helmets');
    if (helmetsJson != null) {
      setState(() {
        helmets = helmetsJson
            .map((helmetString) => Helmet.fromJson(jsonDecode(helmetString)))
            .toList();
      });
    }
  }

  Future<void> _saveHelmets() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> helmetsJson = helmets
        .map((helmet) => jsonEncode(helmet.toJson()))
        .toList();
    await prefs.setStringList('helmets', helmetsJson);
  }

  Future<void> _addHelmet(Helmet helmet) async {
    setState(() {
      helmets.insert(0, helmet);
    });
    await _saveHelmets();
  }

  Future<void> _removeHelmet(int index) async {
    setState(() {
      helmets.removeAt(index);
    });
    await _saveHelmets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isContentVisible = constraints.maxHeight > 370;

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 0), // Smooth transition
            child: isContentVisible
                ? Center(
                    key: const ValueKey('content'),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: const Image(
                            image: AssetImage('images/written.png'),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: LayoutBuilder(
                            builder: (BuildContext context, BoxConstraints constraints) {
                              bool isContentFitting = constraints.maxHeight > 110 && constraints.maxWidth > 280;

                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 0),
                                child: isContentFitting
                                    ? Column(
                                        key: const ValueKey('content'),
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Center(
                                            child: Text(
                                              "Game vs Pittsfield",
                                              style: TextStyle(fontFamily: 'Vancouver',fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Text("Oct 14, 2024 | 20:08 - 21:45", style: TextStyle(fontFamily: 'Vancouver')),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(12.0),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color: Colors.red, width: 2.0),
                                                ),
                                                child: const Text(
                                                  "58.37 G \n Max",
                                                  style: TextStyle(fontFamily: 'Vancouver',fontWeight: FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Text(
                                                "\n534G \n Cumulative",
                                                style: TextStyle(fontFamily: 'Vancouver'),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                "\nConcussion \n Test Advised",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontFamily: 'Vancouver',color: Colors.red),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : const Center(
                                        key: ValueKey('fallback'),
                                        child: Text(
                                          "Recent game info",
                                          style: TextStyle(fontFamily: 'Vancouver', fontWeight: FontWeight.bold),
                                        ),
                                      ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: helmets.length,
                            itemBuilder: (context, index) {
                              final helmet = helmets[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HelmetDetailScreen(helmet: helmet),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(211, 211, 211, 1.0),
                                      fixedSize: Size(
                                        MediaQuery.of(context).size.width * 0.6,
                                        MediaQuery.of(context).size.height * 0.08,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      helmet.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Vancouver',
                                        color: Colors.black,
                                        fontSize: MediaQuery.of(context).size.height * 0.02,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AddHelmetScreen()),
                            );
                            if (result != null && result is Helmet) {
                              await _addHelmet(result);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(220, 60, 60, 1),
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.6,
                              MediaQuery.of(context).size.height * 0.08,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadowColor: Colors.red,
                          ),
                          child: Text(
                            'Add Helmet',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Vancouver',
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height * 0.04,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(20),
                                      backgroundColor: Colors.black,
                                    ),
                                    child: Icon(
                                      Icons.home,
                                      size: MediaQuery.of(context).size.height * 0.04,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                  Text(
                                    'Home',
                                    style: TextStyle(fontFamily: 'Vancouver', fontSize: MediaQuery.of(context).size.height * 0.02),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const DeviceScreen()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(20),
                                      backgroundColor: Colors.grey,
                                    ),
                                    child: Icon(
                                      Icons.developer_board,
                                      size: MediaQuery.of(context).size.height * 0.04,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                  Text(
                                    'Device',
                                    style: TextStyle(fontFamily: 'Vancouver', fontSize: MediaQuery.of(context).size.height * 0.02),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Third button action
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(20),
                                      backgroundColor: Colors.grey,
                                    ),
                                    child: Icon(
                                      Icons.info,
                                      size: MediaQuery.of(context).size.height * 0.04,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                  Text(
                                    'Data',
                                    style: TextStyle(fontFamily: 'Vancouver', fontSize: MediaQuery.of(context).size.height * 0.02),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container( // Blank screen
                    key: const ValueKey('blank'),
                    color: Colors.white,
                  ),
          );
        },
      ),
    );
  }
}


class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isContentVisible = constraints.maxHeight > 370;

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 0), // Smooth transition
            child: isContentVisible
                ? Center(
                    key: const ValueKey('content'),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: const Image(
                            image: AssetImage('images/written.png'),
                          ),
                        ),
                        Text(
                          'My Device',
                          style: TextStyle(
                            fontFamily: 'Vancouver',
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.025,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.developer_board,
                          size: MediaQuery.of(context).size.height * 0.2,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                        ElevatedButton(
                          onPressed: () async {
                            // Device settings action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(220, 60, 60, 1),
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.6,
                              MediaQuery.of(context).size.height * 0.08,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadowColor: Colors.red,
                          ),
                          child: Text(
                            'Device Settings',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Vancouver',
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height * 0.04,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(20),
                                      backgroundColor: Colors.grey,
                                    ),
                                    child: Icon(
                                      Icons.home,
                                      size: MediaQuery.of(context).size.height * 0.04,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                  Text(
                                    'Home',
                                    style: TextStyle(fontFamily: 'Vancouver', fontSize: MediaQuery.of(context).size.height * 0.02),
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const DeviceScreen()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        padding: const EdgeInsets.all(20),
                                        backgroundColor: Colors.black,
                                      ),
                                      child: Icon(
                                        Icons.developer_board,
                                        size: MediaQuery.of(context).size.height * 0.04,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                    Text(
                                      'Device',
                                      style: TextStyle(fontFamily: 'Vancouver', fontSize: MediaQuery.of(context).size.height * 0.02),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Third button action
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(20),
                                      backgroundColor: Colors.grey,
                                    ),
                                    child: Icon(
                                      Icons.info,
                                      size: MediaQuery.of(context).size.height * 0.04,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                  Text(
                                    'Data',
                                    style: TextStyle(fontFamily: 'Vancouver', fontSize: MediaQuery.of(context).size.height * 0.02),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container( // Blank screen
                    key: const ValueKey('blank'),
                    color: Colors.white,
                  ),
          );
        },
      ),
    );
  }
}



class Helmet {
  final String name;
  final String sport;
  final String dateAdded;

  Helmet({required this.name, required this.sport, required this.dateAdded});

  // Convert a Helmet object into a Map.
  Map<String, dynamic> toJson() => {
        'name': name,
        'sport': sport,
        'dateAdded': dateAdded,
      };

  // Create a Helmet object from a Map.
  factory Helmet.fromJson(Map<String, dynamic> json) => Helmet(
        name: json['name'],
        sport: json['sport'],
        dateAdded: json['dateAdded'],
      );
}

class AddHelmetScreen extends StatelessWidget {
  const AddHelmetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController helmetController = TextEditingController();
    final TextEditingController sportController = TextEditingController();
    final TextEditingController dateController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isContentVisible = constraints.maxHeight > 370;

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 0), // Smooth transition
            child: isContentVisible
                ? Center(
                    key: const ValueKey('content'),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.04,
                          ),
                          child: Text(
                            'Add Helmet',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Vancouver',
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.height * 0.08,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextField(
                            controller: helmetController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name of Helmet',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextField(
                            controller: dateController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Date Added',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextField(
                            controller: sportController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Sport',
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Create a Helmet object with the entered data
                            final helmet = Helmet(
                              name: helmetController.text,
                              sport: sportController.text,
                              dateAdded: dateController.text,
                            );
                            Navigator.pop(context, helmet);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.5,
                              MediaQuery.of(context).size.height * 0.08,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Add',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Vancouver',
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height * 0.04,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container( // Blank screen
                    key: const ValueKey('blank'),
                    color: Colors.white,
                  ),
          );
        },
      ),
    );
  }
}


class HelmetDetailScreen extends StatelessWidget {
  final Helmet helmet;

  const HelmetDetailScreen({super.key, required this.helmet});

  List<BarChartGroupData> _generateBarData() {
    final random = Random();
    return List.generate(20, (index) {
      final value = random.nextInt(151).toDouble(); // 0 to 150
      return BarChartGroupData(
        x: index+1,
        barRods: [
          BarChartRodData(
            toY: value,
            color: value >= 70 ? Colors.red : Colors.green,
            width: 16,
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isContentVisible = constraints.maxHeight > 370;

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 0),
            child: isContentVisible
                ? Center(
                    key: const ValueKey('content'),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.02,
                          ),
                          child: Text(
                            helmet.name,
                            style: TextStyle(
                              fontFamily: 'Vancouver',
                              fontSize: MediaQuery.of(context).size.height * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.1,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sport: ${helmet.sport}',
                                style: TextStyle(
                                  fontFamily: 'Vancouver',
                                  fontSize: MediaQuery.of(context).size.height * 0.025,
                                ),
                              ),
                              Text(
                                'Added: ${helmet.dateAdded}',
                                style: TextStyle(
                                  fontFamily: 'Vancouver',
                                  fontSize: MediaQuery.of(context).size.height * 0.025,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.02,
                              vertical: MediaQuery.of(context).size.height * 0.02,
                            ),
                            child: BarChart(
                              BarChartData(
                                alignment: BarChartAlignment.spaceAround,
                                maxY: 150,
                                titlesData: FlTitlesData(
                                  show: true,
                                  topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  bottomTitles: AxisTitles(
                                    axisNameWidget: Text('Hit', style: TextStyle(fontFamily: 'Vancouver')),
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      getTitlesWidget: (value, meta) {
                                        return Text(value.toInt().toString());
                                      },
                                    ),
                                  ),
                                  leftTitles: AxisTitles(
                                    axisNameWidget: Text('G Force', style: TextStyle(fontFamily: 'Vancouver'),),
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      getTitlesWidget: (value, meta) {
                                        return Text(value.toInt().toString());
                                      },
                                      reservedSize: 30,
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(color: Colors.black, width: 1),
                                ),
                                gridData: FlGridData(show: false),
                                barGroups: _generateBarData(),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.08,
                              MediaQuery.of(context).size.height * 0.08,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide.none,
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      ],
                    ),
                  )
                : Container(
                    key: const ValueKey('blank'),
                    color: Colors.white,
                  ),
          );
        },
      ),
    );
  }
}

      
// Add more details as needed
//Text(helmet.name)
//Text(helmet.sport)
//Text(helmet.dateAdded)

