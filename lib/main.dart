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
      appBar: AppBar(
        title: Text('Admin Profile'),
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
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? effectiveTextStyle; // Define your TextStyle variable

    double textScaleFactor = MediaQuery.of(context).textScaleFactor;

// Check if textScaleFactor suggests bold text preference
    if (textScaleFactor > 1.0) {
      effectiveTextStyle = effectiveTextStyle!.merge(const TextStyle(fontWeight: FontWeight.bold));
    }


// Example usage:
    TextStyle(
      fontSize: 20.0 * textScaleFactor,
      fontWeight: textScaleFactor >= 1.3 ? FontWeight.bold : FontWeight.normal,
    );


    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            radius: 40.0,
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sandra Awiiri',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0 * textScaleFactor,
                ),
              ),
              Text(
                '+256 704688781',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0 * textScaleFactor,
                ),
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
            'Company Facts',
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
                      FlSpot(0, 1),
                      FlSpot(1, 2),
                      FlSpot(2, 3),
                      FlSpot(3, 4),
                      FlSpot(4, 5),
                      FlSpot(5, 4),
                      FlSpot(6, 3),
                      FlSpot(7, 2),
                      FlSpot(8, 1),
                    ],
                    isCurved: true,
                    colors: [Colors.orange],
                    barWidth: 4,
                    belowBarData: BarAreaData(show: true),
                  ),
                ],
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(showTitles: true),
                  bottomTitles: SideTitles(showTitles: true),
                ),
              ),
            ),
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
                    value: 40,
                    title: 'Zakat F',
                    radius: 50,
                    titleStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.orange,
                    value: 30,
                    title: 'Y Organization',
                    radius: 50,
                    titleStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.purple,
                    value: 20,
                    title: 'KLM',
                    radius: 50,
                    titleStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.blue,
                    value: 10,
                    title: 'X Org.',
                    radius: 50,
                    titleStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
