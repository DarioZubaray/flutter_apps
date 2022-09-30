import 'package:fl_components/themes/themes.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue1 = 300;
  double _sliderValue2 = 200;
  double _sliderValue3 = 100;
  bool _sliderEnabled1 = true;
  bool _sliderEnabled2 = true;
  bool _sliderEnabled3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders and checks'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            const Text('slider normal'),
            const SizedBox(height: 20),
            Slider(
              min: 20,
              max: 500,
              value: _sliderValue1,
              activeColor: AppTheme.primary,
              onChanged: _sliderEnabled1
                ? (value) {
                  _sliderValue1 = value;
                  setState(() {});
                }
                : null,
                
            ),
        
            const Text('slider con divisiones'),
            const SizedBox(height: 20),
            Slider(
              min: 20,
              max: 500,
              value: _sliderValue2,
              activeColor: AppTheme.primary,
              divisions: 10,
              onChanged: _sliderEnabled2
                ? (value) {
                  _sliderValue2 = value;
                  setState(() {});
                }
                : null,

            ),
        
            const Text('slider adaptativa'),
            const SizedBox(height: 20),
            Slider.adaptive(
              min: 20,
              max: 400,
              value: _sliderValue3,
              activeColor: AppTheme.primary,
              divisions: 10,
              onChanged: _sliderEnabled3
                ? (value) {
                  _sliderValue3 = value;
                  setState(() {});
                }
                : null,
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Text('Habilitar Slider normal'),
                  Checkbox(
                    value: _sliderEnabled1,
                    onChanged: (value) {
                      _sliderEnabled1 = value ?? true;
                      setState(() {});
                    }
                  ),
                ],
              ),
            ),

            CheckboxListTile(
              title: const Text('Habilitar slider con divisiones'),
              activeColor: AppTheme.primary,
              value: _sliderEnabled2,
              onChanged: (value) {
                _sliderEnabled2 = value ?? true;
                setState(() {});
              }
            ),

            // Switch(
            //   value: _sliderEnabled3,
            //   onChanged: (value) {
            //     _sliderEnabled3 = value;
            //     setState(() {});
            //   }
            // ),

            SwitchListTile.adaptive(
              title: const Text('Habilitar slider adaptativo'),
              activeColor: AppTheme.primary,
              value: _sliderEnabled3,
              onChanged: (value) {
                _sliderEnabled3 = value;
                setState(() {});
              }
            ),

            const AboutListTile(),

            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Image(
                  image: const NetworkImage('https://static.wikia.nocookie.net/kirby/images/0/09/Kirby_Kirby%27s_Dream_Buffet.png'),
                  fit: BoxFit.cover,
                  width: _sliderValue1,
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}