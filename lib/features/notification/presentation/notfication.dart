import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gbnl_mobile/core/theme/app_colors.dart';

import '../../../routes/app_routes.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/message_notif.svg",
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Get the most out of Blott ✅",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Allow notifications to stay in the loop with\nyour payments, requests and groups.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.text500,
                      ),
                    ),
                  ],
                ),
              ),
              FilledButton(
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title:
                          Text("“Blott” Would Like to Send You Notifications"),
                      content: Text(
                          "Notifications may include alerts, sounds, and icon badges. These can be configured in Settings."),
                      actions: [
                        CupertinoButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Don’t Allow",
                            style: TextStyle(
                              color: AppColors.systemBlue,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        CupertinoButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.dashboard,
                              (route) => false,
                            );
                          },
                          child: Text(
                            "Allow",
                            style: TextStyle(
                                color: AppColors.systemBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  );
                },
                style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary600,
                    padding: EdgeInsets.symmetric(vertical: 12)),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
