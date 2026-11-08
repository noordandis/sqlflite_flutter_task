
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  final Function(String productName, String quantity) onSave;


  const AddProductScreen({super.key, required this.onSave});

  @override
  State<AddProductScreen> createState() => _AddProductScreen();
}

class _AddProductScreen extends State<AddProductScreen> {

  final _formKey = GlobalKey<FormState>();


  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  void dispose() {
    _productNameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _submitForm() {

    if (_formKey.currentState!.validate()) {
      widget.onSave(
        _productNameController.text.trim(),
        _quantityController.text.trim(),
      );
      Navigator.pop(context);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 5, 48),
      appBar: AppBar(
          title: Text("Add Product",textAlign:TextAlign.center,
            style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
          backgroundColor: Color.fromARGB(255, 133, 5, 184)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 60),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _productNameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.white70),
                  labelText: 'ProductName',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
             
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is requiredً';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),


              TextFormField(

                controller: _quantityController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white),
                  ),

                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'This field is requiredً';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 60),


              ElevatedButton(

                  onPressed: _submitForm,

                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  backgroundColor: const Color.fromARGB(255, 133, 5, 184),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.only(left: 40,right:40,top: 10,bottom: 10),
                ),
                child: const Text('Add', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}