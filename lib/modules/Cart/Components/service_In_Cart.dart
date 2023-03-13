import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceInCart extends StatelessWidget {
  const ServiceInCart({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      height: 400,
      customBorderRadius: const BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EasyContainer(
              padding: 10,
              height: 50,
              borderRadius: 0,
              color: Colors.blueAccent.withOpacity(0.5),
              child: Row(
                children: const [CircleAvatar(), Text('Amit Bairwa')],
              )),
          const SizedBox(
            height: 8,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              EasyContainer(
                showBorder: true,
                borderColor: EazyColors.borderColors,
                height: 60,
                width: 60,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'serviceName',
                      style: Get.textTheme.titleMedium,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      'subTitle',
                      style: Get.textTheme.titleMedium,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                '499',
                style: Get.textTheme.labelSmall,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ]),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              EasyContainer(
                showBorder: true,
                borderColor: EazyColors.borderColors,
                height: 60,
                width: 60,
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'serviceName',
                      style: Get.textTheme.titleMedium,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      'subTitle',
                      style: Get.textTheme.titleMedium,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                '499',
                style: Get.textTheme.labelSmall,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
