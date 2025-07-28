import 'package:flutter/material.dart';
import '../../models/theme_model.dart';
import '../../models/package_model.dart';
import '../../models/addon_model.dart';
import '../../models/booking.dart';

import '../../services/booking_data_service.dart';
import '../../services/booking_service.dart';

class BookingWizardScreen extends StatefulWidget {
  @override
  State<BookingWizardScreen> createState() => _BookingWizardScreenState();
}

class _BookingWizardScreenState extends State<BookingWizardScreen> {
  int currentStep = 0;

  List<ThemeModel> themes = [];
  List<PackageModel> packages = [];
  List<AddonModel> addons = [];

  int? selectedThemeId;
  int? selectedPackageId;
  Set<int> selectedAddonIds = {};

  DateTime? selectedDate;
  String location = "My Home";
  final TextEditingController childNameController = TextEditingController();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAll();
  }

  Future<void> fetchAll() async {
    try {
      final t = await BookingDataService.fetchThemes();
      final p = await BookingDataService.fetchPackages();
      final a = await BookingDataService.fetchAddons();
      setState(() {
        themes = t;
        packages = p;
        addons = a;
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() => isLoading = false);
    }
  }

  void _nextStep() {
    if (currentStep < 4) {
      setState(() => currentStep++);
    } else {
      _submitBooking();
    }
  }

  void _previousStep() {
    if (currentStep > 0) {
      setState(() => currentStep--);
    }
  }

  double _calculateTotalPrice() {
    double total = 0;
    
    if (selectedPackageId != null) {
      final selectedPackage = packages.firstWhere((p) => p.id == selectedPackageId);
      total += selectedPackage.price;
    }
    
    for (int addonId in selectedAddonIds) {
      final addon = addons.firstWhere((a) => a.id == addonId);
      total += addon.price;
    }
    
    return total;
  }

  Future<void> _submitBooking() async {
    if (selectedThemeId == null || selectedPackageId == null || selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields"))
      );
      return;
    }

    try {
      final booking = Booking(
        childName: childNameController.text,
        birthdayDate: selectedDate!.toIso8601String().split('T')[0],
        location: location,
        themeId: selectedThemeId!,
        packageId: selectedPackageId!,
        addonIds: selectedAddonIds.toList(),
        paymentStatus: 'pending',
        totalPrice: _calculateTotalPrice(),
        userId: 1,
      );
      
      await BookingService.createBooking(booking);
      _showSuccessDialog();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Booking failed: $e"))
      );
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('🎉 Booking Confirmed'),
        content: const Text("Your magical party is set! We'll contact you soon."),
        actions: [
          TextButton(
            onPressed: () => Navigator.popUntil(context, (r) => r.isFirst), 
            child: const Text("Back Home")
          )
        ],
      ),
    );
  }

  Widget _buildStepBody() {
    switch (currentStep) {
      case 0:
        return _buildThemeStep();
      case 1:
        return _buildDateStep();
      case 2:
        return _buildPackageStep();
      case 3:
        return _buildAddonsStep();
      case 4:
        return _buildChildDetailsStep();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎂 Birthday Booking'),
        backgroundColor: Colors.pink[100],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _buildProgressBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16), 
                      child: _buildStepBody()
                    )
                  )
                ),
                _buildNavigationButtons(),
              ],
            ),
    );
  }

  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        children: List.generate(5, (index) {
          return Expanded(
            child: Container(
              height: 4,
              margin: EdgeInsets.only(right: index < 4 ? 5 : 0),
              decoration: BoxDecoration(
                color: index <= currentStep ? Colors.pink : Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildThemeStep() {
    if (themes.isEmpty) return const Text("No themes available");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose a Theme ✨', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        ...themes.map((theme) => RadioListTile<int>(
              title: Text(theme.name),
              subtitle: Text(theme.description),
              value: theme.id,
              groupValue: selectedThemeId,
              onChanged: (val) => setState(() => selectedThemeId = val),
            )),
      ],
    );
  }

  Widget _buildDateStep() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.calendar_today),
          title: Text(selectedDate == null
              ? 'Pick a date'
              : '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}'),
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
            );
            if (picked != null) setState(() => selectedDate = picked);
          },
        ),
        TextField(
          decoration: const InputDecoration(labelText: "Location"),
          controller: TextEditingController(text: location),
          onChanged: (val) => setState(() => location = val),
        ),
      ],
    );
  }

  Widget _buildPackageStep() {
    if (packages.isEmpty) return const Text("No packages available");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose a Package 📦', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        ...packages.map((pkg) => RadioListTile<int>(
              title: Text(pkg.name),
              subtitle: Text('${pkg.description}\nPrice: \$${pkg.price.toStringAsFixed(2)}'),
              value: pkg.id,
              groupValue: selectedPackageId,
              onChanged: (val) => setState(() => selectedPackageId = val),
              isThreeLine: true,
            )),
      ],
    );
  }

  Widget _buildAddonsStep() {
    if (addons.isEmpty) return const Text("No add-ons available");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose Add-ons (Optional) 🎈', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        ...addons.map((addon) => CheckboxListTile(
              title: Text(addon.name),
              // subtitle: Text("${addon.description ?? ''}\nPrice: \$${addon.price.toStringAsFixed(2)}"),
              value: selectedAddonIds.contains(addon.id),
              onChanged: (checked) {
                setState(() {
                  if (checked == true) {
                    selectedAddonIds.add(addon.id);
                  } else {
                    selectedAddonIds.remove(addon.id);
                  }
                });
              },
              isThreeLine: true,
            )),
      ],
    );
  }

  Widget _buildChildDetailsStep() {
    final totalPrice = _calculateTotalPrice();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Final Details 👶', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 20),
        TextField(
          controller: childNameController,
          decoration: const InputDecoration(
            labelText: "Child's Name",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Booking Summary', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 10),
                if (selectedThemeId != null)
                  Text('Theme: ${themes.firstWhere((t) => t.id == selectedThemeId).name}'),
                if (selectedPackageId != null)
                  Text('Package: ${packages.firstWhere((p) => p.id == selectedPackageId).name}'),
                if (selectedDate != null)
                  Text('Date: ${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}'),
                Text('Location: $location'),
                if (selectedAddonIds.isNotEmpty)
                  Text('Add-ons: ${selectedAddonIds.map((id) => addons.firstWhere((a) => a.id == id).name).join(", ")}'),
                const SizedBox(height: 10),
                const Divider(),
                Text('Total Price: \$${totalPrice.toStringAsFixed(2)}', 
                     style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.pink)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          if (currentStep > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: _previousStep,
                child: const Text("Back"),
              ),
            ),
          if (currentStep > 0) const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: _nextStep,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              child: Text(currentStep < 4 ? "Next" : "Book Now"),
            ),
          ),
        ],
      ),
    );
  }
}