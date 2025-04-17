import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<AppointmentViewController>(
        () => AppointmentViewController(),
      )
    ];
  }
}

class Appointment {
  final DateTime startTime;
  final DateTime endTime;
  final String subject;
  final Color color;

  Appointment({
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.color,
  });
}

class AppointmentViewController extends GetxController {
  final events = <Appointment>[].obs;

  @override
  void onInit() {
    super.onInit();
    // 初始化一些示例事件
    events.addAll([
      Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(hours: 1)),
        subject: '团队会议',
        color: Colors.blue,
      ),
      Appointment(
        startTime: DateTime.now().add(const Duration(days: 1)),
        endTime: DateTime.now().add(const Duration(days: 1, hours: 2)),
        subject: '客户演示',
        color: Colors.green,
      ),
    ]);
  }

  void addEvent(Appointment event) {
    events.add(event);
  }

  void removeEvent(Appointment event) {
    events.remove(event);
  }
}

class AppointmentView extends GetView<AppointmentViewController> {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX 日历示例'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddEventDialog(context),
          ),
        ],
      ),
      body: Obx(
        () => SfCalendar(
          view: CalendarView.week,
          dataSource: _getCalendarDataSource(),
          onTap: (details) {
            if (details.targetElement == CalendarElement.appointment) {
              _showEventDetails(details.appointments!.first);
            }
          },
        ),
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    return _AppointmentDataSource(controller.events);
  }

  void _showAddEventDialog(BuildContext context) {
    final titleController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('添加新事件'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: '事件标题'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  selectedDate = pickedDate;
                }
              },
              child: const Text('选择日期'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                final newEvent = Appointment(
                  startTime: selectedDate,
                  endTime: selectedDate.add(const Duration(hours: 1)),
                  subject: titleController.text,
                  color: Colors.primaries[
                      controller.events.length % Colors.primaries.length],
                );
                controller.addEvent(newEvent);
                Navigator.pop(context);
              }
            },
            child: const Text('添加'),
          ),
        ],
      ),
    );
  }

  void _showEventDetails(Appointment appointment) {
    Get.defaultDialog(
      title: appointment.subject,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('开始时间: ${appointment.startTime}'),
          Text('结束时间: ${appointment.endTime}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            controller.removeEvent(appointment);
            Get.back();
          },
          child: const Text('删除'),
        ),
        TextButton(
          onPressed: Get.back,
          child: const Text('关闭'),
        ),
      ],
    );
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
