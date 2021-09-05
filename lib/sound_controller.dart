import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class SoundController {
  Soundpool pool = Soundpool(streamType: StreamType.notification);


  SoundController() {
    sesCal();
  }

  Future<void> sesCal() async {
    int soundId = await rootBundle
        .load("lib/sound_pool/select.flac")
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    await pool.play(soundId);
  }
}
