import 'package:flutter/material.dart';

void main() {
  runApp(EduApp());
}

class EduApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edu Platform',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/courses': (context) => CourseListPage(),
        '/course-detail': (context) => CourseDetailPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Build Your Skills With Online Course'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CourseCategoriesSection(),
            SizedBox(height: 20),
            FeaturedCoursesSection(),
            SizedBox(height: 20),
            TopInstructorsSection(),
            SizedBox(height: 20),
            StudentFeedbackSection(),
            SizedBox(height: 20),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class CourseCategoriesSection extends StatelessWidget {
  final List<String> categories = [
    'Development',
    'Business',
    'Finance',
    'IT & Software',
    'Design',
    'Marketing',
    'Lifestyle',
    'Photography',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: categories
          .map((cat) => Chip(
                label: Text(cat),
                backgroundColor: Colors.green.shade100,
              ))
          .toList(),
    );
  }
}

class FeaturedCoursesSection extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {
      'title': 'How to Create an Online Course Website',
      'instructor': 'John Doe',
      'image': 'https://via.placeholder.com/150',
      'price': '\$49',
    },
    {
      'title': 'Web Development Full Course',
      'instructor': 'Jane Smith',
      'image': 'https://via.placeholder.com/150',
      'price': '\$59',
    },
    {
      'title': 'Careers in Digital Marketing',
      'instructor': 'Alice Johnson',
      'image': 'https://via.placeholder.com/150',
      'price': '\$39',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Featured Courses',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: courses.length,
            separatorBuilder: (context, index) => SizedBox(width: 16),
            itemBuilder: (context, index) {
              final course = courses[index];
              return CourseCard(
                title: course['title']!,
                instructor: course['instructor']!,
                imageUrl: course['image']!,
                price: course['price']!,
              );
            },
          ),
        ),
      ],
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String instructor;
  final String imageUrl;
  final String price;

  const CourseCard({
    Key? key,
    required this.title,
    required this.instructor,
    required this.imageUrl,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              height: 100,
              width: 160,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'By $instructor',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              price,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.green[700]),
            ),
          ),
        ],
      ),
    );
  }
}

class TopInstructorsSection extends StatelessWidget {
  final List<Map<String, String>> instructors = [
    {
      'name': 'John Doe',
      'image': 'https://via.placeholder.com/80',
    },
    {
      'name': 'Jane Smith',
      'image': 'https://via.placeholder.com/80',
    },
    {
      'name': 'Alice Johnson',
      'image': 'https://via.placeholder.com/80',
    },
    {
      'name': 'Bob Brown',
      'image': 'https://via.placeholder.com/80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Top Instructors of the Month',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: instructors.length,
            separatorBuilder: (context, index) => SizedBox(width: 16),
            itemBuilder: (context, index) {
              final instructor = instructors[index];
              return Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(instructor['image']!),
                  ),
                  SizedBox(height: 6),
                  Text(instructor['name']!),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class StudentFeedbackSection extends StatelessWidget {
  final List<Map<String, String>> feedbacks = [
    {
      'name': 'Emily',
      'feedback': 'Great courses and instructors!',
    },
    {
      'name': 'Michael',
      'feedback': 'Learned a lot, highly recommend.',
    },
    {
      'name': 'Sophia',
      'feedback': 'Very user-friendly platform.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Student Feedback',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ...feedbacks.map((fb) => Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: ListTile(
                leading: CircleAvatar(child: Text(fb['name']![0])),
                title: Text(fb['name']!),
                subtitle: Text(fb['feedback']!),
              ),
            )),
      ],
    );
  }
}

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade100,
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text(
          '© 2024 Edu Platform. All rights reserved.',
          style: TextStyle(color: Colors.green.shade900),
        ),
      ),
    );
  }
}

class CourseListPage extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {
      'title': 'How to Create an Online Course Website',
      'instructor': 'John Doe',
      'image': 'https://via.placeholder.com/150',
      'price': '\$49',
    },
    {
      'title': 'Web Development Full Course',
      'instructor': 'Jane Smith',
      'image': 'https://via.placeholder.com/150',
      'price': '\$59',
    },
    {
      'title': 'Careers in Digital Marketing',
      'instructor': 'Alice Johnson',
      'image': 'https://via.placeholder.com/150',
      'price': '\$39',
    },
    {
      'title': 'Complete Website Responsive Design',
      'instructor': 'Bob Brown',
      'image': 'https://via.placeholder.com/150',
      'price': '\$69',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Courses'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: courses.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            final course = courses[index];
            return CourseCard(
              title: course['title']!,
              instructor: course['instructor']!,
              imageUrl: course['image']!,
              price: course['price']!,
            );
          },
        ),
      ),
    );
  }
}

class CourseDetailPage extends StatelessWidget {
  final Map<String, dynamic> course = {
    'title': 'Complete Website Responsive Design: From Figma to Workflow to Website Design',
    'instructor': 'Jane Smith',
    'image': 'https://via.placeholder.com/300x150',
    'price': '\$69',
    'rating': 4.8,
    'reviews': 120,
    'description':
        'Learn how to create responsive websites from design to deployment. This course covers Figma, HTML, CSS, and workflow best practices.',
    'whatYouWillLearn': [
      'Responsive design principles',
      'Figma to HTML workflow',
      'CSS Grid and Flexbox',
      'Website deployment',
    ],
    'requirements': [
      'Basic knowledge of HTML and CSS',
      'Figma installed on your computer',
    ],
    'curriculum': [
      {'title': 'Introduction', 'duration': '10 min'},
      {'title': 'Figma Basics', 'duration': '30 min'},
      {'title': 'HTML Structure', 'duration': '45 min'},
      {'title': 'CSS Styling', 'duration': '60 min'},
      {'title': 'Responsive Design', 'duration': '50 min'},
      {'title': 'Deployment', 'duration': '40 min'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(course['image']),
            SizedBox(height: 12),
            Text(
              course['title'],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text('By ${course['instructor']}'),
            SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text('${course['rating']} (${course['reviews']} reviews)'),
              ],
            ),
            SizedBox(height: 12),
            Text(
              course['description'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'What You Will Learn',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...course['whatYouWillLearn'].map<Widget>((item) => ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text(item),
                )),
            SizedBox(height: 20),
            Text(
              'Requirements',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...course['requirements'].map<Widget>((item) => ListTile(
                  leading: Icon(Icons.info, color: Colors.blue),
                  title: Text(item),
                )),
            SizedBox(height: 20),
            Text(
              'Curriculum',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...course['curriculum'].map<Widget>((item) => ListTile(
                  title: Text(item['title']),
                  trailing: Text(item['duration']),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Purchase action
              },
              child: Text('Buy Now for ${course['price']}'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
