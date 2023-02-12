drop table Region CASCADE CONSTRAINTS;
drop table Trainer CASCADE CONSTRAINTS;
drop table Pokemon_item CASCADE CONSTRAINTS;
drop table Gym CASCADE CONSTRAINTS;
drop table Generation CASCADE CONSTRAINTS;
drop table Typee CASCADE CONSTRAINTS;
drop table Pokemon CASCADE CONSTRAINTS;
drop table Trains CASCADE CONSTRAINTS;
drop table Holds CASCADE CONSTRAINTS;
drop table Gym_leader CASCADE CONSTRAINTS;
drop table Appear_in_Generation CASCADE CONSTRAINTS;
drop table Moves CASCADE CONSTRAINTS;
drop table HasMove CASCADE CONSTRAINTS;
drop table Strong_against CASCADE CONSTRAINTS;
drop table Weak_against CASCADE CONSTRAINTS;
drop table Ineffective_against CASCADE CONSTRAINTS;

CREATE TABLE Region(
    rname CHAR(30) PRIMARY KEY
);

CREATE TABLE Trainer(
    tname CHAR(30) PRIMARY KEY
);

CREATE TABLE Pokemon_Item(
    iname CHAR(30) PRIMARY KEY,
    effect CHAR(500) NOT NULL
);

CREATE TABLE Gym(
    gym CHAR(30) PRIMARY KEY, 
    gym_badge CHAR(30), 
    gym_number_of_trainers INT
);

CREATE TABLE Generation(
    gname INT PRIMARY KEY
);

CREATE TABLE Typee(
    tyname CHAR(30) PRIMARY KEY 
);


CREATE TABLE Pokemon(
    id INT,
    nickname CHAR(50),
    pname CHAR(30) NOT NULL,
    rname CHAR(30) NOT NULL,
    CONSTRAINT pk_IdNickname 
        PRIMARY KEY(id, nickname), 
    FOREIGN KEY (rname) REFERENCES Region ON DELETE CASCADE
);


CREATE TABLE Trains(
    id INT,
    nickname CHAR(50),
    tname CHAR(30),
    PRIMARY KEY(id, nickname, tname), 
    CONSTRAINT fk_Trains FOREIGN KEY(id, nickname) REFERENCES Pokemon(id, nickname) ON DELETE CASCADE,
    FOREIGN KEY (tname) REFERENCES Trainer ON DELETE CASCADE
);


CREATE TABLE Holds(
    id INT,
    nickname CHAR(50),
    iname CHAR(30),
    PRIMARY KEY(id, nickname, iname), 
    CONSTRAINT fk_Holds FOREIGN KEY(id, nickname) REFERENCES Pokemon(id, nickname) ON DELETE CASCADE,
    FOREIGN KEY (iname) REFERENCES Pokemon_Item ON DELETE CASCADE
);


CREATE TABLE Appear_in_Generation(
    id INT,
    pname CHAR(50),
    nickname CHAR(50),
    gname INT,
    PRIMARY KEY(id, nickname, gname),
    CONSTRAINT fk_Appear_in_G FOREIGN KEY(id, nickname) REFERENCES Pokemon(id, nickname) ON DELETE CASCADE, 
    FOREIGN KEY (gname) REFERENCES Generation ON DELETE CASCADE
);


CREATE TABLE Gym_leader(
    tname CHAR(30) PRIMARY KEY, 
    gym CHAR(20) NOT NULL, 
    rname CHAR(30) NOT NULL,
    tyname CHAR(30),
    FOREIGN KEY (tyname) REFERENCES Typee ON DELETE CASCADE,
    FOREIGN KEY (rname) REFERENCES Region ON DELETE CASCADE
);


CREATE TABLE Moves(
    mname CHAR(30),
    tyname CHAR(30),
    PRIMARY KEY(mname,tyname),
    FOREIGN KEY (tyname) REFERENCES Typee ON DELETE CASCADE
);


CREATE TABLE HasMove(
    id INT,
    nickname CHAR(50),
    mname CHAR(30),
    tyname CHAR(30),
    PRIMARY KEY(id, nickname, mname, tyname),
    CONSTRAINT fk_Pokemon FOREIGN KEY(id, nickname) REFERENCES Pokemon(id, nickname) ON DELETE CASCADE,
    CONSTRAINT fk_Moves FOREIGN KEY(mname, tyname) REFERENCES Moves(mname, tyname) ON DELETE CASCADE
);


CREATE TABLE Strong_against(
    tyname_self CHAR(30),
    tyname_other CHAR(30),
    PRIMARY KEY (tyname_self, tyname_other),
    FOREIGN KEY (tyname_self) REFERENCES Typee(tyname) ON DELETE SET NULL,
    FOREIGN KEY (tyname_other) REFERENCES Typee(tyname) ON DELETE SET NULL
);


CREATE TABLE Weak_against(
    tyname_self CHAR(30),
    tyname_other CHAR(30),
    PRIMARY KEY (tyname_self, tyname_other),
    FOREIGN KEY (tyname_self) REFERENCES Typee(tyname) ON DELETE SET NULL,
    FOREIGN KEY (tyname_other) REFERENCES Typee(tyname) ON DELETE SET NULL
);


CREATE TABLE Ineffective_against(
    tyname_self CHAR(30),
    tyname_other CHAR(30),
    PRIMARY KEY (tyname_self, tyname_other),
    FOREIGN KEY (tyname_self) REFERENCES Typee(tyname) ON DELETE SET NULL,
    FOREIGN KEY (tyname_other) REFERENCES Typee(tyname) ON DELETE SET NULL
);


INSERT INTO Region values('Kanto');
INSERT INTO Region values('Alola');
INSERT INTO Region values('Johto');
INSERT INTO Region values('Hoenn');
INSERT INTO Region values('Sinnoh');
INSERT INTO Region values('Unova');
INSERT INTO Region values('Kalos');

INSERT INTO Trainer values('Ash');
INSERT INTO Trainer values('Misty');
INSERT INTO Trainer values('Brock');
INSERT INTO Trainer values('Iris');
INSERT INTO Trainer values('Clemon');
INSERT INTO Trainer values('Naruto');
INSERT INTO Trainer values('Terry');
INSERT INTO Trainer values('Andrew');
INSERT INTO Trainer values('Tianne');


INSERT INTO Pokemon_item values('Bug Gem', 'Increases the power of a Bug-type move only once.');
INSERT INTO Pokemon_item values('Charcoal', 'Increases the power of Fire-type moves.');
INSERT INTO Pokemon_item values('Focus Band', 'An item to be held by a Pokémon. The holder may endure a potential KO attack, leaving it with just 1 HP.');
INSERT INTO Pokemon_item values('Grass Stone', 'Increases the power of Grass-type moves.');
INSERT INTO Pokemon_item values('Leftovers', 'An item to be held by a Pokémon. The holders HP is gradually restored during battle.');
INSERT INTO Pokemon_item values('SQLPlus', 'BECOME  THE  LEGEND');

INSERT INTO Gym values('Cerulean', 'Cascade', '10');
INSERT INTO Gym values('Rustboro', 'Stone', '5');
INSERT INTO Gym values('Striaton', 'Unova', '9');
INSERT INTO Gym values('Thunderbird', 'Ono', '2');
INSERT INTO Gym values('Viridian', 'Kanto', '0');

INSERT INTO Generation values('1');
INSERT INTO Generation values('2');
INSERT INTO Generation values('3');
INSERT INTO Generation values('4');
INSERT INTO Generation values('5');
INSERT INTO Generation values('6');
INSERT INTO Generation values('7');

INSERT INTO Typee values('Normal');
INSERT INTO Typee values('Water');
INSERT INTO Typee values('Fire');
INSERT INTO Typee values('Electric');
INSERT INTO Typee values('Grass');
INSERT INTO Typee values('Bug');
INSERT INTO Typee values('Flying');
INSERT INTO Typee values('Fighting');
INSERT INTO Typee values('Dragon');
INSERT INTO Typee values('Fairy');
INSERT INTO Typee values('Ground');
INSERT INTO Typee values('Steel');
INSERT INTO Typee values('Poison');
INSERT INTO Typee values('Psychic');
INSERT INTO Typee values('Ghost');
INSERT INTO Typee values('Rock');
INSERT INTO Typee values('Ice');
INSERT INTO Typee values('Dark');


INSERT INTO Pokemon VALUES('25', 'Pika', 'Pikachu', 'Kanto');
INSERT INTO Pokemon VALUES('25', 'Chu', 'Pikachu', 'Kanto');
INSERT INTO Pokemon VALUES('1', 'Bulby', 'Bulbasaur', 'Kanto');
INSERT INTO Pokemon VALUES('1', 'Bulburino', 'Bulbasaur', 'Kanto');
INSERT INTO Pokemon VALUES('5', 'Charmelon', 'Charmeleon', 'Kanto');
INSERT INTO Pokemon VALUES('132', '''___''', 'Ditto', 'Kanto');
INSERT INTO Pokemon VALUES('141', 'Tiannes snorlax', 'Snorlax', 'Kanto');
INSERT INTO Pokemon VALUES('79', 'Procrastinator', 'Slowpoke', 'Kanto');
INSERT INTO Pokemon VALUES('133', 'Eve', 'Eevee', 'Kanto');
INSERT INTO Pokemon VALUES('243', 'Raisu', 'Raikou', 'Johto');
INSERT INTO Pokemon VALUES('250', 'Santa', 'Ho-Oh', 'Johto');
INSERT INTO Pokemon VALUES('382', 'Kygo', 'Kyogre', 'Hoenn');
INSERT INTO Pokemon VALUES('384', 'Terrys Raccoon', 'Rayquaza', 'Hoenn');
INSERT INTO Pokemon VALUES('386', 'DNA', 'Deoxys', 'Hoenn');
INSERT INTO Pokemon values('172', 'Pi', 'Pichu', 'Johto');
INSERT INTO Pokemon VALUES('37', 'Saiken', 'Alolan Vulpix',  'Alola');
INSERT INTO Pokemon VALUES('38', 'Kurama', 'Alolan Ninetales',  'Alola');
INSERT INTO Pokemon VALUES('52', 'MewMewMew', 'Meowth',  'Alola');
INSERT INTO Pokemon values('242', 'Blissie', 'Blissy', 'Johto');
INSERT INTO Pokemon values('204', 'PP', 'Pineco', 'Johto');
INSERT INTO Pokemon values('252', 'Tree', 'Treecko', 'Hoenn');
INSERT INTO Pokemon values('255', 'Tortor', 'Torchic', 'Hoenn');
INSERT INTO Pokemon values('258', 'Muddie', 'Mudkip', 'Hoenn');
INSERT INTO Pokemon values('387', 'Turtt', 'Turtwig', 'Sinnoh');
INSERT INTO Pokemon values('390', 'Chimchim', 'Chimchar', 'Sinnoh');
INSERT INTO Pokemon values('393', 'Pipip', 'Piplup', 'Sinnoh');
INSERT INTO Pokemon values('439', 'Mr. Meme', 'Mime Jr.', 'Sinnoh');
INSERT INTO Pokemon values('495', 'Sniffie', 'Snivy', 'Unova');
INSERT INTO Pokemon values('531', 'Audi', 'Audino', 'Unova');
INSERT INTO Pokemon values('607', 'Litt', 'Litwick', 'Unova');
INSERT INTO Pokemon values('650', 'Chestnut', 'Chespin', 'Kalos');
INSERT INTO Pokemon values('684', 'Swirlie', 'Swirlix', 'Kalos');
INSERT INTO Pokemon values('700', 'Sliverrr', 'Sylveon', 'Kalos');
INSERT INTO Pokemon values('710', 'Pikaboo', 'Pumpkaboo', 'Kalos');
INSERT INTO Pokemon values('722', 'Rolex', 'Rowlet', 'Alola');
INSERT INTO Pokemon values('798', 'Katana', 'Kartana', 'Alola');
INSERT INTO Pokemon values('791', 'Sol', 'Solgaleo', 'Alola');
INSERT INTO Pokemon values('775', 'Koalaaa', 'Komala', 'Alola');
INSERT INTO Pokemon values('289', 'Slashie', 'Slaking', 'Hoenn');
INSERT INTO Pokemon values('478', 'Frozen', 'Froslass', 'Sinnoh');
INSERT INTO Pokemon values('610', 'Axxx', 'Axew', 'Unova');
INSERT INTO Pokemon values('712', 'Berrrrr', 'Bergmite', 'Kalos');
INSERT INTO Pokemon values('778', 'MimiQ', 'Mimijyu', 'Alola');


INSERT INTO Trains values('25', 'Pika', 'Ash');
INSERT INTO Trains values('25', 'Chu', 'Brock');
INSERT INTO Trains values ('1', 'Bulby', 'Ash');
INSERT INTO Trains values('38', 'Kurama', 'Naruto');
INSERT INTO Trains values('141', 'Tiannes snorlax', 'Tianne');
INSERT INTO Trains values('243', 'Raisu', 'Tianne');
INSERT INTO Trains values('79', 'Procrastinator', 'Andrew');
INSERT INTO Trains VALUES('250', 'Santa', 'Iris');
INSERT INTO Trains VALUES('382', 'Kygo', 'Iris');
INSERT INTO Trains VALUES('384', 'Terrys Raccoon', 'Terry');
INSERT INTO Trains VALUES('386', 'DNA', 'Terry');
INSERT INTO Trains VALUES('37', 'Saiken', 'Terry');
INSERT INTO Trains VALUES('38', 'Kurama', 'Andrew');
INSERT INTO Trains VALUES('52', 'MewMewMew', 'Andrew');
INSERT INTO Trains values('242', 'Blissie', 'Tianne');
INSERT INTO Trains values('204', 'PP', 'Tianne');
INSERT INTO Trains VALUES('132', '''___''', 'Terry');
INSERT INTO Trains values('252', 'Tree', 'Tianne');
INSERT INTO Trains values('255', 'Tortor', 'Naruto');
INSERT INTO Trains values('258', 'Muddie', 'Iris');
INSERT INTO Trains values('387', 'Turtt', 'Tianne');
INSERT INTO Trains values('390', 'Chimchim', 'Ash');
INSERT INTO Trains values('393', 'Pipip', 'Ash');
INSERT INTO Trains values('439', 'Mr. Meme', 'Tianne');
INSERT INTO Trains values('495', 'Sniffie', 'Andrew');
INSERT INTO Trains values('531', 'Audi', 'Tianne');
INSERT INTO Trains values('607', 'Litt', 'Terry');
INSERT INTO Trains values('650', 'Chestnut', 'Tianne');
INSERT INTO Trains values('684', 'Swirlie', 'Naruto');
INSERT INTO Trains values('700', 'Sliverrr', 'Iris');
INSERT INTO Trains values('710', 'Pikaboo', 'Naruto');
INSERT INTO Trains values('722', 'Rolex', 'Terry');
INSERT INTO Trains values('798', 'Katana', 'Andrew');
INSERT INTO Trains values('791', 'Sol', 'Tianne');
INSERT INTO Trains values('775', 'Koalaaa', 'Iris');
INSERT INTO Trains values('133', 'Eve', 'Ash');
INSERT INTO Trains values('172', 'Pi', 'Ash');
INSERT INTO Trains values('289', 'Slashie', 'Ash');
INSERT INTO Trains values('478', 'Frozen', 'Ash');
INSERT INTO Trains values('610', 'Axxx', 'Ash');
INSERT INTO Trains values('712', 'Berrrrr', 'Ash');
INSERT INTO Trains values('778', 'MimiQ', 'Ash');



INSERT INTO Holds values('1', 'Bulby', 'Bug Gem');
INSERT INTO Holds values('1', 'Bulby', 'SQLPlus');
INSERT INTO Holds values('25', 'Pika', 'Focus Band');
INSERT INTO Holds values('25', 'Chu', 'Grass Stone');
INSERT INTO Holds values('25', 'Chu', 'Charcoal');
INSERT INTO Holds values('141', 'Tiannes snorlax', 'Leftovers');
INSERT INTO Holds values('141', 'Tiannes snorlax', 'SQLPlus');
INSERT INTO Holds values('141', 'Tiannes snorlax', 'Grass Stone');
INSERT INTO Holds values('141', 'Tiannes snorlax', 'Focus Band');
INSERT INTO Holds values('141', 'Tiannes snorlax', 'Charcoal');
INSERT INTO Holds values('141', 'Tiannes snorlax', 'Bug Gem');

INSERT INTO Holds values('38', 'Kurama', 'Leftovers');
INSERT INTO Holds values('38', 'Kurama', 'SQLPlus');
INSERT INTO Holds values('38', 'Kurama', 'Grass Stone');
INSERT INTO Holds values('38', 'Kurama', 'Focus Band');
INSERT INTO Holds values('38', 'Kurama', 'Charcoal');
INSERT INTO Holds values('38', 'Kurama', 'Bug Gem');




INSERT INTO Gym_leader values('Misty', 'Cerulean', 'Kanto', 'Water');
INSERT INTO Gym_leader values('Roxanne', 'Rustboro', 'Hoenn', 'Rock');
INSERT INTO Gym_leader values('Cilan', 'Striaton', 'Unova', 'Grass');
INSERT INTO Gym_leader values('Chili', 'Striaton', 'Unova', 'Fire');
INSERT INTO Gym_leader values('Blue', 'Viridian', 'Kanto', NULL);


INSERT INTO Appear_in_Generation values('1', 'Bulbasaur', 'Bulby', '1');
INSERT INTO Appear_in_Generation values('25', 'Pikachu', 'Pika', '1');
INSERT INTO Appear_in_Generation values('25', 'Pikachu', 'Chu', '1');
INSERT INTO Appear_in_Generation values('141', 'Snorlax', 'Tiannes snorlax', '1');
INSERT INTO Appear_in_Generation values('38', 'Alolan Ninetales', 'Kurama', '7');
INSERT INTO Appear_in_Generation values('79', 'Slowpoke', 'Procrastinator', '1');
INSERT INTO Appear_in_Generation values('242', 'Blissy', 'Blissie', '2');
INSERT INTO Appear_in_Generation values('204', 'Pineco', 'PP', '2');
INSERT INTO Appear_in_Generation values('252', 'Treecko', 'Tree', '3');
INSERT INTO Appear_in_Generation values('255', 'Torchic', 'Tortor', '3');
INSERT INTO Appear_in_Generation values('258', 'Mudkip', 'Muddie', '3');
INSERT INTO Appear_in_Generation values('387', 'Turtwig', 'Turtt', '4');
INSERT INTO Appear_in_Generation values('390', 'Chimchar', 'Chimchim', '4');
INSERT INTO Appear_in_Generation values('393', 'Piplup', 'Pipip', '4');
INSERT INTO Appear_in_Generation values('439', 'Mime Jr.', 'Mr. Meme', '4');
INSERT INTO Appear_in_Generation values('495', 'Snivy', 'Sniffie', '5');
INSERT INTO Appear_in_Generation values('531', 'Audino', 'Audi', '5');
INSERT INTO Appear_in_Generation values('607', 'Litwick', 'Litt', '5');
INSERT INTO Appear_in_Generation values('684', 'Swirlix', 'Swirlie', '6');
INSERT INTO Appear_in_Generation values('710', 'Pumpkaboo', 'Pikaboo', '6');
INSERT INTO Appear_in_Generation values('722', 'Rowlet', 'Rolex', '7');
INSERT INTO Appear_in_Generation values('798', 'Kartana', 'Katana', '7');
INSERT INTO Appear_in_Generation values('791', 'Solgaleo', 'Sol', '7');


INSERT INTO Moves values('Hyper Beam', 'Normal');
INSERT INTO Moves values('Tackle', 'Normal');
INSERT INTO Moves values('Thunderbolt', 'Electric');
INSERT INTO Moves values('Spark', 'Electric');
INSERT INTO Moves values('Megahorn', 'Bug');
INSERT INTO Moves values('Twineedle', 'Bug');
INSERT INTO Moves values('Tailed Beast Bomb', 'Fire');
INSERT INTO Moves values('Fire Spin', 'Fire');
INSERT INTO Moves values('Fire Punch', 'Fire');
INSERT INTO Moves values('Hydro Pump', 'Water');
INSERT INTO Moves values('Water Gun', 'Water');
INSERT INTO Moves values('Karate Chop', 'Fighting');
INSERT INTO Moves values('Mach Punch', 'Fighting');
INSERT INTO Moves values('Amnesia', 'Psychic');
INSERT INTO Moves values('Kinesis', 'Psychic');
INSERT INTO Moves values('Poison Gas', 'Poison');
INSERT INTO Moves values('Acid Armor', 'Poison');
INSERT INTO Moves values('Rock Slide', 'Rock');
INSERT INTO Moves values('Sandstorm', 'Rock');
INSERT INTO Moves values('Spikes', 'Ground');
INSERT INTO Moves values('Icy Wind', 'Ice');
INSERT INTO Moves values('Dragon Rage', 'Dragon');
INSERT INTO Moves values('Dragon Tail', 'Dragon');
INSERT INTO Moves values('Mirror Move', 'Flying');
INSERT INTO Moves values ('Air Slash', 'Flying');
INSERT INTO Moves values('Confuse Ray', 'Ghost');
INSERT INTO Moves values('Night Shade', 'Ghost');
INSERT INTO Moves values('Charm', 'Fairy');
INSERT INTO Moves values ('Moonlight', 'Fairy');
INSERT INTO Moves values ('Thief', 'Dark');
INSERT INTO Moves values ('Vine Whip', 'Grass');
INSERT INTO Moves values ('Leech Seed', 'Grass');
INSERT INTO Moves values ('Razor Leaf', 'Grass');
INSERT INTO Moves values ('Steel Wing', 'Steel');
INSERT INTO Moves values ('Metal Claw', 'Steel');

INSERT INTO HasMove values('141', 'Tiannes snorlax', 'Hyper Beam', 'Normal');
INSERT INTO HasMove values('25', 'Pika', 'Thunderbolt', 'Electric');
INSERT INTO HasMove values('25', 'Chu', 'Spark', 'Electric');
INSERT INTO HasMove values('1', 'Bulby', 'Megahorn', 'Bug');
INSERT INTO HasMove values('1', 'Bulby', 'Spark', 'Electric');
INSERT INTO HasMove values('1', 'Bulby', 'Dragon Tail', 'Dragon');
INSERT INTO HasMove values('38', 'Kurama', 'Tailed Beast Bomb', 'Fire');
INSERT INTO HasMove VALUES('243', 'Raisu', 'Spark', 'Electric');
INSERT INTO HasMove VALUES('250', 'Santa', 'Fire Punch', 'Fire');
INSERT INTO HasMove VALUES('250', 'Santa', 'Mirror Move', 'Flying');
INSERT INTO HasMove VALUES('250', 'Santa', 'Confuse Ray', 'Ghost');
INSERT INTO HasMove VALUES('382', 'Kygo', 'Hydro Pump', 'Water');
INSERT INTO HasMove VALUES('384', 'Terrys Raccoon', 'Dragon Tail', 'Dragon');
INSERT INTO HasMove VALUES('386', 'DNA', 'Amnesia', 'Psychic');
INSERT INTO HasMove VALUES('37', 'Saiken', 'Icy Wind', 'Ice');
INSERT INTO HasMove VALUES('52', 'MewMewMew', 'Thief', 'Dark');
INSERT INTO HasMove values('242', 'Blissie', 'Tackle', 'Normal');
INSERT INTO HasMove values('204', 'PP', 'Megahorn', 'Bug');
INSERT INTO HasMove values('252', 'Tree', 'Razor Leaf', 'Grass');
INSERT INTO HasMove values('255', 'Tortor', 'Fire Spin', 'Fire');
INSERT INTO HasMove values('258', 'Muddie', 'Water Gun', 'Water');
INSERT INTO HasMove values('387', 'Turtt', 'Leech Seed', 'Grass');
INSERT INTO HasMove values('390', 'Chimchim', 'Fire Punch', 'Fire');
INSERT INTO HasMove values('390', 'Chimchim', 'Thief', 'Dark');
INSERT INTO HasMove values('390', 'Chimchim', 'Dragon Tail', 'Dragon');
INSERT INTO HasMove values('390', 'Chimchim', 'Tackle', 'Normal');
INSERT INTO HasMove values('390', 'Chimchim', 'Metal Claw', 'Steel');
INSERT INTO HasMove values('439', 'Mr. Meme', 'Kinesis', 'Psychic');
INSERT INTO HasMove values('439', 'Mr. Meme', 'Moonlight', 'Fairy');
INSERT INTO HasMove values('495', 'Sniffie', 'Vine Whip', 'Grass');
INSERT INTO HasMove values('531', 'Audi', 'Hyper Beam', 'Normal');
INSERT INTO HasMove values('607', 'Litt', 'Confuse Ray', 'Ghost');
INSERT INTO HasMove values('607', 'Litt', 'Fire Spin', 'Fire');
INSERT INTO HasMove values('684', 'Swirlie', 'Charm', 'Fairy');
INSERT INTO HasMove values('710', 'Pikaboo', 'Night Shade', 'Ghost');
INSERT INTO HasMove values('722', 'Rolex', 'Air Slash', 'Flying');
INSERT INTO HasMove values('798', 'Katana', 'Razor Leaf', 'Grass');
INSERT INTO HasMove values('791', 'Sol', 'Kinesis', 'Psychic');
INSERT INTO HasMove values('791', 'Sol', 'Metal Claw', 'Steel');
INSERT INTO HasMove values('791', 'Sol', 'Air Slash', 'Flying');
INSERT INTO HasMove values('791', 'Sol', 'Fire Punch', 'Fire');
INSERT INTO HasMove values('775', 'Koalaaa', 'Tackle', 'Normal');

INSERT INTO Strong_against values('Electric', 'Water');
INSERT INTO Strong_against values('Electric', 'Flying');
INSERT INTO Strong_against values('Fire', 'Grass');
INSERT INTO Strong_against values('Fire', 'Bug');
INSERT INTO Strong_against values('Grass', 'Rock');

INSERT INTO Weak_against values('Electric', 'Electric');
INSERT INTO Weak_against values('Electric', 'Dragon');
INSERT INTO Weak_against values('Fire', 'Water');
INSERT INTO Weak_against values('Fire', 'Rock');
INSERT INTO Weak_against values('Grass', 'Fire');

INSERT INTO Ineffective_against values('Normal', 'Ghost');
INSERT INTO Ineffective_against values('Electric', 'Ground');
INSERT INTO Ineffective_against values('Ground', 'Flying');
INSERT INTO Ineffective_against values('Psychic', 'Dragon');
INSERT INTO Ineffective_against values('Dragon', 'Fairy');

COMMIT WORK;
