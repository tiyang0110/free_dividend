import 'package:flutter/material.dart';
import 'package:free_dividend/models/stock.dart';
import 'package:free_dividend/utils/formatter.dart';

class HomeScreen extends StatelessWidget {
  final List<StockModel> stocks = [
    // StockModel(name: '삼성전자', principal: 3500, dividend: 1350),
    // StockModel(name: 'KT&G', principal: 3000, dividend: 1350),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double totalDividend = stocks.fold(0, (sum, stock) => sum + stock.dividend);
    final double totalPrincipal = stocks.fold(0, (sum, stock) => sum + stock.principal);
    final String recoveryRate = (totalDividend / totalPrincipal * 100).toStringAsFixed(1);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('나의배당기록')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('총 회수율: $recoveryRate', style: TextStyle(fontSize: 20)),
                Text('$totalDividend / $totalPrincipal', style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height: 20),
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(color: Colors.amber.shade50),
                child: ListView.builder(
                  itemCount: stocks.length,
                  itemBuilder: (context, index) {
                    final stock = stocks[index];
                    final rate = stock.dividend / stock.principal;

                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: index % 2 == 0 ? Colors.blue[50] : Colors.green[50],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(stock.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('회수율: ${(rate * 100).toStringAsFixed(1)}%'),
                          Text('누적배당: ${formatWithCommas(stock.dividend)}'),
                          const SizedBox(height: 8),
                          LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(5),
                            value: stock.recoveryRate,
                            minHeight: 10,
                            backgroundColor: Colors.grey[300],
                            color: index % 2 == 0 ? Colors.blue : Colors.green,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {}, label: Text('종목추가'), icon: Icon(Icons.add)),
    );
  }
}
