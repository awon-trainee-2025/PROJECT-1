import 'package:flutter/material.dart';
import 'package:masaar/widgets/custom_button.dart';

class AddLocationPage extends StatefulWidget {
  final Map<String, dynamic>? initialData;

  const AddLocationPage({Key? key, this.initialData}) : super(key: key);

  @override
  AddLocationPageState createState() => AddLocationPageState();
}

class AddLocationPageState extends State<AddLocationPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _addressController;
  late final TextEditingController _cityController;
  late final TextEditingController _detailsController;

  static const Color _labelColor = Color(0xFF6A42C2);

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.initialData?['name'] ?? '',
    );
    _addressController = TextEditingController(
      text: widget.initialData?['address'] ?? '',
    );
    _cityController = TextEditingController(
      text: widget.initialData?['city'] ?? '',
    );
    _detailsController = TextEditingController(
      text: widget.initialData?['details'] ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(leading: BackButton(), title: Text('Add a Location')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('Location name', style: TextStyle(color: _labelColor)),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(hintText: 'College, Home'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 16),
              Text('Address', style: TextStyle(color: _labelColor)),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(hintText: 'Address'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 16),
              Text('City', style: TextStyle(color: _labelColor)),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(hintText: 'City'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 16),
              Text('Additional details', style: TextStyle(color: _labelColor)),
              TextFormField(
                controller: _detailsController,
                decoration: InputDecoration(hintText: 'Gate 2, Building B'),
              ),
              SizedBox(height: 32),
              CustomButton(
                text: 'Save location',
                isActive: true,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, {
                      'name': _nameController.text,
                      'address': _addressController.text,
                      'city': _cityController.text,
                      'details': _detailsController.text,
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
