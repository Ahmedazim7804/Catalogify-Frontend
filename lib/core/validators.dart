class Validators {
  static String? titleValidator(String? value) {
    if (value == null) {
      return "Null";
    }

    return null;
  }

  static String? priceValidator(String? value) {
    if (value == null || int.tryParse(value) == null) {
      return "Null";
    }

    if (int.parse(value) < 0) {
      return "Price cannot be negative";
    }

    return null;
  }

  static String? descValidator(String? value) {
    if (value == null) {
      return "Null";
    }

    if (value.length < 50) {
      return "Please fill proper description.";
    }

    return null;
  }

  static String? brandValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Null";
    }

    return null;
  }

  static String? warrantyValidator(String? value) {
    if (value == null || int.tryParse(value) == null) {
      return "Null";
    }

    if (int.parse(value) < 0) {
      return "Warranty Months cannot be negative";
    }

    return null;
  }

  static String? returnPeriodValidator(String? value) {
    if (value == null || int.tryParse(value) == null) {
      return "Null";
    }

    if (int.parse(value) < 0) {
      return "Return Period cannot be negative";
    }

    return null;
  }

  static String? locationValidator(String? value) {
    if (value == null || int.tryParse(value) == null) {
      return "Null";
    }

    if (int.parse(value) < 0) {
      return "Return Period cannot be negative";
    }

    return null;
  }
}
