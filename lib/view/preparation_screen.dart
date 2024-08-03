import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [PageView].
class Preparation extends StatelessWidget {
  const Preparation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Preparation')),
        body: const PageViewExample(),
      ),
    );
  }
}

class PageViewExample extends StatefulWidget {
  const PageViewExample({super.key});

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView( 
          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
          /// Use [Axis.vertical] to scroll vertically.
          scrollBehavior: MyCustomScrollBehavior(),
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          children: const <Widget>[
            Introduction(),
            NaturalDisaster(),

          ],
        ),
        PageIndicator(
          tabController: _tabController,
          currentPageIndex: _currentPageIndex,
          onUpdateCurrentPageIndex: _updateCurrentPageIndex,
          isOnDesktopAndWeb: _isOnDesktopAndWeb,
        ),
      ],
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
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

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }
}

/// Page indicator for desktop and web platforms.
///
/// On Desktop and Web, drag gesture for horizontal scrolling in a PageView is disabled by default.
/// You can defined a custom scroll behavior to activate drag gestures,
/// see https://docs.flutter.dev/release/breaking-changes/default-scroll-behavior-drag.
///
/// In this sample, we use a TabPageSelector to navigate between pages,
/// in order to build natural behavior similar to other desktop applications.

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
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
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
              if (currentPageIndex == 2) {
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

class Introduction extends StatelessWidget {
  const Introduction ({ super.key });

  final TextStyle titleStyle = const TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Preparation',
              style: titleStyle,
              textAlign: TextAlign.start,
            ),

            const Divider(),

            const SizedBox(height: 15.0,),

            const Text(
              'Introduction',
              style: TextStyle(fontSize: 15.0),
            ),

            const SizedBox(height: 15.0,),

            const Text("Hello Dear User! We are happy that you decided to dowload ADA’s app. This app will help people to prepare themselves to possible disasters that can happen. Will provide too, useful information in order to"),
            
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

class NaturalDisaster extends StatelessWidget {
  const NaturalDisaster ({ super.key });

  final TextStyle titleStyle = const TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
      
            children: [
              Text(
                'What is a Natural Disaster ? ',
                style: titleStyle,
                textAlign: TextAlign.start,
              ),
      
              const Divider(),
      
              const SizedBox(height: 15.0,),
      
              const Text(
                'Introduction',
                style: TextStyle(fontSize: 15.0),
              ),
      
              const SizedBox(height: 15.0,),
      
              const Text(
                "A natural disaster is a catastrophic event caused by natural processes that overwhelm local resources and threaten the function and safety of a community. "
              ),
              const SizedBox(height: 15.0,),
              const Text(
                "These events are often sudden and destructive, resulting in significant loss of life, property damage, and environmental disruption."
              ),

              const Text(
                "These events are often sudden and destructive, resulting in significant loss of life, property damage, and environmental disruption."
              ),

              const Text(
                " "
              ),
              
            ],
          ),
      ),
    );
  }
}
class HowGetPreparated extends StatelessWidget {
  const HowGetPreparated ({ super.key });

  final TextStyle titleStyle = const TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
      
            children: [
              Text(
                'What is a Natural Disaster ? ',
                style: titleStyle,
                textAlign: TextAlign.start,
              ),
      
              const Divider(),
      
              const SizedBox(height: 15.0,),
      
              const Text(
                'Introduction',
                style: TextStyle(fontSize: 15.0),
              ),
      
              const SizedBox(height: 15.0,),
      
              const Text(
                """ 
                A natural disaster is a catastrophic event caused by natural processes that overwhelm local resources and threaten the function and safety of a community. 
                """
              ),
              const SizedBox(height: 15.0,),
              const Text(
                '''
                These events are often sudden and destructive, resulting in significant loss of life, property damage, and environmental disruption.
                '''
              ),

              const Text(
                """ 
                These events are often sudden and destructive, resulting in significant loss of life, property damage, and environmental disruption.  
                """
              ),

              const Text(
                """ 
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


// class UnorderedList extends StatelessWidget {
//   const UnorderedList(this.texts, {super.key});
//   final List<String> texts;

//   @override
//   Widget build(BuildContext context) {
//     var widgetList = <Widget>[];
//     for (var text in texts) {
//       // Add list item
//       widgetList.add(UnorderedListItem(text));
//       // Add space between items
//       widgetList.add(SizedBox(height: 5.0));
//     }

//     return Column(children: widgetList);
//   }
// }

// class UnorderedListItem extends StatelessWidget {
//   const UnorderedListItem(this.text, {super.key});
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         const Text("• "),
//         Expanded(
//           child: Text(text),
//         ),
//       ],
//     );
//   }
// }
