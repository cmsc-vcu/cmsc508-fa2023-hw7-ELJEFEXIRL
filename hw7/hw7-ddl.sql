# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS people_roles;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(4096),
    tag VARCHAR(255) NOT NULL,
    url VARCHAR(255),
    time_commitment VARCHAR(255),
    PRIMARY KEY (id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (name, description, tag, url, time_commitment) VALUES
('HANDYMAN', 'FIXES ALL MY FAILED DIY PROJECTS', 'Skill 1', 'http://url_for_skill_1.com', '10 hours'),
('PLUMMER', 'UNCLOGS MY TOILET AFTER TACO BELL', 'Skill 2', 'http://url_for_skill_2.com', '20 hours'),
('PAINTER', 'MAKES MY HOUSE LOOK PRETTY', 'Skill 3', 'http://url_for_skill_3.com', '15 hours'),
('CHEF', 'MAKES GOOD GRUB', 'Skill 4', 'http://url_for_skill_4.com', '5 hours'),
('TEACHER', 'PROVIDES EDUCATION TO CHILDREN', 'Skill 5', 'http://url_for_skill_5.com', '30 hours'),
('PHARMACIST', 'HELPS GIVE MEDICINE', 'Skill 6', 'http://url_for_skill_6.com', '25 hours'),
('NURSE', 'A MINI DOCTOR', 'Skill 7', 'http://url_for_skill_7.com', '35 hours'),
('STRIPPER', 'AN EXOTIC DANCER', 'Skill 8', 'http://url_for_skill_8.com', '40 hours');

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    linkedin_url VARCHAR(255),
    headshot_url VARCHAR(255),
    discord_handle VARCHAR(255),
    brief_bio VARCHAR(4096),
    date_joined DATE NOT NULL,
    PRIMARY KEY (id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) VALUES
('John', 'Doe', 'john.doe@example.com', 'http://linkedin.com/in/johndoe', 'http://headshot_url_john.com', 'john_discord', 'John is a skilled developer with a passion for web technologies.', '2021-01-10'),
('Jane', 'Smith', 'jane.smith@example.com', 'http://linkedin.com/in/janesmith', 'http://headshot_url_jane.com', 'jane_discord', 'Jane, an experienced designer, excels in creating user-centric designs.', '2021-02-15'),
('Mike', 'Brown', 'mike.brown@example.com', 'http://linkedin.com/in/mikebrown', 'http://headshot_url_mike.com', 'mike_discord', 'Mike is a project manager known for his effective team leadership.', '2021-03-20'),
('Clark', 'Kent', 'clark.kent@example.com', 'http://linkedin.com/in/clarkkent', 'http://headshot_url_clark.com', 'clark_discord', 'Clark specializes in digital marketing with a focus on social media.', '2021-04-25'),
('David', 'Johnson', 'david.johnson@example.com', 'http://linkedin.com/in/davidjohnson', 'http://headshot_url_david.com', 'david_discord', 'David is an IT consultant with extensive experience in cybersecurity.', '2021-05-30'),
('Sophia', 'Lopez', 'sophia.lopez@example.com', 'http://linkedin.com/in/sophialopez', 'http://headshot_url_sophia.com', 'sophia_discord', 'Sophia, a talented graphic designer, brings creativity to branding projects.', '2021-06-15'),
('Bruce', 'Wayne', 'bruce.wayne@example.com', 'http://linkedin.com/in/brucewayne', 'http://headshot_url_bruce.com', 'bruce_discord', 'Bruce is a software engineer with a knack for solving complex problems.', '2021-07-10'),
('Diana', 'Prince', 'diana.prince@example.com', 'http://linkedin.com/in/dianaprince', 'http://headshot_url_diana.com', 'diana_discord', 'Diana is a data analyst with a strong background in statistics and machine learning.', '2021-08-05'),
('Martha', 'Kent', 'martha.kent@example.com', 'http://linkedin.com/in/marthakent', 'http://headshot_url_martha.com', 'martha_discord', 'Martha, a seasoned product manager, excels in driving projects to success.', '2021-09-20'),
('Peter', 'Parker', 'peter.parker@example.com', 'http://linkedin.com/in/peterparker', 'http://headshot_url_peter.com', 'peter_discord', 'Peter is a creative content writer with a flair for engaging and informative storytelling.', '2021-10-15');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT,
    skills_id INT,
    people_id INT,
    date_acquired DATE,
    FOREIGN KEY (skills_id) REFERENCES skills(id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    PRIMARY KEY (id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
-- Person 1 has skills 1, 3, 6
(1, 1, '2021-01-01'),
(3, 1, '2021-01-02'),
(6, 1, '2021-01-03'),

-- Person 2 has skills 3, 4, 5
(3, 2, '2021-02-04'),
(4, 2, '2021-02-05'),
(5, 2, '2021-02-05'),

-- Person 3 has skills 1, 5
(1, 3, '2021-03-07'),
(5, 3, '2021-03-08'),

-- Person 4 has no skills

-- Person 5 has skills 3, 6
(3, 5, '2021-04-09'),
(6, 5, '2021-04-10'),

-- Person 6 has skills 2, 3, 4
(2, 6, '2021-05-11'),
(3, 6, '2021-05-12'),
(4, 6, '2021-05-13'),

-- Person 7 has skills 3, 5, 6
(3, 7, '2021-06-14'),
(5, 7, '2021-06-15'),
(6, 7, '2021-06-16'),

-- Person 8 has skills 1, 3, 5, 6
(1, 8, '2021-07-17'),
(3, 8, '2021-07-18'),
(5, 8, '2021-07-19'),
(6, 8, '2021-07-20'),

-- Person 9 has skills 2, 5, 6
(2, 9, '2021-08-21'),
(5, 9, '2021-08-22'),
(6, 9, '2021-08-23'),

-- Person 10 has skills 1, 4, 5
(1, 10, '2021-09-24'),
(4, 10, '2021-09-25'),
(5, 10, '2021-09-26');


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    sort_priority INT,
    PRIMARY KEY (id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (name, sort_priority) VALUES
('Designer', 10),
('Developer', 20),
('Recruit', 30),
('Team Lead', 40),
('Boss', 50),
('Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE people_roles (
    id INT AUTO_INCREMENT,
    people_id INT,
    role_id INT,
    date_role_acquired DATE,
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (role_id) REFERENCES roles(id),
    PRIMARY KEY (id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO people_roles (people_id, role_id, date_role_acquired) VALUES
-- Person 1 is Developer
(1, 10, '2021-01-10'),

-- Person 2 is Boss, Mentor
(2, 20, '2021-02-15'), -- Assuming 2 is Boss
(2, 30, '2021-02-20'), -- Assuming 3 is Mentor

-- Person 3 is Developer and Team Lead
(3, 10, '2021-03-20'), -- Assuming 1 is Developer
(3, 40, '2021-03-25'), -- Assuming 4 is Team Lead

-- Person 4 is Recruit
(4, 50, '2021-04-10'), -- Assuming 5 is Recruit

-- Person 5 is Recruit
(5, 50, '2021-05-15'),

-- Person 6 is Developer and Designer
(6, 10, '2021-06-10'),
(6, 60, '2021-06-15'), -- Assuming 6 is Designer

-- Person 7 is Designer
(7, 60, '2021-07-20'),

-- Person 8 is Designer and Team Lead
(8, 60, '2021-08-15'),
(8, 40, '2021-08-20'),

-- Person 9 is Developer
(9, 10, '2021-09-10'),

-- Person 10 is Developer and Designer
(10, 10, '2021-10-05'),
(10, 60, '2021-10-10');
