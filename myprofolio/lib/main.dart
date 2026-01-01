import 'package:flutter/material.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({super.key});

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ali Abdalla Zinga"),
          actions: [
            IconButton(
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                setState(() => isDark = !isDark);
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ProfileSection(),
              SizedBox(height: 40),
              SkillsSection(),
              SizedBox(height: 40),
              ProjectsSection(),
              SizedBox(height: 40),
              ContactSection(),
            ],
          ),
        ),
      ),
    );
  }
}

/* ---------------- PROFILE ---------------- */

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundColor: Color.fromARGB(255, 21, 77, 122),
          child: Icon(Icons.person, size: 70, color: Color.fromARGB(255, 201, 80, 80)),
        ),
        const SizedBox(height: 16),
        Text(
          "Ali Abdalla Zinga",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        const Text(
          "Flutter Developer • IT Technician • CCTV Specialist",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/* ---------------- SKILLS ---------------- */

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle("Skills"),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: const [
            Skill("Flutter"),
            Skill("Dart"),
            Skill("Python"),
            Skill("Networking"),
            Skill("CCTV Installation"),
          ],
        ),
      ],
    );
  }
}

class Skill extends StatelessWidget {
  final String text;
  const Skill(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.blue.shade100,
    );
  }
}

/* ---------------- PROJECTS ---------------- */

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle("Projects"),
        projectCard(
          "comming soon",
          "Flutter app connecting henna artists with clients.",
        ),
        projectCard(
          "CCTV Security System",
          "Installation, configuration, and monitoring solution.",
        ),
      ],
    );
  }

  Widget projectCard(String title, String desc) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc),
      ),
    );
  }
}

/* ---------------- CONTACT ---------------- */

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle("Contact"),
        const ListTile(
          leading: Icon(Icons.email),
          title: Text("aliabdallaz@gmail.com"),
        ),
        const ListTile(
          leading: Icon(Icons.phone),
          title: Text("+254 759 878 793"),
        ),
        const ListTile(
          leading: Icon(Icons.location_on),
          title: Text("Kenya"),
        ),
      ],
    );
  }
}

/* ---------------- COMMON ---------------- */

Widget sectionTitle(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Text(
      text,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
  );
}
