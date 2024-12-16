import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Bottom navigation selected index

  final List<Widget> _pages = [
    RoomsScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find room'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () {
              // Add filter action
            },
          )
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
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

// Rooms Tab Content
class RoomsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tabs for Hotels and Villas
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: Text('Hotels'),
                selected: true,
                selectedColor: Colors.redAccent,
                onSelected: (bool selected) {},
              ),
              SizedBox(width: 8),
              ChoiceChip(
                label: Text('Villas'),
                selected: false,
                onSelected: (bool selected) {},
              ),
            ],
          ),
          SizedBox(height: 16),
          // Filters
          _buildFilterOption('Where do you want'),
          _buildFilterOption('Checkin date & time'),
          _buildFilterOption('Checkout date & time'),
          _buildFilterOption('0 Adults, 0 Children, 0 room'),
          _buildFilterOption('Fan | Air conditioned'),
          SizedBox(height: 16),
          // Search Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add search action
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                backgroundColor: Colors.redAccent,
              ),
              child: Text('Search'),
            ),
          ),
          SizedBox(height: 16),
          // Best Places
          _buildSectionHeader('Best Places', context),
          _buildHorizontalList(['Boudha', 'Ratnapark', 'Gangabu', 'Thamel']),
          // Best Hotels
          _buildSectionHeader('Best Hotels', context),
          _buildHorizontalList(['Hilton', 'Radisson', 'Mercure', 'Soaltee']),
        ],
      ),
    );
  }

  // Reusable filter option
  Widget _buildFilterOption(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(fontSize: 16, color: Colors.grey[600])),
            Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
          ],
        ),
      ),
    );
  }

  // Section Header
  Widget _buildSectionHeader(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              // Add view all action
            },
            child: Text(
              'View All',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Horizontal List for places/hotels
  Widget _buildHorizontalList(List<String> items) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                items[index],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
      child: Text('Profile Screen'),
    );
  }
}

// Settings Tab Content (Placeholder)
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Screen'),
    );
  }
}
