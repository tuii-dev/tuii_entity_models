import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tuiientitymodels/files/auth/data/models/lesson_booking_state_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/nullable_wrapper.dart';
import 'package:tuiientitymodels/files/auth/data/models/onboarding_state_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/parent_child_connection_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/tutor_availability_day_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/tutor_unavailability_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/user_discounting_state_model.dart';
import 'package:tuiientitymodels/files/auth/data/models/user_model.dart';
import 'package:tuiientitymodels/files/classroom/data/models/subject_model.dart';
import 'package:tuiicore/core/enums/enums.dart';
import 'package:tuiicore/core/enums/payout_cadence_type.dart';
import 'package:tuiicore/core/models/lesson_configuration.dart';

class User extends Equatable {
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

  // New Stripe Payment Stuff
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

  final bool isSignUp;
  final bool? isEmpty;

  const User({
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
    this.isZoomSetUpComplete,
    this.isStripeSetUpComplete,
    this.areStripePayoutsEnabled,
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

  factory User.empty() {
    return const User(
      email: '',
      isEmpty: true,
    );
  }

  factory User.fromModel({required UserModel model}) {
    return User(
      id: model.id,
      email: model.email,
      phoneNumber: model.phoneNumber,
      emailVerified: model.emailVerified,
      phoneVerified: model.phoneVerified,
      mfaOn: model.mfaOn,
      roleType: model.roleType,
      hasCustodian: model.hasCustodian,
      custodianId: model.custodianId,
      custodianSecurityCode: model.custodianSecurityCode,
      custodianFirstName: model.custodianFirstName,
      custodianLastName: model.custodianLastName,
      custodianProfileImageUrl: model.custodianProfileImageUrl,
      custodianConnections: model.custodianConnections,
      forceCustodianPinCheck: model.forceCustodianPinCheck,
      creationTimestamp: model.creationTimestamp,
      dateOfBirth: model.dateOfBirth,
      birthYear: model.birthYear,
      firstName: model.firstName,
      lastName: model.lastName,
      bio: model.bio,
      address: model.address,
      welcomeMessage: model.welcomeMessage,
      profileImageUrl: model.profileImageUrl,
      provider: model.provider,
      age: model.age,
      userHasConfirmedLegalAge: model.userHasConfirmedLegalAge,
      onboarded: model.onboarded,
      profilePercentageComplete: model.profilePercentageComplete,
      isSignUp: model.isSignUp,
      enrollmentStatus: model.enrollmentStatus,
      lessonConfiguration: model.lessonConfiguration,
      userSubjects: model.userSubjects,
      availabilitySchedule: model.availabilitySchedule,
      unavailabilitySchedule: model.unavailabilitySchedule,
      isZoomSetUpComplete: model.isZoomSetUpComplete,
      isStripeSetUpComplete: model.isStripeSetUpComplete,
      areStripePayoutsEnabled: model.areStripePayoutsEnabled,
      stripeCustomerId: model.stripeCustomerId,
      stripeAccountId: model.stripeAccountId,
      stripeAccountDashboardUrl: model.stripeAccountDashboardUrl,
      standardHourlyRate: model.standardHourlyRate,
      onboardingState: model.onboardingState,
      searchTerms: model.searchTerms,
      domain: model.domain,
      // zoomToken: model.zoomToken,
      zoomAccessToken: model.zoomAccessToken,
      zoomMeetingUrl: model.zoomMeetingUrl,
      firebaseToken: model.firebaseToken,
      lastUpdateDate: model.lastUpdateDate,
      multiFactor: model.multiFactor,
      studioName: model.studioName,
      studioImageUrl: model.studioImageUrl,
      lessonBookingState: model.lessonBookingState,
      discountingState: model.discountingState,
      taxableRate: model.taxableRate,
      taxLabel: model.taxLabel,
      countryCode: model.countryCode,
      currencyCode: model.currencyCode,
      isConnected: model.isConnected,
      payoutCadence: model.payoutCadence,
      lastPayoutDate: model.lastPayoutDate,

      // Tutor Business Details Stuff
      hasStudioPolicy: model.hasStudioPolicy,
      studioPolicyUrl: model.studioPolicyUrl,
      studioPolicyName: model.studioPolicyName,
      studioPolicyHash: model.studioPolicyHash,
      acceptedWwccObligation: model.acceptedWwccObligation,
      wwccObligationDate: model.wwccObligationDate,
      agreedToPaymentTerms: model.agreedToPaymentTerms,
      agreedToPaymentFees: model.agreedToPaymentFees,

      isEmpty: model.isEmpty,
    );
  }

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
      isSignUp,
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
      isEmpty,
    ];
  }

  UserModel toModel() {
    return UserModel(
      id: id,
      email: email,
      phoneNumber: phoneNumber,
      emailVerified: emailVerified,
      phoneVerified: phoneVerified,
      mfaOn: mfaOn,
      roleType: roleType,
      hasCustodian: hasCustodian,
      custodianId: custodianId,
      custodianSecurityCode: custodianSecurityCode,
      custodianFirstName: custodianFirstName,
      custodianLastName: custodianLastName,
      custodianProfileImageUrl: custodianProfileImageUrl,
      custodianConnections: custodianConnections,
      forceCustodianPinCheck: forceCustodianPinCheck,
      creationTimestamp: creationTimestamp,
      dateOfBirth: dateOfBirth,
      birthYear: birthYear,
      firstName: firstName,
      lastName: lastName,
      bio: bio,
      address: address,
      welcomeMessage: welcomeMessage,
      profileImageUrl: profileImageUrl,
      provider: provider,
      age: age,
      userHasConfirmedLegalAge: userHasConfirmedLegalAge,
      onboarded: onboarded,
      profilePercentageComplete: profilePercentageComplete,
      enrollmentStatus: enrollmentStatus,
      lessonConfiguration: lessonConfiguration,
      userSubjects: userSubjects,
      availabilitySchedule: availabilitySchedule,
      unavailabilitySchedule: unavailabilitySchedule,
      isZoomSetUpComplete: isZoomSetUpComplete,
      isStripeSetUpComplete: isStripeSetUpComplete,
      areStripePayoutsEnabled: areStripePayoutsEnabled,
      stripeCustomerId: stripeCustomerId,
      stripeAccountId: stripeAccountId,
      stripeAccountDashboardUrl: stripeAccountDashboardUrl,
      standardHourlyRate: standardHourlyRate,
      onboardingState: onboardingState,
      searchTerms: searchTerms,
      domain: domain,
      // zoomToken: zoomToken,
      zoomAccessToken: zoomAccessToken,
      zoomMeetingUrl: zoomMeetingUrl,
      lastUpdateDate: lastUpdateDate,
      firebaseToken: firebaseToken,
      multiFactor: multiFactor,
      studioName: studioName,
      studioImageUrl: studioImageUrl,
      lessonBookingState: lessonBookingState,
      discountingState: discountingState,
      taxableRate: taxableRate,
      taxLabel: taxLabel,
      countryCode: countryCode,
      currencyCode: currencyCode,
      isConnected: isConnected,
      payoutCadence: payoutCadence,
      lastPayoutDate: lastPayoutDate,

      // Tutor Business Details Stuff
      hasStudioPolicy: hasStudioPolicy,
      studioPolicyUrl: studioPolicyUrl,
      studioPolicyName: studioPolicyName,
      studioPolicyHash: studioPolicyHash,
      acceptedWwccObligation: acceptedWwccObligation,
      wwccObligationDate: wwccObligationDate,
      agreedToPaymentTerms: agreedToPaymentTerms,
      agreedToPaymentFees: agreedToPaymentFees,
    );
  }

  User copyWith({
    String? id,
    String? email,
    String? phoneNumber,
    bool? emailVerified,
    bool? phoneVerified,
    bool? mfaOn,
    TuiiRoleType? roleType,
    bool? hasCustodian,
    String? custodianId,
    String? custodianFirstName,
    String? custodianLastName,
    String? custodianSecurityCode,
    String? custodianProfileImageUrl,
    List<ParentChildConnectionModel>? custodianConnections,
    bool? forceCustodianPinCheck,
    DateTime? creationTimestamp,
    DateTime? dateOfBirth,
    NullableWrapper<int?>? birthYear,
    NullableWrapper<String?>? firstName,
    NullableWrapper<String?>? lastName,
    NullableWrapper<String?>? bio,
    NullableWrapper<String?>? address,
    NullableWrapper<String?>? welcomeMessage,
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
    MultiFactor? multiFactor,

    // Tutor Studio
    String? studioName,
    String? studioImageUrl,
    List<LessonBookingStateModel>? lessonBookingState,
    UserDiscountingStateModel? discountingState,
    double? taxableRate,
    String? taxLabel,
    String? countryCode,
    String? currencyCode,
    PayoutCadenceType? payoutCadence,
    DateTime? lastPayoutDate,
    bool? isConnected,
    DateTime? lastUpdateDate,

    // Tutor Business Details Stuff
    bool? hasStudioPolicy,
    String? studioPolicyUrl,
    String? studioPolicyName,
    String? studioPolicyHash,
    bool? acceptedWwccObligation,
    DateTime? wwccObligationDate,
    bool? agreedToPaymentTerms,
    bool? agreedToPaymentFees,
  }) {
    return User(
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
      birthYear: birthYear != null ? birthYear.value : this.birthYear,
      firstName: firstName != null ? firstName.value : this.firstName,
      lastName: lastName != null ? lastName.value : this.lastName,
      bio: bio != null ? bio.value : this.bio,
      address: address != null ? address.value : this.address,
      welcomeMessage:
          welcomeMessage != null ? welcomeMessage.value : this.welcomeMessage,
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
      multiFactor: multiFactor ?? this.multiFactor,
      studioName: studioName ?? this.studioName,
      studioImageUrl: studioImageUrl ?? this.studioImageUrl,
      lessonBookingState: lessonBookingState ?? this.lessonBookingState,
      discountingState: discountingState ?? this.discountingState,
      taxableRate: taxableRate ?? this.taxableRate,
      taxLabel: taxLabel ?? this.taxLabel,
      countryCode: countryCode ?? this.countryCode,
      currencyCode: currencyCode ?? this.currencyCode,
      payoutCadence: payoutCadence ?? this.payoutCadence,
      lastPayoutDate: lastPayoutDate ?? this.lastPayoutDate,
      isConnected: isConnected ?? this.isConnected,
      lastUpdateDate: lastUpdateDate ?? this.lastUpdateDate,

      hasStudioPolicy: hasStudioPolicy ?? this.hasStudioPolicy,
      studioPolicyUrl: studioPolicyUrl ?? this.studioPolicyUrl,
      studioPolicyName: studioPolicyName ?? this.studioPolicyName,
      studioPolicyHash: studioPolicyHash ?? this.studioPolicyHash,
      acceptedWwccObligation:
          acceptedWwccObligation ?? this.acceptedWwccObligation,
      wwccObligationDate: wwccObligationDate ?? this.wwccObligationDate,
      agreedToPaymentTerms: agreedToPaymentTerms ?? this.agreedToPaymentTerms,
      agreedToPaymentFees: agreedToPaymentFees ?? this.agreedToPaymentFees,
    );
  }

  User disconnectUserFromZoom() {
    return User(
        id: id,
        email: email,
        phoneNumber: phoneNumber,
        emailVerified: emailVerified,
        phoneVerified: phoneVerified,
        mfaOn: mfaOn,
        roleType: roleType,
        hasCustodian: hasCustodian,
        custodianId: custodianId,
        custodianSecurityCode: custodianSecurityCode,
        custodianFirstName: custodianFirstName,
        custodianLastName: custodianLastName,
        custodianProfileImageUrl: custodianProfileImageUrl,
        custodianConnections: custodianConnections,
        forceCustodianPinCheck: forceCustodianPinCheck,
        creationTimestamp: creationTimestamp,
        dateOfBirth: dateOfBirth,
        birthYear: birthYear,
        firstName: firstName,
        lastName: lastName,
        bio: bio,
        address: address,
        welcomeMessage: welcomeMessage,
        profileImageUrl: profileImageUrl,
        provider: provider,
        age: age,
        userHasConfirmedLegalAge: userHasConfirmedLegalAge,
        onboarded: onboarded,
        profilePercentageComplete: profilePercentageComplete,
        enrollmentStatus: enrollmentStatus,
        lessonConfiguration: lessonConfiguration,
        userSubjects: userSubjects,
        availabilitySchedule: availabilitySchedule,
        unavailabilitySchedule: unavailabilitySchedule,
        isZoomSetUpComplete: false,
        isStripeSetUpComplete: isStripeSetUpComplete,
        areStripePayoutsEnabled: areStripePayoutsEnabled,
        stripeCustomerId: stripeCustomerId,
        stripeAccountId: stripeAccountId,
        stripeAccountDashboardUrl: stripeAccountDashboardUrl,
        standardHourlyRate: standardHourlyRate,
        onboardingState: onboardingState,
        searchTerms: searchTerms,
        domain: domain,
        // zoomToken: null,
        zoomAccessToken: null,
        zoomMeetingUrl: null,
        firebaseToken: firebaseToken,
        multiFactor: multiFactor,
        lastUpdateDate: lastUpdateDate,
        studioName: studioName,
        studioImageUrl: studioImageUrl,
        lessonBookingState: lessonBookingState,
        discountingState: discountingState,
        taxableRate: taxableRate,
        taxLabel: taxLabel,
        countryCode: countryCode,
        currencyCode: currencyCode,
        isConnected: isConnected,
        payoutCadence: payoutCadence,
        lastPayoutDate: lastPayoutDate,

        // Tutor Business Details Stuff
        hasStudioPolicy: hasStudioPolicy,
        studioPolicyUrl: studioPolicyUrl,
        studioPolicyName: studioPolicyName,
        studioPolicyHash: studioPolicyHash,
        acceptedWwccObligation: acceptedWwccObligation,
        wwccObligationDate: wwccObligationDate,
        agreedToPaymentTerms: agreedToPaymentTerms,
        agreedToPaymentFees: agreedToPaymentFees);
  }

  @override
  bool get stringify => true;
}
