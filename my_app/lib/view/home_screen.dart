import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    RoomsScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find room', style: Theme.of(context).textTheme.headline1),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () {
              // Add filter action
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bed_outlined),
            label: 'Rooms',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'My Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.grey,
        backgroundColor: Theme.of(context).bottomAppBarColor,
      ),
    );
  }
}

// Rooms Tab Content
class RoomsScreen extends StatelessWidget {
  final List<String> _placesImages = [
    'assets/images/boudha.jpg',
    'assets/images/ratnapark.jpg',
    'assets/images/gangabu.jpg',
    'assets/images/thamel.jpg',
  ];

  final List<String> _hotelsImages = [
    'assets/images/hilton.jpg',
    'assets/images/radisson.jpg',
    'assets/images/mercure.jpg',
    'assets/images/soaltee.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFilterOption('Where do you want', context),
          _buildFilterOption('Checkin date & time', context),
          _buildFilterOption('Checkout date & time', context),
          _buildFilterOption('0 Adults, 0 Children, 0 room', context),
          _buildFilterOption('Fan | Air conditioned', context),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Searching for rooms...')),
                );
              },
              child: Text('Search'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 16),
          _buildSectionHeader('Best Places', context),
          _buildImageList(_placesImages, context),
          _buildSectionHeader('Best Hotels', context),
          _buildImageList(_hotelsImages, context),
        ],
      ),
    );
  }

  Widget _buildFilterOption(String title, BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Text('Filter options for $title',
                  style: Theme.of(context).textTheme.bodyText1),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyText1),
              Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline2),
          GestureDetector(
            onTap: () {},
            child: Text(
              'View All',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageList(List<String> images, BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped on item ${index + 1}')),
              );
            },
            child: Container(
              width: 200,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Profile Tab Content (Placeholder)
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Text('Profile Screen', style: Theme.of(context).textTheme.headline2),
    );
  }
}

// Settings Tab Content (Placeholder)
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Text('Settings Screen', style: Theme.of(context).textTheme.headline2),
    );
  }
}
