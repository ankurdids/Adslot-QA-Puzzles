assert   = require 'assert'
{validate} = require '../lib'



describe '07-validation', ->

      ############################################ TEST CASES FOR VALID VALUES START #########################################
  it 'should return `true` for valid data (Test Case 0 : SMOKE TEST)', ->
    assert validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]
      ############################################# TEST CASES FOR VALID VALUES END #########################################

      ############################################ TEST CASES FOR FIELD ID START ############################################

  it 'should return `false` for invalid data: id (Test Case 1 : Negative Value)', ->
    assert !validate
      id: -5 # <--- problem
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]


  it 'should return `false` for invalid data: id (Test Case 2 : Undefined Value)', ->
    assert !validate
      id:''
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

   it 'should return `false` for invalid data: id (Test Case 3 : String Value)', ->
    assert !validate
      id:'aa'
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

   it 'should return `false` for invalid data: id (Test Case 4 : Float Value)', ->
    assert !validate
      id:1.5
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

# This is a special case it will depend on the requirement
# Id can  not be 0
   it 'should return `false` for invalid data: id (Test Case 5 :  Id can not be 0)', ->
    assert !validate
      id:0
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

	############################################ TEST CASES FOR FIELD ID END ############################################

	############################################ TEST CASES FOR FIELD NAME START ############################################
  it 'should return `false` for invalid data: name (Test Case 6 : Non String Integer Value)', ->
    assert !validate
      id: 1
      name: 2 # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

   it 'should return `false` for invalid data: name (Test Case 7 : Non String Float Value)', ->
    assert !validate
      id: 1
      name: 2.0 # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

   it 'should return `false` for invalid data: name (Test Case 8 : Check the length of Name)', ->
    assert !validate
      id: 1
      name: 'ABCDEFGHIJKLMNOPQERSTUVWXYZabcdefghijklmnopqrstuvwxyzPQRTSUVWXYZ' # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

   it 'should return `false` for invalid data: name (Test Case 9 : Check if Name is Provided)', ->
    assert !validate
      id: 1
      name: '' # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

#  This Case depends on the requirements but Name must not contain only digit  
   it 'should return `false` for invalid data: name (Test Case 10 : Numerical Values in the Name are Provided)', ->
    assert !validate
      id: 1
      name: "1234356" # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

 #  This Case depends on the requirements but Name must not contain only digit  
   it 'should return `false` for invalid data: name (Test Case 11 : Special Char in the Name are Provided)', ->
    assert !validate
      id: 1
      name: "A@N_K#U&R" # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]
	############################################ TEST CASES FOR NAME END ############################################

	############################################ TEST CASES FOR EMAIL START  ############################################
  
  it 'should return `false` for invalid data: email (Test Case 12 : Invalid EMAIL Format is Provided)', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar@baz.com' # <--- problem
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

   it 'should return `false` for invalid data: email (Test Case 13 : NO EMAIL is Provided)', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: '' # <--- problem
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

   it 'should return `false` for invalid data: email (Test Case 14 : Invalid Email Format is Provided)', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'ankur~didwania@gmail.com' # <--- problem
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]
   
   it 'should return `false` for invalid data: email (Test Case 15 : Invalid Email Length is Provided)', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email:'HMMNOPQERSTUVWXYZabcdefghijklmnopqrstuvwxyzPQRTSUVWXYZABCDEFGHIJKLMNOPQERSTUVWXYZabcdefghijklmnopqrstuvwxyzPQRTSUVWXYZABCDEFGHIJKLMNOPQERSTUVWXYZabcdefghijklmnopqrstuvwxyzPQRTSUVWXYZABCDEFGHIJKLMNOPQERSTUVWXYZabcdefghijklmnopqrstuvwxyzPQRTSUVWXYZ@gmail.com' # <--- problem
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]
  

	############################################ TEST CASES FOR EMAIL END ############################################

	############################################ TEST CASES FOR COLOR START ############################################

  it 'should return `false` for invalid data: favouriteColour (Test Case 16 : Invalid COLOR CODE is Provided', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccffx' # <--- problem
      interests: ["cycling", "programming"]


  it 'should return `false` for invalid data: favouriteColour (Test Case 17 : Non String Integer Color Value)', ->
    assert !validate
      id: 1
      name: "Ankur" 
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: 1
      interests: ["cycling", "programming"]

   it 'should return `false` for invalid data: favouriteColour (Test Case 18 : Non String Float Color Value)', ->
    assert !validate
      id: 1
      name: "Didwania"
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: 2.0
      interests: ["cycling", "programming"]

   it 'should return `false` for invalid data: favouriteColour (Test Case 19 : Color Value not provided)', ->
    assert !validate
      id: 1
      name: "Didwania"
      email: 'foo@bar.com'
      taxRate: 0.1
      interests: ["cycling", "programming"]

	############################################ TEST CASES FOR COLOR END ############################################

	############################################ TEST CASES FOR TAX RATE START ############################################
   
   it 'should return `false` for invalid data: taxRate (Test Case 20 : Tax Rate value > 1)', ->
    assert !validate
      id: 1
      name: 'Ankur'
      email: 'foo@bar.com'
      taxRate: 1.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

   it 'should return `false` for invalid data: taxRate (Test Case 21 : Tax Rate < 0)', ->
    assert !validate
      id: 1
      name: 'Ankur'
      email: 'foo@bar.com'
      taxRate: -.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

   it 'should return `true` for invalid data: taxRate (Test Case 22 : Tax Rate = 0)', ->
    assert validate
      id: 1
      name: 'Ankur'
      email: 'foo@bar.com'
      taxRate: 0.0
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

   it 'should return `true` for invalid data: taxRate (Test Case 23 : Tax Rate = 1)', ->
    assert validate
      id: 1
      name: 'Ankur'
      email: 'foo@bar.com'
      taxRate: 1.0
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

   it 'should return `false` for invalid data: taxRate (Test Case 24 : Tax Rate not specified)', ->
    assert !validate
      id: 1
      name: 'Ankur'
      email: 'foo@bar.com'
      taxRate: ''
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

   it 'should return `false` for invalid data: taxRate (Test Case 25 : Tax Rate is integer)', ->
    assert !validate
      id: 1
      name: 'Ankur'
      email: 'foo@bar.com'
      taxRate: 2
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

	############################################ TEST CASES FOR TAX RATE END ############################################

	############################################ TEST CASES FOR INTERESTS START ############################################
	
   it 'should return `false` for invalid data: Interest (Test Case 26 : More then 4 Interest)', ->
    assert !validate
      id: 1
      name: 'Ankur'
      email: 'foo@bar.com'
      taxRate: 2
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming", "Sleeping", "Running", "Invalid"]

   it 'should return `false` for invalid data: Interest (Test Case 27 : More then 31 Char)', ->
    assert !validate
      id: 1
      name: 'Ankur'
      email: 'foo@bar.com'
      taxRate: 2
      favouriteColour: '#ccccff'
      interests: ["cyclingcyclingcyclingcycling12345", "programming", "Sleeping"]

   it 'should return `false` for invalid data: Interest (Test Case 27 : Check for Interests array)', ->
    assert !validate
      id: 1
      name: 'Ankur'
      email: 'foo@bar.com'
      taxRate: 2
      favouriteColour: '#ccccff'
      interests: 1234

   it 'should return `false` for invalid data: Interest (Test Case 28 : Optional Array)', ->
    assert !validate
      id: 1
      name: 'Ankur'
      email: 'foo@bar.com'
      taxRate: 2
      favouriteColour: '#ccccff'
      interests:''

	############################################ TEST CASES FOR INTERESTS END ############################################

	############################################ TEST CASES FOR SMOKE TEST ############################################
   
       # Will add more cases 

  # !!!!!
  # Add more tests for different data that users might try to provide!
  # !!!!!
