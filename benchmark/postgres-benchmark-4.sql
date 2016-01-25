-- Create a partitioned version of chartevents

  CREATE TABLE CHARTEVENTS_PARTITIONED
   (	ROW_ID INT NOT NULL,
	SUBJECT_ID INT NOT NULL,
	HADM_ID INT,
	ICUSTAY_ID INT,
	ITEMID INT,
	CHARTTIME TIMESTAMP(0),
	STORETIME TIMESTAMP(0),
	CGID INT,
	VALUE VARCHAR(255),
	VALUENUM DOUBLE PRECISION,
	UOM VARCHAR(50),
	WARNING INT,
	ERROR INT,
	RESULTSTATUS VARCHAR(50),
	STOPPED VARCHAR(50)
   ) ;

-- PARTITIONNING
-- CREATE CHARTEVENTS_PARTITIONED TABLE
CREATE TABLE CHARTEVENTS_PARTITIONED_0 ( CHECK ( itemid in
  (
    -- HEART RATE
    211, --"Heart Rate"
    220045, --"Heart Rate"

    -- Systolic/diastolic

    51, --	Arterial BP [Systolic]
    442, --	Manual BP [Systolic]
    455, --	NBP [Systolic]
    6701, --	Arterial BP #2 [Systolic]
    220179, --	Non Invasive Blood Pressure systolic
    220050, --	Arterial Blood Pressure systolic

    8368, --	Arterial BP [Diastolic]
    8440, --	Manual BP [Diastolic]
    8441, --	NBP [Diastolic]
    8555, --	Arterial BP #2 [Diastolic]
    220180, --	Non Invasive Blood Pressure diastolic
    220051, --	Arterial Blood Pressure diastolic


    -- MEAN ARTERIAL PRESSURE
    456, --"NBP Mean"
    52, --"Arterial BP Mean"
    6702, --	Arterial BP Mean #2
    443, --	Manual BP Mean(calc)
    220052, --"Arterial Blood Pressure mean"
    220181, --"Non Invasive Blood Pressure mean"
    225312, --"ART BP mean"

    -- RESPIRATORY RATE
    618,--	Respiratory Rate
    615,--	Resp Rate (Total)
    220210,--	Respiratory Rate
    224690, --	Respiratory Rate (Total)


    -- SPO2, peripheral
    646, 220277,

    -- GLUCOSE, both lab and fingerstick
    807,--	Fingerstick Glucose
    811,--	Glucose (70-105)
    1529,--	Glucose
    3745,--	BloodGlucose
    3744,--	Blood Glucose
    225664,--	Glucose finger stick
    220621,--	Glucose (serum)
    226537,--	Glucose (whole blood)

    -- TEMPERATURE
    223762, -- "Temperature Celsius"
    676,	-- "Temperature C"
    223761, -- "Temperature Fahrenheit"
    678 --	"Temperature F"
  )
    )) INHERITS (CHARTEVENTS_PARTITIONED);
CREATE TABLE CHARTEVENTS_PARTITIONED_1 ( CHECK ( itemid >= 1  AND itemid < 161 )) INHERITS (CHARTEVENTS_PARTITIONED);
CREATE TABLE CHARTEVENTS_PARTITIONED_2 ( CHECK ( itemid >= 161  AND itemid < 428 )) INHERITS (CHARTEVENTS_PARTITIONED);
CREATE TABLE CHARTEVENTS_PARTITIONED_3 ( CHECK ( itemid >= 428  AND itemid < 615 )) INHERITS (CHARTEVENTS_PARTITIONED);
CREATE TABLE CHARTEVENTS_PARTITIONED_4 ( CHECK ( itemid >= 615  AND itemid < 742 )) INHERITS (CHARTEVENTS_PARTITIONED);
CREATE TABLE CHARTEVENTS_PARTITIONED_5 ( CHECK ( itemid >= 742  AND itemid < 3338 )) INHERITS (CHARTEVENTS_PARTITIONED);
CREATE TABLE CHARTEVENTS_PARTITIONED_6 ( CHECK ( itemid >= 3338  AND itemid < 3723 )) INHERITS (CHARTEVENTS_PARTITIONED);
CREATE TABLE CHARTEVENTS_PARTITIONED_7 ( CHECK ( itemid >= 3723  AND itemid < 8523 )) INHERITS (CHARTEVENTS_PARTITIONED);
CREATE TABLE CHARTEVENTS_PARTITIONED_8 ( CHECK ( itemid >= 8523  AND itemid < 220074 )) INHERITS (CHARTEVENTS_PARTITIONED);
CREATE TABLE CHARTEVENTS_PARTITIONED_9 ( CHECK ( itemid >= 220074  AND itemid < 323769 )) INHERITS (CHARTEVENTS_PARTITIONED);

-- CREATE CHARTEVENTS_PARTITIONED TRIGGER
CREATE OR REPLACE FUNCTION CHARTEVENTS_PARTITIONED_insert_trigger()
RETURNS TRIGGER AS $$
BEGIN


IF ( NEW.itemid in
  (
    -- HEART RATE
    211, --"Heart Rate"
    220045, --"Heart Rate"

    -- Systolic/diastolic

    51, --	Arterial BP [Systolic]
    442, --	Manual BP [Systolic]
    455, --	NBP [Systolic]
    6701, --	Arterial BP #2 [Systolic]
    220179, --	Non Invasive Blood Pressure systolic
    220050, --	Arterial Blood Pressure systolic

    8368, --	Arterial BP [Diastolic]
    8440, --	Manual BP [Diastolic]
    8441, --	NBP [Diastolic]
    8555, --	Arterial BP #2 [Diastolic]
    220180, --	Non Invasive Blood Pressure diastolic
    220051, --	Arterial Blood Pressure diastolic


    -- MEAN ARTERIAL PRESSURE
    456, --"NBP Mean"
    52, --"Arterial BP Mean"
    6702, --	Arterial BP Mean #2
    443, --	Manual BP Mean(calc)
    220052, --"Arterial Blood Pressure mean"
    220181, --"Non Invasive Blood Pressure mean"
    225312, --"ART BP mean"

    -- RESPIRATORY RATE
    618,--	Respiratory Rate
    615,--	Resp Rate (Total)
    220210,--	Respiratory Rate
    224690, --	Respiratory Rate (Total)


    -- SPO2, peripheral
    646, 220277,

    -- GLUCOSE, both lab and fingerstick
    807,--	Fingerstick Glucose
    811,--	Glucose (70-105)
    1529,--	Glucose
    3745,--	BloodGlucose
    3744,--	Blood Glucose
    225664,--	Glucose finger stick
    220621,--	Glucose (serum)
    226537,--	Glucose (whole blood)

    -- TEMPERATURE
    223762, -- "Temperature Celsius"
    676,	-- "Temperature C"
    223761, -- "Temperature Fahrenheit"
    678 --	"Temperature F"
  )
    ) THEN INSERT INTO CHARTEVENTS_PARTITIONED_0 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 1 AND NEW.itemid < 161 ) THEN INSERT INTO CHARTEVENTS_PARTITIONED_1 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 161 AND NEW.itemid < 428 ) THEN INSERT INTO CHARTEVENTS_PARTITIONED_2 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 428 AND NEW.itemid < 615 ) THEN INSERT INTO CHARTEVENTS_PARTITIONED_3 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 615 AND NEW.itemid < 742 ) THEN INSERT INTO CHARTEVENTS_PARTITIONED_4 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 742 AND NEW.itemid < 3338 ) THEN INSERT INTO CHARTEVENTS_PARTITIONED_5 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 3338 AND NEW.itemid < 3723 ) THEN INSERT INTO CHARTEVENTS_PARTITIONED_6 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 3723 AND NEW.itemid < 8523 ) THEN INSERT INTO CHARTEVENTS_PARTITIONED_7 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 8523 AND NEW.itemid < 220074 ) THEN INSERT INTO CHARTEVENTS_PARTITIONED_8 VALUES (NEW.*);
ELSIF ( NEW.itemid >= 220074 AND NEW.itemid < 323769 ) THEN INSERT INTO CHARTEVENTS_PARTITIONED_9 VALUES (NEW.*);
	ELSE
		INSERT INTO CHARTEVENTS_PARTITIONED_NULL VALUES (NEW.*);
       END IF;
RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER INSERT_CHARTEVENTS_PARTITIONED_TRIGGER
    BEFORE INSERT ON CHARTEVENTS_PARTITIONED
    FOR EACH ROW EXECUTE PROCEDURE CHARTEVENTS_PARTITIONED_INSERT_TRIGGER();

-- Example command for importing from a CSV to a table
COPY CHARTEVENTS_PARTITIONED
FROM '/data/mimic3/version_1_3/CHARTEVENTS_DATA_TABLE.csv'
DELIMITER ','
CSV HEADER;
