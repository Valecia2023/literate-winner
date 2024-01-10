package teams
import future.keywords


#
# Policy 1
#--
test_meeting_policies_Correct if {
    ControlNumber := "Teams 2.3"
    Requirement := "Anonymous users, including dial-in users, SHOULD NOT be admitted automatically"

    Output := tests with input as {
        "meeting_policies": [
            {
                "Identity": "Global",
                "AllowPSTNUsersToBypassLobby": false,
                "AutoAdmittedUsers": "EveryoneInCompany"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_AllowPSTNUsersToBypassLobby_Incorrect if {
    ControlNumber := "Teams 2.3"
    Requirement := "Anonymous users, including dial-in users, SHOULD NOT be admitted automatically"

    Output := tests with input as {
        "meeting_policies": [
            {
                "Identity": "Global",
                "AllowPSTNUsersToBypassLobby": true,
                "AutoAdmittedUsers": "EveryoneInCompany"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement not met: Dial-in users are enabled to bypass the lobby"
}

test_AutoAdmittedUsers_Incorrect if {
    ControlNumber := "Teams 2.3"
    Requirement := "Anonymous users, including dial-in users, SHOULD NOT be admitted automatically"

    Output := tests with input as {
        "meeting_policies": [
            {
                "Identity": "Global",
                "AllowPSTNUsersToBypassLobby": true,
                "AutoAdmittedUsers": "Everyone"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement not met: All users are admitted automatically"
}

# It shouldn't matter that the custom policy is incorrect as this policy only applies to the Global policy
test_Multiple_Correct if {
    ControlNumber := "Teams 2.3"
    Requirement := "Anonymous users, including dial-in users, SHOULD NOT be admitted automatically"

    Output := tests with input as {
        "meeting_policies": [
            {
                "Identity": "Global",
                "AllowPSTNUsersToBypassLobby": false,
                "AutoAdmittedUsers": "EveryoneInCompany"
            },
            {
                "Identity": "Tag:CustomPolicy",
                "AllowPSTNUsersToBypassLobby": true,
                "AutoAdmittedUsers": "Everyone"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

#
# Policy 2
#--
test_AutoAdmittedUsers_Correct_V1 if {
    ControlNumber := "Teams 2.3"
    Requirement := "Internal users SHOULD be admitted automatically"

    Output := tests with input as {
        "meeting_policies": [
            {
                "Identity": "Global", 
                "AutoAdmittedUsers" : "EveryoneInSameAndFederatedCompany"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_AutoAdmittedUsers_Correct_V2 if {
    ControlNumber := "Teams 2.3"
    Requirement := "Internal users SHOULD be admitted automatically"

    Output := tests with input as {
        "meeting_policies": [
            {
                "Identity": "Global", 
                "AutoAdmittedUsers" : "EveryoneInCompanyExcludingGuests"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_AutoAdmittedUsers_Incorrect_V2 if {
    ControlNumber := "Teams 2.3"
    Requirement := "Internal users SHOULD be admitted automatically"

    Output := tests with input as {
        "meeting_policies": [
            {
                "Identity": "Global", 
                "AutoAdmittedUsers" : "OrganizerOnly"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement not met"
}

test_AutoAdmittedUsers_Incorrect_V3 if {
    ControlNumber := "Teams 2.3"
    Requirement := "Internal users SHOULD be admitted automatically"

    Output := tests with input as {
        "meeting_policies": [
            {
                "Identity": "Global", 
                "AutoAdmittedUsers" : "InvitedUsers"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
    
    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement not met"
}