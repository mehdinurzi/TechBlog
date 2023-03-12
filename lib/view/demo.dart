// // main.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Remove the debug banner
//       debugShowCheckedModeBanner: false,
//       title: 'Kindacode.com',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   final _htmlContent = """
// <h1>heading one</h1>
// <h2>heading tow</h2>
// <h3>heading three</h3>
// <h4>heading four</h4>
//   """;

//   const HomePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Kindacode.com'),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Html(
//             data: _htmlContent,
//             // Styling with CSS (not real CSS)
//             style: {
//               'h1': Style(color: Colors.red),
//               'p': Style(color: Colors.black87, fontSize: FontSize.medium),
//               'ul': Style(margin: const EdgeInsets.symmetric(vertical: 20))
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

