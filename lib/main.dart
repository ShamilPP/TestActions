import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo Home',
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            const _TopBar(),
            const SizedBox(height: 20),
            Expanded(child: _DashboardGrid()),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4facfe), Color(0xFF00f2fe)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/300', // Random avatar
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome Back,',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Text(
                'Shamil 👋',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const Spacer(),
          Icon(Icons.notifications_none, color: Colors.white, size: 28),
        ],
      ),
    );
  }
}

class _DashboardGrid extends StatelessWidget {
  final List<_DashboardItem> items = const [
    _DashboardItem(icon: Icons.person, title: 'Profile'),
    _DashboardItem(icon: Icons.schedule, title: 'Schedule'),
    _DashboardItem(icon: Icons.check_circle, title: 'Attendance'),
    _DashboardItem(icon: Icons.grade, title: 'Grades'),
    _DashboardItem(icon: Icons.chat, title: 'Messages'),
    _DashboardItem(icon: Icons.settings, title: 'Settings'),
  ];

  const _DashboardGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: items.map((item) => _DashboardCard(item)).toList(),
    );
  }
}

class _DashboardItem {
  final IconData icon;
  final String title;

  const _DashboardItem({required this.icon, required this.title});
}

class _DashboardCard extends StatelessWidget {
  final _DashboardItem item;

  const _DashboardCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(item.icon, size: 36, color: Colors.blueAccent),
              const SizedBox(height: 10),
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
