import 'package:flutter/material.dart';

void main() {
  runApp(const NouranCVApp());
}

class NouranCVApp extends StatelessWidget {
  const NouranCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nouran Nasri - CV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        fontFamily: 'Roboto', // Clean, readable font
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CVScreen(),
      },
    );
  }
}

class CVScreen extends StatelessWidget {
  const CVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouran Nasri - Curriculum Vitae'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800), // Max width for readability
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderSection(),
                  SizedBox(height: 24),
                  _SummarySection(),
                  SizedBox(height: 24),
                  _ExperienceSection(),
                  SizedBox(height: 24),
                  _EducationSection(),
                  SizedBox(height: 24),
                  _SkillsSection(),
                  SizedBox(height: 24),
                  _LanguagesSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'NOURAN NASRI',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          'Environmental Scientist',
          style: TextStyle(
            fontSize: 18,
            color: Colors.blueGrey,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 8,
          children: [
            _ContactInfo(icon: Icons.location_on, text: 'Vaihingen an der Enz, 71665, Germany'),
            _ContactInfo(icon: Icons.phone, text: '(+49) 17656020462'),
            _ContactInfo(icon: Icons.email, text: 'nouran.nasri@yahoo.com'),
          ],
        ),
        SizedBox(height: 16),
        Divider(),
      ],
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactInfo({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.blueGrey),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _SummarySection extends StatelessWidget {
  const _SummarySection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader('Professional Summary'),
        Text(
          'I am a passionate Environmental Scientist driven by a deep commitment to sustainability and ecological restoration. My expertise lies in Environmental Impact Assessments (EIAs), sustainability, pollution, and ecological restoration, with a solid background in research and project coordination. I am a strong communicator, thriving in diverse teams and dynamic environments, always eager to learn and embrace new methods.',
          style: TextStyle(fontSize: 15, height: 1.5),
        ),
      ],
    );
  }
}

class _ExperienceSection extends StatelessWidget {
  const _ExperienceSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader('Work Experience'),
        _JobItem(
          title: 'Environmental Facilitator',
          company: 'Gargjet Foundation',
          location: 'Damascus, Syria',
          date: '06/2024 - 07/2024',
          description: 'Conducted external training sessions for corporate employees on sustainable business practices.',
        ),
        _JobItem(
          title: 'Leader Team Assistant',
          company: 'Gaea Initiative',
          location: 'Damascus, Syria',
          date: '10/2022 - 06/2023',
          description: 'Coordinated with the initiative\'s funders alongside the team leader and team members. Designed presentations.',
        ),
        _JobItem(
          title: 'Receptionist',
          company: 'Rosa Clinic',
          location: 'Damascus, Syria',
          date: '2021 - 2021',
          description: 'Managed the reception area, answered phones, greeted guests, passed information, responded to inquiries, and instructed visitors.',
        ),
      ],
    );
  }
}

class _JobItem extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String date;
  final String description;

  const _JobItem({
    required this.title,
    required this.company,
    required this.location,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '$company | $location',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('• ', style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 15, height: 1.4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EducationSection extends StatelessWidget {
  const _EducationSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader('Education & Training'),
        _EducationItem(
          degree: 'Master in Environmental Science',
          institution: 'Debrecen University',
          location: 'Debrecen, Hungary',
          date: '09/2023 - 07/2025',
          description: 'Thesis: Assessing the Environmental Impact of Green Space Reduction on Air Quality in Urban Cities: A Case Study of Damascus, Syria.',
        ),
        _EducationItem(
          degree: 'Bachelor\'s Degree in Environmental Science',
          institution: 'Damascus University',
          location: 'Damascus, Syria',
          date: '2015 - 2019',
          description: 'Thesis: Determination of Thicknesses of Natural Zeolite in the Uom-Alodan area in Syria.',
        ),
        _EducationItem(
          degree: 'English Language Exchange Program',
          institution: 'Lyceum and IAIS at the University of Exeter',
          location: 'England',
          date: '10/2022 - 02/2023',
          description: '',
        ),
      ],
    );
  }
}

class _EducationItem extends StatelessWidget {
  final String degree;
  final String institution;
  final String location;
  final String date;
  final String description;

  const _EducationItem({
    required this.degree,
    required this.institution,
    required this.location,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  degree,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '$institution | $location',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          if (description.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• ', style: TextStyle(fontSize: 16)),
                Expanded(
                  child: Text(
                    description,
                    style: const TextStyle(fontSize: 15, height: 1.4),
                  ),
                ),
              ],
            ),
          ]
        ],
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  const _SkillsSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader('Skills'),
        _SkillCategory(
          category: 'Soft Skills',
          skills: 'Teamwork, Problem Solving, Leadership, Emotional Intelligence, Communication, Time Management, Creativity, Organizational.',
        ),
        SizedBox(height: 8),
        _SkillCategory(
          category: 'Technical Skills',
          skills: 'Microsoft Office (Word, PowerPoint), Surfer, Basic QGIS knowledge, Adobe Photoshop, Adobe Illustrator.',
        ),
      ],
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final String category;
  final String skills;

  const _SkillCategory({required this.category, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$category: ',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            skills,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}

class _LanguagesSection extends StatelessWidget {
  const _LanguagesSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader('Languages'),
        Text('• Arabic (Native)', style: TextStyle(fontSize: 15)),
        SizedBox(height: 4),
        Text('• English', style: TextStyle(fontSize: 15)),
      ],
    );
  }
}
