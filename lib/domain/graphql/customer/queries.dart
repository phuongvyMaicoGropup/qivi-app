var allCustomerQuery = '''
query{
  users{
    id 
    address
    name
    phoneNumber
  }
}
''';

var customerSelectQuery = '''
query{
  users{
    id
    name
  }
}
''';

var detailCustomerQuery = r'''
query($customerId: String!){
  bills: allBillByCustomer(customerId: $customerId){
    id
    created
    lastUpdated
    isSuccess
    total 
    amountOwed
  }
  user : userById (userId: $customerId){
    id
    name
    phoneNumber
    address
  }
}
''';
