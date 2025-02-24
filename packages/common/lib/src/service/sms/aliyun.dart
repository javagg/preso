import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class AliYunSMS {
  final String accessKeyId;
  final String accessKeySecret;
  final String endpoint = 'dysmsapi.aliyuncs.com';
  final String version = '2017-05-25';
  final String regionId = 'cn-hangzhou';
  final String signName;
  final String templateCode;

  AliYunSMS({
    required this.accessKeyId,
    required this.accessKeySecret,
    required this.signName,
    required this.templateCode,
  });

  Future<void> sendSms(String phoneNumber, String code) async {
    final Map<String, String> params = {
      'AccessKeyId': accessKeyId,
      'Action': 'SendSms',
      'Format': 'JSON',
      'PhoneNumbers': phoneNumber,
      'RegionId': regionId,
      'SignName': signName,
      'SignatureMethod': 'HMAC-SHA1',
      'SignatureNonce': Random().nextInt(999999999).toString(),
      'SignatureVersion': '1.0',
      'TemplateCode': templateCode,
      'TemplateParam': '{"code":"$code"}',
      'Timestamp': DateTime.now().toUtc().toString().split(' ').join('T') + 'Z',
      'Version': version,
    };

    // 生成签名
    final String signature = generateSignature(params, accessKeySecret);
    params['Signature'] = signature;

    // 发送请求
    final Uri uri = Uri.https(endpoint, '', params);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      if (responseBody['Code'] == 'OK') {
        print('短信发送成功');
      } else {
        print('短信发送失败: ${responseBody['Message']}');
      }
    } else {
      print('请求失败: ${response.statusCode}');
    }
  }

  String generateSignature(Map<String, String> params, String accessKeySecret) {
    // 对参数进行排序
    final List<String> sortedKeys = params.keys.toList()..sort();
    final String canonicalizedQueryString = sortedKeys
        .map((key) => '$key=${Uri.encodeComponent(params[key]!)}')
        .join('&');

    // 构造待签名的字符串
    final String stringToSign = 'GET&%2F&${Uri.encodeComponent(canonicalizedQueryString)}';

    // 使用HMAC-SHA1算法生成签名
    final Hmac hmac = Hmac(sha1, utf8.encode('$accessKeySecret&'));
    final Digest digest = hmac.convert(utf8.encode(stringToSign));
    final String signature = base64Encode(digest.bytes);

    return signature;
  }
}

void main() async {
  final AliYunSMS sms = AliYunSMS(
    accessKeyId: 'your-access-key-id',
    accessKeySecret: 'your-access-key-secret',
    signName: 'your-sign-name',
    templateCode: 'your-template-code',
  );

  await sms.sendSms('12345678901', '123456');
}