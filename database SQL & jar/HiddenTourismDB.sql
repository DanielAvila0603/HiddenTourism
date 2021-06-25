CREATE TABLE `hiddentourismdata`.`restaurant` (
  `restaurantId` VARCHAR(30) NOT NULL,
  `restaurantName` VARCHAR(30) NOT NULL,
  `restaurantAddress` VARCHAR(30) NOT NULL,
  `restaurantDescription` VARCHAR(30) NOT NULL,
  `openingTime` VARCHAR(30) NOT NULL,
  `closingTime` VARCHAR(30) NOT NULL,
  `consumptionType` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`restaurantId`));

CREATE TABLE `hiddentourismdata`.`tourist` (
  `IdTourist` VARCHAR(32) NOT NULL,
  `FirstName` VARCHAR(32) NOT NULL,
  `LastName` VARCHAR(32) NOT NULL,
  `Location` VARCHAR(32) NOT NULL,
  `ResevationDate` DATE NOT NULL,
  `PaymentType` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`IdTourist`));

CREATE TABLE `hiddentourismdata`.`places` (
  `TourismName` VARCHAR(50) NOT NULL,
  `Province` VARCHAR(50) NOT NULL,
  `Canton` VARCHAR(50) NOT NULL,
  `Address` VARCHAR(50) NOT NULL,
  `Contact` VARCHAR(20) NOT NULL,
  `Activities` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`TourismName`));

CREATE TABLE `hiddentourismdata`.`tourguide` (
  `idTourguide` VARCHAR(10) NOT NULL,
  `FirstName` VARCHAR(30) NOT NULL,
  `LastName` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idTourguide`));

INSERT INTO `hiddentourismdata`.`restaurant` (`restaurantId`, `restaurantName`, `restaurantAddress`, `restaurantDescription`, `openingTime`, `closingTime`, `consumptionType`) VALUES ('001', 'La cabaña', 'Machala', 'Marisqueria', '08:00', '20:00', 'To serve');
INSERT INTO `hiddentourismdata`.`restaurant` (`restaurantId`, `restaurantName`, `restaurantAddress`, `restaurantDescription`, `openingTime`, `closingTime`, `consumptionType`) VALUES ('002', 'Bambu', 'Quito', 'Comida Tipica', '08:30', '22:00', 'To serve');
INSERT INTO `hiddentourismdata`.`restaurant` (`restaurantId`, `restaurantName`, `restaurantAddress`, `restaurantDescription`, `openingTime`, `closingTime`, `consumptionType`) VALUES ('003', 'La Chosita', 'Machala', 'Marisqueria', '09:00', '23:00', 'To serve');
INSERT INTO `hiddentourismdata`.`restaurant` (`restaurantId`, `restaurantName`, `restaurantAddress`, `restaurantDescription`, `openingTime`, `closingTime`, `consumptionType`) VALUES ('004', 'El Rincon ', 'Quito', 'Comida Tipica', '07:30', '22:30', 'To serve');

INSERT INTO `hiddentourismdata`.`places` (`TourismName`, `Province`, `Canton`, `Address`, `Contact`, `Activities`) VALUES ('Tulipe', 'Pichincha', 'Quito', 'Nanegalito', '0995632147', 'Nadar,Caminar y comer');
INSERT INTO `hiddentourismdata`.`places` (`TourismName`, `Province`, `Canton`, `Address`, `Contact`, `Activities`) VALUES ('Catedral de Machala', 'El Oro', 'Machala', 'Plaza de armas central', '0955487410', 'Caminar, comer y fotografias');
INSERT INTO `hiddentourismdata`.`places` (`TourismName`, `Province`, `Canton`, `Address`, `Contact`, `Activities`) VALUES ('Piramides Cochasqui', 'Pichincha', 'Pedro Moncayo', 'Cochasqui', '0885522147', 'Caminar, comer y fotografias');

INSERT INTO `hiddentourismdata`.`tourguide` (`idTourguide`, `firstName`, `lastName`) VALUES ('1727791731', 'Sebastian', 'Andrango');
INSERT INTO `hiddentourismdata`.`tourguide` (`idTourguide`, `firstName`, `lastName`) VALUES ('1789632100', 'Jose', 'Guevara');
INSERT INTO `hiddentourismdata`.`tourguide` (`idTourguide`, `firstName`, `lastName`) VALUES ('1712502036', 'Katty', 'Santos');

USE hiddentourismdata;

SELECT * FROM places;
SELECT * FROM restaurant;
SELECT * FROM tourguide;
SELECT * FROM tourist;
