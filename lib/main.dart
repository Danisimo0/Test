
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
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
  List<String> _messages = [];
  int _selectedIndex = 0;
  String _chatText = "";


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openChatScreen(String prompt) {
    setState(() {
      _chatText = prompt;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(prompt: _chatText),
      ),
    );
  }

  void _openHistoryDetail(BuildContext context, String title, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Heading

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Главная',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'История',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3, // Теперь количество историй 3
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (index == 0) {
                              _openHistoryDetail(
                                context,
                                'Какая самая длинная река?',
                                'Самая длинная река — это',
                              );
                            } else if (index == 1) {
                              _openHistoryDetail(
                                context,
                                'Funny day in Las-Vegas',
                                'It was on my birthday.',
                              );
                            } else {
                              _openHistoryDetail(
                                context,
                                'Путешествие по миру',
                                'Моё путешествие началось с',
                              );
                            }
                          },
                          child: Card(
                            color: Color(0xFF111111),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    index == 0
                                        ? 'Какая самая длинная река?'
                                        : index == 1
                                        ? 'Funny day in Las-Vegas'
                                        : 'Путешествие по миру',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Divider(
                                    color: Colors.white70,
                                    thickness: 1,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    index == 0
                                        ? 'Самая длинная река — это'
                                        : index == 1
                                        ? 'It was on my birthday.'
                                        : 'Моё путешествие началось с',
                                    style: TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    index == 0
                                        ? '19 Июня 2023, 21:47'
                                        : index == 1
                                        ? '12 July 2025, 12:12'
                                        : '25 декабря 2024, 10:00',
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Category section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Категории',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Здоровье 💪',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CategoryCard(
                        title: 'Йога',
                        description: 'Йога — это отличный способ улучшить своё здоровье и настроение',
                        gradientColors: [Colors.blue, Colors.purple],
                        onTap: () => _openChatScreen('Йога — это отличный способ улучшить своё здоровье и настроение'),
                      ),
                      SizedBox(width: 10),
                      CategoryCard(
                        title: 'Врач',
                        description: 'Врач помогает поддерживать здоровье и решать проблемы с ним.',
                        gradientColors: [Colors.green, Colors.teal],
                        onTap: () => _openChatScreen('Врач помогает поддерживать здоровье и решать проблемы с ним.'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Science 🔬',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CategoryCard(
                        title: 'Тренер',
                        description: 'Тренер помогает в развитии физической активности',
                        gradientColors: [Colors.orange, Colors.yellow],
                        onTap: () => _openChatScreen('Тренер помогает в развитии физической активности'),
                      ),
                      SizedBox(width: 10),
                      CategoryCard(
                        title: 'Рецепты',
                        description: 'Врач помогает поддерживать здоровье и решать проблемы с ним.',
                        gradientColors: [Colors.pink, Colors.red],
                        onTap: () => _openChatScreen('Рецепты для здоровья'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Образование 📚',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CategoryCard(
                        title: 'Учитель',
                        description: 'Учитель помогает вам в обучении.',
                        gradientColors: [Colors.cyan, Colors.blue],
                        onTap: () => _openChatScreen('Учитель помогает вам в обучении.'),
                      ),
                      SizedBox(width: 10),
                      CategoryCard(
                        title: 'Коуч',
                        description: 'Коуч помогает вам развиваться в жизни.',
                        gradientColors: [Colors.purple, Colors.indigo],
                        onTap: () => _openChatScreen('Коуч помогает вам развиваться в жизни.'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white60,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_on),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Настройки',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: Container(
        width: 75.0,
        height: 75.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen(prompt: '')),
            );
          },
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Color(0xFF222222), width: 8),
          ),
          child: Icon(
            Icons.message,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Message {
final String text;
final bool isAssistant;
final bool isCategory;
Message({required this.text, required this.isAssistant, this.isCategory = false});
}
class CategoryCard extends StatelessWidget {
  final String title;
  final String description;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  CategoryCard({required this.title, required this.description, required this.gradientColors, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


  class ChatScreen extends StatefulWidget {
    final String prompt;

  ChatScreen({required this.prompt});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<Message> _messages = [];
  String getAssistantResponse(String userMessage) {
    if (userMessage.contains("река")) {
      return "Самая длинная река — это Амазонка.";
    } else if (userMessage.contains("гора")) {
      return "Самая высокая гора — это Эверест.";
    } else {
      return "Извините, я не знаю ответа на этот вопрос.";
    }
  }


  @override
  void initState() {
    super.initState();
    if (widget.prompt.isNotEmpty) {
      _messages.add(Message(text: widget.prompt, isAssistant: true));
    } else {

      _messages.add(Message(text: "Привет! Чем могу помочь?", isAssistant: true));
    }
  }


  void _sendMessage(String text) {
    if (text.isEmpty) return;
    setState(() {
      _messages.add(Message(text: text, isAssistant: false));

      _messages.add(Message(text: getAssistantResponse(text), isAssistant: true));

    });
    _controller.clear();
  }
  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Текст скопирован!')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Чат'),
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
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message.isAssistant ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: message.isAssistant ? Colors.green : Colors.black38,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment:
                      message.isAssistant ? MainAxisAlignment.start : MainAxisAlignment.end,
                      children: [
                        if (message.isAssistant)
                          Icon(Icons.filter_tilt_shift, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          message.text,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                        icon: Icon(Icons.copy),
                        onPressed: () {
                          _copyToClipboard(message.text);
                       },
                      ),
                    ],
                  ),
                ),
              );
            },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Введите сообщение...',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),

                    ),
                    onChanged: (text) {
                    setState(() {});
                    },
                    onSubmitted: (text) {
                      _sendMessage(text);
                    },
                  ),
                ),
                if (_controller.text.isNotEmpty)
                  IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () {
                    _sendMessage(_controller.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
