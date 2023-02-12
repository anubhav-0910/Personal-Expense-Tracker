import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double total_spend_percent;
  ChartBar(this.label, this.spendingAmount, this.total_spend_percent);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraint) {
        return Column(
          children: [
            Container(
                height: constraint.maxHeight * 0.15,
                child: FittedBox(
                    child: Text('\₹${spendingAmount.toStringAsFixed(0)}'))),
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
            Container(
              height: constraint.maxHeight * 0.63,
              width: 8,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 255, 0, 0), width: 0.6),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: total_spend_percent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.03,
            ),
            Container(
              height: constraint.maxHeight * 0.14,
              child: FittedBox(
                child: Text(
                  label,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
