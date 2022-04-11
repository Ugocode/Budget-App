import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/helpers/corolrs_helpers.dart';
import 'package:flutter_budget_ui/models/expense_model.dart';

import '../models/category_model.dart';
import '../widgets/radial_panter.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;
  const CategoryScreen({Key key, this.category}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    //to get our circluer progressbar
    double totalAmountSpent = 0;
    widget.category.expenses.forEach((Expense expense) {
      totalAmountSpent += expense.cost;
    });
    final double amountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / widget.category.maxAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(20),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ]),
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                    bgColor: Colors.grey[200],
                    lineColor: getColor(context, percent),
                    percent: percent,
                    width: 15.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Center(
                    child: Text(
                      '\$${amountLeft.toStringAsFixed(2)} / \$${widget.category.maxAmount.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            _buildExpenses()
          ],
        ),
      ),
    );
  }

  _buildExpenses() {
    List<Widget> expenseList = [];
    widget.category.expenses.forEach((Expense expense) {
      expenseList.add(
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(offset: Offset(0, 2), blurRadius: 6.0)],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    expense.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${expense.cost.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.w600),
                  ),
                ]),
          ),
        ),
      );
    });
    return Column(
      children: expenseList,
    );
  }
}
