import 'package:flutter/material.dart';
import 'package:masaar/controllers/auth_controller.dart';
import 'package:masaar/widgets/custom%20widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  bool _isLoading = false;
  bool _isEditMode = false;
  String? _locationId;

  static const Color _labelColor = Color(0xFF6A42C2);
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _checkEditMode();
  }

  void _initializeControllers() {
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

  void _checkEditMode() {
    if (widget.initialData != null && widget.initialData!['id'] != null) {
      _isEditMode = true;
      _locationId = widget.initialData!['id'].toString();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  Future<void> _saveLocationToDB() async {
    if (_isLoading) return;

    setState(() => _isLoading = true);

    try {
      final userId = Get.find<AuthController>().user?.id;

      if (userId == null) {
        _showErrorDialog('User not logged in. Please log in and try again.');
        return;
      }

      final locationData = {
        'location_name': _nameController.text.trim(),
        'address': _addressController.text.trim(),
        'city': _cityController.text.trim(),
        'additional_details':
            _detailsController.text.trim().isEmpty
                ? null
                : _detailsController.text.trim(),
        'customer_id': userId,
        'updated_at': DateTime.now().toIso8601String(),
      };

      if (_isEditMode && _locationId != null) {
        // Update existing location
        final response =
            await supabase
                .from('locations')
                .update(locationData)
                .eq('id', _locationId!)
                .eq('customer_id', userId) // Security check
                .select();

        if (response.isEmpty) {
          _showErrorDialog('Failed to update location. Please try again.');
          return;
        }

        _showSuccessSnackbar('Location updated successfully');
      } else {
        // Create new location
        locationData['created_at'] = DateTime.now().toIso8601String();

        final response =
            await supabase.from('locations').insert(locationData).select();

        if (response.isEmpty) {
          _showErrorDialog('Failed to add location. Please try again.');
          return;
        }

        _showSuccessSnackbar('Location added successfully');
      }

      Get.back(result: true);
    } catch (e) {
      print('Error saving location: $e');
      _showErrorDialog(
        'An error occurred while saving the location. Please try again.',
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
    String? Function(String?)? validator,
    int maxLines = 1,
    bool isRequired = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
              color: _labelColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            children: [
              if (isRequired)
                const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[500]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: _labelColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Get.back(),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset('images/back_button.png'),
          ),
        ),
        title: Text(
          _isEditMode ? 'Edit Location' : 'Add a Location',
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(
                label: 'Location Name',
                controller: _nameController,
                hint: 'e.g., Home, Office, Gym',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Location name is required';
                  }
                  if (value.trim().length < 2) {
                    return 'Location name must be at least 2 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              _buildTextField(
                label: 'Address',
                controller: _addressController,
                hint: 'e.g., 123 Main Street, Downtown',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Address is required';
                  }
                  if (value.trim().length < 5) {
                    return 'Please enter a valid address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              _buildTextField(
                label: 'City',
                controller: _cityController,
                hint: 'e.g., Jeddah, Riyadh, Medina',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'City is required';
                  }
                  if (value.trim().length < 2) {
                    return 'Please enter a valid city name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              _buildTextField(
                label: 'Additional Details',
                controller: _detailsController,
                hint: 'e.g., Gate 2, Building B, Floor 3 (Optional)',
                maxLines: 3,
                isRequired: false,
              ),
              const SizedBox(height: 40),
              CustomButton(
                text:
                    _isLoading
                        ? (_isEditMode ? 'Updating...' : 'Saving...')
                        : (_isEditMode ? 'Update Location' : 'Save Location'),
                isActive: !_isLoading,
                onPressed:
                    _isLoading
                        ? () {}
                        : () {
                          if (_formKey.currentState!.validate()) {
                            _saveLocationToDB();
                          }
                        },
              ),
              const SizedBox(height: 16),
              if (_isLoading)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
