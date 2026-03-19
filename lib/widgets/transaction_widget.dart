import 'package:budget_tracker/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionModel transactionModel;
  const TransactionWidget({super.key, required this.transactionModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: transactionModel.transactionType.name.toLowerCase() == 'income' ? Colors.green[200] : Colors.red[200],
            child: Icon(
              transactionModel.transactionType.name.toLowerCase() == 'income' ? Icons.trending_up : Icons.trending_down,
              color: transactionModel.transactionType.name.toLowerCase() == 'income' ? Colors.green : Colors.red,
            ),
          ),
          // const SizedBox(
          //   width: 10,
          // ),
          Column(
            crossAxisAlignment: .start,
            mainAxisSize: .min,
            children: [
              Text(
                transactionModel.title,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                transactionModel.category.name,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${DateFormat.yMMMd().format(transactionModel.date)} at ${transactionModel.date.hour}:${transactionModel.date.minute}',
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          Text(
            '${transactionModel.transactionType == TransactionType.income ? '+\$' : '-\$'}${transactionModel.amount}',
            style: GoogleFonts.poppins(
              color: transactionModel.transactionType.name.toLowerCase() == 'income' ? Colors.greenAccent : Colors.redAccent,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
