# Helm charts used in Euro Data Cube projects
TEST

### Chart upgrade steps

1) update referenced `docker image` and `chart version number` in specific chart
2) navigate to `packages` folder
3) create helm package (e.g. `helm package .././ogc-edc`)
4) upload package to Chart Repository
