import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectmyb/screens/home/views/home_screen.dart';
import 'package:projectmyb/screens/menu_items/views/add_items.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({super.key});

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) => const HomeScreen(),
    ),);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) => AddItems(),
    ),);
        },
        shape: const CircleBorder(),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        child: const Icon(
          CupertinoIcons.add
        ),
      ),
      ),
    );
  }
}