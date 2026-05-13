# Remote Desktop Connection via GitHub Actions

This repository uses GitHub Actions to create an RDP tunnel via Ngrok on a Windows runner. The workflow configures RDP, starts Ngrok, and prints the connection address and login credentials.

### How it works
- The GitHub Action runs on `windows-latest`.
- Ngrok is downloaded and authenticated using your `NGROK_AUTH_TOKEN` secret.
- Remote Desktop is enabled and the `runneradmin` account password is set.
- Ngrok opens a TCP tunnel to port `3389`.
- The workflow prints the public RDP address and login details.
- The job stays alive for ~55 minutes so you can connect.

### Required secret
1. In your repository, go to **Settings > Secrets and variables > Actions**.
2. Add a secret named `NGROK_AUTH_TOKEN`.
3. Paste your Ngrok auth token value.

### Usage
1. Push any commit or open the workflow run manually using **Actions > RDP via Ngrok > Run workflow**.
2. Open the workflow run logs and find the `Start Ngrok TCP tunnel and print connection info` step.
3. Copy the `RDP address`, `Username`, and `Password` from the logs.
4. Use Remote Desktop Connection with the printed address to connect.

### Default login details
- Username: `runneradmin`
- Password: `P@ssw0rd!`

> Keep the workflow run active while you connect. Once the job ends, the tunnel will close.

### Notes
- This is intended for temporary access only.
- The tunnel is valid while the GitHub Actions job is running.
- For security, do not reuse this password in production.

### Contributing
Feel free to open issues or submit pull requests for improvements.

## Local RDP Setup (Ubuntu)

For setting up RDP directly on an Ubuntu machine without GitHub Actions.

### Usage
1. Run `./setup_rdp.sh` on your Ubuntu system.
2. The script will install xrdp, create a user, start the service, and print the connection details.
3. Connect using Remote Desktop Connection.

### Default Credentials
- Username: `rdpuser`
- Password: `password123`

> Ensure your Ubuntu system has a desktop environment installed for the RDP session to display properly.
