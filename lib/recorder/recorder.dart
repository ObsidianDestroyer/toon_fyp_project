import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toon_fyp_project/files/files.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class AudioRecorder extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AudioRecorderState();
}


class _AudioRecorderState extends State<AudioRecorder> with FilesService {
  Codec _codec = Codec.aacMP4;
  String _extension = '.mp4';

  FlutterSoundRecorder _micSession = FlutterSoundRecorder();
  FlutterSoundPlayer _player = FlutterSoundPlayer();
  // final AssetsAudioPlayer = AssetsAudioPlayer();
  bool _micPlayerIsInitialized = false;
  bool _micRecorderIsInitialized = false;

  @override
  void initState() {
    try {
      _player.openPlayer().then((value) {
        setState(() {
          _micPlayerIsInitialized = true;
        });
      });
    }
    on MissingPluginException {
      initializer().then((value) {
        setState(() {
          _micRecorderIsInitialized = true;
        });
      });
    }

    initializer().then((value) {
      setState(() {
        _micRecorderIsInitialized = true;
      });
    });
    super.initState();
  }

  Future<void> configureSession() async {
    final AudioSession session = await AudioSession.instance;
    await session.configure(
        AudioSessionConfiguration(
          avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
          avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.allowBluetooth |
          AVAudioSessionCategoryOptions.defaultToSpeaker,
          avAudioSessionMode: AVAudioSessionMode.spokenAudio,
          avAudioSessionRouteSharingPolicy:
          AVAudioSessionRouteSharingPolicy.defaultPolicy,
          androidAudioAttributes: const AndroidAudioAttributes(
            contentType: AndroidAudioContentType.speech,
            flags: AndroidAudioFlags.none,
            usage: AndroidAudioUsage.voiceCommunication,
          ),
          androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
          androidWillPauseWhenDucked: true,
        ),
    );
    _micRecorderIsInitialized = true;
  }

  Future<void> initializer() async {
    if (!kIsWeb) {
      try {
        var status = await Permission.microphone.request();
        if (status != PermissionStatus.granted) {
          throw RecordingPermissionException('Microphone permission not granted!');
        }
      } on MissingPluginException {
        _micPlayerIsInitialized = true;
        return await configureSession();
      }
    }
    await _micSession.openRecorder();
    if (!await _micSession.isEncoderSupported(_codec) && kIsWeb) {
      _codec = Codec.opusWebM;
      _extension = '.webm';
      if (!await _micSession.isEncoderSupported(_codec) && kIsWeb) {
        _micPlayerIsInitialized = true;
        return await configureSession();
      }
    }
  }

  void record() {
    _micSession.openRecorder();
  }

  @override
  Widget build(BuildContext context) {
    Widget makeBody() {
      return Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.black54,
                width: 1,
              ),
            ),
            child: Row(children: [
              ElevatedButton(
                  onPressed: () => {},
                  child: Text('Play'),
              ),
              SizedBox(
                width: 20,
              ),
              Text('Playing recorder. . .'),
            ]),
          ),
        ],
      );
    }
    return Center(
      child: makeBody(),
    );
  }
}
