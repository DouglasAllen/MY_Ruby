# p080dbconnect.rb
# gem install mysl2

require 'active_record'

ActiveRecord::Base.establish_connection(
adapter: "mysql2",
host: "localhost",
database: "students",
password: "root"
)

class Rubyist < ActiveRecord::Base
end

Rubyist.create(name: 'Mitali Talim', city: "Nashville, Tenessee")
Rubyist.create(name: 'Sunil Kelkar', city: "Pune, India")
Rubyist.create(name: 'Adam Smith', city: "San Fransisco, USA")


participant = Rubyist.find(:all)
participant.each {|participant| puts %Q{#{participant.name} stays in #{participant.city}}}

Rubyist.delete_all(name: 'Mitali Talim', city: "Nashville, Tenessee")
Rubyist.delete_all(name: 'Sunil Kelkar', city: "Pune, India")
Rubyist.delete_all(name: 'Adam Smith', city: "San Fransisco, USA")

=begin
Copyright (c) 2000, 2013, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE students;
Query OK, 1 row affected (0.03 sec)

mysql> SHOW TABLES;
ERROR 1046 (3D000): No database selected
mysql> USE students;
Database changed
mysql> SHOW TABLES;
Empty set (0.00 sec)

mysql> CREATE TABLE rubyists (name VARCHAR(50), city VARCHAR(50));
Query OK, 0 rows affected (0.28 sec)


mysql> SHOW TABLES;
+--------------------+
| Tables_in_students |
+--------------------+
| rubyists           |
+--------------------+
1 row in set (0.00 sec)


mysql> DESCRIBE rubyists;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(50) | YES  |     | NULL    |       |
| city  | varchar(50) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

SELECT * FROM rubyists;
=end