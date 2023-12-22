import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController PalinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 414.0,
        height: 896.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/images/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white54,
                child: Icon(
                  Icons.person_add_alt_1_rounded,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                width: 310.0,
                height: 47.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black38),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                width: 310.0,
                height: 47.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white),
                child: TextField(
                  controller: PalinController,
                  decoration: InputDecoration(
                    hintText: 'Palindrome',
                    hintStyle: TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black38),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                width: 310.0,
                height: 41.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 43, 99, 123),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    bool isPalindrome = checkPalindrome(PalinController.text);
                    String resultMessage =
                        isPalindrome ? 'Palindrome' : 'Not Palindrome';
                    if (isPalindrome) {
                      tampilkanDialog(context, "Palindrome");
                    } else {
                      tampilkanDialog(context, "Not Palindrome");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text(
                    'CHECK',
                    style: TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 310.0,
                height: 41.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 43, 99, 123),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(
                          name: nameController.text,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkPalindrome(String text) {
    String cleanedText = text.replaceAll(' ', '').toLowerCase();
    String reversedText = cleanedText.split('').reversed.join('');
    return cleanedText == reversedText;
  }
}

void tampilkanDialog(BuildContext context, String message) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Result'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

class SecondScreen extends StatefulWidget {
  final String name;

  SecondScreen({required this.name});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? selectedUserName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: TextStyle(
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          color: Color.fromARGB(255, 85, 74, 240),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Colors.black),
            ),
            SizedBox(height: 2.0),
            Text(
              '${widget.name}',
              style: TextStyle(
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.black),
            ),
            Spacer(flex: 30),
            Center(
              child: Column(
                children: [
                  Text(
                    selectedUserName ?? 'Selected User Name',
                    style: TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.black),
                  ),
                  SizedBox(height: 400.0),
                  Container(
                    width: 310.0,
                    height: 41.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 43, 99, 123),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ThirdScreen(),
                          ),
                        );

                        // Handle the selected user name here
                        if (result != null) {
                          setState(() {
                            selectedUserName = result;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Text(
                        'Choose a User',
                        style: TextStyle(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white),
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

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late List<User> userList;
  int page = 1;
  int perPage = 10;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    userList = [];
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
          style: TextStyle(
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          color: Color.fromARGB(255, 85, 74, 240),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!isLoading &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            fetchUserData();
            return true;
          }
          return false;
        },
        child: RefreshIndicator(
          onRefresh: refreshData,
          child: userList.isEmpty
              ? Center(
                  child: Text(
                    'No data available',
                    style: TextStyle(
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                )
              : ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    User user = userList[index];
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                      title: Text(
                        '${user.firstName} ${user.lastName}',
                        style: TextStyle(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      subtitle: Text(user.email,
                          style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.black)),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      onTap: () {
                        Navigator.pop(
                          context,
                          '${user.firstName} ${user.lastName}',
                        );
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }

  Future<void> refreshData() async {
    userList = [];
    page = 1;
    await fetchUserData();
  }

  Future<void> fetchUserData() async {
    if (isLoading) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$page&per_page=$perPage'),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> usersData = data['data'];

      List<User> users = usersData.map((userData) {
        return User(
          id: userData['id'],
          email: userData['email'],
          firstName: userData['first_name'],
          lastName: userData['last_name'],
          avatar: userData['avatar'],
        );
      }).toList();

      setState(() {
        userList.addAll(users);
        page++;
      });
    } else {
      throw Exception('Failed to load user data');
    }
  }
}

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
}
