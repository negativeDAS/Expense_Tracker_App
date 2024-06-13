import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:projectmyb/screens/menu_items/views/menu.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _inputValue = '';

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  void _saveInput() {
    setState(() {
      _inputValue = _controller1.text;
      _inputValue = "name $_inputValue price ${_controller2.text}";
    });
    _saveToFile(_inputValue);
  }

  Future<void> _saveToFile(String input) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/menu.txt');
    await file.writeAsString(input, mode: FileMode.writeOnlyAppend);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Input saved to file')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item",),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _controller1,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(
                FontAwesomeIcons.burger,
                size: 16,
                color: Colors.grey,
              ),
              hintText: 'Enter Name',
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _controller2,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(
                FontAwesomeIcons.rupeeSign,
                size: 16,
                color: Colors.grey,
              ),
              hintText: 'Enter Price',
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: _saveInput,
            child: Text('Save Input'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}





// class AddItems extends StatefulWidget {
//   const AddItems({super.key});

//   @override
//   State<AddItems> createState() => _AddItemsState();
// }

// class _AddItemsState extends State<AddItems> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.secondary,
//         title: const Text('Add Item'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute<void>(
//       builder: (BuildContext context) => const MenuItems(),
//     ),);
//           },
//         ),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 20,),
//               const Text(
//                 "Add Name",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),

//               const SizedBox(height: 16,),
//               TextFormField(
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(
//                     FontAwesomeIcons.burger, 
//                     size: 16,
//                     color: Colors.grey,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20,),
//               const Text(
//                 "Add Price",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),

//               const SizedBox(height: 16,),
//               TextFormField(
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.white,
//                   prefixIcon: const Icon(
//                     FontAwesomeIcons.rupeeSign, 
//                     size: 16,
//                     color: Colors.grey,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16,),
//               TextButton(
//                 onPressed: () {}, 
//                 child: const Text(
//                   "Save",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),

//                 ),
//               ),
//             ],
//           ),
//         ),
//     );
//   }
// }