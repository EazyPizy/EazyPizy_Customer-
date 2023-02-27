import 'package:eazymen_customer/modules/BookingHistory/Components/BookingHistoryCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListBookingHistory extends StatelessWidget {
  const ListBookingHistory({super.key});

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
              itemBuilder: (context, index) => BookingHistoryCard(
                index: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
