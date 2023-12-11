import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Alternatives"),
      ),
      body: Column(
        children: [
          // Search bar
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Search by Brand Name",
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          // Product list
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with actual data length
              itemBuilder: (context, index) {
                return ProductListItem(
                  brandName: "Brand Name $index",
                  description: "Short product description $index",
                  // Add other product information here
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  final String brandName;
  final String description;

  const ProductListItem({
    required this.brandName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFEEEEEE),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          // Brand logo
          Container(
            width: 50.0,
            height: 50.0,
            color: Colors.grey[200], // Replace with actual logo
          ),
          SizedBox(width: 16.0),
          // Brand name and description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  brandName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
