import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage;
    String appBarTitle = 'Good Evening, Sabbir';
    bool showBackButton = false;

    switch (_selectedIndex) {
      case 1:
        currentPage = CommunityPage();
        appBarTitle = 'Community';
        break;
      case 2:
        currentPage = MessagesPage();
        appBarTitle = 'Messages';
        break;
      case 3:
        currentPage = ProfilePage();
        appBarTitle = 'Profile';
        break;
      case 0:
      default:
        currentPage = HomeContent();
        showBackButton = false;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
        leading: showBackButton
            ? IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        )
            : null,
      ),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: const [
              PostCard(
                name: 'Karim Saif',
                message: 'Hello users, I need urgent money for new semester. Is there anyone help me out?',
                profileImageUrl: 'https://via.placeholder.com/150',
                postImageUrl: 'https://via.placeholder.com/600',
              ),
              PostCard(
                name: 'Ali Saif',
                message: 'My Mother is very sick. I need early money for her treatment.',
                profileImageUrl: 'https://via.placeholder.com/150',
              ),
              PostCard(
                name: 'Ali Saif',
                message: 'Help! Can anyone "Into to Algorithm" pdf book? Also can anyone share Data Structure Algorithm resources.',
                profileImageUrl: 'https://via.placeholder.com/150',
                postImageUrl: 'https://via.placeholder.com/600',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PostCard extends StatefulWidget {
  final String name;
  final String message;
  final String profileImageUrl;
  final String? postImageUrl;

  const PostCard({
    Key? key,
    required this.name,
    required this.message,
    required this.profileImageUrl,
    this.postImageUrl,
  }) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isApproved = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                  radius: 24.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              widget.message,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            if (widget.postImageUrl != null) ...[
              SizedBox(height: 8.0),
              Image.network(widget.postImageUrl!),
            ],
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!isApproved)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isApproved = true;
                      });
                    },
                    child: Text('Approve'),
                  ),
                if (isApproved)
                  Text(
                    'Approved',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (isApproved)
                  Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: const [
        MessageCard(
          name: 'Alex Linderson',
          message: 'How are you today?',
          profileImageUrl: 'https://via.placeholder.com/150',
          time: '2 min ago',
          unreadMessages: 3,
        ),
        MessageCard(
          name: 'Team Align',
          message: 'Don\'t miss to attend the meeting.',
          profileImageUrl: 'https://via.placeholder.com/150',
          time: '2 min ago',
          unreadMessages: 4,
        ),
        MessageCard(
          name: 'John Ahraham',
          message: 'Hey! Can you join the meeting?',
          profileImageUrl: 'https://via.placeholder.com/150',
          time: '2 min ago',
        ),
        MessageCard(
          name:     'Sabina Say ma',
          message:  'How are you today?',
          profileImageUrl: 'https://via.placeholder.com/150',
          time: '2 min ago',
        ),
        MessageCard(
          name: 'John Borino',
          message: 'Have a good day 🌸',
          profileImageUrl: 'https://via.placeholder.com/150',
          time: '2 min ago',
        ),
      ],
    );
  }
}

class MessageCard extends StatelessWidget {
  final String name;
  final String message;
  final String profileImageUrl;
  final String time;
  final int? unreadMessages;

  const MessageCard({
    super.key,
    required this.name,
    required this.message,
    required this.profileImageUrl,
    required this.time,
    this.unreadMessages,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profileImageUrl),
        radius: 24.0,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      subtitle: Text(message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          if (unreadMessages != null && unreadMessages! > 0)
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadMessages.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(name: name, profileImageUrl: profileImageUrl)),
        );
      },
    );
  }
}

class ChatPage extends StatelessWidget {
  final String name;
  final String profileImageUrl;

  const ChatPage({
    Key? key,
    required this.name,
    required this.profileImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                ChatBubble(
                  message: 'Hello! Jhon abraham',
                  isSent: true,
                  time: '09:25 AM',
                ),
                ChatBubble(
                  message: 'Hello! Nazrul How are you?',
                  isSent: false,
                  time: '09:25 AM',
                ),
                ChatBubble(
                  message: 'You did your job well!',
                  isSent: true,
                  time: '09:25 AM',
                ),
                ChatBubble(
                  message: 'Have a great working week!!\nHope you like it',
                  isSent: false,
                  time: '09:25 AM',
                  isAudio: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Write your message',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSent;
  final String time;
  final bool isAudio;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isSent,
    required this.time,
    this.isAudio = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
        isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
              color: isSent ? Colors.green : Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: isAudio
                ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.play_arrow, color: Colors.white),
                SizedBox(width: 8.0),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            )
                : Text(
              message,
              style: TextStyle(
                color: isSent ? Colors.white : Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              time,
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Community Page'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileHeader(),
          Expanded(
            child: PageView(
              children: [
                CompanyFacts(),
                Statistics(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isBoldText = MediaQuery.of(context).boldText;

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage:
                NetworkImage('https://via.placeholder.com/150'),
                radius: 50.0,
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sandra Awiiri',
                    style: TextStyle(
                      fontWeight:
                      isBoldText ? FontWeight.bold : FontWeight.normal,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    '+256 704688781',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight:
                      isBoldText ? FontWeight.bold : FontWeight.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 14.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2.0, color: Colors.black12),
                  textStyle: TextStyle(color: Colors.blue),
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  // Update profile logic
                },
                child: Text('Update'),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2.0, color: Colors.red),
                  textStyle: TextStyle(color: Colors.black),
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  // Sign out logic
                },
                child: Text('Sign Out'),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 0.0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(), // Pushes the arrow to the right
              Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class CompanyFacts extends StatelessWidget {
  const CompanyFacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Company Facts and users',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 5),
                      FlSpot(1, 10),
                      FlSpot(2, 20),
                      FlSpot(3, 25),
                      FlSpot(4, 40),
                      FlSpot(5, 50),
                      FlSpot(6, 55),
                      FlSpot(7, 60),
                      FlSpot(8, 65),
                    ],
                    isCurved: true,
                    colors: [Colors.orange],
                    barWidth: 4,
                    belowBarData: BarAreaData(show: true, colors: [Colors.orange.withOpacity(0.3)]),
                    dotData: FlDotData(show: false),
                  ),
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(1, 5),
                      FlSpot(2, 8),
                      FlSpot(3, 12),
                      FlSpot(4, 18),
                      FlSpot(5, 25),
                      FlSpot(6, 28),
                      FlSpot(7, 30),
                      FlSpot(8, 35),
                    ],
                    isCurved: true,
                    colors: [Colors.purple],
                    barWidth: 4,
                    belowBarData: BarAreaData(show: true, colors: [Colors.purple.withOpacity(0.3)]),
                    dotData: FlDotData(show: false),
                  ),
                ],
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(showTitles: true),
                  bottomTitles: SideTitles(showTitles: true, getTitles: (value) {
                    switch (value.toInt()) {
                      case 0:
                        return '2016';
                      case 2:
                        return '2017';
                      case 4:
                        return '2018';
                      case 6:
                        return '2019';
                      default:
                        return '';
                    }
                  }),
                ),
                gridData: FlGridData(show: true),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey, width: 1),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Indicator(color: Colors.orange, text: 'Active users'),
              SizedBox(width: 8),
              Indicator(color: Colors.purple, text: 'Donations per year'),
            ],
          ),
        ],
      ),
    );
  }
}



class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistics',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    color: Colors.red,
                    value: 20,
                    title: 'Zakat F',
                    radius: 70,
                  ),
                  PieChartSectionData(
                    color: Colors.yellow,
                    value: 15,
                    title: 'Y Organization',
                    radius: 70,
                  ),
                  PieChartSectionData(
                    color: Colors.purple,
                    value: 25,
                    title: 'American Express',
                    radius: 70,
                  ),
                  PieChartSectionData(
                    color: Colors.green,
                    value: 20,
                    title: 'KLM',
                    radius: 70,
                  ),
                  PieChartSectionData(
                    color: Colors.teal,
                    value: 10,
                    title: 'X org.',
                    radius: 70,
                  ),
                  PieChartSectionData(
                    color: Colors.deepPurple,
                    value: 10,
                    title: 'Hafezia Madrasa',
                    radius: 70,
                  ),
                ],
                centerSpaceRadius:100,
                sectionsSpace: 4,
              ),
            ),
          ),
          const Center(
            child: Column(
              children: [
                Text(
                  'Total Donated Organization',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Indicator(color: Colors.red, text: 'Zakat F'),
                    SizedBox(width: 8),
                    Indicator(color: Colors.yellow, text: 'Y Organization'),
                    SizedBox(width: 8),
                    Indicator(color: Colors.purple, text: 'American Express'),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Indicator(color: Colors.green, text: 'KLM'),
                    SizedBox(width: 8),
                    Indicator(color: Colors.teal, text: 'X Org.'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  const Indicator({Key? key, required this.color, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}
