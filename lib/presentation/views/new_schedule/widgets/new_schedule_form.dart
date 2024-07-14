import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_agenda/core/theme/color_constants.dart';
import 'package:test_agenda/core/theme/text_styles.dart';
import 'package:test_agenda/data/models/field_model.dart';
import 'package:test_agenda/data/models/schedule_model.dart';
import 'package:test_agenda/domain/provider/schedule_provider.dart';
import 'package:test_agenda/domain/provider/weather_provider.dart';
import 'package:test_agenda/presentation/views/new_schedule/widgets/date_selector.dart';
import 'package:test_agenda/presentation/views/new_schedule/widgets/time_picker.dart';
import 'package:test_agenda/presentation/widgets/custom_text.dart';
import 'package:test_agenda/presentation/widgets/custom_text_form_field.dart';

class NewScheduleForm extends StatefulWidget {
  final FieldModel field;
  const NewScheduleForm({super.key, required this.field});

  @override
  State<NewScheduleForm> createState() => _NewScheduleFormState();
}

class _NewScheduleFormState extends State<NewScheduleForm> {
  TextEditingController _username = TextEditingController();
  late TextEditingController _rainProb;
  TextEditingController _date = TextEditingController();
  TextEditingController _timeInit = TextEditingController();
  TextEditingController _timeEnd = TextEditingController();
  TextEditingController _comment = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  void initState() {
    _rainProb = TextEditingController();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _rainProb.text = Provider.of<WeatherProvider>(
      context,
      listen: true,
    ).rainProb;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _username.dispose();
    _rainProb.dispose();
    _date.dispose();
    _timeInit.dispose();
    _timeEnd.dispose();
    _comment.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(33),
      color: AppColors.secondaryBackgroundColor,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              'Establecer fecha y hora',
              style: CustomTextStyles.customTextStylePoppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            dateSelector(context, _date, 'Fecha'),
            const SizedBox(height: 10),
            CustomTextField(
              controller: _rainProb,
              hintText: 'Probabilidad de lluvia',
              labelText: 'Probabilidad de lluvia',
              readOnly: true,
              prefixIcon: SizedBox(
                width: 40,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Icon(
                      Icons.cloud_outlined,
                      color: AppColors.gray,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: AppColors.gray.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: timePicker(context, _timeInit, 'Hora de inicio'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: timePicker(context, _timeEnd, 'Hora de fin'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            CustomText(
              'Agregar comentario',
              style: CustomTextStyles.customTextStylePoppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            //text area comment
            TextFormField(
              controller: _comment,
              maxLines: 5,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.lightScaffoldBackgroundColor,
                hintText: 'Escribe un comentario',
                labelText: 'Comentario',
                hintStyle: const TextStyle(color: Colors.grey),
                labelStyle: const TextStyle(color: Colors.grey),
                // border only bottom
                border: const UnderlineInputBorder(),
                // border all side
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
              ),
            ),

            const SizedBox(height: 10),
            CustomTextField(
              controller: _username,
              hintText: 'Nombre',
              labelText: 'Nombre',
              prefixIcon: Icon(
                Icons.person_outline,
                color: AppColors.gray,
                size: 20,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingrese un nombre';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: Consumer<ScheduleProvider>(
                builder: (context, scheduleService, child) => ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final date = DateTime.parse(_date.text);
                        if (widget.field.id != null) {
                          if (!scheduleService.checkIfRepeated(
                              widget.field.id!, date)) {
                            final weatherProvider =
                                Provider.of<WeatherProvider>(context,
                                    listen: false);

                            scheduleService.createItem(ScheduleModel(
                                fieldName: widget.field.name ?? 'Campo',
                                fieldId: widget.field.id!,
                                username: _username.text,
                                rainProbability: _rainProb.text,
                                date: date));
                            weatherProvider.setRaingProb('');
                            context.go('/dashboard');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Ya existe una cita en esta fecha')));
                          }
                        }
                      }
                    },
                    child: const Text('Reservar')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
