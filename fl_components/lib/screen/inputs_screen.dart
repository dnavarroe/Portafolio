import 'package:flutter/material.dart';

import '../widget/widgets.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> forValues = {
      'first_name':'Daniel',
      'last_name':'Navarro',
      'email':'dnavarroe@gmail.com',
      'password':'123658',
      'role':'Admin'
    };

    return  Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Inputs and Forms'),
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: myFormKey,
            child: Column(
              children:  [
          
                CustomInputField( labelText: 'Nombre', hintText: 'Nombre del Usuairio', formProperty: 'first_name', formValues: forValues),
                const SizedBox(height: 30,),
                CustomInputField( labelText: 'Apellido', hintText: 'Apellido del Usuairio', formProperty: 'last_name', formValues: forValues),
                const SizedBox(height: 30,),
                CustomInputField( labelText: 'Correo', hintText: 'Correo del Usuario', keyboardType: TextInputType.emailAddress, formProperty: 'email', formValues: forValues),
                const SizedBox(height: 30,),
                CustomInputField( labelText: 'Contraseña', hintText: 'Contraseña del Usuario', obscureText: true, formProperty: 'password', formValues: forValues),
                const SizedBox(height: 30,),

                DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(value: 'Admin',child: Text('Admin'),),
                    DropdownMenuItem(value: 'Superuser',child: Text('Superuser'),),
                    DropdownMenuItem(value: 'Developer',child: Text('Developer'),),
                    DropdownMenuItem(value: 'Jr. Developer',child: Text('Jr. Developer'),),
                  ], 
                  onChanged: (value){
                    print(value);
                    forValues['role'] = value ?? 'Admin';
                    
                  }
                ),
          
                ElevatedButton(
                  onPressed: (){

                    //Minimizar teclado
                    FocusScope.of(context).requestFocus(FocusNode());

                    if ( !myFormKey.currentState!.validate()){
                      print('Form validate');
                      return;
                    }

                    print(forValues);
                  }, 
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Confirmar')))
                )
          
              ]
                  ),
          ),
        ),
      )
    );
  }
}

