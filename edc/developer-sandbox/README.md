# EDC Developer Sandbox

This app exposes EDC backend services such that developers can use them while developing their own applications.

When deployed, it provides a subdomain under which the following endpoints documented below are available.
You can use this subdomain as test backend (`CORS` headers are enabled)

When submitting your application, please configure it such that requests are only made to the current subdomain.
This way, user deployments will actually make use of their own backend.

### SentinelHub Token

A `POST` request to `/token_sentinel_hub` will return a `JSON`-response with the following schema:

```
{
  "access_token": "eyJraWQiOiJzaCIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiIwZDE0ZTczM[...]",  
  "expires_at": 1597845795.8934262,  
  "expires_in": 3599
}
```
