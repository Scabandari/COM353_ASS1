DROP DATABASE db;
CREATE DATABASE db;
USE db;

CREATE TABLE IF NOT EXISTS Department(
    id INT UNSIGNED AUTO_INCREMENT NOT NULL, 
    name VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
    ) ENGINE=INNODB;
    
    
INSERT INTO Department (name) VALUES ("Development");
INSERT INTO Department (name) VALUES ("QA");
INSERT INTO Department (name) VALUES ("UI");
INSERT INTO Department (name) VALUES ("Design");
INSERT INTO Department (name) VALUES ("Business Intelligence");
INSERT INTO Department (name) VALUES ("Networking");

CREATE TABLE IF NOT EXISTS Contract_type(
    id INT(6) UNSIGNED AUTO_INCREMENT, 
    name VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
    ) ENGINE=INNODB;
    
    
INSERT INTO Contract_type (name) VALUES ("Premium"); 
INSERT INTO Contract_type (name) VALUES ("Gold");  
INSERT INTO Contract_type (name) VALUES ("Diamond");  
INSERT INTO Contract_type (name) VALUES ("Silver");     

CREATE TABLE IF NOT EXISTS Company(
     id INT UNSIGNED AUTO_INCREMENT NOT NULL,
     name VARCHAR(30) NOT NULL,
     phone_number VARCHAR(15) NOT NULL, # human readable form, count # of digits??
     email VARCHAR(30) NOT NULL,  # email-id?? should be primary key??
     city VARCHAR(30) NOT NULL,
     province VARCHAR(30) NOT NULL,  # should be own table? QC vs Quebec, spelling errors etc.
     postal_code CHAR(7) NOT NULL,
     PRIMARY KEY (id)
) ENGINE=INNODB;


INSERT INTO Company(name, phone_number, email, city, province, postal_code) 
    VALUES("Bobs Plumbing", "1 514 345 7711", "bobs@plubming.com", "Montreal", "QC", "H4G 2F7");
    
INSERT INTO Company(name, phone_number, email, city, province, postal_code) 
    VALUES("Jims Shirt Locker", "1 902 783 2655", "jims@hurtlocker.com", "Antigonish", "N.S", "H2V 2J1");
    
INSERT INTO Company(name, phone_number, email, city, province, postal_code) 
    VALUES("The Wheel Pizza", "1 902 863 2155", "thewheel@yahoo.com", "Antigonish", "N.S", "H2V 3N7");
    
INSERT INTO Company(name, phone_number, email, city, province, postal_code) 
    VALUES("Electronic Box", "1 514 863 7142", "ebox@gmail.com", "Montreal", "QC", "H4K 1E2");
    
INSERT INTO Company(name, phone_number, email, city, province, postal_code) 
    VALUES("GSC Corporation", "1 514 803 5642", "gdc@gmail.com", "Montreal", "QC", "H4K 1N7");

CREATE TABLE IF NOT EXISTS Responsible (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    middle_initial CHAR(1) NOT NULL,
    company_id INT UNSIGNED,
    PRIMARY KEY(id),
    INDEX(company_id),
    FOREIGN KEY (company_id) REFERENCES Company(id)
) ENGINE=INNODB;
     

INSERT INTO Responsible(first_name, last_name, middle_initial, company_id) 
    VALUES("Horse", "Bo-Jackman", "B", 1);  
    
INSERT INTO Responsible(first_name, last_name, middle_initial, company_id) 
    VALUES("Ben", "Smith", "C", 2); 
    
INSERT INTO Responsible(first_name, last_name, middle_initial, company_id) 
    VALUES("Ryan", "Nichols", "B", 3);
    
INSERT INTO Responsible(first_name, last_name, middle_initial, company_id) 
    VALUES("Wanda", "Brides", "F", 4);
    
INSERT INTO Responsible(first_name, last_name, middle_initial, company_id) 
    VALUES("Point", "Man", "Z", 5);  
    
        
CREATE TABLE IF NOT EXISTS Employee(
    id INT UNSIGNED AUTO_INCREMENT, 
    name VARCHAR(30) NOT NULL,
    is_manager BOOL NOT NULL DEFAULT False,  
    department_id INT UNSIGNED,
    PRIMARY KEY(id),
    INDEX(department_id),
    FOREIGN KEY (department_id) REFERENCES Department(id) 
) ENGINE=INNODB;


#################################################
# Managers
###################################################
# ANSWER: Part-2 d. 2
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Juan Vasquez", True, 1);
######################################################
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Fred Flintstone", True, 2);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Ellen Degeneress", True, 3);
    
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Max Patches", True, 4);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Winen Spririts", True, 5);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Jim Carey", True, 6);
   
   
#####################################################
# this team has 10 developers and is managed by Juan
# managed by him since he is the manager of
# their department
#####################################################
## THIS IS THE DEVELOPMENT DEPARTMENT
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Geoff Stowe", False, 1);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Brian Hulbert", False, 1);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Sarah Mattie", False, 1);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Billy Bush", False, 1);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Nina Simone", False, 1);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("The Rock", False, 1);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Bill Nye", False, 1);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Mr. Dressup", False, 1);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Blair Nichols", False, 1);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Britney Spears", False, 1);
    
###################################################
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Ben Stiller", False, 2);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Bill Schruder", False, 2);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Tom McGhee", False, 2);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Jen Staffer", False, 3);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Wayne Cassey", False, 3);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Oprah Winfrey", False, 3);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Charles Hudon", False, 4);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Turtle Neck", False, 4);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Carey Price", False, 4);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Jim Bean", False, 5);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Johhny Walker", False, 5);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Glassov Gynn", False, 5);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Hotly Contested", False, 6);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Laura Laundry", False, 6);
    
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Mack McFuddster", False, 6);
    

CREATE TABLE IF NOT EXISTS Service_type(
    id INT(6) UNSIGNED AUTO_INCREMENT, 
    name CHAR(11),
     PRIMARY KEY(id)
) ENGINE=INNODB;
    

INSERT INTO Service_type (name) VALUES ("On premises");
INSERT INTO Service_type (name) VALUES ("Cloud");

    
CREATE TABLE IF NOT EXISTS Contract (
    id INT UNSIGNED AUTO_INCREMENT, 
    company_id INT UNSIGNED,
    responsible_id INT UNSIGNED,
    acv int (10) NOT NULL,
    initial_amount DOUBLE(10, 2),  # 10 digits total, 2 for decimal
    start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    service_type INT UNSIGNED,
    contract_type INT UNSIGNED,
    manager_id INT UNSIGNED,
    PRIMARY KEY(id),
    INDEX(service_type),
    INDEX(contract_type),
    INDEX(company_id),
    INDEX(manager_id),
    INDEX(responsible_id),
    FOREIGN KEY(service_type) REFERENCES Service_type(id),
    FOREIGN KEY(contract_type) REFERENCES Contract_type(id),
    FOREIGN KEY(company_id) REFERENCES Company(id),
    FOREIGN KEY(responsible_id) REFERENCES Responsible(id),
    FOREIGN KEY(manager_id) REFERENCES Employee(id)
) ENGINE=INNODB;

# Query for dates from timestamp like so:
# SELECT DATE(start_date) FROM Contract;
# More here: 
# https://stackoverflow.com/questions/3696778/create-table-fail-in-mysql-when-using-curdate-as-default#3696802

# This table handles the many to many relationship Employees => Contracts
CREATE TABLE IF NOT EXISTS Contract_worker (
    id INT UNSIGNED AUTO_INCREMENT,
    employee_id INT UNSIGNED,
    contract_id INT UNSIGNED,
    PRIMARY KEY(id),
    INDEX(employee_id),
    INDEX(contract_id),
    FOREIGN KEY(employee_id) REFERENCES Employee(id),
    FOREIGN KEY (contract_id) REFERENCES Contract(id)
);


# Create some contracts and dont forget to also create 
# Create contract workers entry as well
INSERT INTO Contract(
    company_id, 
    responsible_id, 
    acv, 
    initial_amount, 
    service_type,
    contract_type, 
    manager_id
    ) VALUES(
    1,
    1,
    85000,
    10000,
    1,
    2,
    1);
    
# Now Add some Employee from Juans dept for this contract
INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Geoff Stowe"), 1);

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Brian Hulbert"), 1);    

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Sarah Mattie"), 1);  


###########################################
# Answer to Part-2 d. 1
###########################################
INSERT INTO Contract(
    company_id,
    responsible_id,
    acv,
    initial_amount,
    service_type,
    contract_type, 
    manager_id
    ) VALUES(
    5,
    5,
    90000,
    10000,
    1,
    3,
    1);
#################################################

# Now Add some Employee from Juans dept for this contract
# Since the Manager id number and the Department id numbers align

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Billy Bush"), 2);

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Nina Simone"), 2);    

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "The Rock"), 2);  
    
INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Bill Nye"), 2);      
    
    
#####################################################################
# Now another random contact 

INSERT INTO Contract(
    company_id,
    responsible_id,
    acv,
    initial_amount,
    service_type,
    contract_type, 
    manager_id
    ) VALUES(
    1,
    1,
    95000,
    12000,
    1,
    4,
    1); # Juans dept
    
# Now Add some Employee from dept 1 for this contract which is the 3rd contract
# Since the Manager id number and the Department id numbers align

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Ben Stiller"), 3);

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Bill Schruder"), 3);    

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Tom McGhee"), 3);  
    
INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Jen Staffer"), 3);  
    
#####################################################################
# Now another random contract 

INSERT INTO Contract(
    company_id,
    responsible_id,
    acv,
    initial_amount,
    service_type,
    contract_type, 
    manager_id
    ) VALUES(
    3,
    (SELECT id FROM Responsible WHERE company_id = 3),
    65000,
    7000,
    2,
    1,
    3); 
    
# Now Add some Employee from dept 3 for this contract which is the 4th contract
# Since the Manager id number and the Department id numbers align

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Jen Staffer"), 4);

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Wayne Cassey"), 4);    

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Oprah Winfrey"), 4);  
    
INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Charles Hudon"), 4);  
    
    
#####################################################################
# Now another random contract 

INSERT INTO Contract(
    company_id,
    responsible_id,
    acv,
    initial_amount,
    service_type,
    contract_type, 
    manager_id
    ) VALUES(
    5,
    (SELECT id FROM Responsible WHERE company_id = 5),
    100000,
    20000,
    1,
    4,
    1); 
    
# Now Add some Employee from dept 1 for this contract which is the 5th contract
# Since the Manager id number and the Department id numbers align

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "The Rock"), 5);

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Bill Nye"), 5);    

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Mr. Dressup"), 5);  
    
INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Britney Spears"), 5); 
    
    
    
#####################################################################
# Now another random contract 

INSERT INTO Contract(
    company_id,
    responsible_id,
    acv,
    initial_amount,
    service_type,
    contract_type, 
    manager_id
    ) VALUES(
    4,
    (SELECT id FROM Responsible WHERE company_id = 4),
    100000,
    20000,
    1,
    2,
    4); 
    
# Now Add some Employee from dept 4 for this contract which is the 6th contract
# Since the Manager id number and the Department id numbers align

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Charles Hudon"), 6);

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Turtle Neck"), 6);    

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Carey Price "), 6);  
    
    
#####################################################################
# Now another contract for Juan

INSERT INTO Contract(
    company_id,
    responsible_id,
    acv,
    initial_amount,
    service_type,
    contract_type, 
    manager_id
    ) VALUES(
    3,
    (SELECT id FROM Responsible WHERE company_id = 3),
    200000,
    20000,
    1,
    4,
    1); # Juans dept
    
# Now Add some Employee from dept 1 for this contract which is the 3rd contract
# Since the Manager id number and the Department id numbers align

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Ben Stiller"), 7);

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Nina Simone"), 7);    

INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Mr. Dressup"), 7);  
    
INSERT INTO Contract_worker (employee_id, contract_id) VALUES (
    (SELECT id FROM Employee WHERE name LIKE "Britney Spears"), 7);  
    
#######################################################################
# ASSIGNMENT 1 STARTS HERE
#####################################################################

# Q-1
# The development department has a primary key of 1

SELECT DISTINCT Employee.id, Employee.name FROM Employee, Department WHERE
    Employee.department_id = 
    (SELECT Department.id FROM Department WHERE Department.name LIKE "%Development%");
    
    
# Q-2
# We need to add a Company Nike
INSERT INTO Company(name, phone_number, email, city, province, postal_code) 
    VALUES("Nike", "1 800 347 NIKE", "help@nike.com", "Montreal", "QC", "H4M 2F7");
    
# They also need a Responsible to sign their contracts
INSERT INTO Responsible(first_name, last_name, middle_initial, company_id) 
    VALUES("Von", "Van-Showman", "B", 
    (SELECT id FROM Company WHERE name LIKE "Nike")
    );  

# Nike needs to already have a contract of type gold
INSERT INTO Contract(
    company_id,
    responsible_id,
    acv,
    initial_amount,
    service_type,
    contract_type, 
    manager_id
    ) VALUES(
    (SELECT id FROM Company WHERE Company.name LIKE "Nike"),
    (SELECT id FROM Responsible WHERE company_id = 
        (SELECT id FROM Company WHERE Company.name LIKE "Nike")),
    220000,
    20000,
    1,
    (SELECT id FROM Contract_type WHERE Contract_type.name LIKE "Gold"),
    1); # Juans dept

# Now show the company and their contracts w/ the type
SELECT Company.name AS Company_Name, Contract.id AS Contract_ID, Contract.acv AS "ACV",
    Contract_type.name AS Contract_Type FROM Company, Contract, Contract_type WHERE
    Company.name LIKE "NIKE" AND Contract.company_id LIKE 
    (SELECT Company.id FROM Company WHERE Company.name LIKE "Nike")
    AND Contract.contract_type = Contract_type.id;
    
# Now add the Diamond Contract
INSERT INTO Contract(
    company_id,
    responsible_id,
    acv,
    initial_amount,
    service_type,
    contract_type, 
    manager_id
    ) VALUES(
    (SELECT id FROM Company WHERE Company.name LIKE "Nike"),
    (SELECT id FROM Responsible WHERE company_id = 
        (SELECT id FROM Company WHERE Company.name LIKE "Nike")),
    350000,
    50000,
    1,
    (SELECT id FROM Contract_type WHERE Contract_type.name LIKE "Diamond"),
    1); # Juans id
    
# Now show Nikes contracts again
SELECT Company.name AS Company_Name, Contract.id AS Contract_ID, Contract.acv AS "ACV",
    Contract_type.name AS Contract_Type FROM Company, Contract, Contract_type WHERE
    Company.name LIKE "NIKE" AND Contract.company_id LIKE 
    (SELECT Company.id FROM Company WHERE Company.name LIKE "Nike")
    AND Contract.contract_type = Contract_type.id;
    
    
  
# Q-3
# I will return the contract signed by Nike with the latest start_date  
    

# Now I will use a similar querty to update the value of that contract
# Cant use update and order by w/ multiple tables so 
# i need to know Nikes company id, which is easy to find
SELECT id FROM Company WHERE name LIKE "Nike";

# This gives a 6 for their id

UPDATE Contract SET Contract.acv = 370000 WHERE Contract.company_id = 6
    ORDER BY Contract.start_date DESC LIMIT 1 ;
    
# Now show Nikes contracts again to see the change   
SELECT Company.name AS Company_Name, Contract.id AS Contract_ID, Contract.acv AS "ACV",
    Contract_type.name AS Contract_Type FROM Company, Contract, Contract_type WHERE
    Company.name LIKE "NIKE" AND Contract.company_id LIKE 
    (SELECT Company.id FROM Company WHERE Company.name LIKE "Nike")
    AND Contract.contract_type = Contract_type.id;
    
#Q-4
# First we need a manager David
INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("David", True, 2);

# Now we will add Prospero and set David as his manager
# First double check that we know which department David is managing
SELECT department_id FROM Employee WHERE is_manager = True AND
    name LIKE "David";

INSERT INTO Employee(name, is_manager, department_id) 
    VALUES("Prospero", False, 2);
    
# All Employees in Davids dept
SELECT * FROM Employee WHERE is_manager = False AND
    department_id = (SELECT department_id FROM Employee WHERE is_manager = True AND
        name LIKE "David");

# We need some more dummy data Contracts that include start_date


# Need to be able to override the Default timestamp for start date
INSERT INTO Contract(
    company_id, 
    responsible_id, 
    acv, 
    initial_amount, 
    start_date,
    service_type,
    contract_type, 
    manager_id
    ) VALUES(
    1,
    1,
    85000,
    10000,
    "2016-08-17 11:04:23",
    1,
    (SELECT Contract_type.id FROM Contract_type WHERE Contract_type.name LIKE "Gold"),
    1);
    
# Jims Shirt Locker has company_id =2    
INSERT INTO Contract(
    company_id, 
    responsible_id, 
    acv, 
    initial_amount, 
    start_date,
    service_type,
    contract_type, 
    manager_id
    ) VALUES(
    2,
    (SELECT Responsible.id FROM Responsible WHERE Responsible.company_id = 2),
    100000,
    10000,
    "2017-10-17 11:30:23",
    1,
    (SELECT Contract_type.id FROM Contract_type WHERE Contract_type.name LIKE "Gold"),
    1);

# The Wheel Pizza has company_id = 3
INSERT INTO Contract(
    company_id, 
    responsible_id, 
    acv, 
    initial_amount, 
    start_date,
    service_type,
    contract_type, 
    manager_id
    ) VALUES(
    3,
    (SELECT Responsible.id FROM Responsible WHERE Responsible.company_id = 3),
    100000,
    10000,
    "2017-11-15 10:30:23",
    1,
    (SELECT Contract_type.id FROM Contract_type WHERE Contract_type.name LIKE "Gold"),
    1);

# Electronic Box has company_id = 4
INSERT INTO Contract(
    company_id, 
    responsible_id, 
    acv, 
    initial_amount, 
    start_date,
    service_type,
    contract_type, 
    manager_id
    ) VALUES(
    4,
    (SELECT Responsible.id FROM Responsible WHERE Responsible.company_id = 4),
    100000,
    10000,
    "2017-12-11 11:31:23",
    1,
    (SELECT Contract_type.id FROM Contract_type WHERE Contract_type.name LIKE "Gold"),
    1);
   
 
 SELECT DISTINCT Company.name FROM Company, Contract, Contract_type WHERE 
        Company.id = Contract.company_id AND Contract.contract_type LIKE 
        (SELECT Contract_type.id FROM Contract_type WHERE Contract_type.name LIKE "Gold") AND
        Contract.start_date BETWEEN "2017-01-01 00:00:00" AND "2017-12-31 23:59:59";
        
 # We need to be able to determine the number of contracts in each year
 SELECT COUNT(c1.id) AS id_2016, COUNT(c2.id) AS id_2017 FROM 
    Contract AS c1, Contract AS c2
    GROUP BY c1.id;
    WHERE c1.start_date BETWEEN "2016-01-01 00:00:00" AND "2016-12-31 23:59:59";
    
     WHERE 
    c1.start_date BETWEEN "2016-01-01 00:00:00" AND "2016-12-31 23:59:59"
    ;
    DISTINCT c1.acv AS acv_2016
    COUNT(c1.id) AS Contract_2016, COUNT(c2.id)

