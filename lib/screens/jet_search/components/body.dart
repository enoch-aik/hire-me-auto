import 'package:flutter/material.dart';
import 'package:hire_me_auto/screens/jet_search/components/jet_category.dart';
import 'package:hire_me_auto/screens/jet_search/components/listing_card.dart';
import 'package:hire_me_auto/screens/jet_search/components/search.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Search(),
          JetCategory(),
          ListingCard(),
          ListingCard(),
          ListingCard()
        ],
      ),
    );
  }
}
