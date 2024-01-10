package aad
import future.keywords


#
# Policy 1
#--
test_AllowInvitesFrom_Correct if {
    ControlNumber := "AAD 2.18"
    Requirement := "Only users with the Guest Inviter role SHOULD be able to invite guest users"

    Output := tests with input as {
        "authorization_policies": [
            {
                "Id": "authorizationPolicy",
                "AllowInvitesFrom": "adminsAndGuestInviters"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Permission level set to \"adminsAndGuestInviters\" (authorizationPolicy)"
}

test_AllowInvitesFrom_Incorrect if {
    ControlNumber := "AAD 2.18"
    Requirement := "Only users with the Guest Inviter role SHOULD be able to invite guest users"

    Output := tests with input as {
        "authorization_policies": [
            {
                "Id": "authorizationPolicy",
                "AllowInvitesFrom": "Bad value"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Permission level set to \"Bad value\" (authorizationPolicy)"
}

#
# Policy 2
#--
test_NotImplemented_Correct if {
    ControlNumber := "AAD 2.18"
    Requirement := "Guest invites SHOULD only be allowed to specific external domains that have been authorized by the agency for legitimate business purposes"

    Output := tests with input as { }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Currently cannot be checked automatically. See Azure Active Directory Secure Configuration Baseline policy 2.18 for instructions on manual check"
}

#
# Policy 3
#--
test_GuestUserRoleId_Correct_V1 if {
    ControlNumber := "AAD 2.18"
    Requirement := "Guest users SHOULD have limited access to Azure AD directory objects"

    Output := tests with input as {
        "authorization_policies": [
            {
                "GuestUserRoleId" : "2af84b1e-32c8-42b7-82bc-daa82404023b",
                "Id" : "authorizationPolicy" 
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Permission level set to \"Restricted access\" (authorizationPolicy)"
}

test_GuestUserRoleId_Correct_V2 if {
    ControlNumber := "AAD 2.18"
    Requirement := "Guest users SHOULD have limited access to Azure AD directory objects"

    Output := tests with input as {
        "authorization_policies": [
            {
                "GuestUserRoleId" : "10dae51f-b6af-4016-8d66-8c2a99b929b3",
                "Id" : "authorizationPolicy" 
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Permission level set to \"Limited access\" (authorizationPolicy)"
}

test_GuestUserRoleId_Incorrect_V1 if {
    ControlNumber := "AAD 2.18"
    Requirement := "Guest users SHOULD have limited access to Azure AD directory objects"

    Output := tests with input as {
        "authorization_policies": [
            {
                "GuestUserRoleId" : "a0b1b346-4d3e-4e8b-98f8-753987be4970",
                "Id" : "authorizationPolicy" 
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Permission level set to \"Same as member users\" (authorizationPolicy)"
}

test_GuestUserRoleId_Incorrect_V2 if {
    ControlNumber := "AAD 2.18"
    Requirement := "Guest users SHOULD have limited access to Azure AD directory objects"

    Output := tests with input as {
        "authorization_policies": [
            {
                "GuestUserRoleId" : "Hello world",
                "Id" : "authorizationPolicy" 
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Permission level set to \"Unknown\" (authorizationPolicy)"
}

test_GuestUserRoleId_Incorrect_V3 if {
    ControlNumber := "AAD 2.18"
    Requirement := "Guest users SHOULD have limited access to Azure AD directory objects"

    Output := tests with input as {
        "authorization_policies": [
            {
                "GuestUserRoleId" : "Hello world",
                "Id" : "policy 1" 
            },
            {
                "GuestUserRoleId" : "2af84b1e-32c8-42b7-82bc-daa82404023b",
                "Id" : "policy 2" 
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet

    # Can't make any assumptions about the order of the output in the string,
    # hence the contains functions instead of a simple ==
    startswith(RuleOutput[0].ReportDetails, "Permission level set to ")
    contains(RuleOutput[0].ReportDetails, "\"Unknown\" (policy 1)")
    contains(RuleOutput[0].ReportDetails, "\"Restricted access\" (policy 2)")
}