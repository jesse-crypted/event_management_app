import 'dart:io';

import 'package:event_management_app/constants/colors.dart';
import 'package:event_management_app/containers/custom_headtext.dart';
import 'package:event_management_app/containers/custom_input_form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  FilePickerResult? _filePickerResult;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _sponsorsController = TextEditingController();
  final TextEditingController _guestsController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // To pick Date Time from the user
  Future<void> _selectedDateTime(BuildContext context) async {
    final DateTime? pickedDateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));

    if (pickedDateTime != null) {
      final TimeOfDay? pickedTime =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if (pickedTime != null) {
        final DateTime selectedDateTime = DateTime(
            pickedDateTime.year,
            pickedDateTime.month,
            pickedDateTime.day,
            pickedTime.hour,
            pickedTime.minute);

        setState(() {
          _dateTimeController.text = selectedDateTime.toString();
        });
      }
    }
  }

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    setState(() {
      _filePickerResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 50),
            CustomHeadText(text: "Create Event"),
            SizedBox(height: 25),
            GestureDetector(
              onTap: () => _openFilePicker(),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kLightGreen,
                ),
                child: _filePickerResult != null
                    ? ClipRect(
                        child: Image(
                            image: FileImage(
                                File(_filePickerResult!.files.first.path!))),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo_outlined,
                            size: 42,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Add Event Image",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                        
                      ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            CustomInputForm(
                controller: _nameController,
                icon: Icons.event_outlined,
                label: "Event Name",
                hint: "Add Event Name"),
            SizedBox(
              height: 8,
            ),
            CustomInputForm(
                controller: _descriptionController,
                maxLines: 4,
                icon: Icons.description_outlined,
                label: "Description",
                hint: "Add Description"),
            SizedBox(
              height: 8,
            ),
            CustomInputForm(
                controller: _locationController,
                icon: Icons.location_on_outlined,
                label: "Location",
                hint: "Enter Location of Event "),
            SizedBox(
              height: 8,
            ),
            CustomInputForm(
              controller: _dateTimeController,
              icon: Icons.date_range_outlined,
              label: "Date & Time",
              hint: "Pick Date Time",
              readOnly: true,
              onTap: () => _selectedDateTime(context),
            ),
            SizedBox(
              height: 8,
            ),
            CustomInputForm(
                controller: _sponsorsController,
                icon: Icons.attach_money_outlined,
                label: "Sponsors",
                hint: "Enter Sponsors"),
            SizedBox(
              height: 8,
            ),
            CustomInputForm(
                controller: _guestsController,
                icon: Icons.people_outlined,
                label: "Guests",
                hint: "Enter list of guests"),
          ]),
        ),
      ),
    );
  }
}
