import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widgets/chart.dart';
import '../widgets/profile.dart';


class Lesson {
  final String title;
  final bool completed;

  Lesson(this.title, this.completed);
}

class LanguageProgress {
  final int totalLessons;
  final int completedLessons;

  LanguageProgress(this.totalLessons, this.completedLessons);
}

class ProgressTracking extends StatelessWidget {
  final List<Lesson> lessons = [
    Lesson('Greetings', true),
    Lesson('Basic Phrases', true),
    Lesson('Numbers', false),
    Lesson('Colors', false),
    Lesson('Travel Phrases', false),
    Lesson('Advanced Grammar', false),
  ];
  static const String routeName='/tracking';

  final LanguageProgress progress = LanguageProgress(6, 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Learning Progress'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileWidget(
                  avatarUrl: 'https://example.com/avatar.jpg',
                  name: 'John Doe',
                  mainDescription: 'rafid@gmail.com',
                ),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: Container(
                //     height: 200,
                //     width: 200,
                //     child: _buildPieChart(),
                //   ),
                // ),
              ],
            ),
            Text(
              'Your Progress',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress.completedLessons / progress.totalLessons,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 16),
            Text(
              'Lessons',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: lessons.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(lessons[index].title),
                    leading: lessons[index].completed
                        ? Icon(Icons.check_circle, color: Colors.green)
                        : Icon(Icons.radio_button_unchecked),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Statistics',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard('Total Lessons', progress.totalLessons),
                _buildStatCard('Completed', progress.completedLessons),
              ],
            ),
            SizedBox(height: 16),
           // PieChartSample3()
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, int value) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              value.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 30,
        startDegreeOffset: 180,
        sections: _getSections(),
      ),
    );
  }

  List<PieChartSectionData> _getSections() {
    return [
      PieChartSectionData(
        color: Colors.blue,
        value: progress.completedLessons.toDouble(),
        title: '${progress.completedLessons}',
        radius: 25,
      ),
      PieChartSectionData(
        color: Colors.grey[300]!,
        value: (progress.totalLessons - progress.completedLessons).toDouble(),
        title: '${progress.totalLessons - progress.completedLessons}',
        radius: 20,
      ),
    ];
  }
}


