param (
)

Configuration Teams_2_4_Incorrect
{
    param (
    )

    Import-DscResource -ModuleName 'Microsoft365DSC'

    Node localhost
    {
        TeamsFederationConfiguration Meeting_Settings
        {
            AllowFederatedUsers                         = $True;
            AllowedDomains                              = @();
            Identity                                    = "Global";
            ApplicationId                               = $ConfigurationData.NonNodeData.ApplicationId;
            CertificateThumbprint                       = $ConfigurationData.NonNodeData.CertificateThumbprint;
            TenantId                                    = $ConfigurationData.NonNodeData.TenantId;
        }
        TeamsMeetingPolicy Global
        {
            Ensure                                     = "Present";
            AllowAnonymousUsersToJoinMeeting           = $False;
            Identity                                   = "Global";
            ApplicationId                              = $ConfigurationData.NonNodeData.ApplicationId;
            TenantId                                   = $ConfigurationData.NonNodeData.TenantId;
            CertificateThumbprint                      = $ConfigurationData.NonNodeData.CertificateThumbprint;
        }

        TeamsMeetingPolicy Custom_Policy_1
        {
            Ensure                                     = "Present";
            AllowAnonymousUsersToJoinMeeting           = $False;
            Identity                                   = "Custom Policy 1";
            ApplicationId                              = $ConfigurationData.NonNodeData.ApplicationId;
            TenantId                                   = $ConfigurationData.NonNodeData.TenantId;
            CertificateThumbprint                      = $ConfigurationData.NonNodeData.CertificateThumbprint;
        }
    }
}

Teams_2_4_Incorrect -ConfigurationData .\ConfigurationData.psd1
