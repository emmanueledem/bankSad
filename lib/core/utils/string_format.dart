class StringFormat {
  formatAmount(value) {
    return int.parse(value.replaceAll(',', ''));
  }
}
