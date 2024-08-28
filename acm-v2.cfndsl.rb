CloudFormation do

  export = external_parameters.fetch(:export_name, external_parameters[:component_name])

  cert_tags = []
  cert_tags << { Key: "Name", Value: Ref('AWS::StackName') }
  cert_tags << { Key: "Environment", Value: Ref("EnvironmentName") }
  cert_tags << { Key: "EnvironmentType", Value: Ref("EnvironmentType") }

  tags = external_parameters.fetch(:tags, {})
  tags.each do |key, value|
    cert_tags << { Key: key, Value: value }
  end

  Condition(:AlternativeNamesEmpty, FnEquals(Ref(:AlternativeNames), ''))

  CertificateManager_Certificate(:Certificate) {
    DomainName Ref(:DomainName)
    DomainValidationOptions([
      DomainName: Ref(:DomainName),
      HostedZoneId:  Ref(:HostedZoneId)
    ])
    SubjectAlternativeNames(
      FnIf(:AlternativeNamesEmpty, 
        Ref('AWS::NoValue'), 
        FnSplit(',', Ref(:AlternativeNames))
      )
    )
    ValidationMethod 'DNS'
    Tags cert_tags
  }

  Output(:CertificateArn) {
    Value Ref(:Certificate)
    Export(FnSub("${EnvironmentName}-#{export}-cert-arn"))
  }

end
