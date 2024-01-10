# CISA M365 Security Configuration Baseline for Teams

Microsoft Teams is a cloud-based text and live chat workspace in Microsoft 365 that supports video calls, chat messaging, screen-sharing, and file sharing.. This Secure Configuration Baseline (SCB) provides specific policies to strengthen Microsoft Teams' security.

The Secure Cloud Business Applications (SCuBA) project run by the Cybersecurity and Infrastructure Security Agency (CISA) provides guidance and capabilities to secure federal civilian executive branch (FCEB) agencies’ cloud business application environments and protect federal information that is created, accessed, shared, and stored in those environments. 

The CISA SCuBA SCBs for M365 help secure federal information assets stored within M365 cloud business application environments through consistent, effective, and manageable security configurations. CISA created baselines tailored to the federal government’s threats and risk tolerance with the knowledge that every organization has different threat models and risk tolerance. Non-governmental organizations may also find value in applying these baselines to reduce risks.

The information in this document is being provided “as is” for INFORMATIONAL PURPOSES ONLY. CISA does not endorse any commercial product or service, including any subjects of analysis. Any reference to specific commercial entities or commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply endorsement, recommendation, or favoritism by CISA.

## License Compliance and Copyright 
Portions of this document are adapted from documents in Microsoft’s [Microsoft 365](https://github.com/MicrosoftDocs/microsoft-365-docs/blob/public/LICENSE) and [Azure](https://github.com/MicrosoftDocs/azure-docs/blob/main/LICENSE) GitHub repositories. The respective documents are subject to copyright and are adapted under the terms of the Creative Commons Attribution 4.0 International license. Source documents are linked throughout this document. The United States Government has adapted selections of these documents to develop innovative and scalable configuration standards to strengthen the security of widely used cloud-based software services.

## Assumptions
The **License Requirements** sections of this document assume the organization is using an [M365 E3](https://www.microsoft.com/en-us/microsoft-365/compare-microsoft-365-enterprise-plans) or [G3](https://www.microsoft.com/en-us/microsoft-365/government) license level at a minimum. Therefore, only licenses not included in E3/G3 are listed.

## Key Terminology
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119).

Access to Teams can be controlled by the user type. In this baseline,
the types of users are defined as follows (Note: these terms vary in use
across Microsoft documentation):

1.  **Internal users**: members of the agency’s M365 tenant.

2.  **External users**: members of a different M365 tenant.

3.  **Business to Business (B2B) guest users**: external users that are
    formally invited to collaborate with the team and added to the
    agency’s Azure Active Directory (AAD) as guest users. These users
    authenticate with their home organization/tenant and are granted
    access to the team by virtue of being listed as guest users on the
    tenant’s AAD.

4.  **Unmanaged users**: users who are not members of any M365 tenant or
    organization (e.g., personal Microsoft accounts).

5.  **Anonymous users**: Teams users joining calls that are not
    authenticated through the agency’s tenant, including unmanaged
    users, external users (except for B2B guests), and true anonymous
    users, meaning users that are not logged in to any Microsoft or
    organization account, such as dial-in users.[^1]


# Baseline Policies

## 1. Meeting Policies

This section helps reduce security risks posed by the external participants during the meeting. In this instance, the term “external participants” includes external users, B2B guest users, unmanaged users and anonymous users. 

This section also helps reduce security risks related to the user permissions for recording Teams meetings and Events. These policies and user permissions apply to meetings hosted by a user, during one-on-one calls, and on group calls started by a user. Agencies should comply with any other applicable policies or legislation in addition to this guidance.

### Policies

#### MS.TEAMS.1.1v1
External meeting participants SHOULD NOT be enabled to request control of shared desktops or windows.

- _Rationale:_ There is risk in granting an external participant control of a shared screen because the participant could potentially perform unauthorized actions on the shared screen. This policy reduces that risk by removing the ability of an external participant to request control.  However, if agency has a legitimate use case to grant this control, it may be done on a 'as-needed' basis.
- _Last modified:_ July 2023
- _Note:_ This policy applies to the Global (Org-wide default) meeting policy and in custom meeting policies if they exist.

#### MS.TEAMS.1.2v1
Anonymous users SHALL NOT be enabled to start meetings.
- _Rationale:_ For any agencies that implemented custom policies that provided more flexibility to some users to automatically admit "everyone" to a meeting - this policy provides protection from anonymous users starting meeting to scrape internal contacts.
- _Last modified:_ July 2023
- _Note:_ This policy applies to the Global (Org-wide default) meeting policy and in custom meeting policies if they exist.

#### MS.TEAMS.1.3v1
Anonymous users and dial-in callers, SHOULD NOT be admitted automatically. 

- _Rationale:_ Allowing the anonymous and dial-in users automatically reduces the control on who can participate in a meeting and potential for data breaches. This policy reduces the risk by requiring all anonymous and dial-in users to wait in a lobby until they were admitted by an authorized meeting participant. If the agency has a use case to have members of specific trusted organizations and/or B2B guests enter a meeting automatically, custom policies may be created and assigned to authorized meeting organizers.  
- _Last modified:_ July 2023
- _Note:_ This policy applies to the Global (Org-wide default) meeting policy. Custom meeting policies MAY be created that allow more flexibility for specific users. For example, B2B guest users and trusted partner members maybe auto admitted into meetings organized by authorized users. 

#### MS.TEAMS.1.4v1
Internal users SHOULD be admitted automatically.
- _Rationale:_ Requiring internal users to wait in the lobby for explicit admit can lead to admit fatigue. This policy enables the internal users to be automatically admitted to meeting through global policy.  
- _Last modified:_ July 2023
- _Note:_ This policy applies to the Global (Org-wide default) meeting policy. Custom meeting policies MAY be created that allow more flexibility for specific users.

#### MS.TEAMS.1.5v1
Dial-in users, SHOULD NOT be enabled to bypass the lobby.
- _Rationale:_ Allowing the Dial-in users automatically reduces the control on who can participate in a meeting and potential for data breaches. This policy reduces the risk by requiring all dial-in users to wait in a lobby until they were admitted by an authorized meeting participant.   
- _Last modified:_ July 2023
- _Note:_ This policy applies to the Global (Org-wide default) meeting policy and in custom meeting policies if they exist.  

#### MS.TEAMS.1.6v1
Meeting recording SHOULD be disabled.
- _Rationale:_ The security risk with allowing all users to record Teams meetings and group calls exposes the ability to capture all audio, video, screen sharing activity, and information shared. By disabling the meeting recording setting in the Global (org-wide default) meeting policy an agency will limit this exposure of information. 
- _Last modified:_ July 2023
- _Note:_ This policy applies to the Global (Org-wide default) meeting policy and in custom meeting policies if they exist. Custom policies MAY be created to allow more flexibility for specific users.

#### MS.TEAMS.1.7v1
Record an event SHOULD be set to Organizer can record.
- _Rationale:_ The security risk of the default settings for Live Events is that Live Events are available to be recorded by all participants by default. By limiting the recording permissions to only the organizer this minimizes the security risk to the organizer's discretion for these Live Events.
- _Last modified:_ July 2023
- _Note:_ This policy applies to the Global (Org-wide default) meeting policy and in custom meeting policies if they exist. Custom policies MAY be created to allow more flexibility for specific users.

### Resources

- [Manage who can present and request control in Microsoft Teams \| Microsoft
  Learn](https://learn.microsoft.com/en-us/microsoftteams/meeting-who-present-request-control) 
- [Meeting policy settings \| Microsoft Learn](https://learn.microsoft.com/en-us/microsoftteams/settings-policies-reference#meetings)

- [Teams cloud meeting recording \| Microsoft
Learn ](https://learn.microsoft.com/en-us/microsoftteams/cloud-recording)

- [Assign policies in Teams – getting started \| Microsoft
Learn](https://learn.microsoft.com/en-us/microsoftteams/policy-assignment-overview)
- [Live Event Recording Policies \| Microsoft
Learn](https://learn.microsoft.com/en-us/microsoftteams/teams-live-events/live-events-recording-policies)



### License Requirements

- N/A

### Implementation
All the settings in this section are configured in the **Microsoft Teams admin
    center**.
#### MS.TEAMS.1.1v1 instructions:
To ensure external participants do not have the ability to request
control of the shared desktop or window in the meeting:

1.  Sign in to the **Microsoft Teams admin center**.

2.  Select **Meetings** > **Meeting policies**.

3.  Select the **Global (Org-wide default)** policy.

4.  Under the **Content sharing** section, set **External
    participants can give or request control** to **Off**.

5.  If custom policies have been created, repeat these steps for each
    policy, selecting the appropriate policy in step 3.

#### MS.TEAMS.1.2v1 instructions:
To configure settings for anonymous users:
1.	Sign in to the **Microsoft Teams admin center**.

2.	Select **Meetings** > **Meeting policies**.

3.	Select the **Global (Org-wide default)** policy.

4.	Under the **Meeting join & lobby** section, set **Anonymous users and dial-in callers can start a meeting** to **Off**.

5.	If custom policies have been created, repeat these steps for each policy, selecting the appropriate policy in step 3.

#### MS.TEAMS.1.3v1 instructions:
1.	Sign in to the **Microsoft Teams admin center**.

2.	Select **Meetings** > **Meeting policies**.

3.	Select the **Global (Org-wide default)** policy.

4.	Under the **Meeting join & lobby** section, ensure **Who can bypass the lobby** is **not** set to **Everyone**. Bypassing the lobby should be set to **People in my org**, though other options may be used if needed.

5.	In the same section, set **People dialing in can bypass the lobby** to **Off**.
#### MS.TEAMS.1.4v1 instructions:
1.	Sign in to the **Microsoft Teams admin center**.

2.	Select **Meetings** > **Meeting policies**.

3.	Select the **Global (Org-wide default)** policy.

4.	Under the **Meeting join & lobby** section, ensure **Who can bypass the lobby** is set to **People in my org**.

5.	In the same section, set **People dialing in can bypass the lobby** to **Off**.
#### MS.TEAMS.1.5v1 instructions:
1.	Sign in to the **Microsoft Teams admin center**.

2.	Select **Meetings** > **Meeting policies**.

3.	Select the **Global (Org-wide default)** policy.

4.	Under the **Meeting join & lobby** section, set **People dialing in can bypass the lobby** to **Off**.

#### MS.TEAMS.1.6v1 instructions:

1.  Sign in to the **Microsoft Teams admin center**.

2.  Select **Meetings** > **Meeting policies**.

3.  Select the **Global (Org-wide default)** policy.

4.  Under the **Recording & transcription** section, set **Meeting
    recording** to **Off**.

5.  Select **Save**.


#### MS.TEAMS.1.7v1 instructions:

1.  Sign in to the **Microsoft Teams admin
    center**.

2.  Select **Meetings** > **Live events policies**.

3.  Select **Global (Org-wide default)**.

4.  Set **Record an event** to **Organizer can record**.

5.  Click **Save**.

6.  If custom policies have been created, repeat these steps for each
    policy, selecting the appropriate policy in step 3.

## 2. External User Access
This section helps reduce security risks related to external and unmanaged user access. In this instance, external users refer to members of a different M365 tenant. 

External access allows external users to look up internal users by their
email address to initiate chats and calls entirely within Teams.
Blocking external access prevents external users from using Teams as an
avenue for reconnaissance or phishing. Even with external access
disabled, external users will still be able to join Teams calls,
assuming anonymous join is enabled. Depending on agency need, if both
external access and anonymous join need to be blocked—neither required
nor recommended by this baseline—external collaborators would only be
able to attend meetings if added as a B2B guest user.

External access may be granted on a per-domain basis. This may be
desirable in some cases, e.g., for agency-to-agency collaboration (see
the CIO Council's [Interagency Collaboration
Program](https://community.max.gov/display/Egov/Interagency+Collaboration+Program)’s
OMB Max Site for a list of .gov domains for sharing).

Blocking contact with unmanaged Teams users prevents these users from looking up internal users by their email address and initiating chats and calls within Teams. These users would still be able to join calls, assuming anonymous join is enabled. Additionally, unmanaged users may be added to Teams chats if the internal user initiates the contact.



### Policies

#### MS.TEAMS.2.1v1
External access for users SHALL only be enabled on a per-domain basis.
- _Rationale:_ The default configuration is to allow members to communicate with all external users with similar access permissions. This unrestricted access can lead to data breaches and other security threats. This policy provides protection against threats posed by unrestricted access by allowing communication with only trusted domains.  
- _Last modified:_ July 2023

#### MS.TEAMS.2.2v1
Unmanaged users SHALL NOT be enabled to initiate contact with internal
users.
- _Rationale:_ Allowing access to unmanaged users can open up the threat of email and contact address scavenging. This policy provides protection against this threat. 
- _Last modified:_ July 2023

#### MS.TEAMS.2.3v1
Internal users SHOULD NOT be enabled to initiate contact with unmanaged
users.
- _Rationale:_ Access to unmanaged users can pose the risk of data leakage and other security threats. This policy provides protection by disabling the internal user access to unmanaged users. 
- _Last modified:_ July 2023
- _Note:_ This policy is not applicable to GCC, GCC High, and DoD tenants.  

### Resources

- [Manage external access in Microsoft Teams \| Microsoft
  Learn](https://learn.microsoft.com/en-us/microsoftteams/manage-external-access)

- [Allow anonymous users to join meetings \| Microsoft
  Learn](https://learn.microsoft.com/en-us/microsoftteams/meeting-settings-in-teams#allow-anonymous-users-to-join-meetings)

- [Use guest access and external access to collaborate with people
  outside your organization \| Microsoft
  Learn](https://learn.microsoft.com/en-us/microsoftteams/communicate-with-users-from-other-organizations)

- [Manage contact with external Teams users not managed by an organization
\| Microsoft
Learn](https://learn.microsoft.com/en-us/microsoftteams/manage-external-access#manage-contact-with-external-teams-users-not-managed-by-an-organization)

### License Requirements

- N/A

### Implementation

All the settings in this section are configured in the **Microsoft Teams admin center**. Steps for the unmanaged users are outlined in [Manage contact with external Teams users not
managed by an
organization](https://learn.microsoft.com/en-us/microsoftteams/manage-external-access#manage-contact-with-external-teams-users-not-managed-by-an-organization).

#### MS.TEAMS.2.1v1 instructions:  
To enable external access for only specific domains:

1.  Sign in to the **Microsoft Teams admin center**.

2.  Select **Users** > **External access**.

3.  Under **Choose which external domains your users have access to**,
    select **Allow only specific external domains**.

4.  Click **Allow domains** to add allowed external domains. All domains
    not added in this step will be blocked.

5.  Click **Save**.


#### MS.TEAMS.2.2v1 instructions:
    
1.  Sign in to the **Microsoft Teams admin center**.

2.  Select **Users > External access**. 

3. Under **Teams accounts not managed by an organization**, toggle **People in my organization can communicate with Teams users whose accounts aren't managed by an organization** to one of the following:
    1. To completely block contact with unmanaged users, toggle the setting to **Off**.
    2. To allow contact with unmanaged users only if the internal user initiates the contact:
        - Toggle the setting to **On**.
        - Clear the check next to **External users with Teams accounts not managed by an organization can contact users in my organization**.



#### MS.TEAMS.2.3v1 instructions:
    
1.  Sign in to the **Microsoft Teams admin center**.

2.  Select **Users > External access**.

3.  To completely block contact with unmanaged users, under **Teams
    accounts not managed by an organization**, set **People in my
    organization can communicate with Teams users whose accounts aren't
    managed by an organization** to **Off**.



## 3. Skype Users

This section helps reduce security risks related to contact with Skype users. As Microsoft is officially retiring Skype for Business Online and wants to ensure customers have the required information and resources to plan and execute a successful upgrade to Teams. Below are the decommissioning dates by product:
- Skype for Business Online: Jul 31, 2021
- Skype for Business 2015: Apr 11, 2023
- Skype for Business 2016: Oct 14, 2025
- Skype for Business 2019: Oct 14, 2025
- Skype for Business Server 2015: Oct 14, 2025
- Skype for Business Server 2019: Oct 14, 2025
- Skype for Business LTSC 2021: Oct 13, 2026

### Policies

#### MS.TEAMS.3.1v1
Contact with Skype users SHALL be blocked.
- _Rationale:_ The security risk of allowing contact with Skype users is aligned with the risk of contact with a retiring product and its current vulnerabilities. Microsoft is officially retiring all forms of Skype as listed above. By blocking contact with Skype users an agency is limiting access to security threats utilizing the vulnerabilities of the Skype product.
- _Last modified:_ July 2023

### Resources

- [Communicate with Skype users \| Microsoft
Learn](https://learn.microsoft.com/en-us/microsoftteams/external-meetings-skype-for-business-server-hybrid)

- [Skype for Business Online to Be Retired in 2021 \| Microsoft Teams
Blog](https://techcommunity.microsoft.com/t5/microsoft-teams-blog/skype-for-business-online-to-be-retired-in-2021/ba-p/777833)

### License Requirements

- N/A

### Implementation

All the settings in this section are configured in the **Microsoft Teams admin center**.

#### MS.TEAMS.3.1v1 instructions:

1.  Sign in to the **Microsoft Teams admin center**.

2.  Select **Users > External access**.

3.  Under **Skype** users, set **Allow users in my organization to
    communicate with Skype users** to **Off**.

4.  Click **Save**.

## 4. Teams Email Integration
This section helps reduce security risks related to Teams email integration. Teams provides an optional feature that allows channels to have an email address and receive email.

### Policies
#### MS.TEAMS.4.1v1
Teams email integration SHALL be disabled.
- _Rationale:_ Microsoft Teams email integration associates a Microsoft, not tenant domain, email address with a Teams channel. Channel emails are addressed using the Microsoft-owned domain teams.ms. By disabling Teams email integration, an agency prevents potentially sensitive Teams messages from being sent through external email gateways.  
- _Last modified:_ July 2023
- _Note:_ Teams email integration is not available in GCC, GCC High, or DoD regions.

### Resources

- [Email Integration \| Microsoft
Learn](https://learn.microsoft.com/en-us/microsoftteams/settings-policies-reference#email-integration)

### License Requirements

- N/A

### Implementation

All the settings in this section are configured in the **Microsoft Teams admin center**.

#### MS.TEAMS.4.1v1 instructions:

1.  Sign in to the **Microsoft Teams admin
    center**.

2.  Select **Teams** > **Teams Settings**.

3.  Under the **Email integration** section, set **Users can send
    emails to a channel email address** to **Off**.

## 5. App Management
This section helps reduce security risks related to app integration with Microsoft Teams. Teams can integrate with the following classes of apps:

*Microsoft apps*: apps published by Microsoft.

*Third-party apps*: apps not authored by Microsoft, published to the
Teams store.

*Custom apps*: apps not published to the Teams store, such as apps under
development, that users sideload into Teams.

### Policies

#### MS.TEAMS.5.1v1
Agencies SHOULD only allow installation of Microsoft Apps approved by the agency.
- _Rationale:_ The security risk with allowing integration for all Microsoft Apps is access to Teams information through vulnerabilities that can be present in app unmanaged by the agency. By only allowing specific apps and blocking all others the agency will better manage its app integration and potential exposure points.
- _Last modified:_ July 2023
- _Note:_ This policy applies to the Global (Org-wide default) policy, all custom policies, and the org-wide app settings. Custom policies MAY be created to allow more flexibility for specific users.
 
#### MS.TEAMS.5.2v1
Agencies SHOULD only allow installation of third-party apps approved by the agency.
- _Rationale:_ The security risk with allowing integration of third-party apps is access to Teams information through vulnerabilities that can be present in an app unmanaged by the agency. By blocking installation of all third-party apps, the agency will disable the integration for Teams to said apps.
- _Last modified:_ July 2023
- _Note:_ This policy applies to the Global (Org-wide default) policy, all custom policies if they exist, and the org-wise settings. Custom policies MAY be created to allow more flexibility for specific users. Third-party apps are not available in GCC, GCC High, or DoD regions.

#### MS.TEAMS.5.3v1
Agencies SHOULD only allow installation of custom apps approved by the agency.
- _Rationale:_ The security risk with allowing integration of custom apps is access to Teams information through vulnerabilities that can be present in an app unmanaged by the agency. By blocking installation of all custom apps, the agency will disable the integration for Teams to said apps.
- _Last modified:_ July 2023
- _Note:_ This policy applies to the Global (Org-wide default) policy, all custom policies if they exist, and the org-wise settings. Custom policies MAY be created to allow more flexibility for specific users. Custom apps are not available in GCC, GCC High, or DoD regions.

### Resources

- [Manage app permission policies in Microsoft Teams \| Microsoft Learn](https://learn.microsoft.com/en-us/microsoftteams/teams-app-permission-policies)

- [Upload your app in Microsoft Teams \| Microsoft Learn](https://learn.microsoft.com/en-us/microsoftteams/platform/concepts/deploy-and-publish/apps-upload)

### License Requirements

- N/A.

### Implementation

All the settings in this section are configured in the **Microsoft Teams admin center**. 

#### MS.TEAMS.5.1v1 instructions:
1.  Sign in to the **Microsoft Teams admin center**.

2.  Select **Teams apps** > **Permission policies**.

3.  Select **Global (Org-wide default)**.

4.  Under **Microsoft apps**, select **Allow specific apps and block all others** or **Block all apps**.

5.  Click **Allow apps**.

6.  Search and Click **Add** to all appropriate Microsoft Apps.

7.  Click **Allow**.

8.  Click **Save**.

9.  If custom policies have been created, repeat these steps for each
    policy, selecting the appropriate policy in step 3.

#### MS.TEAMS.5.2v1 instructions:

1.  Sign in to the **Microsoft Teams admin center**.


7.  Select **Teams apps** > **Manage apps**.
8.  Select **Org-wide app settings** button to access pop-up options.
    - Under **Third-party apps** turn off **Third-party apps**.
    - Click **Save**.
2.  Select **Teams apps** > **Permission policies**.
3.  Select **Global (Org-wide default)**.

4.  Set **Third-party apps** to **Block all apps**, unless specific apps
    have been approved by the agency, in which case select **Allow
    specific apps and block all others**.

6.  Click **Save**.

11.  If custom policies have been created, repeat steps 4-7 for each
    policy, selecting the appropriate policy in step 5.

#### MS.TEAMS.5.3v1 instructions:

1.  Sign in to the **Microsoft Teams admin center**.


7.  Select **Teams apps** > **Manage apps**.
8.  Select **Org-wide app settings** button to access pop-up options 
    - Under **Custom apps** turn off **Interaction with custom apps**.
    - Click **Save**.
2.  Select **Teams apps** > **Permission policies**.
3.  Select **Global (Org-wide default)**.

5.  Set **Custom apps** to **Block all apps**, unless specific apps have
    been approved by the agency, in which case select **Allow specific
    apps and block all others**.

6.  Click **Save**.

11.  If custom policies have been created, repeat steps 4-8 for each
    policy, selecting the appropriate policy in step 5.

## 6. Data Loss Prevention

Data loss prevention (DLP) helps prevent both accidental leakage of
sensitive information as well as intentional exfiltration of data. DLP
forms an integral part of securing Microsoft Teams. There are
several commercial DLP solutions available that document support for
M365. Microsoft themselves offers DLP services, controlled within the Microsoft Purview
compliance portal. Agencies may select any service that fits their needs and meets
the requirements outlined in this baseline setting. The DLP solution selected by an agency
should offer services comparable to those offered by Microsoft.

Though use of Microsoft’s DLP solution is not strictly
required, guidance for configuring Microsoft’s DLP solution can be found in following section of the CISA M365 Security Configuration Baseline for Defender for Office 365.

- [Data Loss Prevention \| CISA M365 Security Configuration Baseline for Defender for Office 365](./defender.md#4-data-loss-prevention)

### Policies

#### MS.TEAMS.6.1v1
A DLP solution SHALL be enabled. The selected DLP solution SHOULD offer services comparable to the native DLP solution offered by Microsoft.
- _Rationale:_ Teams users may inadvertently disclose sensitive information to unauthorized individuals. Data loss prevention policies provide a way for agencies to detect and prevent unauthorized disclosures. 
- _Last modified:_ July 2023

#### MS.TEAMS.6.2v1
The DLP solution SHALL protect Personally Identifiable Information (PII)
and sensitive information, as defined by the agency. At a minimum, the
sharing of credit card numbers, taxpayer Identification Numbers (TIN),
and Social Security Numbers (SSN) via email SHALL be restricted.
- _Rationale:_ Teams users may inadvertently share sensitive information with others who should not have access to it. Data loss prevention policies provide a way for agencies to detect and prevent unauthorized sharing of sensitive information. 
- _Last modified:_ July 2023

### Resources

- [Plan for data loss prevention (DLP) \| Microsoft Learn](https://learn.microsoft.com/en-us/microsoft-365/compliance/dlp-overview-plan-for-dlp?view=o365-worldwide)

- [Personally identifiable information (PII) \|
  NIST](https://csrc.nist.gov/glossary/term/personally_identifiable_information#:~:text=NISTIR%208259,2%20under%20PII%20from%20EGovAct)

- [Sensitive information \|
  NIST](https://csrc.nist.gov/glossary/term/sensitive_information)

### License Requirements

- DLP for Teams requires an E5 or G5 license. See [Information
  Protection: Data Loss Prevention for Teams \| Microsoft Learn](https://learn.microsoft.com/en-us/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#information-protection-data-loss-prevention-for-teams)
  for more information.

### Implementation
#### MS.TEAMS.6.1v1 instructions:
Any product that meets the requirements outlined in this baseline policy may be used. If the agency is using Microsoft Defender, see the following implementation steps for [DLP](./defender.md#implementation-3) for additional guidance.

#### MS.TEAMS.6.2v1 instructions:
Any product that meets the requirements outlined in this baseline policy may be used. If the agency is using Microsoft Defender, see the following implementation steps for [DLP](./defender.md#implementation-3) for additional guidance.

## 7. Malware Scanning

Any product that meets the requirements outlined in this baseline policy group may be used. If the agency is using Microsoft Defender to implement malware scanning, see the following policies of the CISA M365 Security Configuration Baseline for Defender for Office 365 for additional guidance.

- [MS.DEFENDER.3.1v1 \| CISA M365 Security Configuration Baseline for Defender for Office 365](./defender.md#msdefender31v1)
  - Safe attachments SHOULD be enabled for SharePoint, OneDrive, and Microsoft Teams.

### Policies

#### MS.TEAMS.7.1v1
Attachments included with Teams messages SHOULD be scanned for malware.
- _Rationale:_ Teams can be used as a mechanism for delivering malware. In many cases, malware can be detected through scanning, reducing the risk for end users.
- _Last modified:_ July 2023

#### MS.TEAMS.7.2v1
Users SHOULD be prevented from opening or downloading files detected as malware.
- _Rationale:_ Teams can be used as a mechanism for delivering malware. In many cases, malware can be detected through scanning, reducing the risk for end users.
- _Last modified:_ July 2023

### Resources

- [Safe Attachments in Microsoft Defender for Office 365 \| Microsoft
  Learn](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/safe-attachments-about?view=o365-worldwide#safe-attachments-policy-settings)

- [Turn on Safe Attachments for SharePoint, OneDrive, and Microsoft
  Teams \| Microsoft
  Learn](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/safe-attachments-for-spo-odfb-teams-configure?view=o365-worldwide)

### License Requirements

- If using Microsoft Defender, requires Defender for Office 365 Plan 1 or 2. These are included with
  E5 and G5 and are available as add-ons for E3 and G3.

### Implementation
#### MS.TEAMS.7.1v1 instructions:
Any product that meets the requirements outlined in this baseline policy may be used. If the agency is using Microsoft Defender, see the following implementation steps for [Safe Attachments](./defender.md#implementation-2) for additional guidance.

#### MS.TEAMS.7.2v1 instructions:
Any product that meets the requirements outlined in this baseline policy may be used. If the agency is using Microsoft Defender, see the following implementation steps for [Safe Attachments](./defender.md#implementation-2) for additional guidance.

## 8. Link Protection

Several technologies exist for protecting users from malicious links
included in emails. For example, Microsoft Defender accomplishes this by
prepending:

`https://*.safelinks.protection.outlook.com/?url=`

to any URLs included in emails. By prepending the safe links URL,
Microsoft can proxy the initial URL through their scanning service.
Their proxy can perform the following actions:

- Compare the URL with a block list,

- Compare the URL with a list of know malicious sites, and

- If the URL points to a downloadable file, apply real-time file
  scanning.

If all checks pass, the user is redirected to the original URL.

Microsoft Defender includes link scanning capabilities. Use of Microsoft Defender is not strictly required for this purpose; any product that fulfills the requirements outlined in this baseline policy group may be used.
If the agency is using Microsoft Defender to meet this baseline policy group, see the following policy of the CISA M365 Security Configuration Baseline for Defender for Office 365 for additional guidance.

- [MS.DEFENDER.1.3v1 \| CISA M365 Security Configuration Baseline for Defender for Office 365](./defender.md#msdefender13v1).
  - All users SHALL be added to Defender for Office 365 Protection in either the standard or strict preset security policy.

### Policies

#### MS.TEAMS.8.1v1
URL comparison with a block-list SHOULD be enabled.
- _Rationale:_ Users may be directed to malicious websites via links in Teams. Blocking access to known, malicious URLs can prevent users from accessing known malicious websites.
- _Last modified:_ July 2023

#### MS.TEAMS.8.2v1
User click tracking SHOULD be enabled.
- _Rationale:_ Users may click on malicious links in Teams, leading to compromise or authorized data disclosure. Enabling user click tracking lets agencies know if a malicious link may have been visited after the fact to help tailor a response to a potential incident.
- _Last modified:_ July 2023

### Resources

- [Recommended settings for EOP and Microsoft Defender for Office 365
  security \| Microsoft Learn](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/recommended-settings-for-eop-and-office365)

- [Set up Safe Links policies in Microsoft Defender for Office 365 \| Microsoft Learn](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/safe-links-policies-configure?view=o365-worldwide)
  
### License Requirements

- N/A

### Implementation
#### MS.TEAMS.8.1v1 instructions:
Any product that meets the requirements outlined in this baseline policy may be used. If the agency is using Microsoft Defender, see the following implementation steps for [standard or strict preset security policy](.defender.md#msdefender13v1) for additional guidance.

#### MS.TEAMS.8.2v1 instructions:
Any product that meets the requirements outlined in this baseline policy may be used. If the agency is using Microsoft Defender, see the following implementation steps for [standard or strict preset security policy](.defender.md#msdefender13v1) for additional guidance.

# Acknowledgements

In addition to acknowledging the important contributions of a diverse
team of Cybersecurity and Infrastructure Security Agency (CISA) experts,
CISA thanks the following federal agencies and private sector
organizations that provided input during the development of the Secure
Business Cloud Application’s security configuration baselines in
response to Section 3 of [Executive Order (EO) 14028, *Improving the
Nation’s
Cybersecurity*](https://www.federalregister.gov/documents/2021/05/17/2021-10460/improving-the-nations-cybersecurity):

- The MITRE Corporation
- Sandia National Laboratories (Sandia)

The SCBs were informed by materials produced by the following organizations: 


- Center for Internet Security (CIS)
- Internet Engineering Task Force (IETF)
- Mandiant
- Microsoft
- U.S. Defense Information Systems Agency (DISA)
- U.S. National Institute of Standards (NIST)
- U.S. Office of Management and Budget (OMB)

The cross-agency collaboration and partnerships developed during this initiative serve as an example for solving complex problems faced by the federal government. CISA also thanks the Cybersecurity Innovation Tiger Team (CITT) for its leadership and the following federal agencies that provided input during the development of the baselines:

- Consumer Financial Protection Bureau (CFPB)
- Department of the Interior (DOI)
- National Aeronautics and Space Administration (NASA)
- U.S. Office of Personnel Management (OPM)
- U.S. Small Business Administration (SBA)
- U.S. Census Bureau (USCB)
- U.S. Geological Survey (USGS)


[^1]: Note that B2B guest users and all anonymous users except for
    external users appear in Teams calls as *John Doe (Guest)*. To avoid
    any potential confusion this may cause, true guest users are always
    referred to as B2B guest users in this document.

# Appendix A - Custom Meeting Policies

If there is a legitimate business need, custom meeting policies can be defined with *specific* users assigned to them. For example, custom meeting policies can be configured with *specific* users having
permission to record meetings. To allow specific users the ability to
record meetings:

1.  Sign in to the **Microsoft Teams admin center**.

2.  Select **Meetings** > **Meeting policies**.

3.  Create a new policy by selecting **Add**. Give this new policy a
    name and appropriate description.

4.  Under the **Recording & transcription** section, set **Cloud
    recording** to **On**.

5.  Select **Save**.

6.  After selecting **Save**, a table displays the set of policies.
    Select the row containing the new policy, then select **Manage
    users**.

7.  Assign the users that need the ability to record to this policy.

8.  Select **Apply**.
