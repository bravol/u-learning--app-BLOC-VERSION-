import 'package:flutter/material.dart';
import 'package:u_learning_app/common/service/storage_service.dart';
import 'package:firebase_core/firebase_core.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    storageService = await StorageService().init();
  }
}
