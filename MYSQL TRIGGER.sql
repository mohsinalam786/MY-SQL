CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    JoinDate DATE,
    TotalOrders INT DEFAULT 0
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

#1. Auto-update Total Orders
DELIMITER //
CREATE TRIGGER trg_increase_total_orders
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    UPDATE Customers
    SET TotalOrders = TotalOrders + 1
    WHERE CustomerID = NEW.CustomerID;
END;
DELIMITER ;

#2. Decrease Total Orders on Delete
DELIMITER //
CREATE TRIGGER trg_decrease_total_orders
AFTER DELETE ON Orders
FOR EACH ROW
BEGIN
    UPDATE Customers
    SET TotalOrders = TotalOrders - 1
    WHERE CustomerID = OLD.CustomerID;
END//
DELIMITER ;

#3. Prevent Orders for Non-Existing Customers
DELIMITER //
CREATE TRIGGER trg_check_customer_exists
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM Customers WHERE CustomerID = NEW.CustomerID) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer does not exist!';
    END IF;
END//
DELIMITER ;

//4. Set Default Join Date
DELIMITER $$
CREATE TRIGGER trg_set_join_date
BEFORE INSERT ON Customers
FOR EACH ROW
BEGIN
    IF NEW.JoinDate IS NULL THEN
        SET NEW.JoinDate = CURDATE();
    END IF;
END//
DELIMITER ;

#5. Block Negative Amounts
DELIMITER //
CREATE TRIGGER trg_no_negative_amount
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    IF NEW.Amount < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Order amount cannot be negative!';
    END IF;
END//
DELIMITER ;

#6. Track Status Changes
CREATE TABLE OrderStatusLog (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    OldStatus VARCHAR(20),
    NewStatus VARCHAR(20),
    ChangeDate DATETIME
);
DELIMITER //
CREATE TRIGGER trg_log_status_change
BEFORE UPDATE ON Orders
FOR EACH ROW
BEGIN
    IF OLD.Status <> NEW.Status THEN
        INSERT INTO OrderStatusLog (OrderID, OldStatus, NewStatus, ChangeDate)
        VALUES (OLD.OrderID, OLD.Status, NEW.Status, NOW());
    END IF;
END//
DELIMITER ;

-- 7. Auto-Cancel Old Orders
DELIMITER //
CREATE TRIGGER trg_cancel_old_orders
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    IF NEW.OrderDate < DATE_SUB(CURDATE(), INTERVAL 1 YEAR) THEN
        SET NEW.Status = 'CANCELLED';
    END IF;
END//
DELIMITER ;

-- 8. Uppercase Status Values
DELIMITER //
CREATE TRIGGER trg_uppercase_status
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    SET NEW.Status = UPPER(NEW.Status);
END//
DELIMITER ;

-- 9. Block Duplicate Orders
DELIMITER //
CREATE TRIGGER trg_no_duplicate_orders
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM Orders 
        WHERE CustomerID = NEW.CustomerID AND OrderDate = NEW.OrderDate) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate order for this customer on the same date!';
    END IF;
END//
DELIMITER ;

#10. Validate Email Format
DELIMITER //
CREATE TRIGGER trg_validate_email
BEFORE INSERT ON Customers
FOR EACH ROW
BEGIN
    IF NEW.Email NOT LIKE '%@%' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid email address!';
    END IF;
END//
DELIMITER ;
