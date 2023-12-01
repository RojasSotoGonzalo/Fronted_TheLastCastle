// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Widget/BasicText.W.dart';
import '../../../Widget/DatePickerFormField.W.dart';

class EditPromocion extends ConsumerWidget {
  final String id;
  final String name;
  final String name1;
  final String name2;
  const EditPromocion(
      {required this.id,
      required this.name,
      required this.name1,
      required this.name2,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController proController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final selectedDate = ref.watch(dateProvider);
    final selectedDate1 = ref.watch(dateProvider1);
    String? resultMessage;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Promocion Actual',
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'ID:',
                      style: TextStyle(fontSize: 18, color: Colors.purple),
                    ),
                    Text(
                      id,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Nombre de Promocion:',
                      style: TextStyle(fontSize: 18, color: Colors.purple),
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Fecha de Inicio:',
                      style: TextStyle(fontSize: 18, color: Colors.purple),
                    ),
                    Text(
                      name1,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Fecha de final:',
                      style: TextStyle(fontSize: 18, color: Colors.purple),
                    ),
                    Text(
                      name2,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                BasicText(
                  labelText: 'Ingrese nuevo Nombre de Promoción',
                  icon: const Icon(Icons.new_label),
                  controller: proController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nueva Fecha Inicio de la Promoción',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 74, 7, 151),
                  ),
                ),
                DatePickerFormField(
                  initialDate: selectedDate,
                  onChanged: (newDate) {
                    ref.read(dateProvider.notifier).setDate(newDate);
                  },
                ),
                const Text(
                  'Nueva Fecha Finalización de Promoción',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 63, 15, 139),
                  ),
                ),
                DatePickerFormField(
                  initialDate: selectedDate1,
                  onChanged: (newDate) {
                    ref.read(dateProvider1.notifier).setDate(newDate);
                  },
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                if (resultMessage != null)
                  Text(
                    resultMessage,
                    style: const TextStyle(color: Colors.green),
                  ),
              ],
            )),
      ),
    );
  }
}

final dateProvider = StateNotifierProvider<DateProvider, DateTime>((ref) {
  return DateProvider(DateTime.now());
});

final dateProvider1 = StateNotifierProvider<DateProvider, DateTime>((ref) {
  return DateProvider(DateTime.now());
});

class DateProvider extends StateNotifier<DateTime> {
  DateProvider(DateTime initialValue) : super(initialValue);

  void setDate(DateTime newDate) {
    state = newDate;
  }
}
