import 'package:flutter/material.dart';

class TrainerTileData {
  final String name;
  final String headshotUrl;
  final List<String> tags;
  final bool male = true;

  TrainerTileData(this.tags, {required this.name, required this.headshotUrl});
}

class TrainerTile extends StatelessWidget {
  final TrainerTileData data;

  const TrainerTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        foregroundImage: data.headshotUrl.isEmpty
            ? AssetImage("default")
            : NetworkImage(data.headshotUrl),
      ),
      title: Row(
        children: [
          Text(data.name),
          data.male ? Icon(Icons.male) : Icon(Icons.female)
        ],
      ),
      subtitle: Row(
        children: data.tags.map((tag) => Chip(label: Text(tag))).toList(),
      ),
      trailing: Icon(Icons.arrow_forward),
    );
  }
}
