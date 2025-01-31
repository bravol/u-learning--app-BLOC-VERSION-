import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning_app/common/widgets/global_widgets.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Center(child: reusableText('Settings')),
  );
}

Widget settingButton(BuildContext context, void Function()? onLogout) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: onLogout,
                  child: const Text('Confirm'),
                ),
              ],
              title: const Text(
                'Confirm Logout',
              ),
              content: const Text('Confirm Logout'),
            );
          });
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(
            'assets/icons/Logout.png',
          ),
        ),
      ),
    ),
  );
}
