**`TLP:CLEAR`**

# CISA M365 Security Configuration Baseline for [M365 Product]

Microsoft 365 (M365) [M365 Product] is a cloud-based [M365 Product description].

**Example:**
Microsoft 365 (M365) Defender is a cloud-based enterprise defense suite that coordinates prevention, detection, investigation, and response.

The Secure Cloud Business Applications (SCuBA) project run by the Cybersecurity and Infrastructure Security Agency (CISA) provides guidance and capabilities to secure federal civilian executive branch (FCEB) agencies’ cloud business application environments and protect federal information that is created, accessed, shared, and stored in those environments. 

The CISA SCuBA SCBs for M365 help secure federal information assets stored within M365 cloud business application environments through consistent, effective, and manageable security configurations. CISA created baselines tailored to the federal government’s threats and risk tolerance with the knowledge that every organization has different threat models and risk tolerance. Non-governmental organizations may also find value in applying these baselines to reduce risks.

The information in this document is being provided “as is” for INFORMATIONAL PURPOSES ONLY. CISA does not endorse any commercial product or service, including any subjects of analysis. Any reference to specific commercial entities or commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply endorsement, recommendation, or favoritism by CISA.

> This document is marked TLP:CLEAR. Recipients may share this information without restriction. Information is subject to standard copyright rules. For more information on the Traffic Light Protocol, see https://www.cisa.gov/tlp.


## License Compliance and Copyright 
Portions of this document are adapted from documents in Microsoft’s [Microsoft 365](https://github.com/MicrosoftDocs/microsoft-365-docs/blob/public/LICENSE) and [Azure](https://github.com/MicrosoftDocs/azure-docs/blob/main/LICENSE) GitHub repositories. The respective documents are subject to copyright and are adapted under the terms of the Creative Commons Attribution 4.0 International license. Source documents are linked throughout this document. The United States Government has adapted selections of these documents to develop innovative and scalable configuration standards to strengthen the security of widely used cloud-based software services.

## Assumptions
The **License Requirements** sections of this document assume the organization is using an [M365 E3](https://www.microsoft.com/en-us/microsoft-365/compare-microsoft-365-enterprise-plans) or [G3](https://www.microsoft.com/en-us/microsoft-365/government) license level at a minimum. Therefore, only licenses not included in E3/G3 are listed.

## Key Terminology
The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119).

*Any additional content in this section is only needed if a specific product baseline uses terms that are ambiguous or highly technical, that would benefit from explicit definition within the context of the document. Additional terms in this section should be added sparingly. 

**Example:**
Access to Teams can be controlled by the user type. In this baseline,
the types of users are defined as follows (Note: these terms vary in use
across Microsoft documentation):

1.  **Internal users**: members of the agency’s M365 tenant.

2.  **External users**: members of a different M365 tenant.

3.  **Business to Business** (B2B) guest users: external users that are
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
## 1. Policy Group 1
[Policy Group Description]

### Policies

#### MS.M365PRODUCT.1.1v1
POLICY 1.

<!--Policy: MS.M365PRODUCT.1.1v1; Criticality: [Criticality(SHALL,SHOULD,ETC)] -->
- _Rationale:_
  - 1st sentence: Security risk if policy is not implemented. "The security risk of [context of policy]"
  - 2nd sentence: How this policy minimizes this risk. By [Verb] the risk of [Vulnerability] is minimized."
  - **Example:** "The security risk with Microsoft Team's email integration is due to the fact that Teams channel's email addresses are not under the tenant’s domain, rather they are associated with the Microsoft-owned domain of "teams.ms". By disabling Teams email integration an agency will not utilize an email outside of its tenant's domain. "
- _Last modified:_ July 2023
- _Note:_ [As needed to note dependencies or "MAY" statements for more flexibility]
  - **Example:** "This policy is only applicable if the external sharing slider on the admin page is set to any value other than Only People in your Organization."

#### MS.M365PRODUCT.1.2v1
POLICY 2.

<!--Policy: MS.M365PRODUCT.1.2v1; Criticality: [Criticality(SHALL,SHOULD,ETC)] -->
- _Rationale:_
  - 1st sentence: Security risk if policy is not implemented. "The security risk of [context of policy]"
  - 2nd sentence: How this policy minimizes this risk. By [Verb] the risk of [Vulnerability] is minimized."
- _Last modified:_ July 2023

### Resources

- [Title of article \|Publisher](Link) 
  - Example: [Overview of external sharing in SharePoint and OneDrive in Microsoft 365 \| Microsoft Documents](https://learn.microsoft.com/en-us/sharepoint/external-sharing-overview)

### License Requirements

- [any additional add-on licenses]

### Implementation

#### MS.M365PRODUCT.1.1v1 Instructions
1.  For sequential steps utilize “\>”
    - **Example:** **Policies** \> **Sharing**)
2.  Bold all-important buttonology
    - **Example:** **Policies**, **Sharing**, **More external sharing settings**)

#### MS.M365PRODUCT.1.2v1 Instructions
1.  For sequential steps utilize “\>”
    - **Example:** **Policies** \> **Sharing**)
2.  Bold all-important buttonology
    - **Example:** **Policies**, **Sharing**, **More external sharing settings**)

## 2. Policy Group 2
[Policy Group Description]

### Policies

#### MS.M365Product.2.1v1
POLICY 1.

<!--Policy: MS.M365PRODUCT.2.1v1; Criticality: [Criticality(SHALL,SHOULD,ETC)] -->
- _Rationale:_
  - 1st sentence: Security risk if policy is not implemented. "The security risk of [context of policy]"
  - 2nd sentence: How this policy minimizes this risk. By [Verb] the risk of [Vulnerability] is minimized."
- _Last modified:_ July 2023

#### MS.M365PRODUCT.2.2v1
Policy 2.

<!--Policy: MS.M365PRODUCT.2.2v1; Criticality: [Criticality(SHALL,SHOULD,ETC)] -->
- _Rationale:_
  - 1st sentence: Security risk if policy is not implemented. "The security risk of [context of policy]"
  - 2nd sentence: How this policy minimizes this risk. By [Verb] the risk of [Vulnerability] is minimized."
- _Last modified:_ July 2023

### Resources

- [Title of article \|Publisher](Link) 

### License Requirements

- [any additional add-on licenses]

### Implementation

#### MS.M365PRODUCT.2.1v1 Instructions
1.  For sequential steps utilize “\>”
    - **Example:** **Policies** \> **Sharing**)
2.  Bold all-important buttonology
    - **Example:** **Policies**, **Sharing**, **More external sharing settings**)

#### MS.M365PRODUCT.2.2v1 Instructions
1.  For sequential steps utilize “\>”
    - **Example:** **Policies** \> **Sharing**)
2.  Bold all-important buttonology
    - **Example:** **Policies**, **Sharing**, **More external sharing settings**)


## 3. [Shared policy group name between Defender, EXO and Teams]
[Policy Group Description]
Any product that meets the requirements outlined in this baseline policy group may be used. If the agency is using Microsoft Defender to implement [Shared policy group between Defender, EXO and Teams], see the following policies of the [Defender for Office 365 Minimum Viable Secure Configuration Baseline](./defender.md) for additional guidance.

- [MS.DEFENDER.X.Xv1](./defender.md#msdefenderXXVX) <- update link to appropriate defender policy.
  - [Defender Policy] 

- [MS.DEFENDER.X.Xv1](./defender.md#msdefenderXXvX) <- update link to appropriate defender policy.
  - [Defender Policy] 

**Example:**
- [MS.DEFENDER.1.2v1](./defender.md#msdefender12v1)
  - All users SHALL be added to Exchange Online Protection in either the standard or strict preset security policy.

- [MS.DEFENDER.1.3v1](./defender.md#msdefender13v1)
  - All users SHALL be added to Defender for Office 365 Protection in either the standard or strict preset security policy.

### Policies

#### MS.[TEAMSOREXO].3.1v1
POLICY 1.

<!--Policy: MS.M365PRODUCT.3.1v1; Criticality: [Criticality(SHALL,SHOULD,ETC)] -->
- _Rationale:_
  - 1st sentence: Security risk if policy is not implemented. "The security risk of [context of policy]"
  - 2nd sentence: How this policy minimizes this risk. By [Verb] the risk of [Vulnerability] is minimized."
- _Last modified:_ July 2023

#### MS.[TEAMSOREXO].3.2v1
POLICY 2.

<!--Policy: MS.M365PRODUCT.3.2v1; Criticality: [Criticality(SHALL,SHOULD,ETC)] -->
- _Rationale:_
  - 1st sentence: Security risk if policy is not implemented. "The security risk of [context of policy]"
  - 2nd sentence: How this policy minimizes this risk. By [Verb] the risk of [Vulnerability] is minimized."
- _Last modified:_ July 2023


### Resources

- [Title of article \|Publisher](Link)

### Implementation

#### MS.[TEAMSOREXO].3.1v1 Instructions
Any product that meets the requirements outlined in this baseline policy may be used. If the agency is using Microsoft Defender, see the following implementation steps for [Shared policy group name between Defender, EXO and Teams](./defender.md#implementation) for additional guidance.
< Ensure link to appropriate defender implementation section.

**Example:**
#### MS.TEAMS.3.1v1 Instructions
Any product that meets the requirements outlined in this baseline policy may be used. If the agency is using Microsoft Defender, see the following implementation steps for [DLP](./defender.md#implementation-3) for additional guidance.

#### MS.[TEAMSOREXO].3.2v1 Instructions
Any product that meets the requirements outlined in this baseline policy may be used. If the agency is using Microsoft Defender, see the following implementation steps for [Shared policy group name between Defender, EXO and Teams](./defender.md#implementation) for additional guidance.
< Ensure link to appropriate defender implementation section.

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
