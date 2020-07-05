class Jobs {
  final String company;
  final String title;
  final String location;
  final String options;
  final String status;
  final String salary;
  final String description;
  final String type;

  Jobs(
      {this.company,
      this.title,
      this.location,
      this.options,
      this.status,
      this.salary,
      this.description,
      this.type});
}

// List<Jobs> jobData = [
//   Jobs(
//     title: 'WordPress Developer',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 2000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (React Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Flutter Developer (Flutter + Firebase)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Closed',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Closed',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Closed',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
//   Jobs(
//     title: 'Full Stack Dev (Rect Native + NodeJs)',
//     location: 'Accra-Ghana',
//     options: 'Remote',
//     status: 'Open',
//     salary: 9000,
//     description:
//         'Helped organized Facebook developer circle build day in my region. Introduced other developers to HTML5 Games to enable them participate in the developer challenge program.',
//   ),
// ];
