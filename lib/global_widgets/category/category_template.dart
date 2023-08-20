import 'package:flutter/material.dart';

import 'package:store_user/global_widgets/texts/my_title.dart';
import 'package:store_user/data_types/category/category.dart';

class CategoryTemplate extends StatelessWidget {
  const CategoryTemplate({required this.category, super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.18,
                        child: Image.asset(category.categoryImage)),
                    MyTitle(category.categoryName)
                  ],
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color.fromARGB(255, 249, 249, 248).withOpacity(0.2),
                    const Color.fromARGB(255, 242, 132, 132).withOpacity(0.2),
                    const Color.fromARGB(255, 162, 147, 238).withOpacity(0.2),
                  ]),
                  borderRadius: BorderRadius.circular(15),
                )),
            //  const Positioned(right: 5, top: 5, child: MyPopupMenuButton()),
          ],
        ),
      ),
    );
  }
}

// class MyPopupMenuButton extends StatelessWidget {
//   const MyPopupMenuButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//       itemBuilder: (context) {
//         PopupMenuItem<int> x = const PopupMenuItem(
//             value: 0,
//             child: Row(
//               children: [
//                 Icon(Icons.add),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Text('add product')
//               ],
//             ));
//         PopupMenuItem<int> y = const PopupMenuItem(
//             value: 1,
//             child: Row(
//               children: [
//                 Icon(Icons.edit),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Text('edit product')
//               ],
//             ));
//         return [x, y];
//       },
//       onSelected: (value) {
//         myController.popupFunction(value, context);
//       },
//     );
//   }
// }
