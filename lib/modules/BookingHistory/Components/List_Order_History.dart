import 'package:eazymen_customer/modules/BookingHistory/Components/BookingHistoryCard.dart';
import 'package:eazymen_customer/modules/BookingHistory/Components/OrderHistoryCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOrderHistory extends StatelessWidget {
  const ListOrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => OrderHistoryCard(
                index: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
