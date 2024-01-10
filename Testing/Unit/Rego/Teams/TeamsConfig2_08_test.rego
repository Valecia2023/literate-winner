package teams
import future.keywords


#
# Policy 1
#--
test_DefaultCatalogAppsType_Correct_V1 if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD allow all apps published by Microsoft, but MAY block specific Microsoft apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Global",
                "DefaultCatalogAppsType": "BlockedAppList"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_DefaultCatalogAppsType_Correct_V2 if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD allow all apps published by Microsoft, but MAY block specific Microsoft apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Tag:TestPolicy",
                "DefaultCatalogAppsType": "BlockedAppList"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_DefaultCatalogAppsType_Incorrect_V1 if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD allow all apps published by Microsoft, but MAY block specific Microsoft apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Global",
                "DefaultCatalogAppsType": "AllowedAppList"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "1 meeting policy(ies) found that block Microsoft Apps by default: Global"
}

test_DefaultCatalogAppsType_Incorrect_V2 if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD allow all apps published by Microsoft, but MAY block specific Microsoft apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Tag:TestPolicy",
                "DefaultCatalogAppsType": "AllowedAppList"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "1 meeting policy(ies) found that block Microsoft Apps by default: Tag:TestPolicy"
}

test_DefaultCatalogAppsType_Multiple if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD allow all apps published by Microsoft, but MAY block specific Microsoft apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Global",
                "DefaultCatalogAppsType": "BlockedAppList"
            },
            {
                "Identity": "Tag:TestPolicy1",
                "DefaultCatalogAppsType": "AllowedAppList"
            },
            {
                "Identity": "Tag:TestPolicy2",
                "DefaultCatalogAppsType": "AllowedAppList"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    startswith(RuleOutput[0].ReportDetails, "2 meeting policy(ies) found that block Microsoft Apps by default: ")
    contains(RuleOutput[0].ReportDetails, "Tag:TestPolicy1")
    contains(RuleOutput[0].ReportDetails, "Tag:TestPolicy2")
}

#
# Policy 2
#--
test_GlobalCatalogAppsType_Correct_V1 if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD NOT allow installation of all third-party apps, but MAY allow specific apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Global",
                "GlobalCatalogAppsType": "AllowedAppList"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_GlobalCatalogAppsType_Correct_V2 if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD NOT allow installation of all third-party apps, but MAY allow specific apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Tag:TestPolicy",
                "GlobalCatalogAppsType": "AllowedAppList"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_GlobalCatalogAppsType_Incorrect_V1 if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD NOT allow installation of all third-party apps, but MAY allow specific apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Global",
                "GlobalCatalogAppsType": "BlockedAppList"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "1 meeting policy(ies) found that allow third-party apps by default: Global"
}

test_GlobalCatalogAppsType_Incorrect_V2 if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD NOT allow installation of all third-party apps, but MAY allow specific apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Tag:TestPolicy",
                "GlobalCatalogAppsType": "BlockedAppList"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "1 meeting policy(ies) found that allow third-party apps by default: Tag:TestPolicy"
}

test_GlobalCatalogAppsType_Multiple if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD NOT allow installation of all third-party apps, but MAY allow specific apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Global",
                "GlobalCatalogAppsType": "BlockedAppList"
            },
            {
                "Identity": "Tag:TestPolicy1",
                "GlobalCatalogAppsType": "AllowedAppList"
            },
            {
                "Identity": "Tag:TestPolicy2",
                "GlobalCatalogAppsType": "BlockedAppList"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    startswith(RuleOutput[0].ReportDetails, "2 meeting policy(ies) found that allow third-party apps by default: ")
    contains(RuleOutput[0].ReportDetails, "Global")
    contains(RuleOutput[0].ReportDetails, "Tag:TestPolicy2")
}

test_PrivateCatalogAppsType_Correct_V1 if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD NOT allow installation of all custom apps, but MAY allow specific apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Global",
                "PrivateCatalogAppsType": "AllowedAppList"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_PrivateCatalogAppsType_Correct_V2 if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD NOT allow installation of all custom apps, but MAY allow specific apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Tag:TestPolicy",
                "PrivateCatalogAppsType": "AllowedAppList"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
    
    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_PrivateCatalogAppsType_Incorrect_V1 if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD NOT allow installation of all custom apps, but MAY allow specific apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Global",
                "PrivateCatalogAppsType": "BlockedAppList"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "1 meeting policy(ies) found that allow custom apps by default: Global"
}

test_PrivateCatalogAppsType_Incorrect_V2 if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD NOT allow installation of all custom apps, but MAY allow specific apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Tag:TestPolicy",
                "PrivateCatalogAppsType": "BlockedAppList"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "1 meeting policy(ies) found that allow custom apps by default: Tag:TestPolicy"
}

test_PrivateCatalogAppsType_Multiple if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHOULD NOT allow installation of all custom apps, but MAY allow specific apps as needed"

    Output := tests with input as {
        "app_policies": [
            {
                "Identity": "Global",
                "PrivateCatalogAppsType": "BlockedAppList"
            },
            {
                "Identity": "Tag:TestPolicy1",
                "PrivateCatalogAppsType": "AllowedAppList"
            },
            {
                "Identity": "Tag:TestPolicy2",
                "PrivateCatalogAppsType": "BlockedAppList"
            }
        ]
    }
    
    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    startswith(RuleOutput[0].ReportDetails, "2 meeting policy(ies) found that allow custom apps by default: ")
    contains(RuleOutput[0].ReportDetails, "Global")
    contains(RuleOutput[0].ReportDetails, "Tag:TestPolicy2")
}

#
# Policy 3
#--
test_3rdParty_Correct if {
    ControlNumber := "Teams 2.8"
    Requirement := "Agencies SHALL establish policy dictating the app review and approval process to be used by the agency"

    Output := tests with input as { }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Cannot be checked automatically. See Microsoft Teams Secure Configuration Baseline policy 2.8 for instructions on manual check"
}