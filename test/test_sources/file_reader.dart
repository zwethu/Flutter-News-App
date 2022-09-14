

import 'dart:io';

String readFile(String input) => File('test/test_sources/$input').readAsStringSync();