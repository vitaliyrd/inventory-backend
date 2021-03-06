CREATE TABLE Locations (
  id         int         auto_increment not null primary key,
  name       varchar(50),
  buildingNo varchar(50),
  floorNo    varchar(10),
  roomNo     varchar(10),
  notes      tinytext
);

CREATE TABLE Categories (
  id    int         auto_increment not null primary key,
  name  varchar(50) not null,
  notes tinytext
);

CREATE TABLE Items (
  id         int         auto_increment not null primary key,
  name       varchar(50)                not null,
  categoryId int,
  brand      varchar(50),
  model      varchar(20),
  foreign key (categoryId) references Categories (id)
);

CREATE TABLE Entries (
  itemId       int         not null,
  serialNo     varchar(30) not null,
  locationId   int,
  checkedIn    bool,
  needsService bool,
  lost         bool,
  notes        tinytext,
  primary key (itemId, serialNo),
  foreign key (itemId) references Entries (id),
  foreign key (locationId) references Locations (id)
);