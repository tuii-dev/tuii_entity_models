import 'dart:convert';

import 'package:equatable/equatable.dart';

class StripeExternalAccountModel extends Equatable {
  final String? id;
  final String? account;
  final String? type;
  final String? accountHolderName;
  final String? accountHolderType;
  final String? accountType;
  final List<String>? availablePayoutMethods;
  final String? bankName;
  final String? country;
  final String? currency;
  final String? last4;
  final String? routingNumber;
  final String? status;

  const StripeExternalAccountModel({
    this.id,
    this.account,
    this.type,
    this.accountHolderName,
    this.accountHolderType,
    this.accountType,
    this.availablePayoutMethods,
    this.bankName,
    this.country,
    this.currency,
    this.last4,
    this.routingNumber,
    this.status,
  });

  StripeExternalAccountModel copyWith({
    String? id,
    String? account,
    String? type,
    String? accountHolderName,
    String? accountHolderType,
    String? accountType,
    List<String>? availablePayoutMethods,
    String? bankName,
    String? country,
    String? currency,
    String? last4,
    String? routingNumber,
    String? status,
  }) {
    return StripeExternalAccountModel(
      id: id ?? this.id,
      account: account ?? this.account,
      type: type ?? this.type,
      accountHolderName: accountHolderName ?? this.accountHolderName,
      accountHolderType: accountHolderType ?? this.accountHolderType,
      accountType: accountType ?? this.accountType,
      availablePayoutMethods:
          availablePayoutMethods ?? this.availablePayoutMethods,
      bankName: bankName ?? this.bankName,
      country: country ?? this.country,
      currency: currency ?? this.currency,
      last4: last4 ?? this.last4,
      routingNumber: routingNumber ?? this.routingNumber,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'account': account,
      'type': type,
      'accountHolderName': accountHolderName,
      'accountHolderType': accountHolderType,
      'accountType': accountType,
      'availablePayoutMethods': availablePayoutMethods,
      'bankName': bankName,
      'country': country,
      'currency': currency,
      'last4': last4,
      'routingNumber': routingNumber,
      'status': status,
    };
  }

  factory StripeExternalAccountModel.fromMap(Map<String, dynamic> map) {
    return StripeExternalAccountModel(
      id: map['id'],
      account: map['account'],
      type: map['type'],
      accountHolderName: map['account_holder_name'],
      accountHolderType: map['account_holder_type'],
      accountType: map['account_type'],
      availablePayoutMethods:
          List<String>.from(map['available_payout_methods']),
      bankName: map['bank_name'],
      country: map['country'],
      currency: map['currency'],
      last4: map['last4'],
      routingNumber: map['routing_number'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StripeExternalAccountModel.fromJson(String source) =>
      StripeExternalAccountModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StripeExternalAccountModel(id: $id, accountId: $account, type: $type, accountHolderName: $accountHolderName, accountHolderType: $accountHolderType, accountType: $accountType, availablePayoutMethods: $availablePayoutMethods, bankName: $bankName, country: $country, currency: $currency, last4: $last4, routingNumber: $routingNumber, status: $status)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      account,
      type,
      accountHolderName,
      accountHolderType,
      accountType,
      availablePayoutMethods,
      bankName,
      country,
      currency,
      last4,
      routingNumber,
      status,
    ];
  }
}
