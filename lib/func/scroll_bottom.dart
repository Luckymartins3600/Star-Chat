import 'package:flutter/material.dart';

void scrollToBottom(ScrollController scrollController) {
  Future.delayed(
    const Duration(milliseconds: 300),
    () {
      print(scrollController.position.maxScrollExtent);
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    },
  );
}
