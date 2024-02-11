import 'package:flutter/material.dart';

class SaplingPage extends StatefulWidget {
  const SaplingPage({Key? key}) : super(key: key);

  @override
  State<SaplingPage> createState() => _SaplingPageState();
}

class _SaplingPageState extends State<SaplingPage> {
  @override
  Widget build(BuildContext context) {
    var container = Container(
                      color: Colors.transparent, // Adjust color as needed
                      child: const Card(
                      color: Colors.transparent, // Adjust color as needed
                        child: Center(
                          child: Text(
                            'Card 1',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.blueGrey], // Adjust colors as needed
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/logo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'GDSC First Sapling',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: container,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent, // Adjust color as needed
                      child: Center(
                        child: Text(
                          'Right Section',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

