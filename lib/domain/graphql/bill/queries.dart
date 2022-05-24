const allBillQuery = '''
query{
  bills : allBill{
    id
    created
    isSuccess
    lastUpdated
    total
    invoice
    note
    amountOwed
    customerId
    userInfo {
      id
      name 
      phoneNumber
      address
    }
  }
}''';

const billsWithPagination = r'''
query($skip : Int!, $take : Int!){
  billsWithPagination(skip: $skip, take: $take){
    bills: items{
      id
    created
    isSuccess
    lastUpdated
    total
    invoice
    note
    amountOwed
    customerId
    userInfo {
      id
      name 
      phoneNumber
      address
    }

    }
    pageInfo {
      hasNextPage
      
    
    }
  }
}



''';
const notDoneBill = r'''
query{
  allBill(where: {
    isSuccess: {
      eq: false
    }
  }){
    id 
    userInfo {
      name
    }
    total 
  }
}

''';

var billByIdQuery = r'''
query($id :String!){
  billById (id: $id){
    id
    userInfo {
      name
      phoneNumber 
      id
      address
    }
    created
    lastUpdated
    total
    invoice
    note 
    amountOwed
    isSuccess
    
  } 
}
''';

final filterBillQuery = r'''
query($isSuccess: Boolean!, 
$isOwed : Decimal!
 ){
  allBill(where: {
    isSuccess: {
      eq: $isSuccess,
    },
    amountOwed :{
      gt : $isOwed
    }
  }){
    id
    created
    isSuccess
    lastUpdated
    total
    invoice
    note
    amountOwed
    customerId
    userInfo {
      id
      name 
      phoneNumber
      address
    }
  }
}''';
