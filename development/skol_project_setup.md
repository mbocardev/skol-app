# 🚀 Création du Projet Skol - Guide Complet

## 📁 Étape 1 : Structure de Base

### Créer la structure racine
```bash
mkdir skol
cd skol

# Créer les dossiers principaux
mkdir backend web mobile docs deployment
```

## 🔧 Étape 2 : Backend Laravel

### Installation et configuration Laravel
```bash
cd backend

# Installer Laravel
composer create-project laravel/laravel . --prefer-dist

# Packages nécessaires
composer require spatie/laravel-permission
composer require tymon/jwt-auth
composer require spatie/laravel-query-builder
composer require league/flysystem-aws-s3-v3
composer require pusher/pusher-php-server
composer require laravel/sanctum
```

### Structure des dossiers backend
```bash
# Créer la structure modulaire
mkdir -p app/Modules/{Core,Academic,Grading,Attendance,Payment,Messaging,Schedule,Document,Discipline,Analytics}

# Créer les dossiers de services
mkdir -p app/Services/{Core,Academic,Grading,Attendance,Payment,Messaging,Schedule,Document,Discipline,Analytics}

# Créer les dossiers de repositories
mkdir -p app/Repositories

# Structure des contrôleurs API
mkdir -p app/Http/Controllers/Api/V1/{Auth,Core,Academic,Grading,Attendance,Payment,Messaging,Schedule,Document,Discipline,Analytics}
mkdir -p app/Http/Controllers/Admin

# Middleware personnalisés
mkdir -p app/Http/Middleware

# Requests et Resources
mkdir -p app/Http/Requests/{Core,Academic,Grading,Attendance,Payment,Messaging,Schedule,Document,Discipline,Analytics}
mkdir -p app/Http/Resources/{Core,Academic,Grading,Attendance,Payment,Messaging,Schedule,Document,Discipline,Analytics}

# Traits
mkdir -p app/Traits

# Structure des migrations par module
mkdir -p database/migrations/{core,academic,grading,attendance,payment,messaging,schedule,document,discipline,saas}

# Routes modulaires
mkdir -p routes/modules

# Configuration
mkdir -p config
```

### Fichiers de base du backend
```bash
# Modèles principaux
touch app/Models/{User,School,SchoolLevel,SchoolYear,Term,Classroom,Room,Teacher,Student,Parent,Module,Subject,Schedule,Grade,Payment,Attendance,Document,Discipline,Message}.php
touch app/Models/{SubscriptionPlan,SchoolSubscription,SchoolModule,PlanModule}.php

# Services principaux
touch app/Services/Core/{AuthService,SchoolService,UserService,SubscriptionService}.php
touch app/Services/Academic/{StudentService,TeacherService,ClassroomService,SubjectService}.php
touch app/Services/Grading/{GradeService,ReportService,BulletinService}.php
touch app/Services/Attendance/AttendanceService.php
touch app/Services/Payment/{PaymentService,WaveGateway,OrangeMoneyGateway}.php
touch app/Services/Messaging/MessageService.php
touch app/Services/Schedule/ScheduleService.php
touch app/Services/Document/DocumentService.php
touch app/Services/Discipline/DisciplineService.php
touch app/Services/Analytics/AnalyticsService.php

# Middleware
touch app/Http/Middleware/{ModuleAccessMiddleware,TenantScopeMiddleware,RolePermissionMiddleware}.php

# Traits
touch app/Traits/{BelongsToSchool,HasModules,HasSubscription}.php

# Configuration
touch config/{modules,subscription,permissions}.php

# Routes
touch routes/modules/{core,academic,grading,attendance,payment,messaging,schedule,document,discipline,analytics}.php
```

## 🌐 Étape 3 : Frontend Web (Next.js)

### Installation Next.js
```bash
cd ../web

# Créer le projet Next.js
npx create-next-app@latest . --typescript --tailwind --eslint --app --src-dir --import-alias "@/*"

# Packages nécessaires
npm install axios
npm install @tanstack/react-query
npm install zustand
npm install react-hook-form
npm install @hookform/resolvers
npm install zod
npm install lucide-react
npm install @radix-ui/react-dialog
npm install @radix-ui/react-dropdown-menu
npm install @radix-ui/react-select
npm install recharts
npm install date-fns
npm install clsx
npm install tailwind-merge
```

### Structure des dossiers web
```bash
# Créer la structure des composants
mkdir -p src/components/{shared,core,academic,grading,attendance,payment,messaging,schedule,document,discipline,analytics}
mkdir -p src/components/shared/{Layout,Forms,Tables,Charts,UI}

# Pages par module
mkdir -p src/app/{auth,dashboard,students,teachers,grades,attendance,payments,messages,schedule,documents,discipline,reports,settings}
mkdir -p src/app/dashboard/{super-admin,admin-ecole,enseignant,parent,eleve}

# Services et utilitaires
mkdir -p src/services/modules
mkdir -p src/stores
mkdir -p src/utils
mkdir -p src/types
mkdir -p src/hooks

# Assets
mkdir -p public/{images,icons,documents}
```

### Fichiers de base web
```bash
# Services API
touch src/services/{api,auth,subscription}.ts
touch src/services/modules/{core,academic,grading,attendance,payment,messaging,schedule,document,discipline,analytics}.ts

# Stores
touch src/stores/{auth,school,modules,subscription}.ts

# Utilitaires
touch src/utils/{permissions,moduleChecker,formatters,validators}.ts

# Types
touch src/types/{user,school,student,teacher,grade,attendance,payment,message,schedule,document,discipline}.ts

# Hooks personnalisés
touch src/hooks/{useAuth,useModules,usePermissions,useSubscription}.ts

# Composants de base
touch src/components/shared/Layout/{AppLayout,AuthLayout,DashboardLayout}.tsx
touch src/components/shared/Forms/{LoginForm,StudentForm,GradeForm}.tsx
touch src/components/shared/Tables/{StudentsTable,GradesTable,AttendanceTable}.tsx
touch src/components/shared/Charts/{GradeChart,AttendanceChart,PaymentChart}.tsx
```

## 📱 Étape 4 : App Mobile (React Native)

### Installation React Native
```bash
cd ../mobile

# Initialiser le projet React Native
npx react-native@latest init SkolMobile --template react-native-template-typescript
cd SkolMobile

# Packages nécessaires
npm install @react-navigation/native
npm install @react-navigation/stack
npm install @react-navigation/bottom-tabs
npm install react-native-screens
npm install react-native-safe-area-context
npm install axios
npm install @tanstack/react-query
npm install zustand
npm install react-hook-form
npm install react-native-vector-icons
npm install react-native-paper
npm install @react-native-async-storage/async-storage
npm install react-native-push-notification
npm install react-native-document-picker
npm install react-native-image-picker
```

### Structure des dossiers mobile
```bash
# Déplacer dans src
mkdir src
mv App.tsx src/

# Créer la structure
mkdir -p src/{components,screens,navigation,services,stores,utils,assets}
mkdir -p src/components/{shared,core,academic,grading,attendance,payment,messaging,schedule,document,discipline,analytics}
mkdir -p src/components/shared/{Layout,Forms,Lists,Cards,UI}

# Écrans par rôle
mkdir -p src/screens/{auth,dashboard,student,teacher,grade,attendance,payment,message,schedule,document,profile}
mkdir -p src/screens/dashboard/{admin,teacher,parent,student}

# Navigation
mkdir -p src/navigation

# Services (même structure que web)
mkdir -p src/services/modules
mkdir -p src/stores
mkdir -p src/utils
mkdir -p src/types

# Assets
mkdir -p src/assets/{images,icons,fonts}
```

### Fichiers de base mobile
```bash
# Navigation
touch src/navigation/{AppNavigator,AuthNavigator,AdminNavigator,TeacherNavigator,ParentNavigator,StudentNavigator}.tsx

# Services (réutiliser la logique web)
touch src/services/{api,auth,notifications}.ts
touch src/services/modules/{core,academic,grading,attendance,payment,messaging,schedule,document,discipline,analytics}.ts

# Stores
touch src/stores/{auth,school,modules,offline}.ts

# Utilitaires
touch src/utils/{permissions,storage,notifications,offline}.ts

# Écrans principaux
touch src/screens/auth/{Login,Register,ForgotPassword}.tsx
touch src/screens/dashboard/{AdminDashboard,TeacherDashboard,ParentDashboard,StudentDashboard}.tsx
```

## 📚 Étape 5 : Documentation et Déploiement

### Documentation
```bash
cd ../docs

# Structure documentation
mkdir -p {api,modules,deployment,user-guides}
mkdir -p api/{endpoints,authentication,modules}
mkdir -p modules/{core,academic,grading,attendance,payment,messaging,schedule,document,discipline,analytics}

# Fichiers de base
touch README.md
touch api/README.md
touch modules/README.md
touch deployment/README.md
touch user-guides/README.md
```

### Déploiement
```bash
cd ../deployment

# Docker
mkdir -p docker
touch docker/{Dockerfile.backend,Dockerfile.web,docker-compose.yml,docker-compose.prod.yml}

# CI/CD
mkdir -p ci-cd/{github-actions,gitlab-ci}
touch ci-cd/github-actions/{backend.yml,web.yml,mobile.yml}

# Scripts
mkdir scripts
touch scripts/{deploy.sh,backup.sh,migrate.sh}

# Kubernetes (optionnel)
mkdir kubernetes
touch kubernetes/{backend-deployment.yml,web-deployment.yml,services.yml,ingress.yml}
```

## 🔧 Étape 6 : Configuration Initiale

### Variables d'environnement backend
```bash
cd ../backend

# Copier .env
cp .env.example .env

# Générer la clé d'application
php artisan key:generate
```

### Configuration PostgreSQL
```bash
# Configuration Laravel pour PostgreSQL
echo "DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=skol_dev
DB_USERNAME=skol
DB_PASSWORD=password" >> .env

# Installer le driver PostgreSQL pour PHP
sudo apt-get install php-pgsql  # Ubuntu/Debian
# ou
brew install php@8.2-pgsql      # macOS

# Créer les migrations de base avec PostgreSQL
php artisan make:migration create_modules_table
php artisan make:migration create_subscription_plans_table
php artisan make:migration create_plan_modules_table
php artisan make:migration create_school_subscriptions_table
php artisan make:migration create_school_modules_table

# Migrations principales du schéma Skol
php artisan make:migration create_schools_table
php artisan make:migration create_school_levels_table
php artisan make:migration create_school_years_table
php artisan make:migration create_terms_table
php artisan make:migration create_classrooms_table
php artisan make:migration create_rooms_table
php artisan make:migration create_teachers_table
php artisan make:migration create_students_table
php artisan make:migration create_parents_table
php artisan make:migration create_student_parent_pivot_table
php artisan make:migration create_subjects_table
php artisan make:migration create_schedules_table
php artisan make:migration create_grades_table
php artisan make:migration create_payments_table
php artisan make:migration create_attendances_table
php artisan make:migration create_documents_table
php artisan make:migration create_disciplines_table
php artisan make:migration create_messages_table
```

## ✅ Étape 7 : Validation de la Structure

### Vérifier la structure complète
```bash
# Retour à la racine
cd ..

# Vérifier que tout est en place
tree -L 3 skol/
```

La structure devrait ressembler à :
```
skol/
├── backend/          # API Laravel avec modules
├── web/             # Site Next.js
├── mobile/          # App React Native
├── docs/            # Documentation
└── deployment/      # Docker & CI/CD
```

## 🚀 Prochaines Étapes

1. **Configurer la base de données** et créer les migrations
2. **Implémenter l'authentification** et les rôles
3. **Développer les modules** un par un (Core → Academic → Grading...)
4. **Tester l'intégration** entre backend, web et mobile
5. **Déployer en staging** pour validation

Quelle étape souhaitez-vous aborder en premier ?