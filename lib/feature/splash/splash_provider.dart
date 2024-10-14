// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:firebase_news_app/product/utility/version_manager.dart';

import 'package:firebase_news_app/product/enums/platform_enum.dart';

import 'package:firebase_news_app/product/utility/firebase/firebase_collections.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:firebase_news_app/product/models/number_model.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(const SplashState());

  Future<void> checkApplicationVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    //clientVersion = packageInfo.version;
    final databaseValue = await getVersionNumberFromDatabase();

    if (databaseValue == null || databaseValue.isEmpty) {
      state = state.copyWith(isRedirectHome: false);
      return;
    }

    final checkIsNeedForceUpdate = VersionManager(
      deviceValue: packageInfo.version,
      databaseValue: databaseValue,
    );

    if (checkIsNeedForceUpdate.isNeedUpdate()) {
      state = state.copyWith(isRequiredForceUpdate: true);
      return;
    }

    state = state.copyWith(isRedirectHome: true);
  }

  // If user coming from browser, we dont need to check version control
  //internet oldugu icin istedigin zaman update cikarsin bu yuzden force update gerek yok
  Future<String?> getVersionNumberFromDatabase() async {
    if (kIsWeb) return null;

    final response = await FirebaseCollections.version.reference
        .withConverter<NumberModel>(
          fromFirestore: (snapshot, options) => NumberModel().fromFirebase(snapshot),
          toFirestore: (value, options) => value.toJson(),
        )
        .doc(PlatformEnum.versionName)
        .get();

    return response.data()?.number;
  }
}

class SplashState extends Equatable {
  //equtable referans esitligini kurtarmis oluyorsun
  const SplashState({
    this.isRequiredForceUpdate,
    this.isRedirectHome,
  });
// degiskenlerimizi burda tanimliyoruz class yapisi olan riverpod cozum
  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;

  @override
  List<Object?> get props => [isRequiredForceUpdate, isRedirectHome];

  SplashState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
  }) {
    return SplashState(
      isRequiredForceUpdate: isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
