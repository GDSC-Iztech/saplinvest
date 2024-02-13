import 'package:flutter/material.dart';

class AddSaplingScreen extends StatefulWidget {
  const AddSaplingScreen({Key? key}) : super(key: key);

  @override
  State<AddSaplingScreen> createState() => _AddSaplingScreenState();
}

class _AddSaplingScreenState extends State<AddSaplingScreen> {
  List<String> saplingFeatures = []; // Yeni eklenen fidan özelliklerini tutan liste

  TextEditingController feature1Controller = TextEditingController();
  TextEditingController feature2Controller = TextEditingController();
  String selectedOption = 'Seçenek 1'; // Varsayılan seçenek

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('Hosgeldin GDSC'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueAccent, Colors.blueGrey],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                children: [Icon(Icons.arrow_back_outlined)],
              ),
              const SizedBox(height: 20),
              const Text(
                'Yeni fidanın özelliklerini giriniz',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: feature1Controller,
                decoration: const InputDecoration(
                  labelText: 'Özellik 1',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: feature2Controller,
                decoration: const InputDecoration(
                  labelText: 'Özellik 2',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButton<String?>(
                value: selectedOption,
                items: ['Seçenek 1', 'Seçenek 2', 'Seçenek 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? selectedValue) {
                  setState(() {
                    selectedOption = selectedValue ?? 'Bos';
                  });
                },
                hint: const Text('Seçenekleri Seçin'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    saplingFeatures.add('Özellik 1: ${feature1Controller.text}');
                    saplingFeatures.add('Özellik 2: ${feature2Controller.text}');
                    saplingFeatures.add('Seçenek: $selectedOption');
                  });
                },
                child: const Text('Ekle'),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: saplingFeatures.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        saplingFeatures[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
