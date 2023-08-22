import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/data_types/product.dart';

class ProductTemplate extends StatelessWidget {
  const ProductTemplate(this.myProduct, {super.key});

  final Product myProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        myController.goToProductTetails(myProduct);
      },
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
                        //  border: Border.all(color: Colors.black),
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
            Obx(() {
              int index = myController.getProductIndex(myProduct);

              return Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                      onPressed: () {
                        myController.favoriteFunc(myProduct);
                      },
                      icon: Icon(Icons.favorite,
                          color: myController
                                  .dataModel.value.allProducts[index].isLiked
                              ? Colors.red
                              : Theme.of(context).textTheme.bodyLarge!.color)));
            })
          ],
        ),
      ),
    );
  }
}
