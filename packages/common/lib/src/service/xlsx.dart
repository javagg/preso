import 'dart:io';
import 'package:excel/excel.dart';

void main() {
  // 创建一个新的Excel文件
  var excel = Excel.createExcel();

  // 获取默认的工作表（Sheet）
  Sheet sheet = excel['Sheet1'];

  // 添加表头
  sheet.cell(CellIndex.indexByString("A1")).value = "姓名";
  sheet.cell(CellIndex.indexByString("B1")).value = "年龄";
  sheet.cell(CellIndex.indexByString("C1")).value = "城市";

  // 添加数据行
  sheet.appendRow(["张三", 25, "北京"]);
  sheet.appendRow(["李四", 30, "上海"]);
  sheet.appendRow(["王五", 28, "广州"]);

  // 保存为XLSX文件
  String filePath = 'example.xlsx';
  List<int>? fileBytes = excel.save();
  File(filePath)
    .writeAsBytesSync(fileBytes); // 将文件写入磁盘
  print('XLSX文件已生成: $filePath');
}