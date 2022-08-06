import 'package:flutter/material.dart';

import '../models/trips.dart';
import '../widget/trip_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Trip> favTrips;

  FavoriteScreen(this.favTrips);

  @override
  Widget build(BuildContext context) {
    if (favTrips.isEmpty) {
      return const Center(
        child: Text('ليس لديك اي رحلة في قائمة المفضلة'),
      );
    } else {
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (ctx, index) {
          return TripItem(
            id: favTrips[index].id,
            title: favTrips[index].title,
            imageUrl: favTrips[index].imageUrl,
            duration: favTrips[index].duration,
            tripType: favTrips[index].tripType,
            season: favTrips[index].season,
            //removeItem: _removeTrip,
          );
        },
        itemCount: favTrips.length,
      );
    }
  }
}
