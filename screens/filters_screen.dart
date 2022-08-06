import 'package:flutter/material.dart';
import '../widget/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _Summer = false;
  var _Winter = false;
  var _Family = false;
  @override
  void initState() {
    _Summer = widget.currentFilters['summer'] as bool;
    _Winter = widget.currentFilters['winter'] as bool;
    _Family = widget.currentFilters['family'] as bool;
    super.initState();
  }

  Widget buildSwitchListTile(String title, String subTitle, var currentValue,
      void Function(bool)? updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('التصفية'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'summer': _Summer,
                    'winter': _Winter,
                    'family': _Family
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save)),
          ],
        ),
        drawer: const AppDrawer(),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTile(
                    'الرحلات الصيفية', 'اظهار الرحلات الصيفية فقط', _Summer,
                    (newValue) {
                  setState(() {
                    _Summer = newValue;
                  });
                }),
                buildSwitchListTile(
                    'الرحلات الشتوية', 'اظهار الرحلات الشتوية فقط', _Winter,
                    (newValue) {
                  setState(() {
                    _Winter = newValue;
                  });
                }),
                buildSwitchListTile(
                    'الرحلات العائلية', 'اظهار الرحلات العائلية فقط', _Family,
                    (newValue) {
                  setState(() {
                    _Family = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
