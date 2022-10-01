import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shop_app/features/admin/models/sales.dart';

class CategoryProductChart extends StatelessWidget {
  final List<charts.Series<Sales, String>> seriesList;
  const CategoryProductChart({super.key, required this.seriesList});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: true,
    );
  }
}
