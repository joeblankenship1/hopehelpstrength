import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hopehelpstrength/fab_with_icons.dart';
import 'package:hopehelpstrength/fab_bottom_app_bar.dart';
import 'package:hopehelpstrength/layout.dart';
import 'package:flutter/material.dart';
import 'package:hopehelpstrength/widgets/radial_menu.dart';
import 'package:hopehelpstrength/utils/uidata.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hope Help Strength',
        theme: ThemeData (
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        // red
        primaryColor: UIData.primaryColor,
        cardColor: UIData.cardColor,
        colorScheme: ColorScheme(primary: UIData.primaryColor, primaryVariant: UIData.accentOrange, secondary: UIData.accentYellow, secondaryVariant: UIData.accentGreen, surface: UIData.accentGray, background: UIData.accentCyan, error: UIData.accentPurple, onPrimary: UIData.accentCyan, onSecondary: UIData.accentCyan, onSurface: UIData.accentCyan, onBackground: UIData.accentCyan, onError: UIData.accentCyan, brightness: Brightness.light),
        // Define the default font family.
        fontFamily: 'Montserrat',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox.expand(child: RadialMenu()),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'A',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: FontAwesomeIcons.handsHelping, text: 'Help'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Profile'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Contact'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Info'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(
          context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [ Icons.sms, Icons.mail, Icons.phone ];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () { },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
}
