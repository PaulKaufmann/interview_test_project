import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //selected states should come from the navigator or state management later

    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavigationItem(
              name: 'Home',
              assetPath: 'assets/Home_icon.svg',
              selected: true,
              onTap: () {
                //do nothing
              },
            ),
            BottomNavigationItem(
              name: 'Library',
              assetPath: 'assets/Stack_icon.svg',
              selected: false,
              onTap: () {
                //do nothing
              },
            ),
            BottomNavigationItem(
              name: 'Map',
              assetPath: 'assets/Compass_icon.svg',
              selected: false,
              onTap: () {
                //do nothing
              },
            ),
            BottomNavigationItem(
              name: 'Notificattions',
              assetPath: 'assets/Notifications_icon.svg',
              selected: false,
              onTap: () {
                //do nothing
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String assetPath;
  final String name;
  final bool selected;
  final Function onTap;

  const BottomNavigationItem({
    super.key,
    required this.name,
    required this.assetPath,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        decoration: selected
            ? ShapeDecoration(
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 13.0),
          child: Row(
            children: [
              SvgPicture.asset(
                assetPath,
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
              ),
              Visibility(
                visible: selected,
                child: const SizedBox(width: 7),
              ),
              Visibility(
                visible: selected,
                child: Text(name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
