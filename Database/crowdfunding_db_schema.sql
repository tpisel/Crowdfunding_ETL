-- table creation

CREATE TABLE category
(
    category_id VARCHAR(16) NOT NULL,
    category TEXT UNIQUE NOT NULL,
    CONSTRAINT pk_category
        PRIMARY KEY (category_id)
);

CREATE TABLE subcategory
(
    subcategory_id VARCHAR(16) NOT NULL,
    subcategory TEXT UNIQUE NOT NULL,
    CONSTRAINT pk_subcategory
        PRIMARY KEY (subcategory_id)
);

CREATE TABLE contacts
(
    contact_id BIGINT NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    CONSTRAINT pk_contacts
        PRIMARY KEY (contact_id)
);

CREATE TABLE campaign
(
    cf_id BIGINT NOT NULL,
    contact_id BIGINT NOT NULL,
    company_name TEXT NOT NULL,
    description TEXT NOT NULL,
    goal DOUBLE PRECISION NOT NULL,
    pledged DOUBLE PRECISION NOT NULL,
    outcome TEXT NOT NULL,
    backers_count BIGINT NOT NULL,
    country VARCHAR(2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    launched_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR(16) NOT NULL,
    subcategory_id VARCHAR(16) NOT NULL,
    CONSTRAINT pk_campaign
        PRIMARY KEY (cf_id),
    CONSTRAINT fk_campaign_contact_id
        FOREIGN KEY (contact_id) REFERENCES contacts,
    CONSTRAINT fk_campaign_category_id
        FOREIGN KEY(category_id) REFERENCES category,
    CONSTRAINT fk_campaign_subcategory_id
        FOREIGN KEY(subcategory_id) REFERENCES subcategory
);


-- commands to copy data to these tables

\COPY category(category_id, category) FROM './Resources/category.csv' WITH DELIMITER ',' CSV HEADER;

\COPY subcategory(subcategory_id, subcategory) FROM './Resources/subcategory.csv' WITH DELIMITER ',' CSV HEADER;

\COPY contacts(contact_id, first_name, last_name, email) FROM './Resources/contacts.csv' WITH DELIMITER ',' CSV HEADER;

\COPY campaign(cf_id, contact_id, company_name, description, goal, pledged, outcome, backers_count, country, currency, launched_date, end_date, category_id, subcategory_id) FROM './Resources/campaign.csv' WITH DELIMITER ',' CSV HEADER;


-- SELECT statements to show the contents of these tables

\echo '\n\n CATEGORY TABLE'
SELECT * FROM category;

\echo '\n\n SUBCATEGORY TABLE'
SELECT * FROM subcategory;

\echo '\n\n CONTACTS TABLE (sample)'
SELECT * from contacts LIMIT 10;

\echo '\n\n CAMPAIGN TABLE (sample)'
SELECT * from campaign LIMIT 10;