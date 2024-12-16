import 'package:flutter/material.dart';
import 'package:my_app/view/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Welcome to Sasto Hotel",
      "description":
          "Providing a seamless and affordable hotel reservation experience.",
      "image": "assets/images/logo.png",
    },
    {
      "title": "Cross-Platform Compatibility",
      "description": "Effortlessly book on both Android and iOS devices.",
      "image": "assets/images/logo.png",
    },
    {
      "title": "Budget-Friendly Accommodations",
      "description":
          "Designed for budget-conscious travelers, offering cost-effective stays.",
      "image": "assets/images/logo.png",
    },
    {
      "title": "Fast and Reliable Booking",
      "description":
          "Modern design and robust architecture for a smooth booking process.",
      "image": "assets/images/logo.png",
    },
  ];

  void _goToNextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.orange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return OnboardingContent(
                    title: onboardingData[index]["title"]!,
                    description: onboardingData[index]["description"]!,
                    image: onboardingData[index]["image"]!,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    TextButton(
                      onPressed: _goToPreviousPage,
                      child: Text(
                        "Previous",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    )
                  else
                    SizedBox.shrink(),
                  TextButton(
                    onPressed: _goToNextPage,
                    child: Text(
                      _currentPage == onboardingData.length - 1
                          ? "Get Started"
                          : "Next",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Roboto',
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

class OnboardingContent extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  OnboardingContent({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 200),
          SizedBox(height: 30),
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
