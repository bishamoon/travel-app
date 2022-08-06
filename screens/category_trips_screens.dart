import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/trip_item.dart';
import '../models/trips.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/category-trips';

  final List<Trip> availableTrips;

  CategoryTripsScreen(this.availableTrips);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String? categoryTitle;
  late List<Trip> displyTrips;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final CategoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'];

    displyTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(CategoryId);
    }).toList();

    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displyTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (ctx, index) {
          return TripItem(
            id: displyTrips[index].id,
            title: displyTrips[index].title,
            imageUrl: displyTrips[index].imageUrl,
            duration: displyTrips[index].duration,
            tripType: displyTrips[index].tripType,
            season: displyTrips[index].season,
           // removeItem: _removeTrip,
          );
        },
        itemCount: displyTrips.length,
      ),
    );
  }
}
