import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbnl_mobile/core/theme/app_colors.dart';
import 'package:gbnl_mobile/features/auth/data/model/user.dart';
import 'package:gbnl_mobile/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:gbnl_mobile/features/dashboard/presentation/news_view.dart';

import '../../../core/utils/date_formatter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
          (timeStamp) {
        context.read<DashboardCubit>().loadDashboard();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: BlocSelector<DashboardCubit, DashboardState, UserModel?>(
            selector: (state) => state.user,
            builder: (context, user) {
              return Text(
                "Hey ${user?.firstName}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w900
                ),
              );
            },
          ),
          backgroundColor: AppColors.appBarColor,
        ),
      ),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is DashboardLoaded) {
            return ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                final news = state.news[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              NewsView(authorizationUrl: news.url!),
                        ));
                  },
                  child: Container(
                    height: 132,
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: news.image ?? "",
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                              Container(
                                height: 100,
                                width: 100,
                                color: Colors.grey,
                              ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    news.source ?? "",
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  Text(
                                    formatUnixTimestamp(news.datetime!),
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Text(
                                  news.headline ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
