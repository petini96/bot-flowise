DATABASE_URL=postgresql://postgres:typebot@typebot-db:5432/typebot
NEXTAUTH_URL=https://811c-177-5-247-196.ngrok-free.app
NEXT_PUBLIC_VIEWER_URL=https://d380-177-5-247-196.ngrok-free.app
ENCRYPTION_SECRET=9b6c625184177106275086ddbfa0f8b9

# Configurações de SMTP
ADMIN_EMAIL=vinicius.petini@ms.senai.br
SMTP_HOST=smtp.office365.com
SMTP_USERNAME=msqualifica@ms.senai.br
SMTP_PASSWORD="oV972G4v#"
NEXT_PUBLIC_SMTP_FROM=msqualifica@ms.senai.br
# smtp adicional
EMAIL_PORT=587
EMAIL_AUTH=true
EMAIL_STARTTLS=true

# Configurações de S3
S3_ACCESS_KEY=minio
S3_SECRET_KEY=minio123
S3_BUCKET=typebot
S3_ENDPOINT=host.docker.internal/s3