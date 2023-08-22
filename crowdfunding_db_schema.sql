CREATE TABLE category
(
    category_id VARCHAR(16) NOT NULL,
    category UNIQUE TEXT NOT NULL,
    CONSTRAINT pk_category
        PRIMARY KEY (category_id)
);

CREATE TABLE subcategory
(
    subcategory_id VARCHAR(16) NOT NULL,
    subcategory UNIQUE TEXT NOT NULL,
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
