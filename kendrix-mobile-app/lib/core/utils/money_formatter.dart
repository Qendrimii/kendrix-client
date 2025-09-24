import 'package:intl/intl.dart';

class MoneyFormatter {
  static const String defaultCurrency = 'EUR';
  static const String defaultLocale = 'en_US';

  static String format(
    double amount, {
    String currency = defaultCurrency,
    String locale = defaultLocale,
    int decimalDigits = 2,
  }) {
    final formatter = NumberFormat.currency(
      locale: locale,
      symbol: _getCurrencySymbol(currency),
      decimalDigits: decimalDigits,
    );
    return formatter.format(amount);
  }

  static String formatCompact(
    double amount, {
    String currency = defaultCurrency,
    String locale = defaultLocale,
  }) {
    final formatter = NumberFormat.compactCurrency(
      locale: locale,
      symbol: _getCurrencySymbol(currency),
    );
    return formatter.format(amount);
  }

  static String formatWithoutSymbol(
    double amount, {
    String locale = defaultLocale,
    int decimalDigits = 2,
  }) {
    final formatter = NumberFormat('#,##0.${'0' * decimalDigits}', locale);
    return formatter.format(amount);
  }

  static String formatPercentage(
    double value, {
    String locale = defaultLocale,
    int decimalDigits = 1,
  }) {
    final formatter = NumberFormat.percentPattern(locale);
    formatter.maximumFractionDigits = decimalDigits;
    return formatter.format(value);
  }

  static double? parseAmount(String text) {
    if (text.isEmpty) return null;
    
    // Remove currency symbols and spaces
    final cleanText = text
        .replaceAll(RegExp(r'[€$£¥₿,\s]'), '')
        .replaceAll(',', '.');
    
    return double.tryParse(cleanText);
  }

  static String _getCurrencySymbol(String currency) {
    switch (currency.toUpperCase()) {
      case 'EUR':
        return '€';
      case 'USD':
        return '\$';
      case 'GBP':
        return '£';
      case 'JPY':
        return '¥';
      case 'ALL':
        return 'L';
      default:
        return currency;
    }
  }

  static String formatDifference(
    double current,
    double previous, {
    String currency = defaultCurrency,
    bool showPercentage = true,
  }) {
    final difference = current - previous;
    final percentage = previous != 0 ? (difference / previous) * 100 : 0.0;
    
    final sign = difference >= 0 ? '+' : '';
    final formattedAmount = format(difference.abs(), currency: currency);
    
    if (showPercentage) {
      final formattedPercentage = formatPercentage(percentage.abs() / 100);
      return '$sign$formattedAmount ($formattedPercentage)';
    } else {
      return '$sign$formattedAmount';
    }
  }

  static bool isPositive(double amount) => amount > 0;
  static bool isNegative(double amount) => amount < 0;
  static bool isZero(double amount) => amount == 0;

  static double roundToDecimalPlaces(double amount, int places) {
    final factor = pow(10, places);
    return (amount * factor).round() / factor;
  }
}

// Extension for easier money formatting
extension MoneyExtension on double {
  String toMoney({
    String currency = MoneyFormatter.defaultCurrency,
    String locale = MoneyFormatter.defaultLocale,
    int decimalDigits = 2,
  }) {
    return MoneyFormatter.format(
      this,
      currency: currency,
      locale: locale,
      decimalDigits: decimalDigits,
    );
  }

  String toCompactMoney({
    String currency = MoneyFormatter.defaultCurrency,
    String locale = MoneyFormatter.defaultLocale,
  }) {
    return MoneyFormatter.formatCompact(
      this,
      currency: currency,
      locale: locale,
    );
  }

  String toPercentage({
    String locale = MoneyFormatter.defaultLocale,
    int decimalDigits = 1,
  }) {
    return MoneyFormatter.formatPercentage(
      this,
      locale: locale,
      decimalDigits: decimalDigits,
    );
  }
}

import 'dart:math';