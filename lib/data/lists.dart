class Revenue{
  String? revdescription;
  double revamount;
  DateTime? revdate;

  Revenue({
    required this.revamount,
    required this.revdescription,
    required this.revdate,
  });

}

class Loans{
  String? borrowername;
  double loanamount;
  DateTime? loandate;
  bool isPaid;

  Loans({
    required this.borrowername,
    required this.loanamount,
    required this.loandate,
    this.isPaid = false,
  });
}

class Expenses{
  String? expensesdescription;
  double expensesamount;
  DateTime? expensesdate;

  Expenses({
    required this.expensesdescription,
    required this.expensesamount,
    required this.expensesdate,
  });

}