import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionHelper {
  static String encryptAES(String plainText, String key) {
    final keyBytes = encrypt.Key.fromUtf8(key.padRight(16, '*')); // Key 16 byte
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(keyBytes));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  static String decryptAES(String encryptedText, String key) {
    final keyBytes = encrypt.Key.fromUtf8(key.padRight(16, '*')); // Key 16 byte
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(keyBytes));

    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }
}
