// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Widget/BasicText.W.dart';
import '../../../Widget/CustomSignInButton.W.dart';
import '../../../Widget/DatePickerFormField.W.dart';
import '../../../Controller/ControllerPromocion.Con.dart';

class CrearPromocion extends ConsumerWidget {
  const CrearPromocion({Key? key}) : super(key: key);

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
                  'Promoción',
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              BasicText(
                labelText: 'Ingrese Nombre de Promoción',
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
                'Fecha Inicio de la Promoción',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 146, 8, 173),
                ),
              ),
              DatePickerFormField(
                initialDate: selectedDate,
                onChanged: (newDate) {
                  ref.read(dateProvider.notifier).setDate(newDate);
                },
              ),
              const Text(
                'Fecha Finalización de Promoción',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 128, 10, 151),
                ),
              ),
              DatePickerFormField(
                initialDate: selectedDate1,
                onChanged: (newDate) {
                  ref.read(dateProvider1.notifier).setDate(newDate);
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomSignInButton(
                    onPress: () {
                      proController.clear();
                    },
                    text: 'Cancelar',
                  ),
                  CustomSignInButton(
                    onPress: () async {
                      if (formKey.currentState!.validate()) {
                        final g = proController.text;
                        final selectedDateString =
                            selectedDate.toLocal().toString().split(' ')[0];
                        final selectedDateString1 =
                            selectedDate1.toLocal().toString().split(' ')[0];
                        String result = await createPromocion(
                          g,
                          selectedDateString,
                          selectedDateString1,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(result),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    text: 'Guardar',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (resultMessage != null)
                Text(
                  resultMessage,
                  style: const TextStyle(color: Colors.green),
                ),
            ],
          ),
        ),
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
