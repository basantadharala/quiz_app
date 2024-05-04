import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/question_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (data) => SummryItem(itemData: data),
          )
              .toList(),
        ),
      ),
    );
  }
}
