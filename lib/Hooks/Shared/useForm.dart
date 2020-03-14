import 'package:flutter_hooks/flutter_hooks.dart';

dynamic useForm(Map initialValue) {
  final form = useState(initialValue);

  updateForm(String key, String value) {
    form.value[key] = value;
  }

  Map formObj = {"form": form, "updateForm": updateForm};

  return formObj;
}
