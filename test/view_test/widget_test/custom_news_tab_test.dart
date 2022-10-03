// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:news_app/model/repository/online_article_repo.dart';
// import 'package:news_app/view/widget/custom_news_tab.dart';
// import 'package:news_app/view/widget/news_list.dart';
// import 'package:news_app/view_model/bloc/online_article_bloc/online_article_bloc.dart';





// void main() {
//   testWidgets('test custom news tab', (tester) async {
//     http.Client client = http.Client();
//     const String topic = 'topic';
//     OnlineArticleRepo repo = OnlineArticleRepo(client);

//     await tester.pumpWidget(
//       BlocProvider<OnlineArticleBloc>(
//         create: (context) => OnlineArticleBloc(repo),
//         child: const MaterialApp(
//           home: Scaffold(
//             body: CustomNewsTab(topic: topic),
//           ),
//         ),
//       ),
//     );
//     -
//   });
// }
