import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbnl_mobile/core/theme/app_colors.dart';
import 'package:gbnl_mobile/core/utils/loading_overlay.dart';
import 'package:gbnl_mobile/features/auth/cubit/auth_cubit.dart';
import 'package:gbnl_mobile/features/auth/presentation/widget/custom_text_field.dart';
import 'package:gbnl_mobile/routes/app_routes.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {

        }
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.notification, (route) => false,);
        }
      },
      child: Scaffold(
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return LoadingOverlay(
              show: state is AuthLoading,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your legal name",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Text(
                          "We need to know a bit about you so that we can create your account.",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.text500),
                        ),
                      ),
                      CustomTextForm(
                        hintText: "First Name",
                        controller: firstNameController,
                        onChanged: (_) {
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextForm(
                        hintText: "Last Name",
                        controller: lastNameController,
                        onChanged: (_) {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (firstNameController.text.isNotEmpty &&
                lastNameController.text.isNotEmpty) {
              FocusScope.of(context).unfocus();
              context.read<AuthCubit>().submitUser(
                firstNameController.text,
                lastNameController.text,
              );
            }
          },
          backgroundColor: firstNameController.text.isNotEmpty &&
              lastNameController.text.isNotEmpty
              ? AppColors.primary600
              : AppColors.primary600.withValues(alpha: 0.4),
          elevation: 1,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)),
          child: Icon(
            Icons.chevron_right,
            color: AppColors.muted300,
            size: 30,
          ),
        ),
      ),
    );
  }
}
