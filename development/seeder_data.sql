-- Données de test pour Skol SaaS

-- =================================
-- MODULES DISPONIBLES
-- =================================
INSERT INTO modules (name, key, description, version) VALUES
('Core', 'core', 'Module de base - Authentification, écoles, utilisateurs', '1.0.0'),
('Academic', 'academic', 'Gestion académique - Élèves, enseignants, classes', '1.0.0'),
('Grading', 'grading', 'Gestion des notes et bulletins', '1.0.0'),
('Attendance', 'attendance', 'Gestion des présences et absences', '1.0.0'),
('Payment', 'payment', 'Gestion des paiements et frais scolaires', '1.0.0'),
('Messaging', 'messaging', 'Messagerie interne école-parents-élèves', '1.0.0'),
('Schedule', 'schedule', 'Emplois du temps et planning', '1.0.0'),
('Document', 'document', 'Gestion documentaire et fichiers', '1.0.0'),
('Discipline', 'discipline', 'Gestion discipline et comportement', '1.0.0'),
('Analytics', 'analytics', 'Rapports avancés et statistiques', '1.0.0');

-- =================================
-- PLANS D'ABONNEMENT
-- =================================
INSERT INTO subscription_plans (name, key, price, billing_cycle, student_limit, teacher_limit, storage_limit, features) VALUES
('Starter', 'starter', 25000.00, 'monthly', 100, 10, '1GB', '{"basic_reports": true, "email_support": true}'),
('Standard', 'standard', 50000.00, 'monthly', 500, 50, '5GB', '{"advanced_reports": true, "phone_support": true, "mobile_app": true}'),
('Premium', 'premium', 100000.00, 'monthly', NULL, NULL, '20GB', '{"custom_reports": true, "priority_support": true, "api_access": true, "multi_school": true}'),
('Enterprise', 'enterprise', 200000.00, 'monthly', NULL, NULL, '100GB', '{"white_label": true, "dedicated_support": true, "custom_modules": true, "sla": true}');

-- =================================
-- MODULES PAR PLAN
-- =================================
-- Plan Starter (modules de base)
INSERT INTO plan_modules (plan_id, module_id) VALUES
(1, 1), -- Core
(1, 2), -- Academic  
(1, 3); -- Grading

-- Plan Standard (+ présences et messagerie)
INSERT INTO plan_modules (plan_id, module_id) VALUES
(2, 1), (2, 2), (2, 3), -- modules de base
(2, 4), -- Attendance
(2, 6); -- Messaging

-- Plan Premium (+ paiements, emploi du temps, documents, discipline)
INSERT INTO plan_modules (plan_id, module_id) VALUES
(3, 1), (3, 2), (3, 3), (3, 4), (3, 6), -- modules précédents
(3, 5), -- Payment
(3, 7), -- Schedule
(3, 8), -- Document
(3, 9); -- Discipline

-- Plan Enterprise (tous les modules)
INSERT INTO plan_modules (plan_id, module_id) 
SELECT 4, id FROM modules;

-- =================================
-- ÉCOLES DE TEST
-- =================================
INSERT INTO schools (name, city, type, contact_email, contact_phone, address) VALUES
('École Primaire Les Palmiers', 'Dakar', 'primaire', 'direction@palmiers.sn', '+221 33 123 45 67', 'Plateau, Dakar'),
('Lycée John F. Kennedy', 'Dakar', 'secondaire', 'proviseur@jfk.sn', '+221 33 234 56 78', 'Point E, Dakar'),
('Groupe Scolaire Mariama Ba', 'Thiès', 'primaire', 'contact@mariamaba.sn', '+221 33 345 67 89', 'Centre-ville, Thiès'),
('Université Cheikh Anta Diop', 'Dakar', 'universitaire', 'info@ucad.sn', '+221 33 456 78 90', 'Fann, Dakar');

-- =================================
-- ABONNEMENTS DES ÉCOLES
-- =================================
INSERT INTO school_subscriptions (school_id, plan_id, status, started_at, expires_at) VALUES
(1, 2, 'active', '2024-09-01', '2025-08-31'), -- École Palmiers - Standard
(2, 3, 'active', '2024-09-01', '2025-08-31'), -- Lycée JFK - Premium  
(3, 1, 'active', '2024-09-01', '2025-08-31'), -- Mariama Ba - Starter
(4, 4, 'active', '2024-09-01', '2025-08-31'); -- UCAD - Enterprise

-- =================================
-- MODULES ACTIVÉS PAR ÉCOLE
-- =================================
-- École Palmiers (Plan Standard)
INSERT INTO school_modules (school_id, module_id, is_enabled) VALUES
(1, 1, true), (1, 2, true), (1, 3, true), (1, 4, true), (1, 6, true);

-- Lycée JFK (Plan Premium)
INSERT INTO school_modules (school_id, module_id, is_enabled) VALUES
(2, 1, true), (2, 2, true), (2, 3, true), (2, 4, true), (2, 5, true), 
(2, 6, true), (2, 7, true), (2, 8, true), (2, 9, true);

-- Mariama Ba (Plan Starter)
INSERT INTO school_modules (school_id, module_id, is_enabled) VALUES
(3, 1, true), (3, 2, true), (3, 3, true);

-- UCAD (Plan Enterprise - tous modules)
INSERT INTO school_modules (school_id, module_id, is_enabled) 
SELECT 4, id, true FROM modules;

-- =================================
-- ANNÉES SCOLAIRES
-- =================================
INSERT INTO school_years (school_id, label, start_date, end_date, is_active) VALUES
(1, '2024-2025', '2024-09-02', '2025-07-15', true),
(2, '2024-2025', '2024-09-02', '2025-07-15', true),
(3, '2024-2025', '2024-09-02', '2025-07-15', true),
(4, '2024-2025', '2024-10-01', '2025-07-31', true);

-- =================================
-- TRIMESTRES
-- =================================
INSERT INTO terms (school_year_id, name, start_date, end_date) VALUES
-- École Palmiers
(1, '1er Trimestre', '2024-09-02', '2024-12-20'),
(1, '2ème Trimestre', '2025-01-08', '2025-04-04'),
(1, '3ème Trimestre', '2025-04-21', '2025-07-15'),

-- Lycée JFK
(2, '1er Trimestre', '2024-09-02', '2024-12-20'),
(2, '2ème Trimestre', '2025-01-08', '2025-04-04'),
(2, '3ème Trimestre', '2025-04-21', '2025-07-15'),

-- Mariama Ba
(3, '1er Trimestre', '2024-09-02', '2024-12-20'),
(3, '2ème Trimestre', '2025-01-08', '2025-04-04'),
(3, '3ème Trimestre', '2025-04-21', '2025-07-15'),

-- UCAD (Semestres)
(4, '1er Semestre', '2024-10-01', '2025-02-15'),
(4, '2ème Semestre', '2025-02-25', '2025-07-31');

-- =================================
-- NIVEAUX SCOLAIRES
-- =================================
INSERT INTO school_levels (school_id, level) VALUES
-- École Palmaires (Primaire)
(1, 'primaire'),

-- Lycée JFK (Secondaire)
(2, 'secondaire'),

-- Mariama Ba (Primaire)
(3, 'primaire'),

-- UCAD (Universitaire)
(4, 'universite');

-- =================================
-- CLASSES
-- =================================
INSERT INTO classrooms (school_id, label, level, capacity) VALUES
-- École Palmiers
(1, 'CP', 'Cours Préparatoire', 35),
(1, 'CE1', 'Cours Élémentaire 1', 35),
(1, 'CE2', 'Cours Élémentaire 2', 35),
(1, 'CM1', 'Cours Moyen 1', 40),
(1, 'CM2', 'Cours Moyen 2', 40),

-- Lycée JFK
(2, '6ème A', 'Sixième', 45),
(2, '6ème B', 'Sixième', 45),
(2, '5ème A', 'Cinquième', 42),
(2, '4ème A', 'Quatrième', 40),
(2, '3ème A', 'Troisième', 38),
(2, '2nde S1', 'Seconde Scientifique', 45),
(2, '1ère S1', 'Première Scientifique', 40),
(2, 'Terminale S1', 'Terminale Scientifique', 35),

-- Mariama Ba
(3, 'CP A', 'Cours Préparatoire', 30),
(3, 'CP B', 'Cours Préparatoire', 30),
(3, 'CE1', 'Cours Élémentaire 1', 32),
(3, 'CE2', 'Cours Élémentaire 2', 32),

-- UCAD
(4, 'L1 Maths', 'Licence 1 Mathématiques', 120),
(4, 'L2 Info', 'Licence 2 Informatique', 80),
(4, 'M1 Gestion', 'Master 1 Gestion', 50);

-- =================================
-- SALLES
-- =================================
INSERT INTO rooms (school_id, label, type, capacity, equipment) VALUES
-- École Palmiers
(1, 'Salle 1', 'salle_classe', 40, '["tableau", "projecteur"]'),
(1, 'Salle 2', 'salle_classe', 40, '["tableau"]'),
(1, 'Salle Info', 'laboratoire', 25, '["ordinateurs", "projecteur", "tableau_numerique"]'),
(1, 'Bibliothèque', 'bibliotheque', 60, '["livres", "tables"]'),

-- Lycée JFK
(2, 'A101', 'salle_classe', 50, '["tableau", "projecteur"]'),
(2, 'A102', 'salle_classe', 50, '["tableau", "projecteur"]'),
(2, 'B201', 'salle_classe', 45, '["tableau"]'),
(2, 'Labo Sciences', 'laboratoire', 30, '["microscopes", "materiel_chimie", "hotte"]'),
(2, 'Salle Info 1', 'laboratoire', 35, '["ordinateurs", "projecteur", "tableau_numerique"]'),
(2, 'Amphithéâtre', 'amphitheatre', 200, '["sono", "projecteur", "ecran_geant"]'),

-- Mariama Ba
(3, 'Classe A', 'salle_classe', 35, '["tableau"]'),
(3, 'Classe B', 'salle_classe', 35, '["tableau"]'),
(3, 'Classe C', 'salle_classe', 35, '["tableau"]');

-- =================================
-- UTILISATEURS DE TEST
-- =================================
INSERT INTO users (name, email, password, role, school_id, phone) VALUES
-- Super Admin
('Super Admin Skol', 'admin@skol.sn', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'super_admin', NULL, '+221 77 123 45 67'),

-- Admins d'école
('Directeur Palmiers', 'directeur@palmiers.sn', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin_ecole', 1, '+221 77 234 56 78'),
('Proviseur JFK', 'proviseur@jfk.sn', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin_ecole', 2, '+221 77 345 67 89'),
('Directrice Mariama Ba', 'directrice@mariamaba.sn', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin_ecole', 3, '+221 77 456 78 90'),

-- Enseignants École Palmiers
('Fatou Diop', 'fatou.diop@palmiers.sn', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'enseignant', 1, '+221 77 111 11 11'),
('Mamadou Fall', 'mamadou.fall@palmiers.sn', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'enseignant', 1, '+221 77 222 22 22'),
('Aissatou Sy', 'aissatou.sy@palmiers.sn', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'enseignant', 1, '+221 77 333 33 33'),

-- Enseignants Lycée JFK
('Ousmane Sow', 'ousmane.sow@jfk.sn', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'enseignant', 2, '+221 77 444 44 44'),
('Mariama Diouf', 'mariama.diouf@jfk.sn', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'enseignant', 2, '+221 77 555 55 55'),
('Ibrahima Kane', 'ibrahima.kane@jfk.sn', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'enseignant', 2, '+221 77 666 66 66'),

-- Parents
('Amadou Ndiaye', 'amadou.ndiaye@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'parent', NULL, '+221 77 777 77 77'),
('Khady Sarr', 'khady.sarr@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'parent', NULL, '+221 77 888 88 88'),
('Moussa Ba', 'moussa.ba@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'parent', NULL, '+221 77 999 99 99'),

-- Élèves (utilisateurs optionnels pour les plus grands)
('Awa Ndiaye', 'awa.ndiaye@student.jfk.sn', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eleve', 2, NULL),
('Cheikh Sarr', 'cheikh.sarr@student.jfk.sn', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'eleve', 2, NULL);

-- =================================
-- ENSEIGNANTS (TABLE TEACHERS)
-- =================================
INSERT INTO teachers (user_id, school_id, speciality, hire_date, salary) VALUES
-- École Palmiers
(5, 1, 'Français/Littérature', '2020-09-01', 450000.00),
(6, 1, 'Mathématiques', '2019-09-01', 465000.00),
(7, 1, 'Sciences', '2021-09-01', 440000.00),

-- Lycée JFK
(8, 2, 'Mathématiques', '2018-09-01', 520000.00),
(9, 2, 'Physique-Chimie', '2019-09-01', 510000.00),
(10, 2, 'Histoire-Géographie', '2020-09-01', 495000.00);

-- =================================
-- PARENTS (TABLE PARENTS)
-- =================================
INSERT INTO parents (user_id, profession, workplace) VALUES
(11, 'Ingénieur', 'SONATEL'),
(12, 'Enseignante', 'Ministère de l\'Éducation'),
(13, 'Commerçant', 'Marché Sandaga');

-- =================================
-- ÉLÈVES (TABLE STUDENTS)
-- =================================
INSERT INTO students (user_id, school_id, classroom_id, student_number, birthdate, gender, enrollment_date) VALUES
-- École Palmiers
(NULL, 1, 1, 'PAL2024001', '2018-03-15', 'female', '2024-09-02'),
(NULL, 1, 1, 'PAL2024002', '2018-07-22', 'male', '2024-09-02'),
(NULL, 1, 2, 'PAL2024003', '2017-11-08', 'female', '2024-09-02'),
(NULL, 1, 3, 'PAL2024004', '2016-12-03', 'male', '2024-09-02'),
(NULL, 1, 4, 'PAL2024005', '2015-05-18', 'female', '2024-09-02'),

-- Lycée JFK
(13, 2, 6, 'JFK2024001', '2012-09-10', 'female', '2024-09-02'),
(14, 2, 8, 'JFK2024002', '2010-04-25', 'male', '2024-09-02'),
(NULL, 2, 7, 'JFK2024003', '2011-12-14', 'female', '2024-09-02'),
(NULL, 2, 9, 'JFK2024004', '2010-08-07', 'male', '2024-09-02'),
(NULL, 2, 10, 'JFK2024005', '2009-01-30', 'female', '2024-09-02'),

-- Mariama Ba
(NULL, 3, 9, 'MBA2024001', '2018-06-12', 'male', '2024-09-02'),
(NULL, 3, 10, 'MBA2024002', '2017-10-28', 'female', '2024-09-02');

-- =================================
-- RELATIONS PARENT-ÉLÈVE
-- =================================
INSERT INTO student_parent (student_id, parent_id, relationship, is_primary) VALUES
-- Parent Amadou Ndiaye
(1, 1, 'parent', true),
(2, 1, 'parent', false),

-- Parent Khady Sarr  
(6, 2, 'parent', true),
(7, 2, 'parent', false),

-- Parent Moussa Ba
(11, 3, 'parent', true),
(12, 3, 'parent', false);

-- =================================
-- MODULES ACADÉMIQUES
-- =================================
INSERT INTO modules_academic (school_id, name, description) VALUES
-- École Palmiers
(1, 'Langues', 'Français, Anglais'),
(1, 'Sciences', 'Mathématiques, Sciences Naturelles'),
(1, 'Éveil', 'Histoire, Géographie, Éducation Civique'),

-- Lycée JFK
(2, 'Sciences Exactes', 'Mathématiques, Physique, Chimie'),
(2, 'Sciences Naturelles', 'SVT, Sciences de la Terre'),
(2, 'Lettres et Langues', 'Français, Anglais, Espagnol'),
(2, 'Sciences Humaines', 'Histoire, Géographie, Philosophie');

-- =================================
-- MATIÈRES
-- =================================
INSERT INTO subjects (school_id, classroom_id, teacher_id, module_id, name, code, coefficient, color) VALUES
-- École Palmiers - CP
(1, 1, 1, 1, 'Français', 'FR-CP', 3, '#FF6B6B'),
(1, 1, 2, 2, 'Mathématiques', 'MATH-CP', 3, '#4ECDC4'),
(1, 1, 3, 3, 'Éveil', 'EVL-CP', 2, '#45B7D1'),

-- École Palmiers - CE1
(1, 2, 1, 1, 'Français', 'FR-CE1', 3, '#FF6B6B'),
(1, 2, 2, 2, 'Mathématiques', 'MATH-CE1', 3, '#4ECDC4'),
(1, 2, 3, 3, 'Éveil', 'EVL-CE1', 2, '#45B7D1'),

-- Lycée JFK - 6ème A
(2, 6, 4, 6, 'Mathématiques', 'MATH-6A', 4, '#4ECDC4'),
(2, 6, 5, 5, 'Sciences Physiques', 'PHY-6A', 3, '#96CEB4'),
(2, 6, 6, 6, 'Français', 'FR-6A', 4, '#FF6B6B'),
(2, 6, 6, 7, 'Histoire-Géographie', 'HG-6A', 3, '#FECA57'),

-- Lycée JFK - Terminale S1
(2, 13, 4, 4, 'Mathématiques', 'MATH-TS1', 7, '#4ECDC4'),
(2, 13, 5, 4, 'Physique', 'PHY-TS1', 6, '#96CEB4'),
(2, 13, 5, 4, 'Chimie', 'CHI-TS1', 4, '#A8E6CF'),
(2, 13, 6, 6, 'Français', 'FR-TS1', 4, '#FF6B6B');

-- =================================
-- EMPLOIS DU TEMPS (SAMPLE)
-- =================================
INSERT INTO schedules (classroom_id, subject_id, teacher_id, room_id, school_year_id, weekday, start_time, end_time) VALUES
-- École Palmiers - CP (weekday: 1=Lundi, 2=Mardi, etc.)
(1, 1, 1, 1, 1, 1, '08:00', '10:00'), -- Français Lundi
(1, 2, 2, 1, 1, 1, '10:30', '12:00'), -- Maths Lundi
(1, 1, 1, 1, 1, 2, '08:00', '10:00'), -- Français Mardi
(1, 3, 3, 1, 1, 2, '10:30', '12:00'), -- Éveil Mardi

-- Lycée JFK - 6ème A
(6, 4, 4, 1, 2, 1, '08:00', '09:00'), -- Maths Lundi 8h-9h
(6, 5, 5, 4, 2, 1, '09:00', '10:00'), -- Physique Lundi 9h-10h
(6, 6, 6, 1, 2, 1, '10:30', '11:30'), -- Français Lundi 10h30-11h30
(6, 7, 6, 1, 2, 1, '11:30', '12:30'), -- HG Lundi 11h30-12h30

-- Lycée JFK - Terminale S1
(13, 8, 4, 1, 2, 1, '14:00', '16:00'), -- Maths Lundi 14h-16h
(13, 9, 5, 4, 2, 1, '16:00', '18:00'), -- Physique Lundi 16h-18h
(13, 11, 6, 1, 2, 2, '08:00', '10:00'); -- Français Mardi 8h-10h

-- =================================
-- NOTES ÉCHANTILLON
-- =================================
INSERT INTO grades (student_id, subject_id, teacher_id, term_id, value, max_value, type, date_evaluated) VALUES
-- Élève 1 (École Palmiers - CP)
(1, 1, 1, 1, 16.5, 20, 'evaluation', '2024-10-15'),
(1, 2, 2, 1, 14.0, 20, 'evaluation', '2024-10-20'),
(1, 3, 3, 1, 17.0, 20, 'evaluation', '2024-10-25'),

-- Élève 6 (Lycée JFK - 6ème A) 
(6, 4, 4, 4, 15.5, 20, 'controle', '2024-10-10'),
(6, 5, 5, 4, 13.0, 20, 'evaluation', '2024-10-12'),
(6, 6, 6, 4, 16.0, 20, 'evaluation', '2024-10-14'),
(6, 7, 6, 4, 14.5, 20, 'controle', '2024-10-16'),

-- Élève 7 (Lycée JFK - 5ème A)
(7, 8, 4, 4, 18.0, 20, 'examen', '2024-11-20'),
(7, 9, 5, 4, 16.5, 20, 'controle', '2024-11-15'),
(7, 11, 6, 4, 15.0, 20, 'evaluation', '2024-11-10');

-- =================================
-- PRÉSENCES ÉCHANTILLON
-- =================================
INSERT INTO attendances (student_id, term_id, date, status, justified) VALUES
-- Élève 1 (présent la plupart du temps)
(1, 1, '2024-09-02', 'present', false),
(1, 1, '2024-09-03', 'present', false),
(1, 1, '2024-09-04', 'late', false),
(1, 1, '2024-09-05', 'present', false),
(1, 1, '2024-09-06', 'absent', true),

-- Élève 6 (quelques absences)
(6, 4, '2024-09-02', 'present', false),
(6, 4, '2024-09-03', 'absent', true),
(6, 4, '2024-09-04', 'present', false),
(6, 4, '2024-09-05', 'present', false),
(6, 4, '2024-09-06', 'late', false);

-- =================================
-- PAIEMENTS ÉCHANTILLON
-- =================================
INSERT INTO payments (student_id, school_year_id, term_id, amount, method, status, description, paid_at) VALUES
-- École Palmiers
(1, 1, 1, 75000.00, 'wave', 'completed', 'Frais de scolarité 1er trimestre', '2024-09-15 10:30:00'),
(2, 1, 1, 75000.00, 'cash', 'completed', 'Frais de scolarité 1er trimestre', '2024-09-10 09:00:00'),
(3, 1, 1, 75000.00, 'orange_money', 'completed', 'Frais de scolarité 1er trimestre', '2024-09-20 14:15:00'),

-- Lycée JFK
(6, 2, 4, 150000.00, 'bank_transfer', 'completed', 'Frais de scolarité 1er trimestre', '2024-09-05 08:00:00'),
(7, 2, 4, 150000.00, 'wave', 'pending', 'Frais de scolarité 1er trimestre', NULL),
(8, 2, 4, 150000.00, 'cash', 'completed', 'Frais de scolarité 1er trimestre', '2024-09-12 11:30:00');

-- =================================
-- MESSAGES ÉCHANTILLON
-- =================================
INSERT INTO messages (sender_id, recipient_id, classroom_id, subject, content, type, is_read) VALUES
-- Message du directeur aux parents
(2, 11, NULL, 'Réunion parents d\'élèves', 'Bonjour, nous organisons une réunion des parents d\'élèves le 15 novembre à 18h. Votre présence est souhaitée pour discuter du programme pédagogique.', 'info', false),

-- Message enseignant vers parent
(5, 12, NULL, 'Comportement en classe', 'Bonjour Madame Sarr, je souhaite vous informer des excellent résultats d\'Awa en français ce trimestre. Félicitations !', 'info', true),

-- Message général à une classe
(8, NULL, 6, 'Contrôle de mathématiques', 'Rappel : contrôle de mathématiques prévu pour vendredi prochain. Révisez les chapitres 3 et 4.', 'alerte', false),

-- Message discipline
(9, 11, NULL, 'Retard répétés', 'Bonjour, votre enfant accumule des retards en cours de physique. Merci de veiller à sa ponctualité.', 'discipline', false);

-- =================================
-- DOCUMENTS ÉCHANTILLON
-- =================================
INSERT INTO documents (name, original_name, file_path, owner_id, student_id, type, is_public) VALUES
('Bulletin T1 - Awa Ndiaye', 'bulletin_t1_awa.pdf', '/storage/documents/bulletins/2024/bulletin_t1_awa.pdf', 5, 6, 'bulletin', false),
('Certificat médical', 'certificat_medical_cheikh.pdf', '/storage/documents/medical/certificat_medical_cheikh.pdf', 12, 7, 'medical', false),
('Photo de classe 6ème A', 'photo_classe_6a.jpg', '/storage/documents/photos/photo_classe_6a.jpg', 8, NULL, 'photo', true),
('Règlement intérieur', 'reglement_jfk.pdf', '/storage/documents/school/reglement_jfk.pdf', 3, NULL, 'reglement', true);

-- =================================
-- DISCIPLINES ÉCHANTILLON
-- =================================
INSERT INTO disciplines (student_id, teacher_id, date, type, severity, description, action_taken, parent_notified) VALUES
(7, 9, '2024-10-15', 'retard', 'low', 'Arrivée en retard de 15 minutes en cours de physique', 'Avertissement oral', true),
(8, 4, '2024-10-20', 'comportement', 'medium', 'Perturbation du cours de mathématiques, bavardages répétés', 'Heure de colle samedi matin', true),
(6, 6, '2024-10-25', 'travail', 'low', 'Devoir de français non rendu', 'Devoir supplémentaire à rendre lundi', false);