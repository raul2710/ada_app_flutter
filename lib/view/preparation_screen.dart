import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


const TextStyle titleStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold
);

class Preparation extends StatelessWidget {
  const Preparation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preparation')),
      body: const PageViewPreparation(),
    );
  }
}

class PageViewPreparation extends StatefulWidget {
  const PageViewPreparation({super.key});

  @override
  State<PageViewPreparation> createState() => _PageViewPreparationState();
}

class _PageViewPreparationState extends State<PageViewPreparation>
  with TickerProviderStateMixin {
    
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView( 
          scrollBehavior: MyCustomScrollBehavior(),
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          children: const <Widget>[
            IntroductionPage(),
            NaturalDisasterPage(),
            HowGetPreparatedPage(),
            EmergencyKitPage(),
          ],
        ),
        PageIndicator(
          tabController: _tabController,
          currentPageIndex: _currentPageIndex,
          onUpdateCurrentPageIndex: _updateCurrentPageIndex,
        ),
      ],
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 0) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex - 1);
            },
            icon: const Icon(
              Icons.arrow_left_rounded,
              size: 32.0,
            ),
          ),
          TabPageSelector(
            controller: tabController,
            color: colorScheme.surface,
            selectedColor: colorScheme.primary,
          ),
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 3) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex + 1);
            },
            icon: const Icon(
              Icons.arrow_right_rounded,
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}

class IntroductionPage extends StatelessWidget {
  const IntroductionPage ({ super.key });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Introduction',
              style: titleStyle,
              textAlign: TextAlign.start,
            ),

            const Divider(),

            const SizedBox(height: 15.0,),

            const Text(
              """
Hello Dear User!

We are happy that you decided to dowload ADA’s app. This app will help people to prepare themselves to possible disasters that can happen. Will provide too, useful information in order to prepare your emergency kit. Any question? You can use the Gemini to ask anything that you need to learn about natural disaster and how to get prepared for them.  
              """
            ),
            
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'lib/images/MapPreparation.png',
              ),
            )
          ],
        ),
    );
  }
}

class NaturalDisasterPage extends StatelessWidget {
  const NaturalDisasterPage ({ super.key });

  @override
  Widget build(BuildContext context) {

    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
      
            children: [
              Text(
                'What is a Natural Disaster ? ',
                style: titleStyle,
                textAlign: TextAlign.start,
              ),
      
              Divider(),
      
              SizedBox(height: 15.0,),

              Text(
                """ 
A natural disaster is a catastrophic event caused by natural processes that overwhelm local resources and threaten the function and safety of a community.  

These events are often sudden and destructive, resulting in significant loss of life, property damage, and environmental disruption.  

Key characteristics of a natural disaster:
 • Natural origin: Caused by forces of nature, not human actions.  
 • Sudden and destructive: Often occur without warning and cause widespread damage.  
 • Overwhelms resources: Exceeds the capacity of a community to respond effectively.  
 • Significant impact: Leads to loss of life, property damage, and disruption of normal life.  

Examples of natural disasters:
 • Earthquakes  
 • Hurricanes  
 • Floods  
 • Tsunamis  
 • Volcanoes  
 • Wildfires  
 • Droughts  
 • Landslides  
                """
              ),
            ],
          ),
      ),
    );
  }
}

class HowGetPreparatedPage extends StatelessWidget {
  const HowGetPreparatedPage ({ super.key });

  @override
  Widget build(BuildContext context) {

    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
      
            children: [
              Text(
                'How Can you get prepared ?',
                style: titleStyle,
                textAlign: TextAlign.start,
              ),
      
              Divider(),

              SizedBox(height: 15.0,),
      
              Text(
                """ 
Preparing for a natural disaster is crucial to ensuring your safety and well-being. Here are some essential steps you can take:

Create a Disaster Plan
 • Identify potential hazards: Determine the types of natural disasters your area is prone to (hurricanes, earthquakes, floods, etc.).
 • Develop an evacuation plan: Establish escape routes and meeting points for your family. 
 • Communicate with family: Discuss how you will contact each other if separated.

Assemble a Disaster Supply Kit
 • Essential supplies: Include water, non-perishable food, first aid kit, flashlight, batteries, a battery-powered radio, medications, personal hygiene items, and important documents.  
 • Consider your needs: Tailor your kit to your specific needs, such as items for infants, elderly family members, or pets.

Protect Your Home
 • Secure belongings: Anchor heavy furniture, secure water heaters, and install storm shutters or impact-resistant windows.  
 • Insurance review: Ensure you have adequate homeowners or renters insurance coverage.

Stay Informed
 • Monitor weather alerts: Stay updated on weather conditions and warnings.
 • Know emergency contacts: Have the numbers for local emergency services readily available.

Practice and Prepare
 • Emergency drills: Conduct practice drills to familiarize your family with the plan.  
 • First aid training: Learn basic first aid and CPR.
 • Emotional preparedness: Discuss potential emotional impacts and coping strategies.

Remember: Early preparation is key to minimizing the impact of a natural disaster. By following these steps, you can increase your chances of staying safe and recovering quickly.

                """
              ),
              
            ],
          ),
      ),
    );
  }
}

class EmergencyKitPage extends StatelessWidget {
  const EmergencyKitPage ({ super.key });

  @override
  Widget build(BuildContext context) {

    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                'Emergency Kit',
                style: titleStyle,
                textAlign: TextAlign.start,
              ),
      
              Divider(),

              SizedBox(height: 15.0,),
      
              Text(
                """ 
A well-stocked emergency kit can be a lifesaver in a crisis. Here's a list of essential items to include:

Basic Supplies
 • Water: One gallon per person, per day for at least three days.
 • Food: Non-perishable items like canned goods, energy bars, and dried fruit.
 • First aid kit: Including bandages, antiseptic wipes, pain relievers, and any necessary medications.
 • Flashlight and extra batteries: Or a battery-powered or hand-crank radio.
 • Battery-powered or hand-crank radio: For weather updates and emergency information.
 • Extra batteries: For your flashlight, radio, and other electronic devices.
 • Whistle: To signal for help.
 • Matches or lighter: In a waterproof container.
 • Garbage bags and moist towelettes: For personal hygiene.
 • Local maps: In case of power outages or road closures.
 • Manual can opener: For canned food.
 • Cash and coins: ATMs may not work.
 • Important documents: Copies of identification, insurance policies, and medical information.

Additional Items
 • Medications: A list of all medications and prescriptions.
 • Eyeglasses and contact lenses: With extra supplies.
 • Personal hygiene items: Toothbrush, toothpaste, soap, etc.
 • Feminine hygiene products: For women.
 • Baby supplies: If applicable, including diapers, formula, and baby food.
 • Pet supplies: Food, water, medications, and leashes.
 • Tools: Multi-purpose tool, duct tape, and work gloves.
 • Books, games, or puzzles: For children or to pass the time.

Remember: Customize your kit based on your specific needs and the types of emergencies likely to occur in your area. It's also essential to regularly review and update your kit to ensure it's always ready.
                """
              ),
            ],
          ),
      ),
    );
  }
}
