import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue = 100;
  bool _sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Sliders and Chets')
      ),
      ),
      body: Column(
        children: [
      
          Slider.adaptive(
            min: 50,
            max: 400,
            activeColor: AppTheme.primary,
            value: _sliderValue, 
            onChanged: _sliderEnable 
            ? (value){
              _sliderValue=value;
              setState(() {});
            
            }
            :null
            
        ),

        // Checkbox(
        //   value: _sliderEnable, 
        //   onChanged: (value){
        //     _sliderEnable = value?? true;
        //     setState(() {
              
        //     });
        //   }
        // ),

        // CheckboxListTile(
          
        //   activeColor: AppTheme.primary,
        //   value: _sliderEnable, 
        //   onChanged: (value){
        //     _sliderEnable = value?? true;
        //     setState(() {
              
        //     });
        //   }
        // ),

        // Switch(
        //   activeColor: AppTheme.primary,
        //   value: _sliderEnable, 
        //   onChanged: (value){
        //     _sliderEnable = value;
        //     setState(() {
              
        //     });
        //   }),

        SwitchListTile.adaptive(
          activeColor: AppTheme.primary,
          title: const Text('Activar Slider'),
          value: _sliderEnable, 
          onChanged: (value){
            _sliderEnable = value;
            setState(() {});
          }),

          const AboutListTile(),

        Expanded(
          child: SingleChildScrollView(
            child: Image(
              image: const NetworkImage('https://www.pngmart.com/files/2/Monkey-D-Luffy-PNG-Pic.png'),
              fit: BoxFit.contain,
              width: _sliderValue,
            ),
          ),
        ),

        
      
      
        ],)
    );
  }
}