import 'package:flutter/material.dart';
import 'package:todo_project/utils/colors.dart';
import 'package:todo_project/view/screen/home_screen/kanban_home_screen.dart';

void main() {
  runApp(CustomIntroScreenApp());
}

class CustomIntroScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomIntroScreen(),
    );
  }
}

class CustomIntroScreen extends StatefulWidget {
  @override
  _CustomIntroScreenState createState() => _CustomIntroScreenState();
}

class _CustomIntroScreenState extends State<CustomIntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                IntroPage(
                  title: "Welcome to our Kanban app!",
                  description: "Our app helps you mange your projects with ease.Use our kanban board to stay an top of your tasks and visualize your progress.",
                  imagePath: "assets/images/intro_1.png",
                ),
                IntroPage(
                  title: "Add Board",
                  description: "Create a board for your project Add a title and description for you project.",
                  imagePath: "assets/images/intro_2.png",
                ),
                IntroPage(
                  title: "Drag and Drop",
                  description: "Drag and drop cards to move them between lists.Move cards from 'To Do' to 'In progress' when you are ready to start working on them",
                  imagePath: "assets/images/intro_3.png",
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                width: _currentPage == index ? 12.0 : 8.0,
                height: _currentPage == index ? 12.0 : 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                ),
              );
            }),
          ),
          SizedBox(height: 20),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _currentPage > 0
                ? FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              backgroundColor: Colors.blue, // Blue color
              shape: CircleBorder(), // Circular shape

              child: Icon(Icons.arrow_back_ios_new,color: AppColor.cWhite,),
            )
                : SizedBox(width: 56), // Placeholder for spacing when there's no "Back" button
            FloatingActionButton(
              onPressed: () {
                if (_currentPage < 2) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => KanbanHomeScreen()),
                  );
                }
              },
              backgroundColor: Colors.blue, // Blue color
              shape: CircleBorder(), // Circular shape


              child: Icon(_currentPage < 2 ? Icons.arrow_forward_ios : Icons.check,color: AppColor.cWhite,),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
    
  }
}

class IntroPage extends StatelessWidget {
  final Color? color;
  final String? title;
  final String? description;
  final String? imagePath;

  IntroPage({
     this.color,
     this.title,
     this.description,
     this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath!, height: 200),
          SizedBox(height: 20),
          Text(
            title!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:AppColor.cBlack),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              description!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color:AppColor.cBlack),
            ),
          ),
        ],
      ),
    );
  }
}

