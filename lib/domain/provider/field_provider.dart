import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_agenda/data/models/field_model.dart';

class FieldProvider extends ChangeNotifier {
  FieldModel _selected = FieldModel();
  void selectField(FieldModel field) {
    _selected = field;
    notifyListeners();
  }

  FieldModel get selectedField {
    return _selected;
  }

  final List<FieldModel> _items = [];

  List<FieldModel> get fieldList {
    return _items;
  }

  void fillFieldList(List<FieldModel> items) {
    _items.clear();
    _items.addAll(items);
    notifyListeners();
  }

  Future<void> getFieldsFromJson() async {
    // Here we would get the fields from a json file
    final String response =
        await rootBundle.loadString('assets/json/mock_field.json');

    List<FieldModel> fields = (json.decode(response) as List)
        .map((data) => FieldModel.fromJson(data))
        .toList();
    fillFieldList(fields);
  }
}
