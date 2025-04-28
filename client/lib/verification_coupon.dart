// 核销平台枚举
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum Platform { Meituan, Douyin }

void showVerificationDialog(BuildContext context) {
  final TextEditingController _codeController = TextEditingController();
  Platform _selectedPlatform = Platform.Meituan;

  showDialog(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: Text('核销团购券'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<Platform>(
              value: _selectedPlatform,
              items: Platform.values.map((platform) => DropdownMenuItem(
                value: platform,
                child: Text(platform == Platform.Meituan ? '美团' : '抖音'),
              )).toList(),
              onChanged: (value) => setState(() => _selectedPlatform = value!),
            ),
            TextField(
              controller: _codeController,
              decoration: InputDecoration(
                labelText: '输入券码',
                hintText: '例如: MT123456 或 DY7890'
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('取消'),
          ),
          ElevatedButton(
            onPressed: () => _verifyCoupon(
              context,
              _codeController.text,
              _selectedPlatform,
            ),
            child: Text('确认核销'),
          ),
        ],
      ),
    ),
  );
}

// 核销逻辑
Future<void> _verifyCoupon(
  BuildContext context,
  String code,
  Platform platform,
) async {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  try {
    final response = await http.post(
      Uri.parse(_getApiUrl(platform)),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer YOUR_ACCESS_TOKEN', // 需替换为实际Token
      },
      body: jsonEncode(_buildRequestBody(code, platform)),
    );

    final result = jsonDecode(response.body);
    if (response.statusCode == 200 && result['err_no'] == 0) {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text('核销成功！'),
        backgroundColor: Colors.green,
      ));
    } else {
      _handleError(result, platform);
    }
  } catch (e) {
    scaffoldMessenger.showSnackBar(SnackBar(
      content: Text('网络错误：${e.toString()}'),
      backgroundColor: Colors.red,
    ));
  }
}

// 根据平台构建请求参数
Map<String, dynamic> _buildRequestBody(String code, Platform platform) {
  if (platform == Platform.Douyin) {
    return {
      "out_order_no": code,
      "item_order_list": [{"item_order_id": code}],
      "poi_info": {
        "shop_name": "示例门店", // 需替换实际门店信息
        "ext_valid_shop_id": "X0001",
        "valid_poi_id_str": "6601136930455291912"
      }
    };
  } else {
    return {"code": code}; // 美团接口参数示例（需参考实际API文档）
  }
}

// 获取API地址
String _getApiUrl(Platform platform) {
  return platform == Platform.Douyin
      ? 'https://api.douyin.com/trade/v2/push_delivery' // 抖音核销API:cite[6]
      : 'https://api.meituan.com/coupon/verify'; // 美团假设接口
}

// 错误处理
void _handleError(Map<String, dynamic> result, Platform platform) {
  String errorMsg = '核销失败';
  switch (result['err_no']) {
    case 21001:
      errorMsg = '券码状态不可用（已使用/过期）';
      break;
    case 21111:
      errorMsg = '该订单需通过抖音闭环核销'; // 抖音特定错误:cite[6]
      break;
    case 403:
      errorMsg = '权限不足，请检查Token';
      break;
  }
  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //   content: Text(errorMsg),
  //   backgroundColor: Colors.orange,
  // ));
}