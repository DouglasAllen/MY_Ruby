require 'my-csv'
    data = DataRecord.make("places.txt") # Capture return value and
    list = data.read                     # call a class method on it.
    puts list[0]
    # Output:
    # <People: name=Smith, John age=35 weight=175 height=5'10>
    #~ person = list[0]
    #~ puts person.name          # Smith, John
    #~ if person.age < 18
      #~ puts "under 18"
    #~ else
      #~ puts "over 18"          # over 18
    #~ end
    #~ kg = person.weight / 2.2  # kilograms