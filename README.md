# acm-v2 CfHighlander component

Creates a ACM certificate and validates using DNS

```bash
kurgan add acm-v2
```

## Parameters

| Name | Required | Use | Default | Global | Type | Allowed Values |
| ---- | -------- | --- | ------- | ------ | ---- | -------------- |
| EnvironmentName | true | Tagging | dev | true | string
| EnvironmentType | true | Tagging | development | true | string | ['development','production']
| DomainName | true | The fully qualified domain name (FQDN), such as www.example.com, with which you want to secure an ACM certificate | | false | string
| HostedZoneId | true | Id of the zone you want to create the CNAME record in to validate the certificate | | false | string
| AlternativeNames | false | list of alternitive fully qualified domain names (FQDN) to add to the certificate | | false | comma delimited list

## Outputs/Exports

| Name | Value | Exported |
| ---- | ----- | -------- |
| CertificateArn | Certificate Arn | true