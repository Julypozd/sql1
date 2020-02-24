require 'sqlite3'
#create a users table with a primary key, an email, and a password.   
#Then, the program should insert several records into that table, do a select to retrieve the records, and print out the resulting array.  

if File.exists?("maindata.db")
  File.delete("maindata.db")
end

db = SQLite3::Database.new("maindata.db")

db.execute <<-SQL
    create table users(
      id integer primary key,
      email varchar,
      password varchar);
  SQL
#Insert into 

db.execute("insert into users(email, password) values(?, ?)", ["one@example.com", "password1"])
db.execute("insert into users(email, password) values(?, ?)", ["two@example.com", "password2"])
db.execute("insert into users(email, password) values(?, ?)", ["three@example.com", "password3"])
db.execute("insert into users(email, password) values(?, ?)", ["four@example.com", "password4"])
db.execute("insert into users(email, password) values(?, ?)", ["five@example.com", "password5"])

#Select from 
result = db.execute("Select * from users;")
puts result