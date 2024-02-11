import 'package:flutter/material.dart';

class SaplingPage extends StatefulWidget {
  const SaplingPage({Key? key}) : super(key: key);

  @override
  State<SaplingPage> createState() => _SaplingPageState();
}

class _SaplingPageState extends State<SaplingPage> {
  @override
  Widget build(BuildContext context) {
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
            colors: [
              Colors.blueAccent,
              Colors.blueGrey
            ], // Adjust colors as needed
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
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CommentListView(),
                  ),
                  Expanded(
                    child: ImageListView(),
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

class CommentListView extends StatefulWidget {
  const CommentListView({Key? key}) : super(key: key);

  @override
  State<CommentListView> createState() => _CommentListViewState();
}

class _CommentListViewState extends State<CommentListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        CommentCard(),
        CommentCard(),
        CommentCard(),
        CommentCard(),
        CommentCard(),
        CommentCard(),
        CommentCard(),
        CommentCard(),
        CommentCard(),
      ],
    );
  }
}

class ImageListView extends StatefulWidget {
  const ImageListView({Key? key}) : super(key: key);

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ImageCard(),
        ImageCard(),
        ImageCard(),
        ImageCard(),
        ImageCard(),
        ImageCard(),
        ImageCard(),
        ImageCard(),
        ImageCard(),
      ],
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset("assets/logo.jpg"),
    );
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        subtitle: const Text('Bu ne guzel bir agac bayildim'),
        onTap: () {
          // Öğeye tıklandığında yapılacak işlemler
        },
      ),
    );
  }
}
