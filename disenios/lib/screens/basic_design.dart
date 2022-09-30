import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {

  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Image(image: AssetImage('assets/godofwar.jpeg')),

          const _Title(),

          const _ButtonSection(),

          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              'Duis ea aliquip exercitation sint mollit occaecat quis ea do amet commodo labore proident ullamco. Adipisicing sit in do commodo occaecat irure esse laborum pariatur officia veniam enim. Occaecat adipisicing consequat irure culpa occaecat. In consequat anim elit reprehenderit ut nostrud magna quis irure sunt deserunt.'
            ),
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('God of war 4', style: TextStyle(fontWeight: FontWeight.bold) ,),
              Text('La serpiente del mundo', style: TextStyle(color: Colors.black38),),

            ],
          ),

          Expanded(child: Container()),

          const Icon(Icons.star, color: Colors.red,),

          const SizedBox(width: 15,),
  
          const Text('41')
        ],
      ),
    );
  }
}

class _ButtonSection extends StatelessWidget {
  const _ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _CustomButton(text: 'phone', icon: Icons.phone),
          _CustomButton(text: 'map', icon: Icons.map),
          _CustomButton(text: 'share', icon: Icons.share),
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {

  final IconData icon;
  final String text;

  const _CustomButton({
    Key? key, required this.icon, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Icon(icon, color: Colors.blue,),
          ),
          Text(text.toUpperCase(),)
        ],
      ),
    );
  }
}
