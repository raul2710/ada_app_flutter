import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../widgets/TextButtonStandard.dart';
import 'menuitem.dart';

enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud(
    'Cloud',
    Icons.cloud_outlined,
  ),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}

class FirstStepsScreen extends StatefulWidget {

  const FirstStepsScreen({ super.key });

  @override
  State<FirstStepsScreen> createState() => _FirstStepsScreenState();
}

class _FirstStepsScreenState extends State<FirstStepsScreen> {

  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  IconLabel? selectedIcon;

  @override
  Widget build(BuildContext context) {

  const txtTitleStyle = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 36
  );

  var buttonStyle = OutlinedButton.styleFrom(
    fixedSize: const Size.fromWidth(300.0),
    foregroundColor: const Color(0xFFFFFFFF),
    side: const BorderSide(color: Color(0xFFFFFFFF),),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0))
    )
  );
  double width = MediaQuery.of(context).size.width - 16.0;
  final TextEditingController menuController = TextEditingController();
  MenuItem? selectedMenu;

  return Scaffold(
          //  appBar: AppBar(toolbarOpacity: 1,),
          backgroundColor: const Color(0xFF3F80EA),
           body: Center(
             child: Padding(
               padding: const EdgeInsets.all(15.0),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'A.D.A',
                    style: txtTitleStyle,          
                  ),
                  const Text(
                    'Alert Disaster Assist',
                    style: txtTitleStyle, 
                  ),
                  
                  Image.asset(
                    'lib/images/Icon.png'
                  ),
                  const SizedBox(height: 15,),
                  OutlinedButton.icon(
                    onPressed: ()=>{
                      Navigator.pushNamed(context, '/main')
                    },
                    label: const Text('Select your location'),
                    // child: Text('Login with Google'),
                    icon: const Icon(Icons.location_on_outlined), 
                    style: buttonStyle,
                    iconAlignment: IconAlignment.start,
                  ),
                  const SizedBox(height: 15,),
                  // OutlinedButton.icon(
                  //   onPressed: ()=>{
                  //     Navigator.pushNamed(context, '/main')
                  //   }, 
                  //   label: const Text('Brazil'),
                  //   style: buttonStyle,
                  // ),
                  
                  DropdownMenu<MenuItem>(
                    //initialSelection: menuItems.first,
                    controller: menuController,
                    width: width,
                    hintText: "Select country",
                    requestFocusOnTap: true,
                    enableFilter: true,
                    menuStyle: MenuStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.lightBlue.shade50),
                    ),

                    label: const Text('Select country'),
                    onSelected: (MenuItem? menu) {
                      setState(() {
                        selectedMenu = menu;
                      });
                    },
                    dropdownMenuEntries:
                        menuItems.map<DropdownMenuEntry<MenuItem>>((MenuItem menu) {
                      return DropdownMenuEntry<MenuItem>(
                          value: menu,
                          label: menu.label,
                          leadingIcon: Icon(menu.icon));
                    }).toList(),
                  ),
                  const SizedBox(height: 15,),
                  DropdownMenu<IconLabel>(
                      controller: iconController,
                      enableFilter: true,
                      requestFocusOnTap: true,
                      leadingIcon: const Icon(Icons.search),
                      label: const Text('Icon'),
                      width: double.maxFinite,
                      inputDecorationTheme: const InputDecorationTheme(
                        
                        suffixIconColor: Colors.white,
                        prefixIconColor: Colors.white,

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.white),
                        ),

                        labelStyle: TextStyle(color: Colors.white)
                      ),

                      onSelected: (IconLabel? icon) {
                        setState(() {
                          selectedIcon = icon;
                        });
                      },

                      dropdownMenuEntries:
                          IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
                        (IconLabel icon) {
                          return DropdownMenuEntry<IconLabel>(
                            value: icon,
                            label: icon.label,
                            leadingIcon: Icon(icon.icon),
                          );
                        },
                      ).toList(),
                    ),
                  // OutlinedButton.icon(
                  //   onPressed: ()=>{
                  //     Navigator.pushNamed(context, '/main')
                  //   }, 
                  //   label: const Text('São Paulo'),
                  //   // child: Text('Login with Google'),
                  //   style: buttonStyle,
                  // ),
                  const SizedBox(height: 15,),
                  TextButtonStandard(
                    text: 'Continue',
                    onPressed: (){},
                  ),
                ],
               ),
             ),
           )
       );
  }
}