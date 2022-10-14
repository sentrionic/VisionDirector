import 'package:flutter/material.dart';

class MarkdownEditor extends StatelessWidget {
  final TextEditingController controller;
  const MarkdownEditor({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // https://dev.to/dooven/building-a-simple-markdown-editor-with-flutter-4oi9
    void surroundTextSelection(String left, String right) {
      final currentTextValue = controller.value.text;
      final selection = controller.selection;
      final middle = selection.textInside(currentTextValue);
      final newTextValue =
          '${selection.textBefore(currentTextValue)}$left$middle$right${selection.textAfter(currentTextValue)}';

      controller.value = controller.value.copyWith(
        text: newTextValue,
        selection: TextSelection.collapsed(
          offset: selection.baseOffset + left.length + middle.length,
        ),
      );
    }

    return Container(
      height: kBottomNavigationBarHeight,
      color: Colors.black26,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          IconButton(
            tooltip: 'Bold',
            onPressed: () => surroundTextSelection(
              '**',
              '**',
            ),
            icon: const Icon(Icons.format_bold),
          ),
          IconButton(
            tooltip: 'Italics',
            onPressed: () => surroundTextSelection(
              '__',
              '__',
            ),
            icon: const Icon(Icons.format_italic),
          ),
          IconButton(
            tooltip: 'Strikethrough',
            onPressed: () => surroundTextSelection(
              '~~',
              '~~',
            ),
            icon: const Icon(Icons.strikethrough_s_rounded),
          ),
          IconButton(
            tooltip: 'Link',
            icon: const Icon(Icons.link_sharp),
            onPressed: () => surroundTextSelection(
              '[title](https://',
              ')',
            ),
          ),
          IconButton(
            tooltip: 'Image Link',
            icon: const Icon(Icons.image),
            onPressed: () => surroundTextSelection(
              '![](https://',
              ')',
            ),
          ),
          IconButton(
            tooltip: 'Quote',
            icon: const Icon(Icons.format_quote),
            onPressed: () => surroundTextSelection(
              '`',
              '`',
            ),
          ),
          IconButton(
            tooltip: 'Title',
            icon: const Icon(Icons.title),
            onPressed: () => surroundTextSelection(
              '##',
              '',
            ),
          ),
          IconButton(
            tooltip: 'List',
            icon: const Icon(Icons.list),
            onPressed: () => surroundTextSelection(
              '\n- ',
              '',
            ),
          ),
        ],
      ),
    );
  }
}
