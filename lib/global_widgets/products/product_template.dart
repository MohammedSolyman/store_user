import 'package:flutter/material.dart';
import 'package:store_user/models/product/product_model.dart';

class ProductTemplate extends StatelessWidget {
  const ProductTemplate(this.myProduct, {super.key});

  final ProductModel myProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 110,
                    width: 95,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        image: DecorationImage(
                            image: NetworkImage(myProduct.productImage))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${myProduct.productPrice}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(myProduct.productUnit,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                  Text(myProduct.productName,
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.50,
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
