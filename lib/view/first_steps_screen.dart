import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../services/country_city_service.dart';
import '../widgets/text_button_standard.dart';

class FirstStepsScreen extends StatefulWidget {

  const FirstStepsScreen({ super.key });

  @override
  State<FirstStepsScreen> createState() => _FirstStepsScreenState();
}

class _FirstStepsScreenState extends State<FirstStepsScreen> {

  late Future<String> futureAlbum;

  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();

  String countrySelected = 'Choose your country';
  String citySelected = 'Choose your city';

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
  const txtTitleStyle = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 36
  );

  var buttonStyle = ElevatedButton.styleFrom(
    fixedSize: const Size.fromWidth(300.0),
    foregroundColor: const Color(0xFFFFFFFF),
    side: const BorderSide(color: Color(0xFFFFFFFF),),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5.0))
    )
  );
  var dropDownDecorator = const DropDownDecoratorProps(
    textAlignVertical: TextAlignVertical.center,
    baseStyle: TextStyle(color: Colors.white),
    textAlign: TextAlign.center,
    dropdownSearchDecoration: InputDecoration(
      contentPadding: EdgeInsets.all(0),
       constraints: BoxConstraints(maxHeight: 35, maxWidth: 300),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFFFFFFF),),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      )
    ),
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

                  DropdownSearch<String>(
                    asyncItems: (String filter) => CountryCityService().listCountries(),
                    
                    popupProps: const PopupProps.dialog(
                      showSelectedItems: true,
                      searchDelay: Duration.zero,
                      title: Text('Choose your country'),
                      showSearchBox: true,
                    ),
                    dropdownButtonProps: const DropdownButtonProps(
                      color: Color(0xFFFFFFFF),
                    ),
                    dropdownDecoratorProps: dropDownDecorator,
                    onChanged: (value) {
                      setState(() {
                        countrySelected = value.toString();
                      });
                    },
                    selectedItem: countrySelected,
                  ),

                  const SizedBox(height: 15,),

                  DropdownSearch<String>(
                    asyncItems: (String filter) => CountryCityService().listCities(countrySelected),
                    
                    popupProps: const PopupProps.dialog(
                      showSelectedItems: true,
                      searchDelay: Duration.zero,
                      title: Text('Choose your city'),
                      showSearchBox: true,
                    ),
                    dropdownButtonProps: const DropdownButtonProps(
                      color: Color(0xFFFFFFFF),
                    ),
                    dropdownDecoratorProps: dropDownDecorator,
                    onChanged: (value) {
                      setState(() {
                        citySelected = value.toString();
                      });
                    },
                    selectedItem: citySelected,
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