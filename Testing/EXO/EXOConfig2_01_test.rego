package exo
import future.keywords


#
# Policy 1
#--
test_AutoForwardEnabled_Correct if {
    ControlNumber := "EXO 2.1"
    Requirement := "Automatic forwarding to external domains SHALL be disabled"

    Output := tests with input as {
        "remote_domains": [
            {
                "AutoForwardEnabled" : false, 
                "DomainName" : "Test name"
            }
        ]    
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_AutoForwardEnabled_Incorrect_V1 if {
    ControlNumber := "EXO 2.1"
    Requirement := "Automatic forwarding to external domains SHALL be disabled"

    Output := tests with input as {
        "remote_domains": [
            {
                "AutoForwardEnabled" : true, 
                "DomainName" : "Test name"
            }
        ]    
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "1 remote domain(s) that allows automatic forwarding: Test name"
}

test_AutoForwardEnabled_Incorrect_V2 if {
    ControlNumber := "EXO 2.1"
    Requirement := "Automatic forwarding to external domains SHALL be disabled"

    Output := tests with input as {
        "remote_domains": [
            {
                "AutoForwardEnabled" : true, 
                "DomainName" : "Test name"
            },
            {
                "AutoForwardEnabled" : true, 
                "DomainName" : "Test name 2"
            }
        ]    
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "2 remote domain(s) that allows automatic forwarding: Test name, Test name 2"
}

test_AutoForwardEnabled_Incorrect_V3 if {
    ControlNumber := "EXO 2.1"
    Requirement := "Automatic forwarding to external domains SHALL be disabled"

    Output := tests with input as {
        "remote_domains": [
            {
                "AutoForwardEnabled" : true, 
                "DomainName" : "Test name"
            },
            {
                "AutoForwardEnabled" : true, 
                "DomainName" : "Test name 2"
            },
            {
                "AutoForwardEnabled" : false, 
                "DomainName" : "Test name 3"
            }
        ]    
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]

    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "2 remote domain(s) that allows automatic forwarding: Test name, Test name 2"
}

# TODO: what about the case where "remote_domains" is empty?
# Is this possible? Or will the default domain "*" always be there?
# Requires exploration online and manual testing.