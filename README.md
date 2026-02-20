README.md - DocuCloud


DocuCloud es una plataforma web para la gestión documental inteligente dirigida a PYMES de Medellín. Permite almacenar documentos en AWS S3, clasificarlos automáticamente con NLP, compartir enlaces seguros con caducidad y contraseña, y organizar vía PWA responsiva con modo offline-first.

Estado: En desarrollo (Versión 1.0 - MVP con autenticación, gestión docs, clasificación y seguridad). 
​

🎯 Características principales
Gestión de usuarios: Registro, login JWT, roles (Admin/Estándar), recuperación de contraseña.

Gestión documental: Subida (PDF/DOCX/TXT/imágenes hasta 50MB), carpetas personalizadas, favoritos, historial de actividades.

Clasificación inteligente: Automática por nombre/metadatos/NLP (spaCy), categorías múltiples, "Sin clasificar".

Búsqueda avanzada: Por nombre/categoría/etiquetas/tipo/fecha, sugerencias automáticas, historial reciente.

Compartir seguro: Enlaces con caducidad/contraseña, permisos lectura/escritura, logs de accesos.

Seguridad: Cifrado AES-256 en reposo/transito (HTTPS/TLS 1.2+), RBAC, auditoría, timeout 60min.

UI/UX: PWA responsive (PC/tablet/móvil), panel principal con recientes/favoritos, vistas previas PDF/imágenes.

Fuera de alcance v1.0: OCR avanzado, integraciones externas, apps nativas, pagos, firma digital.
​

🛠️ Stack tecnológico
Componente	Tecnologías
Backend	Java 21, Spring Boot, Gradle, API REST, PostgreSQL 14
Frontend	Vue.js 3, Vite, PWA, Node.js/npm
Clasificador	Python 3.10, FastAPI, spaCy (NLP)
Infra	AWS S3 (almacenamiento), Docker/Docker Compose, GitHub Actions (CI/CD)
Seguridad	JWT, bcrypt/Argon2, AES-256, OWASP best practices

📋 Estructura del proyecto
docucloud/
├── backend/          # Spring Boot API
├── frontend/         # Vue.js PWA
├── classifier/       # FastAPI + spaCy
├── docker-compose.yml # Servicios completos
├── docs/             # Documentos proyecto (alcance, HU, etc.)
└── README.md

🧪 Requisitos previos
Java 21, Node.js 20+, Python 3.10

Docker & Docker Compose

Cuenta AWS (S3/RDS) con capa gratuita/créditos educativos

PostgreSQL 14 (o vía Docker)

🚀 Instalación y ejecución

Desarrollo separado
Backend:
bash
cd backend
cp application-example.yml application.yml  # Configura DB/AWS
./gradlew bootRun

Frontend:
bash
cd frontend
npm install
npm run dev  # http://localhost:5173
Clasificador:


🧑‍💻 Contribución
Fork/clona el repo.

Crea rama: git checkout -b feature/nueva-func

Commit: git commit -m "feat: descripción clara"

Push/PR a develop (main es producción).

Tests: ./gradlew test (backend), npm test (frontend).


📚 Documentación adicional
Acta Constitución
​

Documento Alcance
​

Requerimientos
​

Historias Usuario
​

Casos Uso
​


🛡️ Licencia
MIT License - Proyecto educativo SENA ADSO. © 2026 Equipo DocuCloud: Cristian Rueda (Líder), Emmanuel Seguro, Oscar Petro, Mateo Vásquez.
​

🤝 Equipo & Contacto
Cristian Rueda (Arquitecto Backend): cristianruedav07@gmail.com
​

Emmanuel Seguro (Frontend): @
​

Oscar Petro (Fullstack/Clasificador): @
​

Mateo Vásquez (UI/UX): @
​
