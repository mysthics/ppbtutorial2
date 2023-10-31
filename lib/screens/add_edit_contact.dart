import 'package:flutter/material.dart';
import 'package:ppb_tutor2/providers/contact_provider.dart';
import 'package:provider/provider.dart';
import "package:ppb_tutor2/models/contact.dart";

class AddEditContactScreen extends StatelessWidget {
  const AddEditContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final email = emailController.text;
                final phone = phoneController.text;

                final contact = Contact(
                  id: DateTime.now().millisecondsSinceEpoch,
                  name: name,
                  email: email,
                  phone: phone,
                );

                context.read<ContactProvider>().addContact(contact);

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}