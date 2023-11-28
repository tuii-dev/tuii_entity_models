import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:tuiientitymodels/files/auth/domain/entities/user.dart';

import 'package:tuiicore/core/enums/tuii_role_type.dart';

class SystemConfigModel extends Equatable {
  final AppLinksConfigModel? appLinks;
  final VersioningConfigModel? versioning;
  final ZoomConfigModel? zoomConfig;
  final PlatformRatesConfigModel? platformRates;
  final List<String>? platformCountries;
  final AdministrationModel? administration;
  final PayoutCadenceModel? payoutCadence;
  final ConstraintsModel? constraints;

  const SystemConfigModel({
    this.appLinks,
    this.versioning,
    this.zoomConfig,
    this.platformRates,
    this.platformCountries,
    this.administration,
    this.payoutCadence,
    this.constraints,
  });

  SystemConfigModel copyWith({
    AppLinksConfigModel? appLinks,
    VersioningConfigModel? versioning,
    ZoomConfigModel? zoomConfig,
    PlatformRatesConfigModel? platformRates,
    List<String>? platformCountries,
    AdministrationModel? administration,
    PayoutCadenceModel? payoutCadence,
    ConstraintsModel? constraints,
  }) {
    return SystemConfigModel(
      appLinks: appLinks ?? this.appLinks,
      versioning: versioning ?? this.versioning,
      zoomConfig: zoomConfig ?? this.zoomConfig,
      platformRates: platformRates ?? this.platformRates,
      platformCountries: platformCountries ?? this.platformCountries,
      administration: administration ?? this.administration,
      payoutCadence: payoutCadence ?? this.payoutCadence,
      constraints: constraints ?? this.constraints,
    );
  }

  @override
  List<Object?> get props => [
        appLinks,
        versioning,
        zoomConfig,
        platformRates,
        administration,
        payoutCadence,
        constraints,
      ];

  Map<String, dynamic> toMap() {
    return {
      'appLinks': appLinks?.toMap(),
      'versioning': versioning?.toMap(),
      'zoomConfig': zoomConfig?.toMap(),
      'platformRates': platformRates?.toMap(),
      'platformCountries': platformCountries,
      'administration': administration?.toMap(),
      'payoutCadence': payoutCadence?.toMap(),
      'constraints': constraints?.toMap(),
    };
  }

  factory SystemConfigModel.fromMap(Map<String, dynamic> map) {
    return SystemConfigModel(
      appLinks: map['appLinks'] != null
          ? AppLinksConfigModel.fromMap(map['appLinks'])
          : null,
      versioning: map['versioning'] != null
          ? VersioningConfigModel.fromMap(map['versioning'])
          : null,
      zoomConfig: map['zoomConfig'] != null
          ? ZoomConfigModel.fromMap(map['zoomConfig'])
          : null,
      platformRates: map['platformRates'] != null
          ? PlatformRatesConfigModel.fromMap(map['platformRates'])
          : null,
      platformCountries: List<String>.from(map['platformCountries']),
      administration: map['administration'] != null
          ? AdministrationModel.fromMap(map['administration'])
          : null,
      payoutCadence: map['payoutCadence'] != null
          ? PayoutCadenceModel.fromMap(map['payoutCadence'])
          : null,
      constraints: map['constraints'] != null
          ? ConstraintsModel.fromMap(map['constraints'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SystemConfigModel.fromJson(String source) =>
      SystemConfigModel.fromMap(json.decode(source));
}

class AdministrationModel extends Equatable {
  final String? supportEmailAddress;
  final String? termsAndConditionsUrl;
  final String? privacyPolicyUrl;
  final String? paymentTermsUrl;
  final String? paymentFeesUrl;

  const AdministrationModel({
    this.supportEmailAddress,
    this.termsAndConditionsUrl,
    this.privacyPolicyUrl,
    this.paymentTermsUrl,
    this.paymentFeesUrl,
  });

  AdministrationModel copyWith({
    String? supportEmailAddress,
    String? termsAndConditionsUrl,
    String? privacyPolicyUrl,
    String? paymentTermsUrl,
    String? paymentFeesUrl,
  }) {
    return AdministrationModel(
      supportEmailAddress: supportEmailAddress ?? this.supportEmailAddress,
      termsAndConditionsUrl:
          termsAndConditionsUrl ?? this.termsAndConditionsUrl,
      privacyPolicyUrl: privacyPolicyUrl ?? this.privacyPolicyUrl,
      paymentTermsUrl: paymentTermsUrl ?? this.paymentTermsUrl,
      paymentFeesUrl: paymentFeesUrl ?? this.paymentFeesUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'supportEmailAddress': supportEmailAddress,
      'termsAndConditionsUrl': termsAndConditionsUrl,
      'privacyPolicyUrl': privacyPolicyUrl,
      'paymentTermsUrl': paymentTermsUrl,
      'paymentFeesUrl': paymentFeesUrl,
    };
  }

  factory AdministrationModel.fromMap(Map<String, dynamic> map) {
    return AdministrationModel(
      supportEmailAddress: map['supportEmailAddress'],
      termsAndConditionsUrl: map['termsAndConditionsUrl'],
      privacyPolicyUrl: map['privacyPolicyUrl'],
      paymentTermsUrl: map['paymentTermsUrl'],
      paymentFeesUrl: map['paymentFeesUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AdministrationModel.fromJson(String source) =>
      AdministrationModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AdministrationModel(supportEmailAddress: $supportEmailAddress, termsAndConditionsUrl: $termsAndConditionsUrl, privacyPolicyUrl: $privacyPolicyUrl)';

  @override
  List<Object?> get props => [
        supportEmailAddress,
        termsAndConditionsUrl,
        privacyPolicyUrl,
        paymentTermsUrl,
        paymentFeesUrl,
      ];
}

class VersioningConfigModel extends Equatable {
  final String? app;
  final String? live;
  final String? beta;
  final String? alpha;
  final String? dev;

  const VersioningConfigModel({
    this.app,
    this.live,
    this.beta,
    this.alpha,
    this.dev,
  });

  VersioningConfigModel copyWith({
    String? app,
    String? live,
    String? beta,
    String? alpha,
    String? dev,
  }) {
    return VersioningConfigModel(
      app: app ?? this.app,
      live: live ?? this.live,
      beta: beta ?? this.beta,
      alpha: alpha ?? this.alpha,
      dev: dev ?? this.dev,
    );
  }

  @override
  List<Object?> get props => [app, live, beta, alpha, dev];

  Map<String, dynamic> toMap() {
    return {
      'app': app,
      'live': live,
      'beta': beta,
      'alpha': alpha,
      'dev': dev,
    };
  }

  factory VersioningConfigModel.fromMap(Map<String, dynamic> map) {
    return VersioningConfigModel(
      app: map['app'],
      live: map['live'],
      beta: map['beta'],
      alpha: map['alpha'],
      dev: map['dev'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VersioningConfigModel.fromJson(String source) =>
      VersioningConfigModel.fromMap(json.decode(source));
}

class AppLinksConfigModel extends Equatable {
  final String appUrl;
  final String key;
  const AppLinksConfigModel({
    required this.appUrl,
    required this.key,
  });

  AppLinksConfigModel copyWith({
    String? appUrl,
    String? key,
  }) {
    return AppLinksConfigModel(
      appUrl: appUrl ?? this.appUrl,
      key: key ?? this.key,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appUrl': appUrl,
      'key': key,
    };
  }

  factory AppLinksConfigModel.fromMap(Map<String, dynamic> map) {
    return AppLinksConfigModel(
      appUrl: map['appUrl'] ?? '',
      key: map['key'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AppLinksConfigModel.fromJson(String source) =>
      AppLinksConfigModel.fromMap(json.decode(source));

  @override
  String toString() => 'AppLinksConfigModel(appUrl: $appUrl, key: $key)';

  @override
  List<Object> get props => [appUrl, key];
}

class ZoomConfigModel extends Equatable {
  final String publicKey;
  const ZoomConfigModel({
    required this.publicKey,
  });

  ZoomConfigModel copyWith({
    String? publicKey,
  }) {
    return ZoomConfigModel(
      publicKey: publicKey ?? this.publicKey,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'publicKey': publicKey,
    };
  }

  factory ZoomConfigModel.fromMap(Map<String, dynamic> map) {
    return ZoomConfigModel(
      publicKey: map['publicKey'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ZoomConfigModel.fromJson(String source) =>
      ZoomConfigModel.fromMap(json.decode(source));

  @override
  String toString() => 'ZoomConfigModel(publicKey: $publicKey)';

  @override
  List<Object> get props => [publicKey];
}

class PlatformRatesConfigModel extends Equatable {
  final PlatformRatesModel? standard;
  final PlatformRatesModel? discounted;

  const PlatformRatesConfigModel({
    this.standard,
    this.discounted,
  });

  PlatformRatesModel getRatesForTutor(User user) {
    if (user.roleType == TuiiRoleType.tutor) {
      if (user.discountingState != null) {
        final now = DateTime.now();
        final expiry = user.discountingState!.expiryDate;
        if (expiry != null && expiry.difference(now).inDays > 0) {
          return discounted!;
        }
      }
    }

    return standard!;
  }

  PlatformRatesConfigModel copyWith({
    PlatformRatesModel? standard,
    PlatformRatesModel? discounted,
  }) {
    return PlatformRatesConfigModel(
      standard: standard ?? this.standard,
      discounted: discounted ?? this.discounted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'standard': standard?.toMap(),
      'discounted': discounted?.toMap(),
    };
  }

  factory PlatformRatesConfigModel.fromMap(Map<String, dynamic> map) {
    return PlatformRatesConfigModel(
      standard: map['standard'] != null
          ? PlatformRatesModel.fromMap(map['standard'])
          : null,
      discounted: map['discounted'] != null
          ? PlatformRatesModel.fromMap(map['discounted'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlatformRatesConfigModel.fromJson(String source) =>
      PlatformRatesConfigModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'PlatformRatesModel(standard: $standard, discounted: $discounted)';

  @override
  List<Object?> get props => [standard, discounted];
}

class PlatformRatesModel extends Equatable {
  final double? percentage;
  final double? transactionFee;
  final bool? discounted;

  const PlatformRatesModel({
    this.percentage,
    this.transactionFee,
    this.discounted,
  });

  PlatformRatesModel copyWith({
    double? percentage,
    double? transactionFee,
    bool? discounted,
  }) {
    return PlatformRatesModel(
      percentage: percentage ?? this.percentage,
      transactionFee: transactionFee ?? this.transactionFee,
      discounted: discounted ?? this.discounted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'percentage': percentage,
      'transactionFee': transactionFee,
      'discounted': discounted ?? false,
    };
  }

  factory PlatformRatesModel.fromMap(Map<String, dynamic> map) {
    return PlatformRatesModel(
      percentage: map['percentage']?.toDouble(),
      transactionFee: map['transactionFee']?.toDouble(),
      discounted: map['discounted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlatformRatesModel.fromJson(String source) =>
      PlatformRatesModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'PlatformRatesModel(percentage: $percentage, transactionFee: $transactionFee)';

  @override
  List<Object?> get props => [percentage, transactionFee, discounted];
}

class PayoutCadenceModel extends Equatable {
  final int? defaultInDays;
  final int? defaultMaxAttempts;
  final List<RegionalPayoutCadenceModel>? regions;

  const PayoutCadenceModel({
    this.defaultInDays,
    this.defaultMaxAttempts,
    this.regions,
  });

  int getPayoutCadence(String? countryCode) {
    if (countryCode != null && regions != null && regions!.isNotEmpty) {
      int index = regions!.indexWhere(
          (r) => r.countryCode!.toUpperCase() == countryCode.toUpperCase());
      if (index > -1) {
        return regions![index].payoutCadenceInDays ?? 3;
      }
    }

    return defaultInDays ?? 3;
  }

  int getMaxAttempts(String? countryCode) {
    if (countryCode != null && regions != null && regions!.isNotEmpty) {
      int index = regions!.indexWhere(
          (r) => r.countryCode!.toUpperCase() == countryCode.toUpperCase());
      if (index > -1) {
        return regions![index].maxAttempts ?? 12;
      }
    }

    return defaultInDays ?? 3;
  }

  PayoutCadenceModel copyWith({
    int? defaultInDays,
    int? defaultMaxAttempts,
    List<RegionalPayoutCadenceModel>? regions,
  }) {
    return PayoutCadenceModel(
      defaultInDays: defaultInDays ?? this.defaultInDays,
      defaultMaxAttempts: defaultMaxAttempts ?? this.defaultMaxAttempts,
      regions: regions ?? this.regions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'defaultInDays': defaultInDays,
      'defaultMaxAttempts': defaultMaxAttempts,
      'regions': regions?.map((x) => x.toMap()).toList(),
    };
  }

  factory PayoutCadenceModel.fromMap(Map<String, dynamic> map) {
    return PayoutCadenceModel(
      defaultInDays: map['defaultInDays']?.toInt(),
      defaultMaxAttempts: map['defaultMaxAttempts']?.toInt(),
      regions: map['regions'] != null
          ? List<RegionalPayoutCadenceModel>.from(
              map['regions']?.map((x) => RegionalPayoutCadenceModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PayoutCadenceModel.fromJson(String source) =>
      PayoutCadenceModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'PayoutCadenceModel(defaultInDays: $defaultInDays, defaultMaxAttempts: $defaultMaxAttempts, regions: $regions)';

  @override
  List<Object?> get props => [defaultInDays, defaultMaxAttempts, regions];
}

class RegionalPayoutCadenceModel extends Equatable {
  final String? countryCode;
  final int? payoutCadenceInDays;
  final int? maxAttempts;
  const RegionalPayoutCadenceModel({
    this.countryCode,
    this.payoutCadenceInDays,
    this.maxAttempts,
  });

  RegionalPayoutCadenceModel copyWith({
    String? countryCode,
    int? payoutCadenceInDays,
    int? maxAttempts,
  }) {
    return RegionalPayoutCadenceModel(
      countryCode: countryCode ?? this.countryCode,
      payoutCadenceInDays: payoutCadenceInDays ?? this.payoutCadenceInDays,
      maxAttempts: maxAttempts ?? this.maxAttempts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'countryCode': countryCode,
      'payoutCadenceInDays': payoutCadenceInDays,
      'maxAttempts': maxAttempts,
    };
  }

  factory RegionalPayoutCadenceModel.fromMap(Map<String, dynamic> map) {
    return RegionalPayoutCadenceModel(
      countryCode: map['countryCode'],
      payoutCadenceInDays: map['payoutCadenceInDays']?.toInt() ?? 0,
      maxAttempts: map['maxAttempts']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegionalPayoutCadenceModel.fromJson(String source) =>
      RegionalPayoutCadenceModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'RegionalPayoutCadenceModel(countryCode: $countryCode, payoutCadenceInDays: $payoutCadenceInDays, maxAttempts: $maxAttempts)';

  @override
  List<Object?> get props => [countryCode, payoutCadenceInDays, maxAttempts];
}

class ConstraintsModel extends Equatable {
  final double? maxValueAdditionalCosts;

  const ConstraintsModel({
    this.maxValueAdditionalCosts,
  });

  ConstraintsModel copyWith({
    double? maxValueAdditionalCosts,
  }) {
    return ConstraintsModel(
      maxValueAdditionalCosts:
          maxValueAdditionalCosts ?? this.maxValueAdditionalCosts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'maxValueAdditionalCosts': maxValueAdditionalCosts,
    };
  }

  factory ConstraintsModel.fromMap(Map<String, dynamic> map) {
    return ConstraintsModel(
      maxValueAdditionalCosts: map['maxValueAdditionalCosts']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConstraintsModel.fromJson(String source) =>
      ConstraintsModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ConstraintsModel(maxValueAdditionalCosts: $maxValueAdditionalCosts)';

  @override
  List<Object?> get props => [maxValueAdditionalCosts];
}
