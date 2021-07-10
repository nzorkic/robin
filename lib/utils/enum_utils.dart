class EnumUtils {
  static bool _isValidEnum(enumValue) {
    final enumParts = enumValue.toString().split('.');
    return enumParts.length > 1 &&
        enumParts[0] == enumValue.runtimeType.toString();
  }

  static String asString(dynamic enumValue) {
    assert(enumValue != null);
    assert(_isValidEnum(enumValue),
        '$enumValue of type ${enumValue.runtimeType.toString()} is not a valid enum.');
    return enumValue.toString().split('.')[1];
  }

  static String asCapitalizedString(dynamic enumValue) {
    String strValue = asString(enumValue);
    return '${strValue[0].toUpperCase()}${strValue.substring(1)}';
  }

  static T? fromString<T>(List<T> enumValues, String value) {
    try {
      return enumValues.singleWhere((enumItem) =>
          asString(enumItem).toLowerCase() == value.toLowerCase());
    } on StateError catch (_) {
      return null;
    }
  }
}
