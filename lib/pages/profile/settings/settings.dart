import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/common/routes/routes.dart';
import 'package:u_learning_app/common/values/constant.dart';
import 'package:u_learning_app/global.dart';
import 'package:u_learning_app/pages/application/bloc/app_bloc.dart';
import 'package:u_learning_app/pages/application/bloc/app_events.dart';
import 'package:u_learning_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:u_learning_app/pages/profile/settings/bloc/settings_states.dart';
import 'package:u_learning_app/pages/profile/settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void onLogout() {
    context.read<AppBloc>().add(const TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return Column(
                children: [settingButton(context, onLogout)],
              );
            },
          ),
        ),
      ),
    );
  }
}
