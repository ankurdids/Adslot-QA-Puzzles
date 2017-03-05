# Build your comprehensive validation function here!
# Feel free to use any third party librarys from NPM (http://npmjs.org) for data validation.



exports.validate = (data) ->

  # This Block will check the ID
  ############################################ TEST CASES FOR ID ############################################
  # Test Case 1 :- Check the Negative Value
  if data.id < 0 then return false
  
  # Test Case 2 :- Check for the Null, Undefined values
  if !data.id  then return false

  # Test Case 3 :- Check for the Data Type of the Id
  # Test Case 4 :- Check for the Float Type of the Id
  if !Number.isInteger data.id then return false

  # Test Case 5 :- Check for the value of the Id is 0(ZERO)
  if  data.id is 0 then return false
############################################ TEST CASES FOR ID ############################################ 
 
  
  # This Block will check Name
  ############################################ TEST CASES FOR NAME ############################################
  # Test Case 6 :- Check for the type of Name
  # Test Case 7 :- Check for the type of Name
  if typeof data.name isnt 'string' then return false
  
  # Test Case 8 :- Check for the length of the Name
  # Min. 2 Char Name is made mandatory.
  
  # Test Case 9 :- Check for the Null, Undefined values in Name
  if data.name is '' then return false

  # Test Case 8/10/11 :- Check for the Numerical/Special Characters values in Name
  if !/^([A-Z ]){2,63}$/i.test data.name  then return false
  ############################################ TEST CASES FOR NAME ############################################
  
  
  # This Block will check Email
  ############################################ TEST CASES FOR FIELD EMAIL START ############################################
  # Test Case 12/13/14 :- Check for the Special Characters values in EMAIL

  if !/^(([^<>~()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test data.email then return false

  # Test Case 15 :- Check for the length of EMAIL
  if  data.email.length > 255 then return false
   	
  ############################################ TEST CASES FOR FIELD EMAIL END ############################################
  
  
  # This Block will check Color
  ############################################ TEST CASES FOR COLOR START ############################################
  # Test Case 17 :- Check for the length of EMAIL
  if !/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/i.test data.favouriteColour then return false

  # Test Case 18 :- Check for the type of EMAIL
  # Test Case 19 :- Check for the type of EMAIL
  if typeof data.favouriteColour isnt 'string' then return false

  ############################################ TEST CASES FOR COLOR END ############################################

  ############################################ TEST CASES FOR TAX RATE START ############################################
  
   # Test Case 20 :- Check for > 1 Value
   # Test Case 21 :- Check for < 0 Value
  if  data.taxRate  > 1 or data.taxRate < 0 then return false
  # Value 0 and 1 is taken float since they are the boundary values.
  # Test Case 22 :- Check for  0 Value OR Check for 1 Value
  if  data.taxRate is 0 or data.taxRate is 1  then return true

  # Test Case 23 :- Check for Undefined value
  if  !data.taxRate   then return false

  # Test Case 24 :- Check for Integer Values
  if   Number.isInteger data.taxRate     then return false



  ############################################ TEST CASES FOR TAX RATE END ############################################

  ############################################ TEST CASES FOR INTERESTS START ############################################
  
  # Test Case 25 :- Check for Number of INTERESTS
  if    data.interests.length > 4     then return false
  
  # Test Case 26 :- Check for 31 CHAR LIMIT
  shortNames = (name for name in data.interests when name.length > 31)
  if shortNames.length > 0 then return false;

  # Test Case 27 :- Check for an ARRAY
  if !Array.isArray data.interests  then return false;

  ############################################ TEST CASES FOR TAX INTERESTS END ############################################

  ############################################ SMOKE TEST ############################################
  # Test Case 28 :- Check for any additional wrong input
  if data.length > 6 then return false;

  ############################################ SMOKE TEST ############################################


  return true
