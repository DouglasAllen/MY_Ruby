# Melissa's address
melissa_addr = {
	"street" => "23 St George St.",  
	"city"   => "Silver Spring",
	"state"  => "MD",
	"zip"    => "20465"
}

# Sandy's address
sandy_addr = {
	"street" => "324 Campus Dr.",
	"city"   => "College Park",
	"state"  => "MD",
	"zip" 	 => "23659"
}

# Joe's address
joe_addr = {
	"street" => "43 Main St. W",
	"city"   => "Washington",
	"state"  => "DC",
	"zip"    => "29847"
}

# --------------------------------------------

# Joe
joe = {
	"first name" => "Joe",
	"last name"  => "Smith",
	"phone"	     => "(301) 345-9837",
	"address"    => joe_addr
}

# Melissa
melissa = {
	"first name" => "Melissa",
	"last name"  => "Adams",
	"phone"      => "(301) 364-8924",  
	"address"    => melissa_addr
}

# Sandy
sandy = {
	"first name" => "Sandy",
	"last name"  => "Koh",
	"phone"      => "(301) 354-2975",
	"address"    => sandy_addr
}

# ----------------------------------

addressbook = [ melissa, joe, sandy ]  

addressbook.each do |person|

    #  Name and phone.
    first = person["first name"]  
    last  = person["last name"]
    phone = person["phone"]

    puts first + " " + last + ":"
    puts "    " + phone


    # Address
    street = person["address"]["street"]
    city   = person["address"]["city"]
    state  = person["address"]["state"]
    zip    = person["address"]["zip"]

    puts "    " + street
    puts "    " + city
    puts "    " + state + ", " + zip


    # A blank line to sepparate entries.
    puts ""
end

