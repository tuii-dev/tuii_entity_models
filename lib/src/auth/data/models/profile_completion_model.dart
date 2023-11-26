import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:tuii_entity_models/src/auth/data/models/subject_delivery_mode_model.dart';
import 'package:tuii_entity_models/src/auth/data/models/subject_lesson_length_model.dart';
import 'package:tuii_entity_models/src/auth/data/models/subject_rate_model.dart';
import 'package:tuii_entity_models/src/auth/data/models/user_model.dart';
import 'package:tuiicore/core/enums/tuii_role_type.dart';
import 'package:tuiicore/core/models/lesson_configuration.dart';

class ProfileCompletionModel extends Equatable {
  static bool isPersonalInfoComplete(
      String? firstName, String? lastName, DateTime? dateOfBirth) {
    bool infoComplete = true;
    if (firstName == null || firstName.isEmpty) {
      infoComplete = false;
    } else if (lastName == null || lastName.isEmpty) {
      infoComplete = false;
    } else if (dateOfBirth == null) {
      infoComplete = false;
    }

    return infoComplete;
  }

  static bool isIdentityVerified(bool? emailVerified, bool? phoneVerified) {
    return (emailVerified ?? false) && (phoneVerified ?? false);
  }

  static bool isSubjectsComplete(List<String>? tags) {
    return tags != null && tags.isNotEmpty;
  }

  static bool isModesComplete(List<SubjectDeliveryModeModel>? modes) {
    bool complete = false;
    if (modes != null && modes.isNotEmpty) {
      for (int i = 0; i < modes.length; i++) {
        final mode = modes[i];
        if (mode.homeVisit == true ||
            mode.studio == true ||
            mode.virtual == true) {
          complete = true;
          break;
        }
      }
    }

    return complete;
  }

  static bool isLengthsComplete(List<SubjectLessonLengthModel>? lengths) {
    // return lengths != null && lengths.isNotEmpty;

    bool complete = false;
    if (lengths != null && lengths.isNotEmpty) {
      for (int i = 0; i < lengths.length; i++) {
        final length = lengths[i];
        if (length.isNew != true) {
          complete = true;
          break;
        }
      }
    }

    return complete;
  }

  static bool isRatesComplete(List<SubjectRateModel>? rates) {
    bool complete = false;
    if (rates != null && rates.isNotEmpty) {
      for (int i = 0; i < rates.length; i++) {
        final rate = rates[i];
        if (rate.price != null && rate.price! > 0) {
          complete = true;
          break;
        }
      }
    }

    return complete;
  }

  static bool isLessonConfigurationComplete(
      List<LessonConfiguration>? lessonConfiguration) {
    return lessonConfiguration != null && lessonConfiguration.isNotEmpty;
  }

  static bool isPublicProfileComplete(String? domain) {
    return domain != null && domain.isNotEmpty;
  }

  static bool isBusinessDetailsComplete(bool? acceptedWwccObligation) {
    return acceptedWwccObligation == true;
  }

  static bool isConnectionsComplete(bool? isConnected) {
    return isConnected ?? false;
  }

  final bool? personalInfo;
  final bool? emailVerified;
  final bool? phoneVerified;
  final bool? identityVerified;
  final bool? payments;
  final bool? zoom;
  final bool? subjects;
  final bool? lengths;
  final bool? modes;
  final bool? rates;
  final bool? businessDetails;
  final bool? publicProfile;
  final bool? connections;

  const ProfileCompletionModel({
    this.personalInfo,
    this.emailVerified,
    this.phoneVerified,
    this.identityVerified,
    this.payments,
    this.zoom,
    this.subjects,
    this.lengths,
    this.modes,
    this.rates,
    this.businessDetails,
    this.publicProfile,
    this.connections,
  });

  factory ProfileCompletionModel.fromUser(UserModel user) {
    bool infoComplete = ProfileCompletionModel.isPersonalInfoComplete(
        user.firstName, user.lastName, user.dateOfBirth);

    bool identityVerified = ProfileCompletionModel.isIdentityVerified(
        user.emailVerified, user.phoneVerified);

    bool subjectsComplete = ProfileCompletionModel.isSubjectsComplete(
        user.onboardingState?.subjectTags);

    bool lengthsComplete = ProfileCompletionModel.isLengthsComplete(
        user.onboardingState?.subjectLessonLengths);

    bool modesComplete = ProfileCompletionModel.isModesComplete(
        user.onboardingState?.subjectDeliveryModes);

    bool ratesComplete = ProfileCompletionModel.isRatesComplete(
        user.onboardingState?.subjectRates);

    bool businessDetailsComplete =
        ProfileCompletionModel.isBusinessDetailsComplete(
            user.acceptedWwccObligation);

    bool profileComplete =
        ProfileCompletionModel.isPublicProfileComplete(user.domain);

    bool connectionsComplete =
        ProfileCompletionModel.isConnectionsComplete(user.isConnected);

    return ProfileCompletionModel(
      personalInfo: infoComplete,
      emailVerified: user.emailVerified ?? false,
      phoneVerified: user.phoneVerified ?? false,
      identityVerified: identityVerified,
      payments: user.isStripeSetUpComplete ?? false,
      zoom: user.isZoomSetUpComplete ?? false,
      subjects: subjectsComplete,
      lengths: lengthsComplete,
      modes: modesComplete,
      rates: ratesComplete,
      businessDetails: businessDetailsComplete,
      publicProfile: profileComplete,
      connections: connectionsComplete,
    );
  }

  double getProfileCompletionPercentage(TuiiRoleType role) {
    // Personal info values
    int stepsDone = 0;
    if (personalInfo == true) {
      stepsDone++;
    }

    if (identityVerified == true) {
      stepsDone++;
    }

    if (role == TuiiRoleType.tutor) {
      if (subjects == true) {
        stepsDone++;
      }

      if (lengths == true) {
        stepsDone++;
      }

      if (modes == true) {
        stepsDone++;
      }

      if (rates == true) {
        stepsDone++;
      }

      if (payments == true) {
        stepsDone++;
      }

      if (zoom == true) {
        stepsDone++;
      }

      if (businessDetails == true) {
        stepsDone++;
      }

      if (publicProfile == true) {
        stepsDone++;
      }

      if (connections == true) {
        stepsDone++;
      }

      return stepsDone / 11;
    } else {
      return stepsDone / 2;
    }
  }

  ProfileCompletionModel copyWith({
    bool? personalInfo,
    bool? emailVerified,
    bool? phoneVerified,
    bool? identityVerified,
    bool? payments,
    bool? zoom,
    bool? subjects,
    bool? lengths,
    bool? modes,
    bool? rates,
    bool? publicProfile,
    bool? businessDetails,
    bool? connections,
  }) {
    return ProfileCompletionModel(
      personalInfo: personalInfo ?? this.personalInfo,
      emailVerified: emailVerified ?? this.emailVerified,
      phoneVerified: phoneVerified ?? this.phoneVerified,
      identityVerified: identityVerified ?? this.identityVerified,
      payments: payments ?? this.payments,
      zoom: zoom ?? this.zoom,
      subjects: subjects ?? this.subjects,
      lengths: lengths ?? this.lengths,
      modes: modes ?? this.modes,
      rates: rates ?? this.rates,
      businessDetails: businessDetails ?? this.businessDetails,
      publicProfile: publicProfile ?? this.publicProfile,
      connections: connections ?? this.connections,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'personalInfo': personalInfo,
      'emailVerified': emailVerified,
      'phoneVerified': phoneVerified,
      'identityVerified': identityVerified,
      'payments': payments,
      'zoom': zoom,
      'subjects': subjects,
      'lengths': lengths,
      'modes': modes,
      'rates': rates,
      'businessDetails': businessDetails,
      'publicProfile': publicProfile,
      'connections': connections,
    };
  }

  factory ProfileCompletionModel.fromMap(Map<String, dynamic> map) {
    return ProfileCompletionModel(
      personalInfo: map['personalInfo'],
      emailVerified: map['emailVerified'],
      phoneVerified: map['phoneVerified'],
      identityVerified: map['identityVerified'],
      payments: map['payments'],
      zoom: map['zoom'],
      subjects: map['subjects'],
      lengths: map['lengths'],
      modes: map['modes'],
      rates: map['rates'],
      businessDetails: map['businessDetails'],
      publicProfile: map['publicProfile'],
      connections: map['connections'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileCompletionModel.fromJson(String source) =>
      ProfileCompletionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileCompletionModel(personalInfo: $personalInfo, emailVerified: $emailVerified, phoneVerified: $phoneVerified, identityVerified: $identityVerified, payments: $payments, zoom: $zoom, subjects: $subjects, publicProfile: $publicProfile, connections: $connections)';
  }

  @override
  List<Object?> get props {
    return [
      personalInfo,
      emailVerified,
      phoneVerified,
      identityVerified,
      payments,
      zoom,
      subjects,
      lengths,
      modes,
      rates,
      businessDetails,
      publicProfile,
      connections,
    ];
  }
}
