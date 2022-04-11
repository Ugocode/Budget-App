import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;
  const BarChart({Key key, this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;

    //create a loop to get the expenses:
    expenses.forEach(((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    }));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Weekly  Spending',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back),
              SizedBox(
                width: 10,
              ),
              Text(
                'Nov 12, 2022 - Nov 16 2022',
                style: TextStyle(fontSize: 16, letterSpacing: 1.2),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.arrow_forward),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                label: 'Sun',
                amountSpent: expenses[0],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Mon',
                amountSpent: expenses[1],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Tue',
                amountSpent: expenses[2],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Wed',
                amountSpent: expenses[3],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Thu',
                amountSpent: expenses[4],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Fri',
                amountSpent: expenses[5],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Sat',
                amountSpent: expenses[6],
                mostExpensive: mostExpensive,
              ),
            ],
          )
        ],
      ),
    );
  }
}

//create a class model for the bars:
class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 100.0;

  const Bar({Key key, this.amountSpent, this.label, this.mostExpensive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;

    return Column(
      children: [
        Text('\$${amountSpent.toStringAsFixed(2)}'),
        SizedBox(
          height: 10,
        ),
        Container(
          height: barHeight,
          width: 10.0,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(label),
      ],
    );
  }
}
