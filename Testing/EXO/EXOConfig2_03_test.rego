package exo
import future.keywords


#
# Policy 1
#--
test_Enabled_Correct_V1 if {
    ControlNumber := "EXO 2.3"
    Requirement := "DKIM SHOULD be enabled for any custom domain"

    Output := tests with input as {
        "dkim_config": [
            {
                "Enabled" : true, 
                "Domain" : "test.name"
            }
        ],
        "dkim_records": [
            {
                "rdata" : "v=DKIM1;", 
                "domain" : "test.name"
            }
        ],
        "spf_records": [
            {
                "rdata" : "spf1 ", 
                "domain" : "test.name"
            }
        ]  
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
 
    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_Enabled_Correct_V2 if {
    # Test with incorrect default domain
    ControlNumber := "EXO 2.3"
    Requirement := "DKIM SHOULD be enabled for any custom domain"

    Output := tests with input as {
        "dkim_config": [
            {
                "Enabled" : true, 
                "Domain" : "test.name"
            },
            {
                "Enabled" : false,  
                "Domain" : "example.onmicrosoft.com" # The baseline policy
                # doesn't apply to the default domains, so this should be
                # ignored.
            }
        ],
        "dkim_records": [
            {
                "rdata" : "v=DKIM1;", 
                "domain" : "test.name"
            },
            {
                "rdata" : "", 
                "domain" : "example.onmicrosoft.com"
            }
        ],
        "spf_records": [
            {
                "rdata" : "spf1 ", 
                "domain" : "test.name"
            },
            {
                "rdata" : "spf1 ", 
                "domain" : "example.onmicrosoft.com"
            }
        ]  
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
 
    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_Enabled_Correct_V3 if {
    # Test for multiple custom domains
    ControlNumber := "EXO 2.3"
    Requirement := "DKIM SHOULD be enabled for any custom domain"

    Output := tests with input as {
        "dkim_config": [
            {
                "Enabled" : true, 
                "Domain" : "test.name"
            },
            {
                "Enabled" : true,  
                "Domain" : "test2.name"
            }
        ],
        "dkim_records": [
            {
                "rdata" : "v=DKIM1;", 
                "domain" : "test.name"
            },
            {
                "rdata" : "v=DKIM1;", 
                "domain" : "test2.name"
            }
        ],
        "spf_records": [
            {
                "rdata" : "spf1 ", 
                "domain" : "test.name"
            },
            {
                "rdata" : "spf1 ", 
                "domain" : "test2.name"
            }
        ]  
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
 
    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_Enabled_Correct_V4 if {
    # Test for no custom domains, just the default domain 
    ControlNumber := "EXO 2.3"
    Requirement := "DKIM SHOULD be enabled for any custom domain"

    Output := tests with input as {
        "dkim_config": [
            {
                "Enabled" : true, 
                "Domain" : "example.onmicrosoft.com"
            }
        ],
        "dkim_records": [
            {
                "rdata" : "v=DKIM1;", 
                "domain" : "example.onmicrosoft.com"
            }
        ],
        "spf_records": [
            {
                "rdata" : "spf1 ", 
                "domain" : "example.onmicrosoft.com"
            }
        ]  
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
 
    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_Enabled_Incorrect if {
    ControlNumber := "EXO 2.3"
    Requirement := "DKIM SHOULD be enabled for any custom domain"

    Output := tests with input as {
        "dkim_config": [
            {
                "Enabled" : false, 
                "Domain" : "test.name"
            }
        ],
        "dkim_records": [
            {
                "rdata" : "v=DKIM1;", 
                "domain" : "test.name"
            }
        ],
        "spf_records": [
            {
                "rdata" : "spf1 ", 
                "domain" : "test.name"
            }
        ]  
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
 
    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "1 of 1 agency domain(s) found in violation: test.name"
}

test_Rdata_Incorrect if {
    ControlNumber := "EXO 2.3"
    Requirement := "DKIM SHOULD be enabled for any custom domain"

    Output := tests with input as {
        "dkim_config": [
            {
                "Enabled" : true, 
                "Domain" : "test.name"
            }
        ],
        "dkim_records": [
            {
                "rdata" : " ", 
                "domain" : "test.name"
            }
        ],
        "spf_records": [
            {
                "rdata" : "spf1 ", 
                "domain" : "test.name"
            }
        ]  
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
 
    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "1 of 1 agency domain(s) found in violation: test.name"
}

test_Rdata_Incorrect_V2 if {
    ControlNumber := "EXO 2.3"
    Requirement := "DKIM SHOULD be enabled for any custom domain"

    Output := tests with input as {
        "dkim_config": [
            {
                "Enabled" : true, 
                "Domain" : "test.name"
            }
        ],
        "dkim_records": [
            {
                "rdata" : "Hello World", 
                "domain" : "test.name"
            }
        ],
        "spf_records": [
            {
                "rdata" : "spf1 ", 
                "domain" : "test.name"
            }
        ]  
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
 
    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "1 of 1 agency domain(s) found in violation: test.name"
}

test_Enabled_Correct_V2 if {
    ControlNumber := "EXO 2.3"
    Requirement := "DKIM SHOULD be enabled for any custom domain"

    Output := tests with input as {
        "dkim_config": [
            {
                "Enabled" : true, 
                "Domain" : "test.name"
            },
            {
                "Enabled" : true, 
                "Domain" : "test2.name"
            }
        ],
        "dkim_records": [
            {
                "rdata" : "v=DKIM1;", 
                "domain" : "test.name"
            },
            {
                "rdata" : "v=DKIM1;", 
                "domain" : "test2.name"
            }
        ],
        "spf_records": [
            {
                "rdata" : "spf1 ", 
                "domain" : "test.name"
            },
            {
                "rdata" : "spf1 ", 
                "domain" : "test2.name"
            }
        ]  
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
 
    count(RuleOutput) == 1
    RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "Requirement met"
}

test_Enabled_Inorrect_V3 if {
    ControlNumber := "EXO 2.3"
    Requirement := "DKIM SHOULD be enabled for any custom domain"
    
    Output := tests with input as {
        "dkim_config": [
            {
                "Enabled" : true, 
                "Domain" : "test.name"
            },
            {
                "Enabled" : false, 
                "Domain" : "test2.name"
            }
        ],
        "dkim_records": [
            {
                "rdata" : "v=DKIM1;", 
                "domain" : "test.name"
            },
            {
                "rdata" : "v=DKIM1;", 
                "domain" : "test2.name"
            }
        ],
        "spf_records": [
            {
                "rdata" : "spf1 ", 
                "domain" : "test.name"
            },
            {
                "rdata" : "spf1 ", 
                "domain" : "test2.name"
            }
        ]  
    }

    RuleOutput := [Result | Result = Output[_]; Result.Control == ControlNumber; Result.Requirement == Requirement]
    
    count(RuleOutput) == 1
    not RuleOutput[0].RequirementMet
    RuleOutput[0].ReportDetails == "1 of 2 agency domain(s) found in violation: test2.name"
}