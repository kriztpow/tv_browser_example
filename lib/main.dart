import 'package:flutter/material.dart';

void main() => runApp(TvDemoApp());

class TvDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TV Browser Demo',
      theme: ThemeData.dark(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    // Simple grid that is D-pad friendly: use Focus traversal and InkWell
    return Scaffold(
      appBar: AppBar(title: Text('TV Browser Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Selecciona una opción con el D-Pad (o ratón)', style: TextStyle(fontSize: 22)),
            SizedBox(height: 24),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              padding: EdgeInsets.symmetric(horizontal: 24),
              children: List.generate(6, (i) {
                return FocusableActionDetector(
                  onShowFocusHighlight: (focus) {},
                  child: Builder(builder: (ctx) {
                    final isFocused = Focus.of(ctx).hasPrimaryFocus;
                    return GestureDetector(
                      onTap: () {
                        setState(() => selected = i);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Seleccionada opción #${i+1}')));
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 120),
                        curve: Curves.easeOut,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: selected==i ? Colors.amber : Colors.white24, width: isFocused ? 4 : 2),
                          color: Colors.white10,
                        ),
                        alignment: Alignment.center,
                        child: Text('Opción ${i+1}', style: TextStyle(fontSize: 18)),
                        padding: EdgeInsets.all(18),
                      ),
                    );
                  }),
                );
              }),
            ),
            SizedBox(height: 20),
            Text('Opción seleccionada: ${selected+1}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}