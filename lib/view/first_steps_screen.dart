import 'package:flutter/material.dart';

import '../model/city.dart';
import '../model/country.dart';
import '../services/country_city_service.dart';
import '../widgets/text_button_standard.dart';

class FirstStepsScreen extends StatefulWidget {

  const FirstStepsScreen({ super.key });

  @override
  State<FirstStepsScreen> createState() => _FirstStepsScreenState();
}

class _FirstStepsScreenState extends State<FirstStepsScreen> {

  late Future<Country> futureAlbum;

  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();

  String country = 'Choose your country';
  String city = 'Choose your city';

  AlertDialog showSearchApi(){
    return AlertDialog(
      title: const Text('Country'),
      content: SizedBox(
        width: double.maxFinite,
        child: FutureBuilder(
          future: CountryCityService().listCountries(),

          builder: (context, snapshot) {
            // Requisição finalizada
            if (snapshot.connectionState == ConnectionState.done) {
              
              var lista = snapshot.data as List<Country>;

              return DropdownMenu(
                enableFilter: true,
                label: const Text('Type your country'),
                width: 250,
                menuHeight: 200,
                
                dropdownMenuEntries: lista.map<DropdownMenuEntry<Country>>((Country country) {
                  return DropdownMenuEntry<Country>(
                    label: country.name,
                    value: country,
                  );},
                ).toList(),
                onSelected: (value) => {
                  setState(() {
                    country = value!.name;
                    
                  }),
                  Navigator.pop(context)
                },
              );
            }

            //Aguardando a requisição
            return const Center(child: CircularProgressIndicator());
          },
        ),
      )
    );

    // DropdownMenu<String>(
    //       controller: iconController,
    //       enableFilter: true,
    //       requestFocusOnTap: true,
    //       width: 250,
    //       label: const Text(
    //         'Icon',
    //         textAlign: TextAlign.center,
    //       ),
    //       inputDecorationTheme: const InputDecorationTheme(
            
    //         floatingLabelAlignment: FloatingLabelAlignment.start,
    //         // floatingLabelBehavior: FloatingLabelBehavior.always,
            
    //         activeIndicatorBorder: BorderSide(color: Colors.black),
            
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(5.0)),
    //           borderSide: BorderSide(
    //             color: Colors.black),
    //         ),
            
    //         focusedBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(5.0)),
    //         ),
            
    //         enabledBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(5.0)),
    //           borderSide: BorderSide(color: Colors.black),
    //         ),
            
    //         labelStyle: TextStyle(color: Colors.black)
    //       ),
            
    //       // expandedInsets: EdgeInsets.all(20),
          
    //       menuStyle: const MenuStyle(
    //         side: WidgetStatePropertyAll<BorderSide>(
    //           BorderSide(
    //             color: Color(0xFFFFFFFF),
    //           ),
    //         ),
    //         shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
    //           RoundedRectangleBorder(
    //             borderRadius: BorderRadius.all(Radius.circular(5.0))
    //           )
    //         )
    //       ),
          
    //       onSelected: (IconLabel? icon) {
    //         setState(() {
    //           selectedIcon = icon;
    //           country = icon!.label;
    //           Navigator.pop(context);
    //         });
    //       },
            
    //       dropdownMenuEntries:
    //         IconLabel.values.map<DropdownMenuEntry<IconLabel>>((IconLabel icon) {
    //           return DropdownMenuEntry<IconLabel>(
    //             value: icon,
    //             label: icon.label,
    //             leadingIcon: Icon(icon.icon),
    //           );},
    //         ).toList(),
  //       ),
  //     ),
  //   );
  }

  
  
  AlertDialog showSearchCity(){
    return AlertDialog(
      title: const Text('City'),
      content: SizedBox(
        width: double.maxFinite,
        child: FutureBuilder(
          future: CountryCityService().listCities(),

          builder: (context, snapshot) {
            // Requisição finalizada
            if (snapshot.connectionState == ConnectionState.done) {
              
              var lista = snapshot.data as List<City>;

              return DropdownMenu(
                enableFilter: true,
                label: const Text('Type your city'),
                width: 250,
                menuHeight: 200,
                
                dropdownMenuEntries: lista.map<DropdownMenuEntry<City>>((City city) {
                  return DropdownMenuEntry<City>(
                    label: city.name,
                    value: city,
                  );},
                ).toList(),
                onSelected: (value) => {
                  setState(() {
                    country = value!.name;
                    
                  }),
                  Navigator.pop(context)
                },
              );
            }

            //Aguardando a requisição
            return const Center(child: CircularProgressIndicator());
          },
        ),
      )
    );
  }

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
                  OutlinedButton.icon(
                    onPressed: ()=>{
                      showDialog(
                        context: context,
                        builder: (context) {
                          return showSearchApi();
                        }
                      )
                      // Navigator.pushNamed(context, '/main')
                    }, 
                    label: Text(country),
                    style: buttonStyle,
                  ),
                  
                  const SizedBox(height: 15,),
                  
                  OutlinedButton.icon(
                    
                    onPressed: ()=>{
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return showSearchCity();
                        }
                      )// Navigator.pushNamed(context, '/main')
                    }, 
                    label: Text(city),
                    style: buttonStyle,
                  ),
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