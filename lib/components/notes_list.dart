// Source: https://docs.flutter.dev/cookbook/lists/mixed-list
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:diarist/provider/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import 'common_ui.dart';
import 'in_app_bar.dart';
import '../utils/helpers.dart';

class NotesList extends StatelessWidget {
  const NotesList(
      {Key? key,
      this.selected,
      required this.items,
      required this.onSelect,
      required this.onAdd,
      required this.onRefresh})
      : super(key: key);

  final NoteItem? selected;
  final List<NoteItem> items;
  final Function onSelect;
  final Function onAdd;
  final Function onRefresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: InAppBar(title: 'Entries', onAdd: onAdd)),
        body: Container(
            decoration: const BoxDecoration(
                border: Border(
                    left: BorderSide(color: borderColor),
                    right: BorderSide(color: borderColor))),
            child: RefreshIndicator(
                onRefresh: () => onRefresh(),
                child: ListView.builder(
                    // Let the ListView know how many items it needs to build.
                    itemCount: items.length,
                    // Provide a builder function. This is where the magic happens.
                    // Convert each item into a widget based on the type of item it is.
                    itemBuilder: (context, index) {
                      final item = items[index];

                      return CustomListTile(
                          item: item,
                          selectedItem: selected,
                          onSelect: onSelect);
                    }))));
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key? key,
      required this.item,
      required this.selectedItem,
      required this.onSelect})
      : super(key: key);

  final NoteItem item;
  final NoteItem? selectedItem;
  final Function onSelect;

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(builder: (context, provider, _) {
      final datetime = toDateTime(item.createdAt);

      return ListTile(
        //leading: const FaIcon(FontAwesomeIcons.brain, color: Colors.grey),
        leading: Text('${item.emotion}'),
        contentPadding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
        visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
        textColor: gray,
        title: item.buildTitle(context),
        subtitle: item.buildSubtitle(context),
        onTap: () {
          onSelect(item);
        },
        selected: (selectedItem != null && selectedItem!.id == item.id),
        selectedTileColor: accentCanvasColor,
        selectedColor: white,
        shape: const Border(bottom: BorderSide(color: borderColor)),
      );
    });
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String text;

  MessageItem(this.sender, this.text);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(text);
}

/// A ListItem that contains data to display a note
class NoteItem implements ListItem {
  final int id;
  final String? uuid;
  String text;
  String title;
  final int? createdAt;
  final int? updatedAt;
  String? emotion;
  String? sentiment;

  NoteItem(this.id, this.createdAt, this.updatedAt, this.title, this.text,
      this.uuid, this.emotion, this.sentiment);

  @override
  Widget buildTitle(BuildContext context) => Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      );

  @override
  Widget buildSubtitle(BuildContext context) => Text(getExcerpt(text, 20));

  @override
  String toString() =>
      'NOTEITEM id: $id, uuid: $uuid, text: $text, createdAt: $createdAt, updatedAt: $updatedAt';

  Note toNote() {
    return Note()
      ..id = id
      ..createdAt = createdAt ?? currentTimestamp()
      ..updatedAt = updatedAt ?? currentTimestamp()
      ..uuid = randomString()
      ..text = text
      ..title = title
      ..emotion = emotion
      ..sentiment = sentiment;
  }
}
