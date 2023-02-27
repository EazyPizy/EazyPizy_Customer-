import 'package:flutter/material.dart';

class ProductCard2 extends StatelessWidget {
  const ProductCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blue.withOpacity(0.15),
                    width: 1,
                  ),
                ),
                height: 150,
                width: (MediaQuery.of(context).size.width - 0.2) / 3.5,
                child: Stack(children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 75,
                          width:
                              (MediaQuery.of(context).size.width - 0.2) / 3.5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                          "productName",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                          softWrap: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.greenAccent,
                          //height: 20,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(" Earn",
                                  style: const TextStyle(
                                    fontSize: 7,
                                    color: Colors.black,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.fade),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Count(
                      //   productName,
                      //   imageURL,
                      //   133,
                      //   productId: productId,
                      //   variantId: productId,
                      //   productPrice: sellingPrice,
                      //   commissionAmount: commissionAmount,
                      //   discountAmount: discountAmount,
                      //
                      // ),
                      const Spacer(),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10))),
                      child: const Center(
                        child: Text(
                          "30 OFF",
                          style: TextStyle(fontSize: 5, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: (MediaQuery.of(context).size.width - 0.2) / 3.5,
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      flex: 1,
                      child: Center(
                        child: Container(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.whatshot,
                              color: Colors.green,
                              size: 20,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //  color: Colors.green,
                            border: Border.all(
                              color: Colors.blue.withOpacity(0.15),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
