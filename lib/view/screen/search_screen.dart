import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/constants.dart';
import 'package:news_app/view/route/router.gr.dart';
import 'package:news_app/view/widget/button_back.dart';
import 'package:news_app/view/widget/custom_error_widget.dart';
import 'package:news_app/view/widget/loading_animation.dart';
import 'package:news_app/view/widget/news_list.dart';
import 'package:news_app/view/widget/no_internet_widget.dart';
import 'package:news_app/view_model/provider/input_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../model/repository/online_article_repo.dart';
import '../../model/service/news_api_service.dart';
import '../../view_model/bloc/online_article_bloc/online_article_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late NewsApiService service;
  late OnlineArticleRepo repo;
  @override
  void initState() {
    super.initState();
    http.Client client = http.Client();
    service = NewsApiService(client);
    repo = OnlineArticleRepo(service);
    BlocProvider.of<OnlineArticleBloc>(context).add(
      const ResetOnlineArticleBlocEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AutoRouter.of(context).push(const HomeScreen());
        return true;
      },
      child: ChangeNotifierProvider(
        create: (context) => InputProvider(),
        builder: (context, child) {
          return Scaffold(
            body: SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: padding1x,
                        top: padding2x,
                        bottom: padding1x,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ButtonBack(),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              border: Border.all(color: themeColor),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Consumer<InputProvider>(
                              builder: (context, provider, child) {
                                return TextField(
                                  controller: provider.controller,
                                  cursorColor: themeColor,
                                  autofocus: true,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter here!!',
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                  ),
                                );
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              final provider = context.read<InputProvider>();
                              BlocProvider.of<OnlineArticleBloc>(context).add(
                                GetOnlineArticleBlocEvent(provider.getText),
                              );
                            },
                            icon: const Icon(
                              Icons.search_outlined,
                              size: 35,
                              color: themeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<OnlineArticleBloc, OnlineArticleBlocState>(
                      builder: (context, state) {
                        if (state is OnlineArticleBlocInitialState) {
                          //return loading animtion at initial state
                          return const Expanded(
                            child: Placeholder(color: Colors.transparent),
                          );
                        } else if (state is OnlineArticleBlocLoadingState) {
                          //return loading animation at loading state
                          return const Expanded(
                            child: LoadingAnimation(),
                          );
                        } else if (state is OnlineArticleBlocEmptyState) {
                          // return placeholder when data is empty (empty state)
                          return const Expanded(
                            child: Placeholder(color: Colors.red),
                          );
                        } else if (state is OnlineArticleBlocLoadedState) {
                          // return list of news when loading is completed(loaded)
                          return Expanded(
                            child: NewsList(state: state),
                          );
                        } else if (state
                            is OnlineArticleBlocNoConnectionState) {
                          //return connection error widget when there is no internet
                          return const Expanded(
                            child: NoInternetWidget(),
                          );
                        } else if (state is OnlineArticleBlocErrorState) {
                          //return error widget when error occcured
                          return const Expanded(
                            child: CustomErrorWidget(),
                          );
                        } else {
                          // return loading animation for unexpected condition
                          return const Expanded(
                            child: Placeholder(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
