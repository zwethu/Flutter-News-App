// ignore_for_file: directives_ordering
// ignore_for_file: no_leading_underscores_for_library_prefixes
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:hive_generator/hive_generator.dart' as _i2;
import 'package:source_gen/builder.dart' as _i3;
import 'package:auto_route_generator/builder.dart' as _i4;
import 'package:mockito/src/builder.dart' as _i5;
import 'dart:isolate' as _i6;
import 'package:build_runner/build_runner.dart' as _i7;
import 'dart:io' as _i8;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(r'hive_generator:hive_generator', [_i2.getBuilder],
      _i1.toDependentsOf(r'hive_generator'),
      hideOutput: true,
      appliesBuilders: const [r'source_gen:combining_builder']),
  _i1.apply(r'source_gen:combining_builder', [_i3.combiningBuilder],
      _i1.toNoneByDefault(),
      hideOutput: false, appliesBuilders: const [r'source_gen:part_cleanup']),
  _i1.apply(r'auto_route_generator:autoRouteGenerator',
      [_i4.autoRouteGenerator], _i1.toDependentsOf(r'auto_route_generator'),
      hideOutput: false),
  _i1.apply(
      r'mockito:mockBuilder', [_i5.buildMocks], _i1.toDependentsOf(r'mockito'),
      hideOutput: false),
  _i1.applyPostProcess(r'source_gen:part_cleanup', _i3.partCleanup)
];
void main(List<String> args, [_i6.SendPort? sendPort]) async {
  var result = await _i7.run(args, _builders);
  sendPort?.send(result);
  _i8.exitCode = result;
}
