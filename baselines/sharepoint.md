# Introduction

SharePoint Online is a web-based collaboration and document management
platform. Though highly flexible, it is primarily used to store
documents and communicate information across organizations.
Organizations can create sites, pages, document libraries, lists and
custom applications.

In this baseline, the types of SharePoint Online users are defined as
follows (Note: these terms vary in use across Microsoft documentation
and within the context of different M365 workloads (e.g., Teams vs
SharePoint Online):

1.  **Internal users**: members of the agency’s M365 organization.

2.  **External users**: members of a different M365 organization.

3.  **Business to Business (B2B) guest users**: external users that are
    formally invited to collaborate and added to the agency’s Azure
    Active Directory (AAD) as guest users. These users authenticate with
    their home organization/tenant and are granted access by virtue of
    being listed as guest users on the tenant’s AAD.

4.  **Unmanaged users**: users that are not members of any M365 tenant
    or organization (e.g., recipients of an “Anyone link.”)

    External sharing within SharePoint Online is defined as users within
    an organization sharing content with people outside the organization
    (external users, B2B guest users, or unmanaged users), or with
    licensed users on multiple Microsoft 365 subscriptions if the agency
    has more than one subscription. SharePoint has external sharing
    settings at both the organizational level and the site level
    (previously called the "site collection" level). To allow external
    sharing on any site, it must be allowed at the organization level.
    Then external sharing can be restricted for other sites. If a site's
    external sharing option and the organization-level sharing option
    don't match, the most restrictive value will always be applied.

    Source:
    <https://docs.microsoft.com/en-us/sharepoint/external-sharing-overview>

## Resources

**<u>License Compliance and Copyright</u>**

Portions of this document are adapted from documents in Microsoft’s
[Microsoft
365](https://github.com/MicrosoftDocs/microsoft-365-docs/blob/public/LICENSE)
and
[Azure](https://github.com/MicrosoftDocs/azure-docs/blob/main/LICENSE)
GitHub repositories. The respective documents are subject to copyright
and are adapted under the terms of the Creative Commons Attribution 4.0
International license. Source documents are linked throughout this
document. The United States Government has adapted selections of these
documents to develop innovative and scalable configuration standards to
strengthen the security of widely used cloud-based software services.

## Assumptions

The **License Requirements** sections of this document assume the
organization is using an [M365
E3](https://www.microsoft.com/en-us/microsoft-365/compare-microsoft-365-enterprise-plans)
or [G3](https://www.microsoft.com/en-us/microsoft-365/government)
license level. Therefore, only licenses not included in E3/G3 are
listed.

# Baselines

## 1. External Sharing

SharePoint allows sharing with users who are outside the agency, which
is convenient but may pose a data loss or other information security
risk. This working group recommends allowlisting by domains and security
groups per interagency collaboration needs.

**Note**: Adjusting this setting will adjust external sharing
for OneDrive and Teams to the same, selected level. OneDrive and Teams
can be less permissive (not more permissive) than SharePoint Online.

Adding approved domains and security groups will also be reflected in
OneDrive external sharing settings.

External access may be granted on a per-domain basis. This may be
desirable in some cases, e.g., for agency-to-agency collaboration (see
the CIO Council's [Interagency Collaboration
Program](https://community.max.gov/display/Egov/Interagency+Collaboration+Program)’s
OMB Max Site for a list of .gov domains for sharing).

### Policies
#### MS.SHAREPOINT.1.1v1
External sharing SHOULD be limited to Existing Guests or the more restrictive setting, Only People in your Organization.
- _Rationale:_ TODO
- _Last modified:_ June 2023
- _Note:_ Same implementation in MS.ONEDRIVE.1.1v1

#### MS.SHAREPOINT.1.2v1
External sharing SHOULD be limited to approved domains per interagency collaboration needs.
- _Rationale:_ TODO
- _Last modified:_ June 2023

#### MS.SHAREPOINT.1.3v1
External sharing SHOULD be limited to approved security groups per interagency collaboration needs.
- _Rationale:_ TODO
- _Last modified:_ June 2023

#### MS.SHAREPOINT.1.4v1
Guest access SHOULD be limited to the email the invitation was sent.
- _Rationale:_ TODO
- _Last modified:_ June 2023

### Resources

- [Manage sharing settings \| Microsoft
  Documents](https://docs.microsoft.com/en-us/sharepoint/turn-external-sharing-on-or-off)

### License Requirements

- N/A

### Implementation

MS.SHAREPOINT.1.1v1, in the **SharePoint admin center**:

1.  Select **Policies** -\> **Sharing**

2.  Adjust external sharing slider to **Existing Guests** or **Only people in your organization**

3. Select **Save**

MS.SHAREPOINT.1.2v1, in the **SharePoint admin center**:

1.  Select **Policies** -\> **Sharing**

2.  Expand **More external sharing settings**

3.  Select **Limit external sharing by domain**

4.  Select **Add domains**

5.  Add approved external domains

6.  Select **Save**

MS.SHAREPOINT.1.3v1, in the **SharePoint admin center**:

1.  Select **Policies** -\> **Sharing**

2.  Expand **More external sharing settings**

3.  Select **Allow only users in specific security groups to share
    externally**

4.  Select **Manage security groups**

5. Add approved security groups

6. Select **Save**

MS.SHAREPOINT.1.4v1, in the **SharePoint admin center**:

1.  Select **Policies** -\> **Sharing**

2.  Expand **More external sharing settings**

3. Select **Guests must sign in using the same account to which sharing invitations are sent**

4. Select **Save**

## 2. File and Folder Links Default Sharing Settings

This policy ensures that when sharing files in SharePoint, there are
several possible scopes, including agency-wide or “anyone with the
link.”

### Policies

#### MS.SHAREPOINT.2.1v1
File and folder links default sharing setting SHALL be set to Specific People (only the people the user specifies).
- _Rationale:_ TODO
- _Last modified:_ June 2023
_Note:_ Similar implementation in MS.ONEDRIVE.3.1v1

### Resources

- [File and folder links \| Microsoft
  Documents](https://docs.microsoft.com/en-us/sharepoint/turn-external-sharing-on-or-off#file-and-folder-links)

### License Requirements

- N/A

### Implementation

MS.SHAREPOINT.2.1v1, in the **SharePoint admin center**:

1.  In the left-hand navigation bar, click **Policies** -\> **Sharing**
    to display sharing settings

2.  Under **File and folder links**, ensure that the default link type
    is set to **Specific people (only the people the user specifies)**

3.  Select **Save**

## 3. Sensitivity Levels

SharePoint allows sharing with users who are outside the agency, which
is convenient but may pose a data loss or other information security
risk. This baseline policy recommends, outside of the default
organizational settings, agencies evaluate each created site and
adjust sharing settings best aligned to their respective sensitivity
level.

### Policies
#### MS.SHAREPOINT.3.1v1
Sharing settings for specific SharePoint sites SHOULD align to their sensitivity level.
- _Rationale:_ TODO
- _Last modified:_ June 2023

### Resources

- [Managing SharePoint Online Security: A Team Effort \| Microsoft
  Build](https://docs.microsoft.com/en-us/microsoft-365/community/sharepoint-security-a-team-effort)

### License Requirements

- N/A

### Implementation

MS.SHAREPOINT.3.1v1, in the **SharePoint admin center**:

1.  Select **Sites**

2.  Select **Active sites**

3.  Select **Site name**

4.  Select **Settings**

5.  Select **More sharing settings**

6.  Select permissions aligning to the risk posture associated with the
    sensitivity of the SharePoint site

7.  Select **Save**

## 4. Guest Access to a Site or OneDrive

SharePoint allows sharing with users who are outside the agency, which
is convenient but may pose a data loss or other information security
risk. This working group recommends setting an expiration time for guest
access to the site or OneDrive.

**Note**: Adjusting this setting will adjust external sharing
for OneDrive and Teams to the same, specified expiration times.

### Policies
#### MS.SHAREPOINT.4.1v1
Expiration timers for guest access to a site or OneDrive SHOULD be set to 30 days or less.
- _Rationale:_ TODO
- _Last modified:_ June 2023

#### MS.SHAREPOINT.4.2v1
Expiration timers for people who use a verification code SHOULD be set to 30 days or less.
- _Rationale:_ TODO
- _Last modified:_ June 2023

### License Requirements

- N/A

### Resources

- [Managing SharePoint Online Security: A Team Effort \| Microsoft
  Build](https://docs.microsoft.com/en-us/microsoft-365/community/sharepoint-security-a-team-effort)
- [Secure external sharing recipient experience \| Microsoft
  Build](https://learn.microsoft.com/en-us/sharepoint/what-s-new-in-sharing-in-targeted-release)

### Implementation

MS.SHAREPOINT.4.1v1, in the **SharePoint admin center**:

1.  Select **Policies** -\> **Sharing**

2.  Expand **More external sharing settings**

3.  Select **Guest access to a site or OneDrive will expire
    automatically after this many days**

4.  Enter “30” days or less

5.  Select **Save**

MS.SHAREPOINT.4.2v1, in the **SharePoint admin center**:

1.  Select **Policies** -\> **Sharing**

2.  Expand **More external sharing settings**

3.  Select **People who use a verification code must reauthenticate
    after this many days**

4.  Enter “30 days” or less

5.  Select **Save**

## 5. Custom Scripts

Allowing users to run custom scripts can potentially allow malicious
scripts to run in a trusted environment. Microsoft provides settings to
mitigate this risk by preventing users from running custom scripts.

###  Policy
#### MS.SHAREPOINT.5.1v1
Users SHALL be prevented from running custom scripts on personal sites.
- _Rationale:_ TODO
- _Last modified:_ June 2023

#### MS.SHAREPOINT.5.2v1
Users SHALL be prevented from running custom scripts on self-service created sites.
- _Rationale:_ TODO
- _Last modified:_ June 2023

### Resources

- [Allow or prevent custom script \| Microsoft
  Documents](https://docs.microsoft.com/en-us/sharepoint/allow-or-prevent-custom-script)

### License Requirements

- N/A

### Implementation

MS.SHAREPOINT.5.1v1, in the **SharePoint admin center**:

1.  Select **Settings**

2. Scroll down to select **classic settings page**

3.  Scroll to the **Custom Script** setting

4.  Select **Prevent users from running custom script on personal sites**

5.  Select **Ok**

MS.SHAREPOINT.5.1v1, in the **SharePoint admin center**:

1.  Select **Settings**

2. Scroll down to select **classic settings page**

3.  Scroll to the **Custom Script** setting

4.  Select **Prevent users from running custom script on self-service created
    sites**

5.  Select **Ok**

# Acknowledgements

In addition to acknowledging the important contributions of a diverse
team of Cybersecurity and Infrastructure Security Agency (CISA) experts,
CISA thanks the following federal agencies and private sector
organizations that provided input during the development of the Secure
Business Cloud Application’s security configuration baselines in
response to Section 3 of [Executive Order (EO) 14028, *Improving the
Nation’s
Cybersecurity*](https://www.federalregister.gov/documents/2021/05/17/2021-10460/improving-the-nations-cybersecurity):

- Consumer Financial Protection Bureau (CFPB)

- Department of the Interior (DOI)

- National Aeronautics and Space Administration (NASA)

- Sandia National Laboratories (Sandia)

- U.S. Census Bureau (USCB)

- U.S. Geological Survey (USGS)

- U.S. Office of Personnel Management (OPM)

- U.S. Small Business Administration (SBA)

The cross-agency collaboration and partnerships developed during this
initiative serve as an example for solving complex problems faced by the
federal government.

**Cybersecurity Innovation Tiger Team (CITT) Leadership**

Beau Houser (USCB), Sanjay Gupta (SBA), Michael Witt (NASA), James
Saunders (OPM), Han Lin (Sandia), Andrew Havely (DOI).

**CITT Authors**

Trafenia Salzman (SBA), Benjamin McChesney (OPM), Robert Collier (USCB),
Matthew Snitchler (Sandia), Darryl Purdy (USCB), Brandon Frankens
(NASA), Brandon Goss (NASA), Nicole Bogeajis (DOI/USGS), Kevin Kelly
(DOI), Adnan Ehsan (CFPB), Michael Griffin (CFPB), Vincent Urias
(Sandia), Angela Calabaza (Sandia).

**CITT Contributors**

Dr. Mukesh Rohatgi (MITRE), Lee Szilagyi (MITRE), Nanda Katikaneni
(MITRE), Ted Kolovos (MITRE), Thomas Comeau (MITRE), Karen Caraway
(MITRE), Jackie Whieldon (MITRE), Jeanne Firey (MITRE), Kenneth Myers
(General Services Administration).