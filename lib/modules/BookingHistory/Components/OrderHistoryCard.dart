import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          //color: Colors.blue,
          border: Border.all(
            color: Colors.blue.withOpacity(0.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Order #$index'),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 10,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Delhivered', style: Get.textTheme.titleMedium),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: (){},
              minLeadingWidth: 0,
              leading: EasyContainer(
                borderRadius: 6,
                color: Colors.white,
                borderColor: Colors.blueAccent,
                height: 60,
                width: 60,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
                ),
              ),
              title: (index != null) ? Text('$index customer') : Container(),
              subtitle: const Text('Price'),
              trailing: Icon(Icons.chevron_right, color: Colors.blueAccent,),
            ),
            Divider(

            )

            ,
            Padding(
                padding: const EdgeInsets.all(8),
                child: Text(' Date 12/06/22 '))
          ],
        ),
      ),
    );
  }
}
