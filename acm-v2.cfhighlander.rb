CfhighlanderTemplate do
  Name 'acm-v2'
  Description "acm-v2 - #{component_version}"

  Parameters do
    ComponentParam 'EnvironmentName', 'dev', isGlobal: true
    ComponentParam 'EnvironmentType', 'development', allowedValues: ['development','production'], isGlobal: true
    ComponentParam 'DomainName'
    ComponentParam 'HostedZoneId'
    ComponentParam 'AlternativeNames', ''
  end

end
