import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FormHookType {
  ValueNotifier<Map> form;
  Function(String key, String value) updateForm;
}

FormHookType useForm(Map initialValue) {
  final form = useState(initialValue);

  updateForm(String key, String value) {
    form.value[key] = value;
  }

  FormHookType formObj =
      {"form": form, "updateForm": updateForm} as FormHookType;

  return formObj;
}
