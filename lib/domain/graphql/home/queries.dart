String homeData = ''' 
query{
  allBill(where: {
    isSuccess: {
      eq: true,
    },
  }){
    total  
  }
  notDoneBills: allBill(where: {
    isSuccess: {
      eq: false,
    },
  }){
    id  
  }
  owedBills: allBill(where: {
    amountOwed : {
      eq: 0
    } 
  }){
    id  
  }

}
''';
