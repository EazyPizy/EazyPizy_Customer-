import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:eazymen_customer/widgets/eazy_networkimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:[ EasyContainer(
        width: 150,
        height: 240,
        color: EazyColors.white,


        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children:  [
                EasyContainer(
                height: 120,
                width: 100,
                child: Stack(
                  children:[ EazyNetworkImage(
                    url:'https://firebasestorage.googleapis.com/v0/b/authprovider-e4b69.appspot.com/o/Product_images%2Fimage_picker1130120668430870252.jpg?alt=media&token=6a0b7d1a-6449-49d4-a811-2423972ab0ec',
                    child:
                        'https://thumbs.dreamstime.com/b/person-gray-photo-placeholder-man-shirt-white-background-person-gray-photo-placeholder-man-132818487.jpg',
                  ),

            ]
                ),
              ),

              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('cPVC Pipe ISI', style: Get.textTheme.titleMedium,),
                  Text('SDR 11 ', style: Get.textTheme.titleSmall,),
                  Text('Rs. 200', style: Get.textTheme.titleMedium,)
                  ,
                  OutlinedButton(onPressed: (){}, child: Text('Add to cart'))
                  ,],
              ),

            ],
          ),
        ),
      ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(

              alignment: Alignment.topLeft,
              child:

              EasyContainer(

                height: 20,
                width: 50,
                color: Colors.blueAccent,
                child: Text('50 OFF',style: Get.textTheme.titleSmall,),
              )
          ),
        )

    ]
    );
  }
}
