import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/view_model/provider/navigation_bar_provider.dart';

void main() {
  group('test Navigation bar provider - ', (){
    NavigationBarProvider provider;
    test('return default value 0', (){
    provider = NavigationBarProvider();
    expect(provider.getIndex, 0);
    });
    test('change value', (){
      provider = NavigationBarProvider();
      provider.setIndex(1);
      expect(provider.getIndex, 1);
    });
  });
}