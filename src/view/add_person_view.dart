
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../controllers/person_controller.dart';
import '../widgets/custom_scaffold.dart';

class AddPersonView extends StatelessWidget {
  static final _formKey = GlobalKey<FormBuilderState>();
  final controller = Get.find<PersonController>();



  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(title: Text('New person')),
      child : Padding( padding: EdgeInsets.all(16), child:Column(
        children : [
          Text("Add a person's birthday !"),
          Expanded( child :FormBuilder(
            key: _formKey,
            child : SingleChildScrollView(
              child: Column(
                children : [
                FormBuilderTextField(
                  name: 'name',
                  decoration: InputDecoration(labelText: 'Name'),
                  autovalidateMode: AutovalidateMode.always,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      
                    ],
                  ),
                ),
                FormBuilderTextField(
                  name: 'day',
                  decoration: InputDecoration(labelText: 'Day'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.min(1),
                      FormBuilderValidators.max(31),
                    ],
                  ),
                ),
                FormBuilderTextField(
                  name: 'month',
                  decoration: InputDecoration(labelText: 'Month'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.min(1),
                      FormBuilderValidators.max(12),
                    ],
                  ),
                ),
                FormBuilderTextField(
                  name: 'year',
                  decoration: InputDecoration(labelText: 'Year'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.min(1900),
                    ],
                  ),
                ),
                FormBuilderDropdown<String>(
                  name: 'category',
                  decoration: InputDecoration(labelText: 'Category'),
                  items: ['Family', 'Friends', 'Work']
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          
                          ))
                      .toList(),
                  validator: FormBuilderValidators.required(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        final formData = _formKey.currentState!.value;
                        controller.addPerson(
                          formData['name'],
                          int.parse(formData['day']),
                          int.parse(formData['month']),
                          int.parse(formData['year']),
                          formData['category'],
                        );
                        _formKey.currentState!.reset();
                      } 

                      },
                      child: Text('Add Person'),
                ),
                )




                
              ]
              )
              )
          ),
          )
        ]
      )
      )
    );
  }
}

