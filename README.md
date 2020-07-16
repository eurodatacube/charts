# Helm charts used in Euro Data Cube projects

### Chart upgrade steps

1) update referenced `docker image` and `chart version number` in specific chart
2) navigate to `packages` folder
3) create helm package (e.g. `helm package .././ogc-edc`)
4) upload package to Chart Repository, e.g. by  
  `kubectl cp ogc-edc-tb16-dapa-0.0.0-latest.tgz edc-dev/edc-dev-edc-charts-chartmuseum-<INSERT CURRENT POD HASH>:/storage`  
  (and for production without `dev`)
