const addBillMutation = ''' 
mutation(\$note : String! , \$amountOwed: Decimal!, \$total: Decimal!, \$customerId: String! , \$invoice : String!   ){
  createBill (note: \$note, amountOwed: \$amountOwed, total: \$total, customerId: \$customerId, invoice: \$invoice ) {
    id
    userInfo {
      name
      phoneNumber
    }
  }
}
''';

const updateBillMutation = '''
mutation(
  \$id: String!,
  \$customerId: String!,
  \$invoice: String!,
  \$isSuccess: Boolean!,
  \$note: String!,
  \$lastUpdated: DateTime!,
  \$created: DateTime!,
  \$total: Decimal!,
  \$amountOwed: Decimal!,
){
  updateBillAsync (bill: {
    id: \$id, 
  customerId : \$customerId,
  invoice: \$invoice,
  isSuccess: \$isSuccess,
  note: \$note,
  lastUpdated: \$lastUpdated,
  created: \$created,
  total:\$total, 
  amountOwed: \$amountOwed,
  }){
    id
  }
}
''';
