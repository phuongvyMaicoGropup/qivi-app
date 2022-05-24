
String addCustomer = '''
mutation(\$name: String! , \$phoneNumber: String! , \$address: String!){
  createUser (name: \$name, phoneNumber: \$phoneNumber, address: \$address) {
    id 
    phoneNumber
  }
}
''';

// ...


