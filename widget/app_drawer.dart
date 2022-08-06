import 'package:flutter/Material.dart';
import '../screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, VoidCallback onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.cyan,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'ElMessiri', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 150,
          width: double.infinity,
          padding: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          // ignore: deprecated_member_use
          color: Theme.of(context).accentColor,
          child: Text(
            'دليلك السياحي',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile('الرحلات', Icons.card_travel, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile('التصفية', Icons.filter_list, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.screenRoute);
        }),
      ]),
    );
  }
}
