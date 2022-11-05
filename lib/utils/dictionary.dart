import 'package:get/get.dart';

class Dictionary extends Translations {
  Map<String, Map<String, String>> map = {
    "en": {"aa": "bb"}
  };

  @override
  Map<String, Map<String, String>> get keys => map;
}

