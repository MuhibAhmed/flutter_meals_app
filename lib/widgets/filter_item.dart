// import 'package:flutter/material.dart';

// class FilterItem extends StatefulWidget {
//   bool filterCheck;
//   final String title;
//   final String subtitle;

//   FilterItem(
//       {required this.filterCheck, required this.title, required this.subtitle});
//   @override
//   State<FilterItem> createState() {
//     return FilterItemState(
//         filterCheck: filterCheck, title: title, subtitle: subtitle);
//   }
// }

// class FilterItemState extends State<FilterItem> {
//   bool filterCheck;
//   final String title;
//   final String subtitle;

//   FilterItemState(
//       {required this.filterCheck, required this.title, required this.subtitle});
//   @override
//   Widget build(BuildContext context) {
//     return SwitchListTile(
//       value: filterCheck,
//       onChanged: (bool ischecked) {
//         setState(() {
//           filterCheck = ischecked;
//         });
//       },
//       title: Text(
//         title,
//         style: TextStyle(fontSize: 25, color: Colors.white),
//       ),
//       subtitle: Text(
//         subtitle,
//         style: TextStyle(fontSize: 15, color: Colors.white),
//       ),
//       activeColor: Colors.orange,
//       contentPadding: EdgeInsets.only(left: 18, bottom: 20),
//     );
//   }
// }
