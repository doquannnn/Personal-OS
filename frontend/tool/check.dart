import 'dart:io';

Future<void> main(List<String> arguments) async {
  var runAll = false;
  var fix = false;

  for (final argument in arguments) {
    switch (argument) {
      case '--all':
        runAll = true;
      case '--fix':
        fix = true;
      case '--help':
        _showHelp();
        return;
      default:
        stderr.writeln('Tùy chọn không hợp lệ: $argument');
        _showHelp();
        exitCode = 2;
        return;
    }
  }

  if (!runAll && !stdin.hasTerminal) {
    stderr.writeln(
      'Chế độ mặc định cần terminal tương tác. Dùng --all để chạy không tương tác.',
    );
    exitCode = 2;
    return;
  }

  final flutter = _findFlutterExecutable();
  final dart = Platform.resolvedExecutable;

  await _runStep('Đồng bộ dependency', flutter, const ['pub', 'get']);
  await _confirmNext(runAll);

  if (fix) {
    await _runStep('Định dạng mã nguồn', dart, const [
      'format',
      'lib',
      'test',
      'tool',
    ]);
    await _confirmNext(runAll);
  }

  await _runStep('Kiểm tra định dạng', dart, const [
    'format',
    '--output=none',
    '--set-exit-if-changed',
    'lib',
    'test',
    'tool',
  ]);
  await _confirmNext(runAll);
  await _runStep('Kiểm tra lint và kiểu', flutter, const ['analyze']);
  await _confirmNext(runAll);
  await _runStep('Chạy kiểm thử', flutter, const ['test']);

  stdout.writeln('\nTất cả kiểm tra frontend đã hoàn tất.');
}

void _showHelp() {
  stdout.writeln('''Cách dùng: dart tool/check.dart [--all] [--fix]

Tùy chọn:
  --all   Chạy toàn bộ các bước mà không yêu cầu xác nhận giữa các bước.
  --fix   Cho phép Dart tự định dạng mã nguồn trước khi kiểm tra.
  --help  Hiển thị hướng dẫn này.''');
}

String _findFlutterExecutable() {
  final dartExecutable = File(Platform.resolvedExecutable);
  final flutterRoot = dartExecutable.parent.parent.parent.parent.parent;
  final fileName = Platform.isWindows ? 'flutter.bat' : 'flutter';
  final flutter = File(
    '${flutterRoot.path}${Platform.pathSeparator}bin${Platform.pathSeparator}$fileName',
  );

  if (!flutter.existsSync()) {
    stderr.writeln('Không tìm thấy Flutter tương ứng với Dart đang chạy.');
    exit(1);
  }

  return flutter.path;
}

Future<void> _confirmNext(bool runAll) async {
  if (runAll) {
    return;
  }

  stdout.write('Tiếp tục bước kế tiếp? [y/N] ');
  final answer = stdin.readLineSync();
  if (answer != 'y' && answer != 'Y') {
    stdout.writeln('Đã dừng theo yêu cầu.');
    exit(0);
  }
}

Future<void> _runStep(
  String description,
  String executable,
  List<String> arguments,
) async {
  stdout.writeln('\n==> $description');
  final process = await Process.start(
    executable,
    arguments,
    mode: ProcessStartMode.inheritStdio,
  );
  final code = await process.exitCode;

  if (code != 0) {
    throw ProcessException(executable, arguments, 'Bước thất bại.', code);
  }
}
