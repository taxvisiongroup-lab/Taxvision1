# Taxvision – 3x-ui v3.7.0 for Railway

Files in this package:
- `Dockerfile`
- `start.sh`
- `nginx.conf.template`

## Replace files
Upload these three files to the root of your GitHub repository, replacing files with the same names, then commit/push.

## Railway
Deploy the GitHub repository and generate a public domain in Railway Networking. Nginx listens on the Railway-provided `PORT`.

## First panel URL
`https://YOUR-DOMAIN/managepanel/`

## Important inbound setting
For the WebSocket inbound routed through `/`, configure VLESS with:
- Listen port: `8080`
- Network: `ws`
- Security: `none`
- Path: your chosen path (for example `/cdn`)

The configuration and database are stored in `/etc/x-ui`. Attach a Railway Volume at `/etc/x-ui` if you need persistence across redeployments.

## Notes
- The Dockerfile downloads the official 3x-ui v3.7.0 Linux AMD64 release.
- This package is tailored to Railway's single exposed HTTP port. It is not a general-purpose multi-port deployment.
- Verify the service logs after deployment. Do not rely on default credentials; change the panel credentials immediately.
