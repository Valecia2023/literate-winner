package teams
import future.keywords


#
# Policy 1
#--
test_AllowPublicUsers_Correct if {
    ControlNumber := "Teams 2.6"
    Requirement := "Contact with Skype users SHALL be blocked"

    Output := tests with input as {
        "federation_configuration": [
            {
                "Identity": "Global",
                "AllowPublicUsers" : false
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
    
    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_AllowPublicUsers_InCorrect if {
    ControlNumber := "Teams 2.6"
    Requirement := "Contact with Skype users SHALL be blocked"

    Output := tests with input as {
        "federation_configuration": [
            {
                "Identity": "Global",
                "AllowPublicUsers" : true
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "1 domains that allows contact with Skype users: Global"
}

test_AllowPublicUsers_Correct_multi if {
    ControlNumber := "Teams 2.6"
    Requirement := "Contact with Skype users SHALL be blocked"

    Output := tests with input as {
        "federation_configuration": [
            {
                "Identity": "Global",
                "AllowPublicUsers" : false
            },
            {
                "Identity": "Tag:AllOn",
                "AllowPublicUsers" : false
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
    
    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_AllowPublicUsers_InCorrect_multi if {
    ControlNumber := "Teams 2.6"
    Requirement := "Contact with Skype users SHALL be blocked"

    Output := tests with input as {
        "federation_configuration": [
            {
                "Identity": "Global",
                "AllowPublicUsers" : true
            },
            {
                "Identity": "Tag:AllOn",
                "AllowPublicUsers" : true
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "2 domains that allows contact with Skype users: Global, Tag:AllOn"
}
