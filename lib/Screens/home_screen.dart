import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/data/data.dart';
import 'package:flutter_budget_ui/models/category_model.dart';

import '../helpers/corolrs_helpers.dart';
import '../models/expense_model.dart';
import '../widgets/bar_charts.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildCategory(Category category, double totalAmountSpent) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CategoryScreen(category: category),
        ),
      ),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 6.0,
                offset: Offset(0, 2),
                color: Colors.black12,
              )
            ]),
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$${(category.maxAmount - totalAmountSpent).toStringAsFixed(2)} / \$${category.maxAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            final double maxBarWidth = constraints.maxWidth;
            final double percent =
                (category.maxAmount - totalAmountSpent) / category.maxAmount;
            double barWidth = percent * maxBarWidth;
            //to keep our barwidth positive value:
            if (barWidth < 0) {
              barWidth = 0;
            }
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Stack(
                children: [
                  Container(
                    height: 10,
                    // width: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Container(
                    height: 10,
                    width: barWidth,
                    decoration: BoxDecoration(
                      color: getColor(context, percent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
            );
          })
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            forceElevated: true,
            floating: true,
            //backgroundColor: Color(0xffed4c67),
            expandedHeight: 150,
            leading: IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.pink[300],
              ),
              iconSize: 30,
              onPressed: () {},
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Your Budget App',
                    style: TextStyle(
                        color: Colors.pink[300], fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              background: Image(
                image: AssetImage('assets/images/backgd.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                onPressed: (() {}),
                icon: Icon(Icons.add),
                iconSize: 30,
                color: Colors.pink[300],
              ),
            ],
          ),
          SliverList(
            delegate:
                // ignore: missing_return
                SliverChildBuilderDelegate((BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.all(10),
                  height: 260,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 6.0)
                      ]),
                  child: BarChart(expenses: weeklySpending),
                );
              } else {
                final Category category = categories[index - 1];
                double totalAmountSpent = 0;
                category.expenses.forEach((Expense expenses) {
                  totalAmountSpent += expenses.cost;
                });
                return _buildCategory(category, totalAmountSpent);
              }
            }, childCount: 1 + categories.length),
          ),
        ],
      ),
    );
  }
}
