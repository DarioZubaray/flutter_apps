import 'package:flutter/material.dart';
import 'package:disenios/widgets/widgets.dart';

class AdvancedScreen extends StatelessWidget {
   
  const AdvancedScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: const [

          Background(),

          _HomeBody(),

        ],
      ),

      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [

          // titulos
          PageTitle(),

          SizedBox(height: 40),

          // card table
          CardTable(),

        ]
      ),
    );
  }
}