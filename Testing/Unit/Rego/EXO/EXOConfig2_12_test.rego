package exo
import future.keywords


#
# Policy 1
#--
test_IPAllowList_Correct_V1 if {
    ControlNumber := "EXO 2.12"
    Requirement := "IP allow lists SHOULD NOT be created"
    
    Output := tests with input as {
        "conn_filter": [
            {
                "IPAllowList" : [], 
                "EnableSafeList": false,
                "Name":"A"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
 
    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_IPAllowList_Correct_V2 if {
    ControlNumber := "EXO 2.12"
    Requirement := "IP allow lists SHOULD NOT be created"

    Output := tests with input as {
        "conn_filter": 
        [
            {
                "IPAllowList" : [], 
                "EnableSafeList": true,
                "Name":"A"
            } # it shouldn't matter that safe list is enabled
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
 
    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_IPAllowList_Incorrect if {
    ControlNumber := "EXO 2.12"
    Requirement := "IP allow lists SHOULD NOT be created"

    Output := tests with input as {
        "conn_filter": [
            {
                "IPAllowList" : ["trust.me.please"], 
                "EnableSafeList": false,
                "Name" : "A"
            }  
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
 
    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Allow-list is in use"
}

#
# Policy 2
#--
test_EnableSafeList_Correct_V1 if {
    ControlNumber := "EXO 2.12"
    Requirement := "Safe lists SHOULD NOT be enabled"

    Output := tests with input as {
        "conn_filter": [
            {
                "IPAllowList" : [], 
                "EnableSafeList": false,
                "Name":"A"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
 
    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_EnableSafeList_Incorrect_V1 if {
    ControlNumber := "EXO 2.12"
    Requirement := "Safe lists SHOULD NOT be enabled"

    Output := tests with input as {
        "conn_filter": [
            {
                "IPAllowList" : [], 
                "EnableSafeList": true, 
                "Name" : "A"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
 
    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement not met"
}

test_EnableSafeList_Correct_V2 if {
    ControlNumber := "EXO 2.12"
    Requirement := "Safe lists SHOULD NOT be enabled"

    Output := tests with input as {
        "conn_filter": [
            {
                "IPAllowList" : ["this.shouldnt.matter"],
                "EnableSafeList": false,
                "Name":"A"
            }
        ]
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
 
    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}