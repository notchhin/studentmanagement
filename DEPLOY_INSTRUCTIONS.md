# Deployment Instructions for InfinityFree

## 1. Prepare InfinityFree Account
1. Log in to your InfinityFree client area.
2. Create an account (domain) if you haven't already.
3. Note down your **FTP Details** (Host, Username, Password) from the "FTP Details" or "Settings" page.
4. Note down your **MySQL Details** (Host, Username, Password, Database Name) from the "Databases" page.

## 2. Configure GitHub Secrets
1. Go to your GitHub repository.
2. Click on **Settings** > **Secrets and variables** > **Actions**.
3. Click **New repository secret** and add the following:
   - `FTP_SERVER`: (e.g., ftpupload.net)
   - `FTP_USERNAME`: (Your InfinityFree FTP username, e.g., if0_36382...)
   - `FTP_PASSWORD`: (Your InfinityFree FTP password)
   - `VITE_API_BASE_URL`: (Your website URL + /api, e.g., http://school-hoc.ct.ws.infinityfreeapp.com/api)
     *Important: Do not add a trailing slash after /api.*

## 3. Database Setup
1. Open **phpMyAdmin** in your InfinityFree control panel.
2. Select your database.
3. Import your local SQL database export file.
4. Go to the `File Manager` in InfinityFree.
5. Navigate to `htdocs/api`.
6. Look for the `.env` file. If it doesn't exist, create a new file named `.env`.
7. Paste the content of `.env.example` (from your local API folder) into this new `.env` file.
8. Edit the `.env` file on the server with your **InfinityFree Database Details**:

```env
APP_NAME=SchoolProject
APP_ENV=production
APP_DEBUG=false
APP_URL=http://school-hoc.ct.ws.infinityfreeapp.com

DB_CONNECTION=mysql
DB_HOST=sqlXXX.infinityfree.com  <-- Replace with your MySQL Host
DB_PORT=3306
DB_DATABASE=if0_XXXX_thesis_back <-- Replace with your DB Name
DB_USERNAME=if0_XXXXXX           <-- Replace with your DB Username
DB_PASSWORD=YourPassword         <-- Replace with your DB Password

BROADCAST_DRIVER=log
CACHE_DRIVER=file
FILESYSTEM_DISK=local
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
```

## 4. Final Steps
1. Push your code to the `main` or `master` branch on GitHub.
2. Go to the **Actions** tab in GitHub to watch the deployment progress.
3. Once finished, visit your website URL.
   - The Frontend should load at `http://your-domain.infinityfreeapp.com`
   - The API should be accessible at `http://school-hoc.ct.ws.infinityfreeapp.com/api`

## Troubleshooting
- **404 Errors on Refresh (Frontend):** Ensure the `.htaccess` file exists in `htdocs` (the root).
- **500 Errors (API):** Check `htdocs/api/storage/logs/laravel.log`. Ensure permissions for `storage` and `bootstrap/cache` are writable (777 is often required on InfinityFree).
- **Database Errors:** Double-check your `.env` credentials in `htdocs/api/.env`.
