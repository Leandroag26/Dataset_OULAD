-- Crear tabla de dominio para assessment_type
CREATE TABLE assessment_type_domain (
    assessment_type VARCHAR(50) PRIMARY KEY
);

-- Insertar valores únicos desde tabla original
INSERT INTO assessment_type_domain (assessment_type)
SELECT DISTINCT assessment_type
FROM assessments
WHERE assessment_type IS NOT NULL;

-- Crear tabla de dominio para code_module
CREATE TABLE module_domain (
    code_module VARCHAR(10) PRIMARY KEY
);

INSERT INTO module_domain (code_module)
SELECT DISTINCT code_module FROM assessments WHERE code_module IS NOT NULL;

-- Crear tabla de dominio para code_presentation
CREATE TABLE presentation_domain (
    code_presentation VARCHAR(10) PRIMARY KEY
);

INSERT INTO presentation_domain (code_presentation)
SELECT DISTINCT code_presentation FROM assessments WHERE code_presentation IS NOT NULL;
