import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tuiientitymodels/files/auth/data/models/lesson_booking_state_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/onboarding_state_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/parent_child_connection_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/tutor_availability_day_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/tutor_unavailability_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/user_discounting_state_model.dart';
import 'package:tuiientitymodels/files/classroom/data/models/subject_model.dart';

import 'package:tuiicore/core/enums/enums.dart';
import 'package:tuiicore/core/enums/payout_cadence_type.dart';
import 'package:tuiicore/core/models/lesson_configuration.dart';

class UserModel extends Equatable {
  final String? id;
  final String email;
  final String? phoneNumber;
  final bool? emailVerified;
  final bool? phoneVerified;
  final bool? mfaOn;
  final TuiiRoleType? roleType;
  final bool? hasCustodian;
  final String? custodianId;
  final String? custodianSecurityCode;
  final String? custodianFirstName;
  final String? custodianLastName;
  final String? custodianProfileImageUrl;
  final List<ParentChildConnectionModel>? custodianConnections;
  final bool? forceCustodianPinCheck;
  final DateTime? creationTimestamp;
  final DateTime? dateOfBirth;
  final int? birthYear;
  final String? firstName;
  final String? lastName;
  final String? bio;
  final String? address;
  final String? welcomeMessage;
  final String? profileImageUrl;
  final String? provider;
  final int? age;
  final bool? userHasConfirmedLegalAge;
  final bool? onboarded;
  final double? profilePercentageComplete;
  final bool isSignUp;
  final EnrollmentStatusType? enrollmentStatus;
  final List<LessonConfiguration>? lessonConfiguration;
  final List<SubjectModel>? userSubjects;
  final List<TutorDayAvailabilityModel>? availabilitySchedule;
  final TutorUnavailabilityModel? unavailabilitySchedule;
  final bool? isZoomSetUpComplete;
  final bool? isStripeSetUpComplete;
  final bool? areStripePayoutsEnabled;
  final String? stripeCustomerId;
  final String? stripeAccountId;
  final String? stripeAccountDashboardUrl;
  final double? standardHourlyRate;
  final OnboardingStateModel? onboardingState;
  final List<String>? searchTerms;
  final String? domain;
  // final ZoomTokenModel? zoomToken;
  final String? zoomAccessToken;
  final String? zoomMeetingUrl;
  final String? firebaseToken;
  final DateTime? lastUpdateDate;

  // Multifactor Auth
  final MultiFactor? multiFactor;

  // Tutor Studio
  final String? studioName;
  final String? studioImageUrl;

  // Tutor Lesson Booking Dialog State Stuff
  final List<LessonBookingStateModel>? lessonBookingState;

  // New Stripe Stuff
  final UserDiscountingStateModel? discountingState;
  final double? taxableRate;
  final String? taxLabel;
  final String? countryCode;
  final String? currencyCode;
  final bool? isConnected;

  final PayoutCadenceType? payoutCadence;
  final DateTime? lastPayoutDate;

  // Tutor Business Details Stuff
  final bool? hasStudioPolicy;
  final String? studioPolicyUrl;
  final String? studioPolicyName;
  final String? studioPolicyHash;
  final bool? acceptedWwccObligation;
  final DateTime? wwccObligationDate;
  final bool? agreedToPaymentTerms;
  final bool? agreedToPaymentFees;

  final bool isEmpty;
  const UserModel({
    this.id,
    required this.email,
    this.phoneNumber,
    this.emailVerified,
    this.phoneVerified,
    this.mfaOn,
    this.roleType,
    this.hasCustodian,
    this.custodianId,
    this.custodianSecurityCode,
    this.custodianFirstName,
    this.custodianLastName,
    this.custodianProfileImageUrl,
    this.custodianConnections,
    this.forceCustodianPinCheck = false,
    this.creationTimestamp,
    this.dateOfBirth,
    this.birthYear,
    this.firstName,
    this.lastName,
    this.bio,
    this.address,
    this.welcomeMessage,
    this.profileImageUrl,
    this.provider,
    this.age,
    this.userHasConfirmedLegalAge,
    this.onboarded,
    this.profilePercentageComplete,
    this.enrollmentStatus,
    this.lessonConfiguration,
    this.userSubjects,
    this.availabilitySchedule,
    this.unavailabilitySchedule,
    this.isZoomSetUpComplete = false,
    this.isStripeSetUpComplete = false,
    this.areStripePayoutsEnabled = false,
    this.stripeCustomerId,
    this.stripeAccountId,
    this.stripeAccountDashboardUrl,
    this.standardHourlyRate,
    this.onboardingState,
    this.searchTerms,
    this.domain,
    // this.zoomToken,
    this.zoomAccessToken,
    this.zoomMeetingUrl,
    this.firebaseToken,
    this.lastUpdateDate,
    this.multiFactor,
    this.studioName,
    this.studioImageUrl,
    this.lessonBookingState,
    this.discountingState,
    this.taxableRate,
    this.taxLabel,
    this.countryCode,
    this.currencyCode,
    this.isConnected,
    this.payoutCadence,
    this.lastPayoutDate,

    // Tutor Business Details Stuff
    this.hasStudioPolicy,
    this.studioPolicyUrl,
    this.studioPolicyName,
    this.studioPolicyHash,
    this.acceptedWwccObligation,
    this.wwccObligationDate,
    this.agreedToPaymentTerms,
    this.agreedToPaymentFees,
    this.isSignUp = false,
    this.isEmpty = false,
  });

  @override
  List<Object?> get props {
    return [
      id,
      email,
      phoneNumber,
      emailVerified,
      phoneVerified,
      mfaOn,
      roleType,
      hasCustodian,
      custodianId,
      custodianSecurityCode,
      custodianFirstName,
      custodianLastName,
      custodianProfileImageUrl,
      custodianConnections,
      forceCustodianPinCheck,
      creationTimestamp,
      dateOfBirth,
      birthYear,
      firstName,
      lastName,
      bio,
      address,
      welcomeMessage,
      profileImageUrl,
      provider,
      age,
      userHasConfirmedLegalAge,
      onboarded,
      profilePercentageComplete,
      enrollmentStatus,
      lessonConfiguration,
      userSubjects,
      availabilitySchedule,
      unavailabilitySchedule,
      isZoomSetUpComplete,
      isStripeSetUpComplete,
      areStripePayoutsEnabled,
      stripeCustomerId,
      stripeAccountId,
      stripeAccountDashboardUrl,
      standardHourlyRate,
      onboardingState,
      searchTerms,
      domain,
      // zoomToken,
      zoomAccessToken,
      zoomMeetingUrl,
      firebaseToken,
      lastUpdateDate,
      multiFactor,
      studioName,
      studioImageUrl,
      lessonBookingState,
      discountingState,
      taxableRate,
      taxLabel,
      countryCode,
      currencyCode,
      isConnected,
      payoutCadence,
      lastPayoutDate,

      // Tutor Business Details Stuff
      hasStudioPolicy,
      studioPolicyUrl,
      studioPolicyName,
      studioPolicyHash,
      acceptedWwccObligation,
      wwccObligationDate,
      agreedToPaymentTerms,
      agreedToPaymentFees,

      isSignUp,
      isEmpty
    ];
  }

  @override
  bool get stringify => true;

  factory UserModel.empty() {
    return const UserModel(
      email: '',
      isEmpty: true,
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.exists) {
      final data = doc.data()!;
      const statusType = EnrollmentStatusType.unknown;
      const roleType = TuiiRoleType.unknown;
      const payoutCadenceType = PayoutCadenceType.unknown;
      return UserModel(
        id: doc.id,
        email: data['email'],
        phoneNumber: data['phoneNumber'],
        emailVerified: data['emailVerified'] ?? false,
        phoneVerified: data['phoneVerified'] ?? false,
        mfaOn: data['mfaOn'] ?? false,
        roleType: roleType.fromMap(data['roleType']),
        hasCustodian: data['hasCustodian'] ?? false,
        custodianId: data['custodianId'],
        custodianSecurityCode: data['custodianSecurityCode'],
        custodianFirstName: data['custodianFirstName'],
        custodianLastName: data['custodianLastName'],
        custodianProfileImageUrl: data['custodianProfileImageUrl'],
        custodianConnections: data['custodianConnections'] != null
            ? List<ParentChildConnectionModel>.from(data['custodianConnections']
                ?.map((x) => ParentChildConnectionModel.fromMap(x)))
            : [],
        forceCustodianPinCheck: data['forceCustodianPinCheck'] ?? false,
        creationTimestamp: data['creationTimestamp'] != null
            ? DateTime.fromMillisecondsSinceEpoch(data['creationTimestamp'])
                .toLocal()
            : null,
        dateOfBirth: data['dateOfBirth'] != null
            ? DateTime.fromMillisecondsSinceEpoch(data['dateOfBirth'])
            : null,
        birthYear: data['birthYear'],
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        bio: data['bio'] ?? '',
        address: data['address'] ?? '',
        welcomeMessage: data['welcomeMessage'] ?? '',
        profileImageUrl: data['profileImageUrl'] ?? '',
        provider: data['provider'] ?? '',
        age: data['age'] ?? 0,
        userHasConfirmedLegalAge: data['userHasConfirmedLegalAge'] ?? false,
        onboarded: data['onboarded'] ?? false,
        profilePercentageComplete: data['profilePercentageComplete'] ?? 0,
        enrollmentStatus: statusType.fromMap(data['enrollmentStatus']),
        lessonConfiguration: data['lessonConfiguration'] != null
            ? List<LessonConfiguration>.from(data['lessonConfiguration']
                ?.map((x) => LessonConfiguration.fromMap(x)))
            : null,
        userSubjects: data['userSubjects'] != null
            ? List<SubjectModel>.from(
                data['userSubjects']?.map((x) => SubjectModel.fromMap(x)))
            : null,
        availabilitySchedule: data['availabilitySchedule'] != null
            ? List<TutorDayAvailabilityModel>.from(data['availabilitySchedule']
                ?.map((x) => TutorDayAvailabilityModel.fromMap(x)))
            : null,
        unavailabilitySchedule: data['unavailabilitySchedule'] != null
            ? TutorUnavailabilityModel.fromMap(data['unavailabilitySchedule'])
            : null,
        isZoomSetUpComplete: data['isZoomSetUpComplete'] ?? false,
        isStripeSetUpComplete: data['isStripeSetUpComplete'] ?? false,
        areStripePayoutsEnabled: data['areStripePayoutsEnabled'] ?? false,
        stripeCustomerId: data['stripeCustomerId'] ?? '',
        stripeAccountId: data['stripeAccountId'] ?? '',
        stripeAccountDashboardUrl: data['stripeAccountDashboardUrl'] ?? '',
        standardHourlyRate: data['standardHourlyRate'],
        onboardingState: data['onboardingState'] != null
            ? OnboardingStateModel.fromMap(data['onboardingState'])
            : null,
        searchTerms: data['searchTerms'] != null
            ? List<String>.from(data['searchTerms'])
            : [],
        domain: data['domain'] ?? '',
        // zoomToken: data['zoomToken'] != null
        //     ? ZoomTokenModel.fromMap(data['zoomToken'])
        //     : null,
        zoomAccessToken: data['zoomAccessToken'] ?? '',
        zoomMeetingUrl: data['zoomMeetingUrl'] ?? '',
        lastUpdateDate: data['lastUpdateDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(data['lastUpdateDate'])
                .toLocal()
            : null,

        studioName: data['studioName'] ?? '',
        studioImageUrl: data['studioImageUrl'] ?? '',
        lessonBookingState: data['lessonBookingState'] != null
            ? List<LessonBookingStateModel>.from(data['lessonBookingState']
                ?.map((x) => LessonBookingStateModel.fromMap(x)))
            : null,
        discountingState: data['discountingState'] != null
            ? UserDiscountingStateModel.fromMap(data['discountingState'])
            : null,
        taxableRate: data['taxableRate'] ?? 0,
        taxLabel: data['taxLabel'] ?? '',
        countryCode: data['countryCode'] ?? 'AU',
        currencyCode: data['currencyCode'] ?? 'AUD',
        isConnected: data['isConnected'] ?? false,
        payoutCadence: data['payoutCadence'] != null
            ? payoutCadenceType.fromMap(data['payoutCadence'])
            : null,
        lastPayoutDate: data['lastPayoutDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(data['lastPayoutDate'])
                .toLocal()
            : null,

        // Tutor Business Details Stuff
        hasStudioPolicy: data['hasStudioPolicy'] ?? false,
        studioPolicyUrl: data['studioPolicyUrl'] ?? '',
        studioPolicyName: data['studioPolicyName'],
        studioPolicyHash: data['studioPolicyHash'],
        acceptedWwccObligation: data['acceptedWwccObligation'] ?? false,
        wwccObligationDate: data['wwccObligationDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(data['wwccObligationDate'])
                .toLocal()
            : null,
        agreedToPaymentTerms: data['agreedToPaymentTerms'] ?? false,
        agreedToPaymentFees: data['agreedToPaymentFees'] ?? false,
      );
    } else {
      return UserModel.empty();
    }
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? phoneNumber,
    bool? emailVerified,
    bool? phoneVerified,
    bool? mfaOn,
    TuiiRoleType? roleType,
    bool? hasCustodian,
    String? custodianId,
    String? custodianSecurityCode,
    String? custodianFirstName,
    String? custodianLastName,
    String? custodianProfileImageUrl,
    List<ParentChildConnectionModel>? custodianConnections,
    bool? forceCustodianPinCheck,
    DateTime? creationTimestamp,
    DateTime? dateOfBirth,
    int? birthYear,
    String? firstName,
    String? lastName,
    String? bio,
    String? address,
    String? welcomeMessage,
    String? profileImageUrl,
    String? provider,
    int? age,
    bool? userHasConfirmedLegalAge,
    bool? onboarded,
    double? profilePercentageComplete,
    EnrollmentStatusType? enrollmentStatus,
    List<LessonConfiguration>? lessonConfiguration,
    List<SubjectModel>? userSubjects,
    List<TutorDayAvailabilityModel>? availabilitySchedule,
    TutorUnavailabilityModel? unavailabilitySchedule,
    bool? isZoomSetUpComplete,
    bool? isStripeSetUpComplete,
    bool? areStripePayoutsEnabled,
    String? stripeCustomerId,
    String? stripeAccountId,
    String? stripeAccountDashboardUrl,
    double? standardHourlyRate,
    OnboardingStateModel? onboardingState,
    List<String>? searchTerms,
    String? domain,
    // ZoomTokenModel? zoomToken,
    String? zoomAccessToken,
    String? zoomMeetingUrl,
    String? firebaseToken,
    DateTime? lastUpdateDate,
    MultiFactor? multiFactor,
    String? studioName,
    String? studioImageUrl,
    List<LessonBookingStateModel>? lessonBookingState,
    UserDiscountingStateModel? discountingState,
    double? taxableRate,
    String? taxLabel,
    String? countryCode,
    String? currencyCode,
    bool? isConnected,
    PayoutCadenceType? payoutCadence,
    DateTime? lastPayoutDate,

    // Tutor Business Details Stuff
    bool? hasStudioPolicy,
    String? studioPolicyUrl,
    String? studioPolicyName,
    String? studioPolicyHash,
    bool? acceptedWwccObligation,
    DateTime? wwccObligationDate,
    bool? agreedToPaymentTerms,
    bool? agreedToPaymentFees,
    bool? isSignUp,
    bool? isEmpty,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailVerified: emailVerified ?? this.emailVerified,
      phoneVerified: phoneVerified ?? this.phoneVerified,
      mfaOn: mfaOn ?? this.mfaOn,
      roleType: roleType ?? this.roleType,
      hasCustodian: hasCustodian ?? this.hasCustodian,
      custodianId: custodianId ?? this.custodianId,
      custodianSecurityCode:
          custodianSecurityCode ?? this.custodianSecurityCode,
      custodianFirstName: custodianFirstName ?? this.custodianFirstName,
      custodianLastName: custodianLastName ?? this.custodianLastName,
      custodianProfileImageUrl:
          custodianProfileImageUrl ?? this.custodianProfileImageUrl,
      custodianConnections: custodianConnections ?? this.custodianConnections,
      forceCustodianPinCheck:
          forceCustodianPinCheck ?? this.forceCustodianPinCheck,
      creationTimestamp: creationTimestamp ?? this.creationTimestamp,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      birthYear: birthYear ?? this.birthYear,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      bio: bio ?? this.bio,
      address: address ?? this.address,
      welcomeMessage: welcomeMessage ?? this.welcomeMessage,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      provider: provider ?? this.provider,
      age: age ?? this.age,
      userHasConfirmedLegalAge:
          userHasConfirmedLegalAge ?? this.userHasConfirmedLegalAge,
      onboarded: onboarded ?? this.onboarded,
      profilePercentageComplete:
          profilePercentageComplete ?? this.profilePercentageComplete,
      enrollmentStatus: enrollmentStatus ?? this.enrollmentStatus,
      lessonConfiguration: lessonConfiguration ?? this.lessonConfiguration,
      userSubjects: userSubjects ?? this.userSubjects,
      availabilitySchedule: availabilitySchedule ?? this.availabilitySchedule,
      unavailabilitySchedule:
          unavailabilitySchedule ?? this.unavailabilitySchedule,
      isSignUp: isSignUp ?? this.isSignUp,
      isZoomSetUpComplete: isZoomSetUpComplete ?? this.isZoomSetUpComplete,
      isStripeSetUpComplete:
          isStripeSetUpComplete ?? this.isStripeSetUpComplete,
      areStripePayoutsEnabled:
          areStripePayoutsEnabled ?? this.areStripePayoutsEnabled,
      stripeCustomerId: stripeCustomerId ?? this.stripeCustomerId,
      stripeAccountId: stripeAccountId ?? this.stripeAccountId,
      stripeAccountDashboardUrl:
          stripeAccountDashboardUrl ?? this.stripeAccountDashboardUrl,
      standardHourlyRate: standardHourlyRate ?? this.standardHourlyRate,
      onboardingState: onboardingState ?? this.onboardingState,
      searchTerms: searchTerms ?? this.searchTerms,
      domain: domain ?? this.domain,
      // zoomToken: zoomToken ?? this.zoomToken,
      zoomAccessToken: zoomAccessToken ?? this.zoomAccessToken,
      zoomMeetingUrl: zoomMeetingUrl ?? this.zoomMeetingUrl,
      firebaseToken: firebaseToken ?? this.firebaseToken,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,
      multiFactor: multiFactor ?? this.multiFactor,
      studioName: studioName ?? this.studioName,
      studioImageUrl: studioImageUrl ?? this.studioImageUrl,

      lessonBookingState: lessonBookingState ?? this.lessonBookingState,
      discountingState: discountingState ?? this.discountingState,
      taxableRate: taxableRate ?? this.taxableRate,
      taxLabel: taxLabel ?? this.taxLabel,
      countryCode: countryCode ?? this.countryCode,
      currencyCode: currencyCode ?? this.currencyCode,
      isConnected: isConnected ?? this.isConnected,
      payoutCadence: payoutCadence ?? this.payoutCadence,

      hasStudioPolicy: hasStudioPolicy ?? this.hasStudioPolicy,
      studioPolicyUrl: studioPolicyUrl ?? this.studioPolicyUrl,
      studioPolicyName: studioPolicyName ?? this.studioPolicyName,
      studioPolicyHash: studioPolicyHash ?? this.studioPolicyHash,
      acceptedWwccObligation:
          acceptedWwccObligation ?? this.acceptedWwccObligation,
      wwccObligationDate: wwccObligationDate ?? this.wwccObligationDate,
      agreedToPaymentTerms: agreedToPaymentTerms ?? this.agreedToPaymentTerms,
      agreedToPaymentFees: agreedToPaymentFees ?? this.agreedToPaymentFees,

      lastPayoutDate: lastPayoutDate ?? this.lastPayoutDate,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phoneNumber': phoneNumber,
      'emailVerified': emailVerified ?? false,
      'phoneVerified': phoneVerified ?? false,
      'mfaOn': mfaOn ?? false,
      'roleType': roleType?.toMap(),
      'hasCustodian': hasCustodian ?? false,
      'custodianId': custodianId,
      'custodianSecurityCode': custodianSecurityCode,
      'custodianFirstName': custodianFirstName,
      'custodianLastName': custodianLastName,
      'custodianProfileImageUrl': custodianProfileImageUrl,
      'custodianConnections':
          custodianConnections?.map((x) => x.toMap()).toList(),
      'forceCustodianPinCheck': forceCustodianPinCheck,
      'creationTimestamp': creationTimestamp?.toUtc().millisecondsSinceEpoch,
      'dateOfBirth': dateOfBirth?.millisecondsSinceEpoch,
      'birthYear': birthYear,
      'firstName': firstName,
      'lastName': lastName,
      'bio': bio,
      'address': address,
      'welcomeMessage': welcomeMessage,
      'profileImageUrl': profileImageUrl,
      'provider': provider,
      'age': age,
      'userHasConfirmedLegalAge': userHasConfirmedLegalAge,
      'onboarded': onboarded,
      'profilePercentageComplete': profilePercentageComplete,
      'isSignUp': isSignUp,
      'enrollmentStatus': enrollmentStatus?.toMap(),
      'lessonConfiguration':
          lessonConfiguration?.map((x) => x.toMap()).toList(),
      'userSubjects': userSubjects?.map((x) => x.toMap()).toList(),
      'availabilitySchedule':
          availabilitySchedule?.map((x) => x.toMap()).toList(),
      'unavailabilitySchedule': unavailabilitySchedule?.toMap(),
      'isZoomSetUpComplete': isZoomSetUpComplete,
      // 'isStripeSetUpComplete': isStripeSetUpComplete,
      // 'stripeCustomerId': stripeCustomerId,
      // 'stripeAccountId': stripeAccountId,
      // 'stripeAccountDashboardUrl': stripeAccountDashboardUrl,
      'standardHourlyRate': standardHourlyRate,
      'onboardingState': onboardingState?.toMap(),
      'searchTerms': searchTerms,
      'domain': domain,
      // 'zoomToken': zoomToken?.toMap(),
      'zoomAccessToken': zoomAccessToken,
      'zoomMeetingUrl': zoomMeetingUrl,
      'lastUpdateDate': lastUpdateDate?.toUtc().millisecondsSinceEpoch,
      'studioName': studioName,
      'studioImageUrl': studioImageUrl,
      'lessonBookingState': lessonBookingState?.map((x) => x.toMap()).toList(),
      // 'discountingState': discountingState?.toMap(),
      'taxableRate': taxableRate ?? 0,
      'taxLabel': taxLabel ?? '',
      'countryCode': countryCode ?? 'AU',
      'currencyCode': currencyCode ?? 'AUD',
      'isConnected': isConnected ?? false,
      'payoutCadence': payoutCadence?.toMap(),
      'lastPayoutDate': lastPayoutDate?.toUtc().millisecondsSinceEpoch,
      'hasStudioPolicy': hasStudioPolicy ?? false,
      'studioPolicyUrl': studioPolicyUrl ?? '',
      'studioPolicyName': studioPolicyName,
      'studioPolicyHash': studioPolicyHash,
      'acceptedWwccObligation': acceptedWwccObligation ?? false,
      'wwccObligationDate': wwccObligationDate?.toUtc().millisecondsSinceEpoch,
      'agreedToPaymentTerms': agreedToPaymentTerms ?? false,
      'agreedToPaymentFees': agreedToPaymentFees ?? false,
      'isEmpty': isEmpty,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    const statusType = EnrollmentStatusType.unknown;
    const roleType = TuiiRoleType.unknown;
    const payoutCadenceType = PayoutCadenceType.unknown;
    return UserModel(
      id: map['id'],
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'],
      emailVerified: map['emailVerified'] ?? false,
      phoneVerified: map['phoneVerified'] ?? false,
      mfaOn: map['mfaOn'] ?? false,
      roleType: roleType.fromMap(map['roleType']),
      hasCustodian: map['hasCustodian'] ?? false,
      custodianId: map['custodianId'],
      custodianSecurityCode: map['custodianSecurityCode'],
      custodianFirstName: map['custodianFirstName'],
      custodianLastName: map['custodianLastName'],
      custodianProfileImageUrl: map['custodianProfileImageUrl'],
      custodianConnections: map['custodianConnections'] != null
          ? List<ParentChildConnectionModel>.from(map['custodianConnections']
              ?.map((x) => ParentChildConnectionModel.fromMap(x)))
          : [],
      forceCustodianPinCheck: map['forceCustodianPinCheck'],
      creationTimestamp: map['creationTimestamp'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['creationTimestamp'])
              .toLocal()
          : null,
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth'])
          : null,
      birthYear: map['birthYear'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      bio: map['bio'],
      address: map['address'],
      welcomeMessage: map['welcomeMessage'],
      profileImageUrl: map['profileImageUrl'],
      provider: map['provider'],
      age: map['age']?.toInt(),
      userHasConfirmedLegalAge: map['userHasConfirmedLegalAge'] ?? false,
      onboarded: map['onboarded'],
      profilePercentageComplete: map['profilePercentageComplete']?.toDouble(),
      isSignUp: map['isSignUp'] ?? false,
      enrollmentStatus: statusType.fromMap(map['enrollmentStatus']),
      lessonConfiguration: map['lessonConfiguration'] != null
          ? List<LessonConfiguration>.from(map['lessonConfiguration']
              ?.map((x) => LessonConfiguration.fromMap(x)))
          : null,
      userSubjects: map['userSubjects'] != null
          ? List<SubjectModel>.from(
              map['userSubjects']?.map((x) => SubjectModel.fromMap(x)))
          : null,
      availabilitySchedule: map['availabilitySchedule'] != null
          ? List<TutorDayAvailabilityModel>.from(map['availabilitySchedule']
              ?.map((x) => TutorDayAvailabilityModel.fromMap(x)))
          : null,
      unavailabilitySchedule: map['unavailabilitySchedule'] != null
          ? TutorUnavailabilityModel.fromMap(map['unavailabilitySchedule'])
          : null,
      isZoomSetUpComplete: map['isZoomSetUpComplete'] ?? false,
      isStripeSetUpComplete: map['isStripeSetUpComplete'] ?? false,
      areStripePayoutsEnabled: map['areStripePayoutsEnabled'] ?? false,
      stripeCustomerId: map['stripeCustomerId'] ?? '',
      stripeAccountId: map['stripeAccountId'] ?? '',
      stripeAccountDashboardUrl: map['stripeAccountDashboardUrl'] ?? '',
      standardHourlyRate: map['standardHourlyRate'],
      onboardingState: map['onboardingState'] != null
          ? OnboardingStateModel.fromMap(map['onboardingState'])
          : null,
      searchTerms: map['searchTerms'] != null
          ? List<String>.from(map['searchTerms'])
          : [],
      domain: map['domain'],
      // zoomToken: map['zoomToken'] != null
      //     ? ZoomTokenModel.fromMap(map['zoomToken'])
      //     : null,
      zoomAccessToken: map['zoomAccessToken'],
      zoomMeetingUrl: map['zoomMeetingUrl'],
      lastUpdateDate: map['lastUpdateDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastUpdateDate']).toLocal()
          : null,
      studioName: map['studioName'],
      studioImageUrl: map['studioImageUrl'],
      lessonBookingState: map['lessonBookingState'] != null
          ? List<LessonBookingStateModel>.from(map['lessonBookingState']
              ?.map((x) => LessonBookingStateModel.fromMap(x)))
          : null,
      discountingState: map['discountingState'] != null
          ? UserDiscountingStateModel.fromMap(map['discountingState'])
          : null,
      taxableRate: map['taxableRate'] ?? 0,
      taxLabel: map['taxLabel'] ?? '',
      countryCode: map['countryCode'] ?? 'AU',
      currencyCode: map['currencyCode'] ?? 'AUD',
      isConnected: map['isConnected'] ?? false,
      payoutCadence: map['payoutCadence'] != null
          ? payoutCadenceType.fromMap(map['payoutCadence'])
          : null,
      lastPayoutDate: map['lastPayoutDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastPayoutDate']).toLocal()
          : null,

      // Tutor Business Details Stuff
      hasStudioPolicy: map['hasStudioPolicy'] ?? false,
      studioPolicyUrl: map['studioPolicyUrl'] ?? '',
      studioPolicyName: map['studioPolicyName'],
      studioPolicyHash: map['studioPolicyHash'],
      acceptedWwccObligation: map['acceptedWwccObligation'] ?? false,
      wwccObligationDate: map['wwccObligationDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['wwccObligationDate'])
              .toLocal()
          : null,
      agreedToPaymentTerms: map['agreedToPaymentTerms'] ?? false,
      agreedToPaymentFees: map['agreedToPaymentFees'] ?? false,
      isEmpty: map['isEmpty'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
