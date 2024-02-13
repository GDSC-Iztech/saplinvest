import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('Hosgeldin GDSC'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.blueGrey],
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.end,children: [
              Text(
                'Profile Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.person, color: Colors.white,size: 70,),
              SizedBox(width: 20),
            ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: DashboardListView() ,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardListView extends StatefulWidget {
  const DashboardListView({Key? key}) : super(key: key);

  @override
  State<DashboardListView> createState() => _DashboardListViewState();
}

class _DashboardListViewState extends State<DashboardListView> {
  @override
  Widget build(BuildContext context) {

    return ListView(
      children: const <Widget>[
        DashboardCardForAdding(),
        DashboardCard(),
        DashboardCard(),
        DashboardCard(),
        DashboardCard(),
        DashboardCard(),
        DashboardCard(),
        DashboardCard(),
        DashboardCard(),
      ],
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1.0, 1.0, 10, 10),
      child: Card(
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: const ListTile(
          leading: Icon(Icons.nature_rounded),
          title: Text('Bu ne guzel bir agac bayildim'),
        ),
      ),
    );
  }
}

class DashboardCardForAdding extends StatelessWidget {
  const DashboardCardForAdding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1.0, 1.0, 10, 10),
      child: Card(
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: ListTile(
          leading: const Icon(Icons.add_circle_rounded),
          title: const Text('Yeni Fidan'),
          onTap: () {
          },
        ),
      ),
    );
  }
}

