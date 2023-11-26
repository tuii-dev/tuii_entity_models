import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/auth/data/models/stripe_external_account_model.dart';
import 'package:tuii_entity_models/src/auth/data/models/stripe_payout_configuration_model.dart';

class StripeAccountDetailsModel extends Equatable {
  final String? id;
  final String? businessType;
  final Map<String, String>? capabilities;
  final String? structure;
  final bool? taxIdProvided;
  final String? country;
  final DateTime? created;
  final String? defaultCurrency;
  final bool? detailsSubmitted;
  final String? email;
  final List<StripeExternalAccountModel>? externalAccounts;
  final bool? payoutsEnabled;
  final StripePayoutConfigurationModel? payouts;

  const StripeAccountDetailsModel({
    this.id,
    this.businessType,
    this.capabilities,
    this.structure,
    this.taxIdProvided,
    this.country,
    this.created,
    this.defaultCurrency,
    this.detailsSubmitted,
    this.email,
    this.externalAccounts,
    this.payoutsEnabled,
    this.payouts,
  });

  StripeAccountDetailsModel copyWith({
    String? id,
    String? businessType,
    Map<String, String>? capabilities,
    String? structure,
    bool? taxIdProvided,
    String? country,
    DateTime? created,
    String? defaultCurrency,
    bool? detailsSubmitted,
    String? email,
    List<StripeExternalAccountModel>? externalAccounts,
    bool? payoutsEnabled,
    StripePayoutConfigurationModel? payouts,
  }) {
    return StripeAccountDetailsModel(
      id: id ?? this.id,
      businessType: businessType ?? this.businessType,
      capabilities: capabilities ?? this.capabilities,
      structure: structure ?? this.structure,
      taxIdProvided: taxIdProvided ?? this.taxIdProvided,
      country: country ?? this.country,
      created: created ?? this.created,
      defaultCurrency: defaultCurrency ?? this.defaultCurrency,
      detailsSubmitted: detailsSubmitted ?? this.detailsSubmitted,
      email: email ?? this.email,
      externalAccounts: externalAccounts ?? this.externalAccounts,
      payoutsEnabled: payoutsEnabled ?? this.payoutsEnabled,
      payouts: payouts ?? this.payouts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'business_type': businessType,
      'capabilities': capabilities,
      'structure': structure,
      'tax_id_provided': taxIdProvided,
      'country': country,
      'created': created?.toUtc().millisecondsSinceEpoch,
      'default_currency': defaultCurrency,
      'details_submitted': detailsSubmitted,
      'email': email,
      'external_accounts': externalAccounts?.map((x) => x.toMap()).toList(),
      'payouts_enabled': payoutsEnabled,
      'payouts': payouts?.toMap(),
    };
  }

  factory StripeAccountDetailsModel.fromMap(Map<String, dynamic> map) {
    return StripeAccountDetailsModel(
      id: map['id'],
      businessType: map['business_type'],
      capabilities: Map<String, String>.from(map['capabilities']),
      structure: map['structure'],
      taxIdProvided: map['tax_id_provided'],
      country: map['country'],
      created: map['created'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created'] * 1000).toLocal()
          : null,
      defaultCurrency: map['default_currency'],
      detailsSubmitted: map['details_submitted'],
      email: map['email'],
      externalAccounts: map['external_accounts'] != null
          ? List<StripeExternalAccountModel>.from(map['external_accounts']
              ?.map((x) => StripeExternalAccountModel.fromMap(x)))
          : null,
      payoutsEnabled: map['payouts_enabled'],
      payouts: map['payouts'] != null
          ? StripePayoutConfigurationModel.fromMap(map['payouts'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StripeAccountDetailsModel.fromJson(String source) =>
      StripeAccountDetailsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StipeAccountModel(id: $id, businessType: $businessType, capabilities: $capabilities, structure: $structure, taxIdProvided: $taxIdProvided, country: $country, created: $created, defaultCurrency: $defaultCurrency, detailsSubmitted: $detailsSubmitted, email: $email, externalAccounts: $externalAccounts, payoutsEnabled: $payoutsEnabled, payouts: $payouts)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      businessType,
      capabilities,
      structure,
      taxIdProvided,
      country,
      created,
      defaultCurrency,
      detailsSubmitted,
      email,
      externalAccounts,
      payoutsEnabled,
      payouts,
    ];
  }
}
