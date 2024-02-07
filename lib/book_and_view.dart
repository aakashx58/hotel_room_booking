import 'package:flutter/material.dart';
import 'package:hotel_room_booking/all_view.dart';
import 'package:hotel_room_booking/booking_view.dart';

class BookAndView extends StatelessWidget {
  const BookAndView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          bottom: TabBar(
            padding: const EdgeInsets.all(10),
            labelColor: Colors.white,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            indicator: BoxDecoration(
              border: Border.all(
                color: Colors.deepPurple.shade100,
                width: 2.5,
              ),
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(25),
            ),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.person),
                    Text(
                      "Book",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.person),
                    Text(
                      "Update",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.person),
                    Text(
                      "View",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              // decoration: BoxDecoration(
              //   border: Border.all(width: 8, color: Colors.deepPurple),
              //   // borderRadius: BorderRadius.circular(20),
              // ),
              padding: const EdgeInsets.all(20),
              child: const BookingView(),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const BookingView(),
            ),
            Container(
              color: Colors.teal,
              child: const AllView(),
            ),
          ],
        ),
      ),
    );
  }
}
