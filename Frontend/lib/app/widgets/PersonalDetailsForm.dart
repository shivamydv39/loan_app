import 'package:flutter/material.dart';
class PersonalDetailsForm extends StatefulWidget {
  @override
  _PersonalDetailsFormState createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  String? gender;
  String? maritalStatus;
  DateTime? dob;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              Text(
                "Personal Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "First Name*",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Last Name*",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Gender
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Gender*",
                    border: OutlineInputBorder(),
                  ),
                  items: ["Male", "Female", "Other"]
                      .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
                      .toList(),
                  onChanged: (val) => setState(() => gender = val),
                ),
                const SizedBox(height: 16),

                // DOB
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Date of Birth*",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      setState(() => dob = pickedDate);
                    }
                  },
                  controller: TextEditingController(
                    text: dob == null
                        ? ""
                        : "${dob!.day}-${dob!.month}-${dob!.year}",
                  ),
                ),
                const SizedBox(height: 16),

                // Marital Status
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Your Marital Status*",
                    border: OutlineInputBorder(),
                  ),
                  items: ["Single", "Married", "Divorced", "Widowed"]
                      .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
                      .toList(),
                  onChanged: (val) => setState(() => maritalStatus = val),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
