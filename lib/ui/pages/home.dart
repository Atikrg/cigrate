import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cigarette',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // You can add navigation logic based on the selected index here
    print('Tapped item index: $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Customer',
          style: TextStyle(
            fontSize: 15, // Set your desired font size here (e.g., 24)
            fontWeight: FontWeight.bold, // Optional: make it bold
          ),
        ),
        backgroundColor: Colors.green[100],
        actions: [
          // Row widget to combine text and icons
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Padding for spacing
            child: Row(
              children: [
                const Text(
                  'Bill: 1', // Bill text
                  style: TextStyle(
                    fontSize: 16, // Adjust font size as needed
                    fontWeight: FontWeight.bold, // Optional: make it bold
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.qr_code), // QR code icon
                  onPressed: () {
                    // Handle QR code icon tap
                    print('QR code icon tapped!');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings), // Settings icon
                  onPressed: () {
                    // Handle settings icon tap
                    print('Settings icon tapped!');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.green[100],
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green[100], // Optional: Set a background color
                ),
                child: SizedBox(
                  height: 150, // Adjust height as needed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          print('User account icon tapped!');
                        },
                        child: const Icon(
                          Icons.account_circle, // User account icon
                          size: 90,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                  leading: const Icon(Icons.refresh), // Refresh icon
                  title: const Text('Refresh'),
                  onTap: () {
                    print("Refresh");
                  }),
              ListTile(
                leading: const Icon(Icons.settings), // Settings icon
                title: const Text("Settings"),
                onTap: () {
                  Navigator.pushNamed(context, "/homepage");
                },
              ),
              ListTile(
                leading: const Icon(Icons.list), // Price Lists icon
                title: const Text("Price Lists"),
                onTap: () {
                  Navigator.pushNamed(context, "/settingspage");
                },
              ),
              ListTile(
                leading: const Icon(Icons.assessment), // Summary icon
                title: const Text("Summary"),
                onTap: () {
                  // Add navigation if needed
                },
              ),
              ListTile(
                leading: const Icon(Icons.store), // Stock Entry icon
                title: const Text("Stock Entry"),
                onTap: () {
                  // Add navigation if needed
                },
              ),
              ListTile(
                leading: const Icon(Icons.article), // Price Invoice icon
                title: const Text("Price Invoice"),
                onTap: () {
                  // Add navigation if needed
                },
              ),
              ListTile(
                leading: const Icon(Icons.info), // About icon
                title: const Text("About"),
                onTap: () {
                  // Add navigation if needed
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout), // Logout icon
                title: const Text("Logout"),
                onTap: () {
                  // Add navigation if needed
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green[300], // Adjust the color to match your design
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                // Refresh action
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                // Save action
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.visibility),
              onPressed: () {
                // Save action
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.print),
              onPressed: () {
                // Print action
              },
              color: Colors.white,
            ),
            Text(
              'QTY: 1',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Text(
              '₹ 0',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Dish Name')),
            DataColumn(label: Text('Country')),
            DataColumn(label: Text('Price')),
          ],
          rows: List<DataRow>.generate(
            5,
            (index) {
              // Define your data
              final List<Map<String, String>> data = [
                {
                  'name': 'Chicken Katsu',
                  'country': 'Japan',
                  'price': '\$12.99'
                },
                {
                  'name': 'Falafel Wrap',
                  'country': 'Palestine',
                  'price': '\$8.99'
                },
                {
                  'name': 'Hyderabadi Biryani',
                  'country': 'India',
                  'price': '\$10.99'
                },
                {'name': 'Ramen', 'country': 'Japan', 'price': '\$11.49'},
                {'name': 'Tacos', 'country': 'Mexico', 'price': '\$9.99'},
              ];

              // Get the current row data
              final rowData = data[index];

              return DataRow(
                color: index.isOdd
                    ? MaterialStateProperty.all(Colors.grey[200])
                    : null, // Color for odd rows
                cells: [
                  DataCell(Text(rowData['name']!)),
                  DataCell(Text(rowData['country']!)),
                  DataCell(Text(rowData['price']!)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
