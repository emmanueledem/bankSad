class StringFormat {
  formatAmount(value) {
    return value.replaceAll(RegExp('[^A-Za-z0-9]'), '');
  }
}
